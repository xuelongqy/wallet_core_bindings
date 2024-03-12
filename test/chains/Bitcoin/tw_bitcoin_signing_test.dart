import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/BitcoinV2.pb.dart' as BitcoinV2;
import 'package:wallet_core_bindings/proto/Utxo.pb.dart' as Utxo;
import 'package:wallet_core_bindings/proto/Utxo.pbenum.dart' as Utxo;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';
import 'bitcoin_ordinal_nft_data.dart';
import 'tx_comparison_helper.dart';

Bitcoin.SigningInput buildInputP2PKH([bool omitKey = false]) {
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
      sequence: UINT32_MAX,
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
      sequence: UINT32_MAX,
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
        expect(verifyPlan(plan, [294, 16776], 546, 5643), true);
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
    test('SignMaxAmount', () {
      final privateKey = parse_hex(
          "4646464646464646464646464646464646464646464646464646464646464646");
      final ownAddress = 'bc1qhkfq3zahaqkkzx5mjnamwjsfpq2jk7z00ppggv';

      final revUtxoHash0 = parse_hex(
          "07c42b969286be06fae38528c85f0a1ce508d4df837eb5ac4cf5f2a7a9d65fa8");
      final inPubKey0 = parse_hex(
          "024bc2a31265153f07e70e0bab08724e6b85e217f8cd628ceb62974247bb493382");
      final inPubKeyHash0 =
          parse_hex("bd92088bb7e82d611a9b94fbb74a0908152b784f");
      final utxoScript0 =
          parse_hex("0014bd92088bb7e82d611a9b94fbb74a0908152b784f");

      final initialAmount = 10189533;
      final availableAmount = 10189534;
      final fee = 110;
      final amountWithoutFee = availableAmount - fee;
      // There shouldn't be any change
      final change = 0;

      final signingInput = Bitcoin.SigningInput(
        coinType: TWCoinType.TWCoinTypeBitcoin,
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(initialAmount),
        byteFee: $fixnum.Int64(1),
        toAddress: 'bc1q2dsdlq3343vk29runkgv4yc292hmq53jedfjmp',
        changeAddress: ownAddress,
        useMaxAmount: true,
        privateKey: [privateKey],
        utxo: [
          Bitcoin.UnspentTransaction(
            script: utxoScript0,
            amount: $fixnum.Int64(availableAmount),
            outPoint: Bitcoin.OutPoint(
              hash: revUtxoHash0,
              index: 0,
              sequence: 0xffffffff,
            ),
          ),
        ],
      );

      // Plan
      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
        signingInput.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      // Plan is checked, assume it is accepted
      expect(plan.amount.toInt(), amountWithoutFee);
      expect(plan.availableAmount.toInt(), availableAmount);
      expect(plan.fee.toInt(), fee);
      expect(plan.change.toInt(), change);

      signingInput.plan = plan;

      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        signingInput.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      final output0 = output.transaction.outputs[0];
      expect(output0.value.toInt(), amountWithoutFee);
    });

    test('SignBRC20TransferCommit', () {
      final privateKey = parse_hex(
          "e253373989199da27c48680e3a3fc0f648d50f9a727ef17a7fe6a4dc3b159129");
      final fullAmount = 26400;
      final minerFee = 3000;
      final brcInscribeAmount = 7000;
      final forFeeAmount = fullAmount - brcInscribeAmount - minerFee;
      final txId = parse_hex(
          "089098890d2653567b9e8df2d1fbe5c3c8bf1910ca7184e301db0ad3b495c88e");

      final key = TWPrivateKey.createWithData(privateKey);
      final pubKey =
          key.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(pubKey.data));
      final inputP2wpkh =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);
      final outputInscribe = TWBitcoinScript.buildBRC20InscribeTransfer(
        ticker: 'oadf',
        amount: '20',
        pubkey: pubKey.data,
      );
      final outputInscribeProto =
          Bitcoin.TransactionOutput.fromBuffer(outputInscribe);

      final input = Bitcoin.SigningInput(
        isItBrcOperation: true,
        privateKey: [privateKey],
        coinType: TWCoinType.TWCoinTypeBitcoin,
        utxo: [
          Bitcoin.UnspentTransaction(
            amount: $fixnum.Int64(fullAmount),
            script: inputP2wpkh.data,
            variant: Bitcoin.TransactionVariant.P2WPKH,
            outPoint: Bitcoin.OutPoint(
              index: 1,
              hash: txId,
            ),
          ),
        ],
        plan: Bitcoin.TransactionPlan(
          utxos: [
            Bitcoin.UnspentTransaction(
              amount: $fixnum.Int64(brcInscribeAmount),
              script: outputInscribeProto.script,
              variant: Bitcoin.TransactionVariant.BRC20TRANSFER,
            ),
            Bitcoin.UnspentTransaction(
              amount: $fixnum.Int64(forFeeAmount),
              script: inputP2wpkh.data,
              variant: Bitcoin.TransactionVariant.P2WPKH,
            ),
          ],
        ),
      );

      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      expectHex(output.encoded,
          '02000000000101089098890d2653567b9e8df2d1fbe5c3c8bf1910ca7184e301db0ad3b495c88e0100000000ffffffff02581b000000000000225120e8b706a97732e705e22ae7710703e7f589ed13c636324461afa443016134cc051040000000000000160014e311b8d6ddff856ce8e9a4e03bc6d4fe5050a83d02483045022100a44aa28446a9a886b378a4a65e32ad9a3108870bd725dc6105160bed4f317097022069e9de36422e4ce2e42b39884aa5f626f8f94194d1013007d5a1ea9220a06dce0121030f209b6ada5edb42c77fd2bc64ad650ae38314c8f451f3e36d80bc8e26f132cb00000000');
      expect(output.transactionId,
          '797d17d47ae66e598341f9dfdea020b04d4017dcf9cc33f0e51f7a6082171fb1');
      expect(output.error, Common.SigningError.OK);

      // Successfully broadcasted: https://www.blockchain.com/explorer/transactions/btc/797d17d47ae66e598341f9dfdea020b04d4017dcf9cc33f0e51f7a6082171fb1
    });

    // Tests the BitcoinV2 API through the legacy `SigningInput`.
    test('SignBRC20TransferCommitV2', () {
      final privateKey = parse_hex(
          "e253373989199da27c48680e3a3fc0f648d50f9a727ef17a7fe6a4dc3b159129");
      final fullAmount = 26400;
      final minerFee = 3000;
      final brcInscribeAmount = 7000;
      final forFeeAmount = fullAmount - brcInscribeAmount - minerFee;
      final txId = parse_hex(
          "089098890d2653567b9e8df2d1fbe5c3c8bf1910ca7184e301db0ad3b495c88e");

      final key = TWPrivateKey.createWithData(privateKey);
      final pubKey =
          key.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);

      final signing = BitcoinV2.SigningInput(
        version: 2,
        privateKey: privateKey,
        inputSelector: Utxo.InputSelector.UseAll,
        disableChangeOutput: true,
        inputs: [
          BitcoinV2.Input(
            txid: txId,
            vout: 1,
            value: $fixnum.Int64(fullAmount),
            builder: BitcoinV2.Input_InputBuilder(
              p2wpkh: pubKey.data,
            ),
          ),
        ],
        outputs: [
          BitcoinV2.Output(
            value: $fixnum.Int64(brcInscribeAmount),
            builder: BitcoinV2.Output_OutputBuilder(
              brc20Inscribe: BitcoinV2.Output_OutputBrc20Inscription(
                ticker: 'oadf',
                transferAmount: '20',
                inscribeTo: pubKey.data,
              ),
            ),
          ),
          BitcoinV2.Output(
            value: $fixnum.Int64(forFeeAmount),
            builder: BitcoinV2.Output_OutputBuilder(
              p2wpkh: BitcoinV2.ToPublicKeyOrHash(
                pubkey: pubKey.data,
              ),
            ),
          ),
        ],
      );

      final legacy = Bitcoin.SigningInput(
        signingV2: signing,
      );

      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        legacy.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      expect(output.error, Common.SigningError.OK);
      expect(output.hasSigningResultV2(), true);
      expect(output.signingResultV2.error, BitcoinV2.Error.OK);
      expectHex(output.signingResultV2.encoded,
          '02000000000101089098890d2653567b9e8df2d1fbe5c3c8bf1910ca7184e301db0ad3b495c88e0100000000ffffffff02581b000000000000225120e8b706a97732e705e22ae7710703e7f589ed13c636324461afa443016134cc051040000000000000160014e311b8d6ddff856ce8e9a4e03bc6d4fe5050a83d02483045022100a44aa28446a9a886b378a4a65e32ad9a3108870bd725dc6105160bed4f317097022069e9de36422e4ce2e42b39884aa5f626f8f94194d1013007d5a1ea9220a06dce0121030f209b6ada5edb42c77fd2bc64ad650ae38314c8f451f3e36d80bc8e26f132cb00000000');
      expectHex(output.signingResultV2.txid,
          '797d17d47ae66e598341f9dfdea020b04d4017dcf9cc33f0e51f7a6082171fb1');
    });

    test('SignBRC20TransferReveal', () {
      final privateKey = parse_hex(
          "e253373989199da27c48680e3a3fc0f648d50f9a727ef17a7fe6a4dc3b159129");
      final dustSatoshi = 546;
      final brcInscribeAmount = 7000;
      final txId = parse_hex(
          "b11f1782607a1fe5f033ccf9dc17404db020a0dedff94183596ee67ad4177d79");

      final key = TWPrivateKey.createWithData(privateKey);
      final pubKey =
          key.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(pubKey.data));
      final inputP2wpkh =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);
      final outputInscribe = TWBitcoinScript.buildBRC20InscribeTransfer(
        ticker: 'oadf',
        amount: '20',
        pubkey: pubKey.data,
      );
      final outputInscribeProto =
          Bitcoin.TransactionOutput.fromBuffer(outputInscribe);

      final input = Bitcoin.SigningInput(
        isItBrcOperation: true,
        privateKey: [privateKey],
        coinType: TWCoinType.TWCoinTypeBitcoin,
        utxo: [
          Bitcoin.UnspentTransaction(
            amount: $fixnum.Int64(brcInscribeAmount),
            script: outputInscribeProto.script,
            variant: Bitcoin.TransactionVariant.BRC20TRANSFER,
            spendingScript: outputInscribeProto.spendingScript,
            outPoint: Bitcoin.OutPoint(
              index: 0,
              hash: txId,
            ),
          ),
        ],
        plan: Bitcoin.TransactionPlan(
          utxos: [
            Bitcoin.UnspentTransaction(
              amount: $fixnum.Int64(dustSatoshi),
              script: inputP2wpkh.data,
              variant: Bitcoin.TransactionVariant.P2WPKH,
            ),
          ],
        ),
      );

      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      final result = hex(output.encoded);
      expect(result.substring(0, 164),
          '02000000000101b11f1782607a1fe5f033ccf9dc17404db020a0dedff94183596ee67ad4177d790000000000ffffffff012202000000000000160014e311b8d6ddff856ce8e9a4e03bc6d4fe5050a83d0340');
      expect(result.substring(292),
          '5b0063036f7264010118746578742f706c61696e3b636861727365743d7574662d3800377b2270223a226272632d3230222c226f70223a227472616e73666572222c227469636b223a226f616466222c22616d74223a223230227d6821c00f209b6ada5edb42c77fd2bc64ad650ae38314c8f451f3e36d80bc8e26f132cb00000000');
      expect(output.transactionId,
          '7046dc2689a27e143ea2ad1039710885147e9485ab6453fa7e87464aa7dd3eca');
      expect(output.error, Common.SigningError.OK);
    });

    test('SignBRC20TransferInscription', () {
      // Successfully broadcasted: https://www.blockchain.com/explorer/transactions/btc/3e3576eb02667fac284a5ecfcb25768969680cc4c597784602d0a33ba7c654b7

      final privateKey = parse_hex(
          "e253373989199da27c48680e3a3fc0f648d50f9a727ef17a7fe6a4dc3b159129");
      final dustSatoshi = 546;
      final brcInscribeAmount = 7000;
      final fullAmount = 26400;
      final minerFee = 3000;
      final forFeeAmount = fullAmount - brcInscribeAmount - minerFee;
      final txIDInscription = parse_hex(
              "7046dc2689a27e143ea2ad1039710885147e9485ab6453fa7e87464aa7dd3eca")
          .reversed
          .toList();
      final txIDForFees = parse_hex(
              "797d17d47ae66e598341f9dfdea020b04d4017dcf9cc33f0e51f7a6082171fb1")
          .reversed
          .toList();

      final key = TWPrivateKey.createWithData(privateKey);
      final pubKey =
          key.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(pubKey.data));
      final utxoPubkeyHashBob = TWHash.ripemd(TWHash.sha256(parse_hex(
          "02f453bb46e7afc8796a9629e89e07b5cb0867e9ca340b571e7bcc63fc20c43f2e")));
      final inputP2wpkh =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);
      final outputP2wpkh =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHashBob);
      final outputInscribe = TWBitcoinScript.buildBRC20InscribeTransfer(
          ticker: 'oadf', amount: '20', pubkey: pubKey.data);
      final outputInscribeProto =
          Bitcoin.TransactionOutput.fromBuffer(outputInscribe);

      final input = Bitcoin.SigningInput(
        isItBrcOperation: true,
        privateKey: [privateKey],
        coinType: TWCoinType.TWCoinTypeBitcoin,
        utxo: [
          Bitcoin.UnspentTransaction(
            amount: $fixnum.Int64(dustSatoshi),
            script: inputP2wpkh.data,
            variant: Bitcoin.TransactionVariant.P2WPKH,
            outPoint: Bitcoin.OutPoint(
              index: 0,
              hash: txIDInscription,
            ),
          ),
          Bitcoin.UnspentTransaction(
            amount: $fixnum.Int64(forFeeAmount),
            script: inputP2wpkh.data,
            variant: Bitcoin.TransactionVariant.P2WPKH,
            outPoint: Bitcoin.OutPoint(
              index: 1,
              hash: txIDForFees,
            ),
          ),
        ],
        plan: Bitcoin.TransactionPlan(
          utxos: [
            Bitcoin.UnspentTransaction(
              amount: $fixnum.Int64(dustSatoshi),
              script: outputP2wpkh.data,
              variant: Bitcoin.TransactionVariant.P2WPKH,
            ),
            Bitcoin.UnspentTransaction(
              amount: $fixnum.Int64(forFeeAmount - minerFee),
              script: inputP2wpkh.data,
              variant: Bitcoin.TransactionVariant.P2WPKH,
            ),
          ],
        ),
      );

      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      final result = hex(output.encoded);
      expect(result,
          '02000000000102ca3edda74a46877efa5364ab85947e148508713910ada23e147ea28926dc46700000000000ffffffffb11f1782607a1fe5f033ccf9dc17404db020a0dedff94183596ee67ad4177d790100000000ffffffff022202000000000000160014e891850afc55b64aa8247b2076f8894ebdf889015834000000000000160014e311b8d6ddff856ce8e9a4e03bc6d4fe5050a83d024830450221008798393eb0b7390217591a8c33abe18dd2f7ea7009766e0d833edeaec63f2ec302200cf876ff52e68dbaf108a3f6da250713a9b04949a8f1dcd1fb867b24052236950121030f209b6ada5edb42c77fd2bc64ad650ae38314c8f451f3e36d80bc8e26f132cb0248304502210096bbb9d1f0596d69875646689e46f29485e8ceccacde9d0025db87fd96d3066902206d6de2dd69d965d28df3441b94c76e812384ab9297e69afe3480ee4031e1b2060121030f209b6ada5edb42c77fd2bc64ad650ae38314c8f451f3e36d80bc8e26f132cb00000000');
      expect(output.transactionId,
          '3e3576eb02667fac284a5ecfcb25768969680cc4c597784602d0a33ba7c654b7');
      expect(output.error, Common.SigningError.OK);
    });

    test('SignNftInscriptionCommit', () {
      // Successfully broadcasted: https://www.blockchain.com/explorer/transactions/btc/f1e708e5c5847339e16accf8716c14b33717c14d6fe68f9db36627cecbde7117

      final privateKey = parse_hex(
          "e253373989199da27c48680e3a3fc0f648d50f9a727ef17a7fe6a4dc3b159129");
      final fullAmount = 32400;
      final minerFee = 1300;
      final inscribeAmount = fullAmount - minerFee;
      final txId = parse_hex(
              "579590c3227253ad423b1e7e3c5b073b8a280d307c68aecd779df2600daa2f99")
          .reversed
          .toList();

      // The inscribed image
      final payload = parse_hex(nftInscriptionImageData);

      final key = TWPrivateKey.createWithData(privateKey);
      final pubKey =
          key.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(pubKey.data));
      final inputP2wpkh =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);
      final outputInscribe = TWBitcoinScript.buildOrdinalNftInscription(
        mimeType: 'image/png',
        payload: payload,
        pubkey: pubKey.data,
      );
      final outputInscribeProto =
          Bitcoin.TransactionOutput.fromBuffer(outputInscribe);

      final input = Bitcoin.SigningInput(
        isItBrcOperation: true,
        privateKey: [privateKey],
        coinType: TWCoinType.TWCoinTypeBitcoin,
        utxo: [
          Bitcoin.UnspentTransaction(
            amount: $fixnum.Int64(fullAmount),
            script: inputP2wpkh.data,
            variant: Bitcoin.TransactionVariant.P2WPKH,
            outPoint: Bitcoin.OutPoint(
              index: 0,
              hash: txId,
            ),
          ),
        ],
        plan: Bitcoin.TransactionPlan(
          utxos: [
            Bitcoin.UnspentTransaction(
              amount: $fixnum.Int64(inscribeAmount),
              script: outputInscribeProto.script,
              variant: Bitcoin.TransactionVariant.NFTINSCRIPTION,
            ),
          ],
        ),
      );

      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      final result = hex(output.encoded);
      expect(result,
          '02000000000101992faa0d60f29d77cdae687c300d288a3b075b3c7e1e3b42ad537222c39095570000000000ffffffff017c790000000000002251202ac69a7e9dba801e9fcba826055917b84ca6fba4d51a29e47d478de603eedab602473044022054212984443ed4c66fc103d825bfd2da7baf2ab65d286e3c629b36b98cd7debd022050214cfe5d3b12a17aaaf1a196bfeb2f0ad15ffb320c4717eb7614162453e4fe0121030f209b6ada5edb42c77fd2bc64ad650ae38314c8f451f3e36d80bc8e26f132cb00000000');
      expect(output.transactionId,
          'f1e708e5c5847339e16accf8716c14b33717c14d6fe68f9db36627cecbde7117');
      expect(output.error, Common.SigningError.OK);
    });

    test('SignNftInscriptionReveal', () {
      // Successfully broadcasted: https://www.blockchain.com/explorer/transactions/btc/173f8350b722243d44cc8db5584de76b432eb6d0888d9e66e662db51584f44ac

      final privateKey = parse_hex(
          "e253373989199da27c48680e3a3fc0f648d50f9a727ef17a7fe6a4dc3b159129");
      final inscribeAmount = 31100;
      final dustSatoshi = 546;
      final txId = parse_hex(
              "f1e708e5c5847339e16accf8716c14b33717c14d6fe68f9db36627cecbde7117")
          .reversed
          .toList();

      // The inscribed image
      final payload = parse_hex(nftInscriptionImageData);

      // The expected TX hex output
      final expectedHex = nftInscriptionRawHex;

      final key = TWPrivateKey.createWithData(privateKey);
      final pubKey =
          key.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(pubKey.data));
      final inputInscribe = TWBitcoinScript.buildOrdinalNftInscription(
        mimeType: 'image/png',
        payload: payload,
        pubkey: pubKey.data,
      );
      final inputInscribeProto =
          Bitcoin.TransactionOutput.fromBuffer(inputInscribe);
      final outputP2wpkh =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);

      final input = Bitcoin.SigningInput(
        isItBrcOperation: true,
        privateKey: [privateKey],
        coinType: TWCoinType.TWCoinTypeBitcoin,
        utxo: [
          Bitcoin.UnspentTransaction(
            amount: $fixnum.Int64(inscribeAmount),
            script: inputInscribeProto.script,
            variant: Bitcoin.TransactionVariant.NFTINSCRIPTION,
            spendingScript: inputInscribeProto.spendingScript,
            outPoint: Bitcoin.OutPoint(
              index: 0,
              hash: txId,
            ),
          ),
        ],
        plan: Bitcoin.TransactionPlan(
          utxos: [
            Bitcoin.UnspentTransaction(
              amount: $fixnum.Int64(dustSatoshi),
              script: outputP2wpkh.data,
              variant: Bitcoin.TransactionVariant.P2WPKH,
            ),
          ],
        ),
      );

      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      final result = hex(output.encoded);
      expect(output.transactionId,
          '173f8350b722243d44cc8db5584de76b432eb6d0888d9e66e662db51584f44ac');
      expect(output.error, Common.SigningError.OK);
      expect(result.substring(0, 164), expectedHex.substring(0, 164));
      expect(result.substring(292), expectedHex.substring(292));
    });

    test('SignPlanTransactionWithDustAmount', () {
      final privateKey = parse_hex(
          "4646464646464646464646464646464646464646464646464646464646464646");
      final ownAddress = "bc1qhkfq3zahaqkkzx5mjnamwjsfpq2jk7z00ppggv";

      final revUtxoHash0 = parse_hex(
          "07c42b969286be06fae38528c85f0a1ce508d4df837eb5ac4cf5f2a7a9d65fa8");
      final utxoScript0 =
          parse_hex("0014bd92088bb7e82d611a9b94fbb74a0908152b784f");

      final dustAmount = 546;
      // Use an amount less than dust.
      final sendAmount = 545;
      final availableAmount = 10189534;

      final signingInput = Bitcoin.SigningInput(
        coinType: TWCoinType.TWCoinTypeBitcoin,
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(sendAmount),
        byteFee: $fixnum.Int64(1),
        toAddress: 'bc1q2dsdlq3343vk29runkgv4yc292hmq53jedfjmp',
        changeAddress: ownAddress,
        fixedDustThreshold: $fixnum.Int64(dustAmount),
        privateKey: [privateKey],
        utxo: [
          Bitcoin.UnspentTransaction(
            script: utxoScript0,
            amount: $fixnum.Int64(availableAmount),
            outPoint: Bitcoin.OutPoint(
              hash: revUtxoHash0,
              index: 0,
              sequence: UINT32_MAX,
            ),
          ),
        ],
      );

      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
        signingInput.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(plan.error, Common.SigningError.Error_dust_amount_requested);

      // `AnySigner.sign` should return the same error.
      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        signingInput.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(output.error, Common.SigningError.Error_dust_amount_requested);
    });

    // If the change amount is less than "dust", there should not be a change output.
    test('SignPlanTransactionNoChange', () {
      final myPrivateKey = TWPrivateKey.createWithHexString(
          "9ea2172511ed73ae0096be8e593c3b75631700edaf729f1abbae607314a20e35");
      final myPublicKey = myPrivateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(myPublicKey.data));
      final redeemScript =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);

      final ownAddress = "bc1qvrt7ukvhvmdny0a3j9k8l8jasx92lrqm30t2u2";

      final utxoHash0 = parse_hex(
              "b33082a5fad105c1d9712e8d503971fe4d84713065bd323fd1019636ed940e8d")
          .reversed
          .toList();
      final utxoAmount0 = 30269;
      final utxoOutputIndex0 = 1;

      final utxoHash1 = parse_hex(
              "1f62c18bfc5f8293a2b7b061587c427bf830fb224289f9a806e6ad48de6a4c7d")
          .reversed
          .toList();
      final utxoAmount1 = 4863;
      final utxoOutputIndex1 = 1;

      final utxoHash2 = parse_hex(
              "71c3343dfca5f1914e1bfc04153517d73650cb9c931e8511d24d1f5290120f6f")
          .reversed
          .toList();
      // This UTXO will be filtered out as less than dust threshold.
      final utxoAmount2 = 300;
      final utxoOutputIndex2 = 0;

      final dustAmount = 546;
      // Change amount is too low (less than dust), so we just waste it as the transaction fee.
      final dustChange = 200;
      final sendAmount = 28235 - dustChange;

      final signingInput = Bitcoin.SigningInput(
        coinType: TWCoinType.TWCoinTypeBitcoin,
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        byteFee: $fixnum.Int64(33),
        amount: $fixnum.Int64(sendAmount),
        toAddress: 'bc1q2dsdlq3343vk29runkgv4yc292hmq53jedfjmp',
        changeAddress: ownAddress,
        fixedDustThreshold: $fixnum.Int64(dustAmount),
        privateKey: [myPrivateKey.data],
        utxo: [
          Bitcoin.UnspentTransaction(
            script: redeemScript.data,
            amount: $fixnum.Int64(utxoAmount0),
            outPoint: Bitcoin.OutPoint(
              hash: utxoHash0,
              index: utxoOutputIndex0,
              sequence: UINT32_MAX,
            ),
          ),
          Bitcoin.UnspentTransaction(
            script: redeemScript.data,
            amount: $fixnum.Int64(utxoAmount1),
            outPoint: Bitcoin.OutPoint(
              hash: utxoHash1,
              index: utxoOutputIndex1,
              sequence: UINT32_MAX,
            ),
          ),
          Bitcoin.UnspentTransaction(
            script: redeemScript.data,
            amount: $fixnum.Int64(utxoAmount2),
            outPoint: Bitcoin.OutPoint(
              hash: utxoHash2,
              index: utxoOutputIndex2,
              sequence: UINT32_MAX,
            ),
          ),
        ],
      );

      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
        signingInput.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(plan.error, Common.SigningError.OK);

      final fee = 6897 + dustChange;
      // UTXO-2 with 300 satoshis should be filtered out as less than dust.
      expect(verifyPlan(plan, [4863, 30269], sendAmount, fee), true);

      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        signingInput.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(output.error, Common.SigningError.OK);
      // Successfully broadcasted: https://mempool.space/tx/5d6bf53576a54be4d92cd8abf58d28ecc9ea7956eaf970d24d6bfcb9fcfe9855
      expectHex(output.encoded,
          '010000000001027d4c6ade48ade606a8f9894222fb30f87b427c5861b0b7a293825ffc8bc1621f0100000000ffffffff8d0e94ed369601d13f32bd653071844dfe7139508d2e71d9c105d1faa58230b30100000000ffffffff01836d0000000000001600145360df8231ac5965147c9d90ca930a2aafb0523202483045022100f95f9ac5d39f4b47dcd8c86daaaeac86374258d9960f922333ba0d5fdaa15b7e0220761794672dc9fbd71398d608f72f5d21a0f6c1306c6b700ad0d82f747c221062012103a11506993946e20ea82686b157bf08f944759f43d91af8d84650ee73a482431c02483045022100eb6ba0dcc64af61b2186b7efdab1ff03784d585ee03437f9a53875e93429db080220015a268d308436d3564b83ceaed90bc7272ca164016298ea855d1936568002a7012103a11506993946e20ea82686b157bf08f944759f43d91af8d84650ee73a482431c00000000');
    });

    // Not enough funds to send requested amount after UTXO dust filtering.
    test('SignPlanTransactionNotSufficientAfterDustFiltering', () {
      final myPrivateKey = TWPrivateKey.createWithHexString(
          '9ea2172511ed73ae0096be8e593c3b75631700edaf729f1abbae607314a20e35');
      final myPublicKey = myPrivateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(myPublicKey.data));
      final redeemScript =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);

      final ownAddress = "bc1qvrt7ukvhvmdny0a3j9k8l8jasx92lrqm30t2u2";

      final utxoHash0 = parse_hex(
              "b33082a5fad105c1d9712e8d503971fe4d84713065bd323fd1019636ed940e8d")
          .reversed
          .toList();
      final utxoAmount0 = 30269;
      final utxoOutputIndex0 = 1;

      final utxoHash1 = parse_hex(
              "1f62c18bfc5f8293a2b7b061587c427bf830fb224289f9a806e6ad48de6a4c7d")
          .reversed
          .toList();
      final utxoAmount1 = 545;
      final utxoOutputIndex1 = 1;

      final utxoScript0 =
          parse_hex("0014bd92088bb7e82d611a9b94fbb74a0908152b784f");

      final dustAmount = 546;
      final sendAmount = 25620;

      final signingInput = Bitcoin.SigningInput(
        coinType: TWCoinType.TWCoinTypeBitcoin,
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        byteFee: $fixnum.Int64(33),
        amount: $fixnum.Int64(sendAmount),
        toAddress: 'bc1q2dsdlq3343vk29runkgv4yc292hmq53jedfjmp',
        changeAddress: ownAddress,
        fixedDustThreshold: $fixnum.Int64(dustAmount),
        privateKey: [myPrivateKey.data],
        utxo: [
          Bitcoin.UnspentTransaction(
            script: redeemScript.data,
            amount: $fixnum.Int64(utxoAmount0),
            outPoint: Bitcoin.OutPoint(
              hash: utxoHash0,
              index: utxoOutputIndex0,
              sequence: UINT32_MAX,
            ),
          ),
          Bitcoin.UnspentTransaction(
            script: redeemScript.data,
            amount: $fixnum.Int64(utxoAmount1),
            outPoint: Bitcoin.OutPoint(
              hash: utxoHash1,
              index: utxoOutputIndex1,
              sequence: UINT32_MAX,
            ),
          ),
        ],
      );

      // sum()

      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
        signingInput.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(plan.error, Common.SigningError.Error_not_enough_utxos);

      // `AnySigner.sign` should return the same error.
      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        signingInput.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(output.error, Common.SigningError.Error_not_enough_utxos);
    });

    test('SignP2PKH', () {
      final input = buildInputP2PKH();

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(
          verifyPlan(plan, [625000000], 335790000, 226),
          true,
        );
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      expect(result.error, Common.SigningError.OK);
      final signedTx = hex(result.encoded);
      expect(
        signedTx,
        "01000000" // version
        "01" // inputs
        "fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f"
        "00000000"
        "6a"
        "47304402202819d70d4bec472113a1392cadc0860a7a1b34ea0869abb4bdce3290c3aba086022023eff75f410ad19cdbe6c6a017362bd554ce5fb906c13534ddc306be117ad30a012103c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432"
        "ffffffff"
        "02" // outputs
        "b0bf031400000000"
        "19"
        "76a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        "aefd3c1100000000"
        "19"
        "76a9149e089b6889e032d46e3b915a3392edfd616fb1c488ac"
        "00000000" // nLockTime
        ,
      );
    });

    test('SignP2PKH_NegativeMissingKey', () {
      final input = buildInputP2PKH(true);

      {
        // test plan (but do not reuse plan result). Plan works even with missing keys.
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [625000000], 335790000, 226), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.Error_missing_private_key);
    });

    test('SignP2WPKH_Bip143', () {
      // https://github.com/bitcoin/bips/blob/master/bip-0143.mediawiki#native-p2wpkh
      final amount = 112340000;
      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(amount), // 0x06B22C20
        byteFee: $fixnum.Int64(20), // not relevant
        toAddress: '1Cu32FVupVCgHkMMRJdYJugxwo2Aprgk7H',
        changeAddress: '16TZ8J6Q5iZKBWizWzFAYnrsaox5Z5aBRV',
      );

      final hash0 = parse_hex(
          "fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f");
      final utxoKey0 = TWPrivateKey.createWithHexString(
          'bbc27228ddcb9209d7fd6f36b02f7dfa6252af40bb2f1cbc7a557da8027ff866');
      final pubKey0 =
          utxoKey0.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      expectHex(pubKey0.data,
          '03c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432');

      final utxo0Script = TWBitcoinScript.buildPayToPublicKey(pubKey0.data);
      final key2 = utxo0Script.matchPayToPubkey()!;
      expectHexBytes(key2, pubKey0.data);
      input.privateKey.add(utxoKey0.data);

      final hash1 = parse_hex(
          "ef51e1b804cc89d182d279655c3aa89e815b1b309fe287d9b2b55d57b90ec68a");
      final utxoKey1 = TWPrivateKey.createWithHexString(
          '619c335025c7f4012e556c2a58b2506e30b8511b53ade95ea316fd8c3286feb9');
      final pubKey1 =
          utxoKey1.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      expectHex(pubKey1.data,
          '025476c2e83188368da1ff3e292e7acafcdb3566bb0ad253f62fc70f07aeee6357');
      final utxoPubkeyHash1 = TWHash.ripemd(TWHash.sha256(pubKey1.data));
      expectHex(utxoPubkeyHash1, '1d0f172a0ecb48aee1be1f2687d2963ae33f71a1');
      input.privateKey.add(utxoKey1.data);
      input.lockTime = 0x11;

      final utxo0 = Bitcoin.UnspentTransaction(
        script: utxo0Script.data,
        amount: $fixnum.Int64(1000000),
        outPoint: Bitcoin.OutPoint(
          hash: hash0,
          index: 0,
          sequence: 0xffffffee,
        ),
      );
      final utxo1Script =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash1);
      final utxo1 = Bitcoin.UnspentTransaction(
        script: utxo1Script.data,
        amount: $fixnum.Int64(600000000),
        outPoint: Bitcoin.OutPoint(
          hash: hash1,
          index: 1,
          sequence: UINT32_MAX,
        ),
      );

      input.utxo.addAll([
        utxo0,
        utxo1,
      ]);

      input.plan = Bitcoin.TransactionPlan(
        amount: $fixnum.Int64(amount),
        availableAmount: $fixnum.Int64(600000000 + 1000000),
        fee: $fixnum.Int64(
            265210000), // very large, the amounts specified (in1, out0, out1) are not consistent/realistic
        change: $fixnum.Int64(223450000), // 0x0d519390
        branchId: [0],
        utxos: [
          utxo0,
          utxo1,
        ],
      );

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      expect(result.error, Common.SigningError.OK);
      final signedTx = hex(result.encoded);
      // expected in one string for easy comparison/copy:
      expect(signedTx,
          '01000000000102fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f00000000494830450221008b9d1dc26ba6a9cb62127b02742fa9d754cd3bebf337f7a55d114c8e5cdd30be022040529b194ba3f9281a99f2b1c0a19c0489bc22ede944ccf4ecbab4cc618ef3ed01eeffffffef51e1b804cc89d182d279655c3aa89e815b1b309fe287d9b2b55d57b90ec68a0100000000ffffffff02202cb206000000001976a9148280b37df378db99f66f85c95a783a76ac7a6d5988ac9093510d000000001976a9143bde42dbee7e4dbe6a21b2d50ce2f0167faa815988ac000247304402203609e17b84f6a7d30c80bfa610b5b4542f32a8a0d5447a12fb1366d7f01cc44a0220573a954c4518331561406f90300e8f3358f51928d43c212a8caed02de67eebee0121025476c2e83188368da1ff3e292e7acafcdb3566bb0ad253f62fc70f07aeee635711000000');
      // expected in structured format:
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "02" // inputs
        "fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f"
        "00000000"
        "49"
        "4830450221008b9d1dc26ba6a9cb62127b02742fa9d754cd3bebf337f7a55d114c8e5cdd30be022040529b194ba3f9281a99f2b1c0a19c0489bc22ede944ccf4ecbab4cc618ef3ed01"
        "eeffffff"
        "ef51e1b804cc89d182d279655c3aa89e815b1b309fe287d9b2b55d57b90ec68a"
        "01000000"
        "00"
        ""
        "ffffffff"
        "02" // outputs
        "202cb20600000000"
        "19"
        "76a9148280b37df378db99f66f85c95a783a76ac7a6d5988ac"
        "9093510d00000000"
        "19"
        "76a9143bde42dbee7e4dbe6a21b2d50ce2f0167faa815988ac"
        // witness
        "00"
        "02"
        "47"
        "304402203609e17b84f6a7d30c80bfa610b5b4542f32a8a0d5447a12fb1366d7f01cc44a0220573a954c4518331561406f90300e8f3358f51928d43c212a8caed02de67eebee01"
        "21"
        "025476c2e83188368da1ff3e292e7acafcdb3566bb0ad253f62fc70f07aeee6357"
        "11000000",
      );
    });
  });
}
