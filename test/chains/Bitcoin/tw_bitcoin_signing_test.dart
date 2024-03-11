import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';
import 'tx_comparison_helper.dart';

Bitcoin.SigningInput buildInputP2PKH({bool omitKey = false}) {
  final hash0 = TWData.createWithHexString(
          'fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f')
      .bytes()!;
  final hash1 = TWData.createWithHexString(
          'ef51e1b804cc89d182d279655c3aa89e815b1b309fe287d9b2b55d57b90ec68a')
      .bytes()!;

  // Setup input
  final utxoKey0 = TWPrivateKey.createWithHexString(
      'bbc27228ddcb9209d7fd6f36b02f7dfa6252af40bb2f1cbc7a557da8027ff866');
  final pubKey0 =
      utxoKey0.getPublicKey(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
  final utxoPubkeyHash0 = TWHash.ripemd(TWHash.sha256(pubKey0.data));
  expectHex(utxoPubkeyHash0, 'b7cd046b6d522a3d61dbcb5235c0e9cc97265457');

  final utxoKey1 = TWPrivateKey.createWithHexString(
      '619c335025c7f4012e556c2a58b2506e30b8511b53ade95ea316fd8c3286feb9');
  final pubKey1 =
      utxoKey1.getPublicKey(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
  final utxoPubkeyHash1 = TWHash.ripemd(TWHash.sha256(pubKey1.data));
  expectHex(utxoPubkeyHash1, '1d0f172a0ecb48aee1be1f2687d2963ae33f71a1');

  final utxo0Script = TWBitcoinScript.buildPayToPublicKeyHash(utxoPubkeyHash0);
  final scriptHash = utxo0Script.matchPayToPubkeyHash()!;
  expectHex(scriptHash, 'b7cd046b6d522a3d61dbcb5235c0e9cc97265457');

  final utxo0 = Bitcoin.UnspentTransaction(
    amount: $fixnum.Int64(625000000),
    script: utxo0Script.data,
    outPoint: Bitcoin.OutPoint(
      hash: hash0,
      index: 0,
      tree: 0xffffffff,
    ),
  );

  final utxo1 = Bitcoin.UnspentTransaction(
    amount: $fixnum.Int64(600000000),
    script: TWBitcoinScript.createWithBytes(TWData.createWithHexString(
                '00141d0f172a0ecb48aee1be1f2687d2963ae33f71a1')
            .bytes()!)
        .data,
    outPoint: Bitcoin.OutPoint(
      hash: hash1,
      index: 1,
      tree: 0xffffffff,
    ),
  );

  final input = Bitcoin.SigningInput(
    hashType: TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoin),
    amount: $fixnum.Int64(335790000),
    byteFee: $fixnum.Int64(1),
    toAddress: '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx',
    changeAddress: '1FQc5LdgGHMHEN9nwkjmz6tWkxhPpxBvBU',
    coinType: TWCoinType.TWCoinTypeBitcoin,
    privateKey: omitKey ? null : [utxoKey0.data, utxoKey1.data],
    utxo: [utxo0, utxo1],
  );

  return input;
}

void main() {
  group('BitcoinSigning', () {
    test('SpendMinimumAmountP2WPKH', () {
      final myPrivateKey = TWPrivateKey.createWithHexString(
          '9ea2172511ed73ae0096be8e593c3b75631700edaf729f1abbae607314a20e35');

      final myPublicKey =
          myPrivateKey.getPublicKey(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(myPublicKey.data));
      final redeemScript =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);

      // Both two UTXOs came from the same transaction.
      final utxoHash = TWData.createWithHexString(
          "e8b3c2d0d5851cef139d87dfb5794db8897ce90ce1b6961526f61923baf5b5a3");
      utxoHash.reverse();

      final segwitDustAmount = 294;

      // Setup input
      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoin),
        amount: $fixnum.Int64(546),
        useMaxAmount: false,
        useMaxUtxo: true,
        byteFee: $fixnum.Int64(27),
        toAddress: 'bc1qvrt7ukvhvmdny0a3j9k8l8jasx92lrqm30t2u2',
        changeAddress: 'bc1qvrt7ukvhvmdny0a3j9k8l8jasx92lrqm30t2u2',
        coinType: TWCoinType.TWCoinTypeBitcoin,
        fixedDustThreshold: $fixnum.Int64(segwitDustAmount),
        privateKey: [myPrivateKey.data],
        scripts: {
          hex(utxoPubkeyHash): redeemScript.data,
        },
        utxo: [
          Bitcoin.UnspentTransaction(
            script: redeemScript.data,
            amount: $fixnum.Int64(segwitDustAmount),
            outPoint: Bitcoin.OutPoint(
              hash: utxoHash.bytes()!,
              index: 0,
              sequence: 0xffffffff,
            ),
          ),
          Bitcoin.UnspentTransaction(
            script: redeemScript.data,
            amount: $fixnum.Int64(16776),
            outPoint: Bitcoin.OutPoint(
              hash: utxoHash.bytes()!,
              index: 1,
              sequence: 0xffffffff,
            ),
          ),
        ],
      );

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
            input.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));
        expect(
            verifyPlan(plan, [294, 16776], 546, 5643, Common.SigningError.OK),
            true);
        expect(plan.change.toInt(), 10881);
      }

      // Signs
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
          input.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(result.error, Common.SigningError.OK);
      final signedTx = result.encoded;

      expectHex(signedTx,
          '01000000000102a3b5f5ba2319f6261596b6e10ce97c89b84d79b5df879d13ef1c85d5d0c2b3e80000000000ffffffffa3b5f5ba2319f6261596b6e10ce97c89b84d79b5df879d13ef1c85d5d0c2b3e80100000000ffffffff02220200000000000016001460d7ee599766db323fb1916c7f9e5d818aaf8c1b812a00000000000016001460d7ee599766db323fb1916c7f9e5d818aaf8c1b02483045022100d7e4d267e94547bd365736229219a85b21f79cf896a65baa444e339215b4b36f022078c0dee3d1d603f77855fee8f23291fe180b50afaa2c9ae9f724b7418d76da75012103a11506993946e20ea82686b157bf08f944759f43d91af8d84650ee73a482431c02483045022100c10cdbe21cedab3b4e7db9422f69c7074764711d552a63545104d71c905b138802204999f3ecb5fdadfd8669a8c14f04643c59bb3e98aaf52c52f829a0f6ef5d6abb012103a11506993946e20ea82686b157bf08f944759f43d91af8d84650ee73a482431c00000000');
    });

    test('ExtraOutputs', () {
      final privateKey = TWData.createWithHexString(
              'e253373989199da27c48680e3a3fc0f648d50f9a727ef17a7fe6a4dc3b159129')
          .bytes()!;
      final ownAddress = '1MhdctqCwYMn2DT4mshpwvYtfF98wBojXS';
      final toAddress = '1PRuxNSZwUXym6A31kmrArdT2BGJiTna19';
      final utxoAmount = 10000;
      final toAmount = 2000;
      final byteFee = 6;
      final utxoScript = TWBitcoinScript.lockScriptForAddress(
          ownAddress, TWCoinType.TWCoinTypeBitcoin);
      final utxoHash = TWData.createWithHexString(
          'd15d38de9a619809b575532a235d23947c4ff7d219d3feb6c5b6105d23360f4e');
      utxoHash.reverse();

      // Setup input
      final signingInput = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(toAmount),
        byteFee: $fixnum.Int64(byteFee),
        toAddress: toAddress,
        changeAddress: ownAddress,
        privateKey: [privateKey],
        utxo: [
          Bitcoin.UnspentTransaction(
            amount: $fixnum.Int64(utxoAmount),
            script: utxoScript.data,
            outPoint: Bitcoin.OutPoint(
              hash: utxoHash.bytes()!,
              index: 0,
              sequence: 4294967290,
            ),
          ),
        ],
        extraOutputs: [
          Bitcoin.OutputAddress(
            toAddress: 'bc1qkm0awulcn94gmtjwzwkvnpflc3ytt7a6cjentn',
            amount: $fixnum.Int64(2000),
          ),
          Bitcoin.OutputAddress(
            toAddress:
                'bc1pqa49cxxdqyr49nwe2379tq4xsc4e8qe8mdxyjx3mprnftcde0v4s3lnhzq',
            amount: $fixnum.Int64(2000),
          ),
        ],
      );

      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          signingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(plan.amount.toInt(), 2000);
      expect(plan.change.toInt(), 2200);
      expect(plan.fee.toInt(), 1800);

      signingInput.plan = plan;
      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
          signingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(output.error, Common.SigningError.OK);
      expect(output.transaction.inputs.length, 1);
      // Expected outputs: `amount`, `change`, `extra_output[0]`, `extra_output[1]`
      expect(output.transaction.outputs.length, 4);
      expectHex(output.encoded,
          '01000000014e0f36235d10b6c5b6fed319d2f74f7c94235d232a5375b50998619ade385dd1000000006b483045022100e044cce5c2cf141f725bb88dafc74d7db8679826838f1dd4ba35fa57a159454202204aed2c624dc53b6f98adbc818689af4d99c6d9cdb0377979a74982b0624d6e9e0121030f209b6ada5edb42c77fd2bc64ad650ae38314c8f451f3e36d80bc8e26f132cbfaffffff04d0070000000000001976a914f608f4635f9072c4f92715e5a6c35c058a9d6fe988ac98080000000000001976a914e311b8d6ddff856ce8e9a4e03bc6d4fe5050a83d88acd007000000000000160014b6dfd773f8996a8dae4e13acc9853fc448b5fbbad007000000000000225120076a5c18cd010752cdd9547c5582a6862b938327db4c491a3b08e695e1b97b2b00000000');
    });

    /// It would be enough to use the only `utxo0` to send `toAmount` and pay the fee.
    /// But since the `extraOutputs` are present, `utxo0` is not enough to generate the transaction.
    /// Here, `utxoAmount - toAmount - extraOutputsAmount - fee = -1799`
    /// Please note that the `toAmount` shouldn't be reduced if `extraOutputs` are set.
    test('ExtraOutputsExceedAvailableAmount', () {
      final privateKey = TWData.createWithHexString(
              'e253373989199da27c48680e3a3fc0f648d50f9a727ef17a7fe6a4dc3b159129')
          .bytes()!;
      final ownAddress = '1MhdctqCwYMn2DT4mshpwvYtfF98wBojXS';
      final toAddress = '1PRuxNSZwUXym6A31kmrArdT2BGJiTna19';
      final utxoAmount = 10000;
      final toAmount = 5999;
      final byteFee = 6;

      final signingInput = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(toAmount),
        byteFee: $fixnum.Int64(byteFee),
        toAddress: toAddress,
        changeAddress: ownAddress,
        privateKey: [privateKey],
      );

      final utxoScript = TWBitcoinScript.lockScriptForAddress(
        ownAddress,
        TWCoinType.TWCoinTypeBitcoin,
      );
      // The UTXO doesn't belong to the `ownAddress`, it's used just for the test purposes.
      final utxoHash = parse_hex(
              "d15d38de9a619809b575532a235d23947c4ff7d219d3feb6c5b6105d23360f4e")
          .reversed
          .toList();
      signingInput.utxo.add(Bitcoin.UnspentTransaction(
        amount: $fixnum.Int64(utxoAmount),
        script: utxoScript.data,
        outPoint: Bitcoin.OutPoint(
          hash: utxoHash,
          index: 0,
          sequence: 4294967290,
        ),
      ));

      signingInput.extraOutputs.add(Bitcoin.OutputAddress(
        toAddress: 'bc1qkm0awulcn94gmtjwzwkvnpflc3ytt7a6cjentn',
        amount: $fixnum.Int64(2000),
      ));

      signingInput.extraOutputs.add(Bitcoin.OutputAddress(
        toAddress:
            'bc1pqa49cxxdqyr49nwe2379tq4xsc4e8qe8mdxyjx3mprnftcde0v4s3lnhzq',
        amount: $fixnum.Int64(2000),
      ));

      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          signingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(plan.error, Common.SigningError.Error_not_enough_utxos);
    });

    /// It would be enough to use the only `utxo0` to send `toAmount` and pay the fee.
    /// But since the `extraOutputs` are present, the transaction builder needs to select one extra UTXO (e.g. `utxo1`).
    test('ExtraOutputsRequireExtraInputs', () {
      final privateKey = parse_hex(
          "e253373989199da27c48680e3a3fc0f648d50f9a727ef17a7fe6a4dc3b159129");
      final ownAddress = '1MhdctqCwYMn2DT4mshpwvYtfF98wBojXS';
      final toAddress = '1PRuxNSZwUXym6A31kmrArdT2BGJiTna19';
      final utxo0Amount = 10000;
      final utxo1Amount = 3000;
      final toAmount = 5999;
      final byteFee = 6;

      final signingInput = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(toAmount),
        byteFee: $fixnum.Int64(byteFee),
        toAddress: toAddress,
        changeAddress: ownAddress,
        privateKey: [privateKey],
      );
      // Dust threshold will be 612 (102 * 6) if otherwise is not set.
      // So to fix the test, we should set the 313 dust threshold for the change output to be included.
      signingInput.fixedDustThreshold = $fixnum.Int64(313);

      final utxoScript = TWBitcoinScript.lockScriptForAddress(
        ownAddress,
        TWCoinType.TWCoinTypeBitcoin,
      );
      // The UTXO doesn't belong to the `ownAddress`, it's used just for the test purposes.
      final utxoHash = parse_hex(
          'd15d38de9a619809b575532a235d23947c4ff7d219d3feb6c5b6105d23360f4e');
      signingInput.utxo.add(Bitcoin.UnspentTransaction(
        amount: $fixnum.Int64(utxo0Amount),
        script: utxoScript.data,
        outPoint: Bitcoin.OutPoint(
          hash: utxoHash.reversed.toList(),
          index: 0,
          sequence: 4294967290,
        ),
      ));

      signingInput.utxo.add(Bitcoin.UnspentTransaction(
        amount: $fixnum.Int64(utxo1Amount),
        script: utxoScript.data,
        outPoint: Bitcoin.OutPoint(
          hash: utxoHash,
          index: 1,
          sequence: 4294967290,
        ),
      ));

      signingInput.extraOutputs.add(Bitcoin.OutputAddress(
        toAddress: 'bc1qkm0awulcn94gmtjwzwkvnpflc3ytt7a6cjentn',
        amount: $fixnum.Int64(2000),
      ));

      signingInput.extraOutputs.add(Bitcoin.OutputAddress(
        toAddress:
            'bc1pqa49cxxdqyr49nwe2379tq4xsc4e8qe8mdxyjx3mprnftcde0v4s3lnhzq',
        amount: $fixnum.Int64(2000),
      ));

      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          signingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(plan.error, Common.SigningError.OK);
      expect(plan.amount.toInt(), toAmount);
      expect(plan.fee.toInt(), 2688);
      expect(plan.change.toInt(), 313);

      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
          signingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(output.transaction.inputs.length, 2);
      // Expected outputs: `amount`, `change`, `extra_output[0]`, `extra_output[1]`
      expect(output.transaction.outputs.length, 4);
      expectHex(
        output.encoded,
        '0100000002d15d38de9a619809b575532a235d23947c4ff7d219d3feb6c5b6105d23360f4e010000006b483045022100d104fd6b122a22b4104ec7898e355e8fe2e5fea2c838e828f748fa1e2ac3af4f022068dd9448c55f70d19cf04c2d1e7627029270e4cfd0721d5fac817a3b0c230d900121030f209b6ada5edb42c77fd2bc64ad650ae38314c8f451f3e36d80bc8e26f132cbfaffffff4e0f36235d10b6c5b6fed319d2f74f7c94235d232a5375b50998619ade385dd1000000006b4830450221009faff5b9ce33df0d56f068cae5c82b589698a79b86b51a6ca2c6784f7b761157022043849144348cea8526f6e78cf235e51edf6c72bf47a08234231a9df936d0746f0121030f209b6ada5edb42c77fd2bc64ad650ae38314c8f451f3e36d80bc8e26f132cbfaffffff046f170000000000001976a914f608f4635f9072c4f92715e5a6c35c058a9d6fe988ac39010000000000001976a914e311b8d6ddff856ce8e9a4e03bc6d4fe5050a83d88acd007000000000000160014b6dfd773f8996a8dae4e13acc9853fc448b5fbbad007000000000000225120076a5c18cd010752cdd9547c5582a6862b938327db4c491a3b08e695e1b97b2b00000000',
      );
    });

    /// This test only checks if the transaction output will have an expected value.
    /// It doesn't check correctness of the encoded representation.
    /// Issue: https://github.com/trustwallet/wallet-core/issues/3273
    test('SignMaxAmount', () {});
  });
}
