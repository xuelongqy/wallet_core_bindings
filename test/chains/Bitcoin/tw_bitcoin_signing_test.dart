import 'dart:typed_data';

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

Bitcoin.SigningInput buildInputP2WPKH(
    int amount, int hashType, int utxo0Amount, int utxo1Amount,
    [bool useMaxAmount = false]) {
  final hash0 = parse_hex(
      "fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f");
  final hash1 = parse_hex(
      "ef51e1b804cc89d182d279655c3aa89e815b1b309fe287d9b2b55d57b90ec68a");

  // Setup input
  final input = Bitcoin.SigningInput(
    hashType: hashType,
    amount: $fixnum.Int64(amount),
    useMaxAmount: useMaxAmount,
    byteFee: $fixnum.Int64(1),
    toAddress: '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx',
    changeAddress: '1FQc5LdgGHMHEN9nwkjmz6tWkxhPpxBvBU',
    coinType: TWCoinType.TWCoinTypeBitcoin,
  );

  final utxoKey0 = TWPrivateKey.createWithData(TWData.createWithHexString(
          'bbc27228ddcb9209d7fd6f36b02f7dfa6252af40bb2f1cbc7a557da8027ff866')
      .bytes()!);
  final pubKey0 =
      utxoKey0.getPublicKey(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
  final utxoPubkeyHash0 = TWHash.ripemd(TWHash.sha256(pubKey0.data));
  expectHex(utxoPubkeyHash0, 'b7cd046b6d522a3d61dbcb5235c0e9cc97265457');
  input.privateKey.add(utxoKey0.data);

  final utxoKey1 = TWPrivateKey.createWithData(TWData.createWithHexString(
          '619c335025c7f4012e556c2a58b2506e30b8511b53ade95ea316fd8c3286feb9')
      .bytes()!);
  final pubKey1 =
      utxoKey1.getPublicKey(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
  final utxoPubkeyHash1 = TWHash.ripemd(TWHash.sha256(pubKey1.data));
  expectHex(utxoPubkeyHash1, '1d0f172a0ecb48aee1be1f2687d2963ae33f71a1');
  input.privateKey.add(utxoKey1.data);

  final scriptPub1 = TWBitcoinScript.createWithBytes(parse_hex("0014"
      "1d0f172a0ecb48aee1be1f2687d2963ae33f71a1"));
  final scriptHash = scriptPub1.matchPayToWitnessPublicKeyHash()!;
  final scriptHashHex = hex(scriptHash);
  expect(scriptHashHex, '1d0f172a0ecb48aee1be1f2687d2963ae33f71a1');

  final redeemScript = TWBitcoinScript.buildPayToWitnessPubkeyHash(
      parse_hex("1d0f172a0ecb48aee1be1f2687d2963ae33f71a1"));
  input.scripts[scriptHashHex] = redeemScript.data;

  final utxo0 = Bitcoin.UnspentTransaction(
    script: parse_hex(
        "2103c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432ac"),
    amount: $fixnum.Int64(utxo0Amount),
    outPoint: Bitcoin.OutPoint(
      hash: hash0,
      index: 0,
      sequence: UINT32_MAX,
    ),
  );
  input.utxo.add(utxo0);

  final utxo1 = Bitcoin.UnspentTransaction(
    script: parse_hex("0014"
        "1d0f172a0ecb48aee1be1f2687d2963ae33f71a1"),
    amount: $fixnum.Int64(utxo1Amount),
    outPoint: Bitcoin.OutPoint(
      hash: hash1,
      index: 1,
      sequence: UINT32_MAX,
    ),
  );
  input.utxo.add(utxo1);
  return input;
}

Bitcoin.SigningInput buildInputP2WSH(int hashType,
    [bool omitScript = false, bool omitKeys = false]) {
  final input = Bitcoin.SigningInput(
    hashType: hashType,
    amount: $fixnum.Int64(1000),
    byteFee: $fixnum.Int64(1),
    toAddress: '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx',
    changeAddress: '1FQc5LdgGHMHEN9nwkjmz6tWkxhPpxBvBU',
    fixedDustThreshold: $fixnum.Int64(50),
  );

  if (!omitKeys) {
    final utxoKey0 = TWPrivateKey.createWithData(TWData.createWithHexString(
            'ed00a0841cd53aedf89b0c616742d1d2a930f8ae2b0fb514765a17bb62c7521a')
        .bytes()!);
    input.privateKey.add(utxoKey0.data);

    final utxoKey1 = TWPrivateKey.createWithData(TWData.createWithHexString(
            '619c335025c7f4012e556c2a58b2506e30b8511b53ade95ea316fd8c3286feb9')
        .bytes()!);
    input.privateKey.add(utxoKey1.data);
  }

  if (!omitScript) {
    final redeemScript = TWBitcoinScript.createWithBytes(parse_hex(
        '2103596d3451025c19dbbdeb932d6bf8bfb4ad499b95b6f88db8899efac102e5fc71ac'));
    final scriptHash = '593128f9f90e38b706c18623151e37d2da05c229';
    input.scripts[scriptHash] = redeemScript.data;
  }

  final utxo0 = Bitcoin.UnspentTransaction(
    script: TWBitcoinScript.buildPayToWitnessScriptHash(parse_hex(
            "ff25429251b5a84f452230a3c75fd886b7fc5a7865ce4a7bb7a9d7c5be6da3db"))
        .data,
    amount: $fixnum.Int64(1226),
    outPoint: Bitcoin.OutPoint(
      hash: parse_hex(
          '0001000000000000000000000000000000000000000000000000000000000000'),
      index: 0,
      sequence: UINT32_MAX,
    ),
  );
  input.utxo.add(utxo0);

  return input;
}

Bitcoin.SigningInput buildInputP2SH_P2WPKH(
    [bool omitScript = false,
    bool omitKeys = false,
    bool invalidOutputScript = false,
    bool invalidRedeemScript = false]) {
  // Setup input
  final input = Bitcoin.SigningInput(
    hashType: TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoin),
    amount: $fixnum.Int64(200000000),
    byteFee: $fixnum.Int64(1),
    toAddress: '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx',
    changeAddress: '1FQc5LdgGHMHEN9nwkjmz6tWkxhPpxBvBU',
    coinType: TWCoinType.TWCoinTypeBitcoin,
  );

  final utxoKey0 = TWPrivateKey.createWithHexString(
      'eb696a065ef48a2192da5b28b694f87544b30fae8327c4510137a922f32c6dcf');
  final pubKey0 =
      utxoKey0.getPublicKey(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
  final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(pubKey0.data));
  expectHex(utxoPubkeyHash, '79091972186c449eb1ded22b78e40d009bdf0089');
  if (!omitKeys) {
    input.privateKey.add(utxoKey0.data);
  }

  if (!omitScript && !invalidRedeemScript) {
    final redeemScript =
        TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);
    final scriptHash = TWHash.ripemd(TWHash.sha256(redeemScript.data));
    expectHex(scriptHash, '4733f37cf4db86fbc2efed2500b4f4e49f312023');
    input.scripts[hex(scriptHash)] = redeemScript.data;
  } else if (invalidRedeemScript) {
    final redeemScript =
        TWBitcoinScript.createWithBytes(parse_hex('FAFBFCFDFE'));
    final scriptHash = TWHash.ripemd(TWHash.sha256(redeemScript.data));
    input.scripts[hex(scriptHash)] = redeemScript.data;
  }

  var utxo0Script = TWBitcoinScript.createWithBytes(
      parse_hex('a9144733f37cf4db86fbc2efed2500b4f4e49f31202387'));
  if (invalidOutputScript) {
    utxo0Script = TWBitcoinScript.createWithBytes(parse_hex('FFFEFDFCFB'));
  }
  final utxo0 = Bitcoin.UnspentTransaction(
    script: utxo0Script.data,
    amount: $fixnum.Int64(1000000000),
    outPoint: Bitcoin.OutPoint(
      hash: parse_hex(
          "db6b1b20aa0fd7b23880be2ecbd4a98130974cf4748fb66092ac4d3ceb1a5477"),
      index: 1,
      sequence: UINT32_MAX,
    ),
  );
  input.utxo.add(utxo0);

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

    // Deposit 0.0001 BTC from bc1q2sphzvc2uqmxqte2w9dd4gzy4sy9vvfv0me9ke to 0xa8491D40d4F71A752cA41DA0516AEd80c33a1B56 on ZETA mainnet.
// https://www.zetachain.com/docs/developers/omnichain/bitcoin/#example-1-deposit-btc-into-an-account-in-zevm
    test('SignDepositBtcToZetaChain', () {
      final myPrivateKey = TWPrivateKey.createWithHexString(
          '428d66be0b5a620f126a00fa67637222ce3dc9badfe5c605189520760810cfac');
      final myPublicKey = myPrivateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(myPublicKey.data));
      final redeemScript =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);

      final ownAddress = "bc1q2sphzvc2uqmxqte2w9dd4gzy4sy9vvfv0me9ke";
      final ownZetaEvmAddress =
          parse_hex("a8491D40d4F71A752cA41DA0516AEd80c33a1B56");
      // https://www.zetachain.com/docs/reference/glossary/#tss
      final zetaTssAddress = "bc1qm24wp577nk8aacckv8np465z3dvmu7ry45el6y";

      final utxoHash0 = parse_hex(
              "17a6adb5db1e33c87467a58aa31cddbb3800052315015cf3cf1c2b0119310e20")
          .reversed
          .toList();
      final utxoAmount0 = 20000;
      final utxoOutputIndex0 = 0;

      final sendAmount = 10000;
      final dustAmount = 546;

      final signingInput = Bitcoin.SigningInput(
        coinType: TWCoinType.TWCoinTypeBitcoin,
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        byteFee: $fixnum.Int64(15),
        amount: $fixnum.Int64(sendAmount),
        toAddress: zetaTssAddress,
        changeAddress: ownAddress,
        fixedDustThreshold: $fixnum.Int64(dustAmount),
        outputOpReturn: ownZetaEvmAddress,
        // OP_RETURN must be the second output before the change.
        outputOpReturnIndex: Bitcoin.OutputIndex(
          index: 1,
        ),
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
        ],
      );

      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        signingInput.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(output.error, Common.SigningError.OK);

      expect(output.transaction.outputs.length, 3);
      // P2WPKH to the TSS address.
      expect(output.transaction.outputs[0].value.toInt(), sendAmount);
      // OP_RETURN
      expect(output.transaction.outputs[1].value.toInt(), 0);
      // Transaction fee.
      expect(output.transaction.outputs[2].value.toInt(), 7420);

      // Successfully broadcasted:
      // https://mempool.space/tx/2b871b6c1112ad0a777f6db1f7a7709154c4d9af8e771ba4eca148915f830e9d
      // https://explorer.zetachain.com/cc/tx/0x269e319478f8849247abb28b33a7b8e0a849dab4551bab328bf58bf67b02a807
      final expectedTx =
          "01000000000101200e3119012b1ccff35c011523050038bbdd1ca38aa56774c8331edbb5ada6170000000000ffffffff031027000000000000160014daaae0d3de9d8fdee31661e61aea828b59be78640000000000000000166a14a8491d40d4f71a752ca41da0516aed80c33a1b56fc1c000000000000160014540371330ae036602f2a715adaa044ac0856312c02483045022100e29731f7474f9103c6df3434c8c62a540a21ad0e10e23df343b1e81e4b26110602202d37fb4fee5341a41f9e4e65ba2d3e0d2309425ea9806d94eb268efe6f21007001210369cdaf80b4a5fdad91e9face90e848225512884ec2e3ed572ca11dc68e75054700000000";

      expectHex(output.encoded, expectedTx);

      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
        signingInput.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      expect(plan.error, Common.SigningError.OK);
      expect(plan.hasOutputOpReturnIndex(), true);
      expect(plan.outputOpReturnIndex.index, 1);
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

    test('SignP2WPKH', () {
      final input = buildInputP2WPKH(335790000,
          TWBitcoinSigHashType.TWBitcoinSigHashTypeAll, 625000000, 600000000);

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [625000000], 335790000, 192), true);
      }

      // Signs
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      expect(result.error, Common.SigningError.OK);
      final signedTx = hex(result.encoded);

      expect(result.encoded.length, 192);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "01" // inputs
        "fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f"
        "00000000"
        "49"
        "483045022100c327babdd370f0fc5b24cf920736446bf7d9c5660e4a5f7df432386fd652fe280220269c4fc3690c1c248e50c8bf2435c20b4ef00f308b403575f4437f862a91c53a01"
        "ffffffff"
        "02" // outputs
        "b0bf031400000000"
        "19"
        "76a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        "d0fd3c1100000000"
        "19"
        "76a9149e089b6889e032d46e3b915a3392edfd616fb1c488ac"
        "00000000" // nLockTime
        ,
      );
    });

    test('SignP2WPKH_HashSingle_TwoInput', () {
      final input = buildInputP2WPKH(
          335790000,
          TWBitcoinSigHashType.TWBitcoinSigHashTypeSingle,
          210000000,
          210000000);

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [210000000, 210000000], 335790000, 261), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      final signedTx = hex(result.encoded);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "02" // inputs
        "fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f"
        "00000000"
        "49"
        "483045022100fd8591c3611a07b55f509ec850534c7a9c49713c9b8fa0e844ea06c2e65e19d702205e3806676192e790bc93dd4c28e937c4bf97b15f189158ba1a30d7ecff5ee75503"
        "ffffffff"
        "ef51e1b804cc89d182d279655c3aa89e815b1b309fe287d9b2b55d57b90ec68a"
        "01000000"
        "00"
        ""
        "ffffffff"
        "02" // outputs
        "b0bf031400000000"
        "19"
        "76a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        "4bf0040500000000"
        "19"
        "76a9149e089b6889e032d46e3b915a3392edfd616fb1c488ac"
        // witness
        "00"
        "02"
        "47"
        "30440220096d20c7e92f991c2bf38dc28118feb34019ae74ec1c17179b28cb041de7517402204594f46a911f24bdc7109ca192e6860ebf2f3a0087579b3c128d5ce0cd5ed46803"
        "21"
        "025476c2e83188368da1ff3e292e7acafcdb3566bb0ad253f62fc70f07aeee6357"
        "00000000" // nLockTime
        ,
      );
    });

    test('SignP2WPKH_HashAnyoneCanPay_TwoInput', () {
      final input = buildInputP2WPKH(
          335790000,
          TWBitcoinSigHashType.TWBitcoinSigHashTypeAnyoneCanPay,
          210000000,
          210000000);

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [210000000, 210000000], 335790000, 261), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      final signedTx = hex(result.encoded);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "02" // inputs
        "fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f"
        "00000000"
        "49"
        "483045022100e21fb2f1cfd59bdb3703fd45db38fd680d0c06e5d0be86fb7dc233c07ee7ab2f02207367220a73e43df4352a6831f6f31d8dc172c83c9f613a9caf679f0f15621c5e80"
        "ffffffff"
        "ef51e1b804cc89d182d279655c3aa89e815b1b309fe287d9b2b55d57b90ec68a"
        "01000000"
        "00"
        ""
        "ffffffff"
        "02" // outputs
        "b0bf031400000000"
        "19"
        "76a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        "4bf0040500000000"
        "19"
        "76a9149e089b6889e032d46e3b915a3392edfd616fb1c488ac"
        // witness
        "00"
        "02"
        "48"
        "304502210095f9cc913d2f0892b953f2380112533e8930b67c53e00a7bbd7a01d547156adc022026efe3a684aa7432a00a919dbf81b63e635fb92d3149453e95b4a7ccea59f7c480"
        "21"
        "025476c2e83188368da1ff3e292e7acafcdb3566bb0ad253f62fc70f07aeee6357"
        "00000000" // nLockTime
        ,
      );
    });

    test('SignP2WPKH_MaxAmount', () {
      final input = buildInputP2WPKH(
          1000,
          TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
          625000000,
          600000000,
          true);
      input.amount = $fixnum.Int64(1224999773);
      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [625000000, 600000000], 1224999773, 227), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      final signedTx = hex(result.encoded);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "02" // inputs
        "fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f"
        "00000000"
        "49"
        "483045022100a8b3c1619e985923994e80efdc0be0eac12f2419e11ce5e4286a0a5ac27c775d02205d6feee85ffe19ae0835cba1562beb3beb172107cd02ac4caf24a8be3749811f01"
        "ffffffff"
        "ef51e1b804cc89d182d279655c3aa89e815b1b309fe287d9b2b55d57b90ec68a"
        "01000000"
        "00"
        ""
        "ffffffff"
        "01" // outputs
        "5d03044900000000"
        "19"
        "76a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        // witness
        "00"
        "02"
        "48"
        "3045022100db1199de92f6fb638a0ba706d13ec686bb01138a254dec2c397616cd74bad30e02200d7286d6d2d4e00d145955bf3d3b848b03c0d1eef8899e4645687a3035d7def401"
        "21"
        "025476c2e83188368da1ff3e292e7acafcdb3566bb0ad253f62fc70f07aeee6357"
        "00000000" // nLockTime
        ,
      );
    });

    test('SignP2WSH', () {
      // Setup input
      final input = buildInputP2WSH(
          TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoin));

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [1226], 1000, 147), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.OK);
      final signedTx = hex(result.encoded);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "0001000000000000000000000000000000000000000000000000000000000000"
        "00000000"
        "00"
        ""
        "ffffffff"
        "02" // outputs
        "e803000000000000"
        "19"
        "76a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        "4f00000000000000"
        "19"
        "76a9149e089b6889e032d46e3b915a3392edfd616fb1c488ac"
        // witness
        "02"
        "48"
        "30450221009eefc1befe96158f82b74e6804f1f713768c6172636ca11fcc975c316ea86f75022057914c48bc24f717498b851a47a2926f96242e3943ebdf08d5a97a499efc8b9001"
        "23"
        "2103596d3451025c19dbbdeb932d6bf8bfb4ad499b95b6f88db8899efac102e5fc71ac"
        "00000000" // nLockTime
        ,
      );
    });

    test('SignP2WSH_HashNone', () {
      // Setup input
      final input =
          buildInputP2WSH(TWBitcoinSigHashType.TWBitcoinSigHashTypeNone);

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [1226], 1000, 147), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.OK);
      final signedTx = hex(result.encoded);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "0001000000000000000000000000000000000000000000000000000000000000"
        "00000000"
        "00"
        ""
        "ffffffff"
        "02" // outputs
        "e803000000000000"
        "19"
        "76a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        "4f00000000000000"
        "19"
        "76a9149e089b6889e032d46e3b915a3392edfd616fb1c488ac"
        // witness
        "02"
        "48"
        "3045022100caa585732cfc50226a90834a306d23d5d2ab1e94af2c66136a637e3d9bad3688022069028750908e53a663bb1f434fd655bcc0cf8d394c6fa1fd5a4983790135722e02"
        "23"
        "2103596d3451025c19dbbdeb932d6bf8bfb4ad499b95b6f88db8899efac102e5fc71ac"
        "00000000" // nLockTime
        ,
      );
    });

    test('SignP2WSH_HashSingle', () {
      // Setup input
      final input =
          buildInputP2WSH(TWBitcoinSigHashType.TWBitcoinSigHashTypeSingle);

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [1226], 1000, 147), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.OK);
      final signedTx = hex(result.encoded);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "0001000000000000000000000000000000000000000000000000000000000000"
        "00000000"
        "00"
        ""
        "ffffffff"
        "02" // outputs
        "e803000000000000"
        "19"
        "76a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        "4f00000000000000"
        "19"
        "76a9149e089b6889e032d46e3b915a3392edfd616fb1c488ac"
        // witness
        "02"
        "47"
        "304402201ba80b2c48fe82915297dc9782ae2141e40263001fafd21b02c04a092503f01e0220666d6c63475c6c52abd09371c200ac319bcf4a7c72eb3782e95790f5c847f0b903"
        "23"
        "2103596d3451025c19dbbdeb932d6bf8bfb4ad499b95b6f88db8899efac102e5fc71ac"
        "00000000" // nLockTime
        ,
      );
    });

    test('SignP2WSH_HashAnyoneCanPay', () {
      // Setup input
      final input = buildInputP2WSH(
          TWBitcoinSigHashType.TWBitcoinSigHashTypeAnyoneCanPay);

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [1226], 1000, 147), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.OK);
      final signedTx = hex(result.encoded);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "0001000000000000000000000000000000000000000000000000000000000000"
        "00000000"
        "00"
        ""
        "ffffffff"
        "02" // outputs
        "e803000000000000"
        "19"
        "76a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        "4f00000000000000"
        "19"
        "76a9149e089b6889e032d46e3b915a3392edfd616fb1c488ac"
        // witness
        "02"
        "48"
        "3045022100d14699fc9b7337768bcd1430098d279cfaf05f6abfa75dd542da2dc038ae1700022063f0751c08796c086ac23b39c25f4320f432092e0c11bec46af0723cc4f55a3980"
        "23"
        "2103596d3451025c19dbbdeb932d6bf8bfb4ad499b95b6f88db8899efac102e5fc71ac"
        "00000000" // nLockTime
        ,
      );
    });

    test('SignP2WSH_NegativeMissingScript', () {
      // Setup input
      final input =
          buildInputP2WSH(TWBitcoinSigHashType.TWBitcoinSigHashTypeAll, true);

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [1226], 1000, 174), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.Error_script_redeem);
    });

    test('SignP2WSH_NegativeMissingKeys', () {
      // Setup input
      final input = buildInputP2WSH(
          TWBitcoinSigHashType.TWBitcoinSigHashTypeAll, false, true);

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [1226], 1000, 147), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.Error_missing_private_key);
    });

    test('SignP2WSH_NegativeNoUTXOs', () {
      // Setup input
      final input =
          buildInputP2WSH(TWBitcoinSigHashType.TWBitcoinSigHashTypeAll);
      input.utxo.clear();
      expect(input.utxo.length, 0);

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.Error_missing_input_utxos);
    });

    test('SignP2SH_P2WPKH', () {
      final input = buildInputP2SH_P2WPKH();
      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(
          verifyPlan(plan, [1000000000], 200000000, 170),
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
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "db6b1b20aa0fd7b23880be2ecbd4a98130974cf4748fb66092ac4d3ceb1a5477"
        "01000000"
        "17"
        "16001479091972186c449eb1ded22b78e40d009bdf0089"
        "ffffffff"
        "02" // outputs
        "00c2eb0b00000000"
        "19"
        "76a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        "5607af2f00000000"
        "19"
        "76a9149e089b6889e032d46e3b915a3392edfd616fb1c488ac"
        // witness
        "02"
        "47"
        "3044022062b408cc7f92c8add622f3297b8992d68403849c6421ef58274ed6fc077102f30220250696eacc0aad022f55882d742dda7178bea780c03705bf9cdbee9f812f785301"
        "21"
        "03ad1d8e89212f0b92c74d23bb710c00662ad1470198ac48c43f7d6f93a2a26873"
        "00000000" // nLockTime
        ,
      );
    });

    test('SignP2SH_P2WPKH_NegativeOmitScript', () {
      final input = buildInputP2SH_P2WPKH(true, false);
      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(
          verifyPlan(plan, [1000000000], 200000000, 174),
          true,
        );
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.Error_script_redeem);
    });

    test('SignP2SH_P2WPKH_NegativeInvalidOutputScript', () {
      final input = buildInputP2SH_P2WPKH(false, false, true);
      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(
          verifyPlan(plan, [1000000000], 200000000, 174),
          true,
        );
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.Error_script_output);
    });

    test('SignP2SH_P2WPKH_NegativeInvalidOutputScript', () {
      final input = buildInputP2SH_P2WPKH(false, false, false, true);
      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(
          verifyPlan(plan, [1000000000], 200000000, 174),
          true,
        );
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.Error_script_redeem);
    });

    test('SignP2SH_P2WPKH_NegativeOmitKeys', () {
      final input = buildInputP2SH_P2WPKH(false, true);
      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(
          verifyPlan(plan, [1000000000], 200000000, 170),
          true,
        );
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.Error_missing_private_key);
    });

    test('SignP2SH_P2WSH', () {
      // Setup signing input
      final input = Bitcoin.SigningInput(
        amount: $fixnum.Int64(900000000),
        hashType: 0,
        toAddress: '16AQVuBMt818u2HBcbxztAZTT2VTDKupPS',
        changeAddress: '1Bd1VA2bnLjoBk4ook3H19tZWETk8s6Ym5',
        privateKey: [
          parse_hex(
              "730fff80e1413068a05b57d6a58261f07551163369787f349438ea38ca80fac6"),
          parse_hex(
              "11fa3d25a17cbc22b29c44a484ba552b5a53149d106d3d853e22fdd05a2d8bb3"),
          parse_hex(
              "77bf4141a87d55bdd7f3cd0bdccf6e9e642935fec45f2f30047be7b799120661"),
          parse_hex(
              "14af36970f5025ea3e8b5542c0f8ebe7763e674838d08808896b63c3351ffe49"),
          parse_hex(
              "fe9a95c19eef81dde2b95c1284ef39be497d128e2aa46916fb02d552485e0323"),
          parse_hex(
              "428a7aee9f0c2af0cd19af3cf1c78149951ea528726989b2e83e4778d2c3f890"),
        ],
      );

      final redeemScript = TWBitcoinScript.buildPayToWitnessScriptHash(parse_hex(
          "a16b5755f7f6f96dbd65f5f0d6ab9418b89af4b1f14a1bb8a09062c35f0dcb54"));
      final scriptHash = TWHash.ripemd(TWHash.sha256(redeemScript.data));
      input.scripts[hex(scriptHash)] = redeemScript.data;

      final witnessScript = TWBitcoinScript.createWithBytes(parse_hex("56"
          "210307b8ae49ac90a048e9b53357a2354b3334e9c8bee813ecb98e99a7e07e8c3ba3"
          "2103b28f0c28bfab54554ae8c658ac5c3e0ce6e79ad336331f78c428dd43eea8449b"
          "21034b8113d703413d57761b8b9781957b8c0ac1dfe69f492580ca4195f50376ba4a"
          "21033400f6afecb833092a9a21cfdf1ed1376e58c5d1f47de74683123987e967a8f4"
          "2103a6d48b1131e94ba04d9737d61acdaa1322008af9602b3b14862c07a1789aac16"
          "2102d8b661b0b3302ee2f162b09e07a55ad5dfbe673a9f01d9f0c19617681024306b"
          "56ae"));
      final witnessScriptHash =
          TWHash.ripemd(TWHash.sha256(witnessScript.data));
      input.scripts[hex(witnessScriptHash)] = witnessScript.data;

      final utxo0Script = TWBitcoinScript.createWithBytes(
          parse_hex('a9149993a429037b5d912407a71c252019287b8d27a587'));
      input.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
              "36641869ca081e70f394c6948e8af409e18b619df2ed74aa106c1ca29787b96e"),
          index: 1,
          sequence: UINT32_MAX,
        ),
        script: utxo0Script.data,
        amount: $fixnum.Int64(987654321),
      ));

      final plan = Bitcoin.TransactionPlan(
        amount: input.amount,
        availableAmount: input.utxo[0].amount,
        change: $fixnum.Int64(87000000),
        fee: input.utxo[0].amount - input.amount - $fixnum.Int64(87000000),
        utxos: input.utxo,
      );
      input.plan = plan;

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.OK);
      final signedTx = hex(result.encoded);

      final expected = "01000000" // version
          "0001" // marker & flag
          "01" // inputs
          "36641869ca081e70f394c6948e8af409e18b619df2ed74aa106c1ca29787b96e"
          "01000000"
          "23"
          "220020a16b5755f7f6f96dbd65f5f0d6ab9418b89af4b1f14a1bb8a09062c35f0dcb54"
          "ffffffff"
          "02" // outputs
          "00e9a43500000000"
          "19"
          "76a914389ffce9cd9ae88dcc0631e88a821ffdbe9bfe2688ac"
          "c0832f0500000000"
          "19"
          "76a9147480a33f950689af511e6e84c138dbbd3c3ee41588ac"
          // witness
          "08"
          "00"
          ""
          "47"
          "304402201992f5426ae0bab04cf206d7640b7e00410297bfe5487637f6c2427ee8496be002204ad4e64dc2d269f593cc4820db1fc1e8dc34774f602945115ce485940e05c64200"
          "47"
          "304402201e412363fa554b994528fd44149f3985b18bb901289ef6b71105b27c7d0e336c0220595e4a1e67154337757562ed5869127533e3e5084c3c2e128518f5f0b85b721800"
          "47"
          "3044022003b0a20ccf545b3f12c5ade10db8717e97b44da2e800387adfd82c95caf529d902206aee3a2395530d52f476d0ddd9d20ba062820ae6f4e1be4921c3630395743ad900"
          "48"
          "3045022100ed7a0eeaf72b84351bceac474b0c0510f67065b1b334f77e6843ed102f968afe022004d97d0cfc4bf5651e46487d6f87bd4af6aef894459f9778f2293b0b2c5b7bc700"
          "48"
          "3045022100934a0c364820588154aed2d519cbcc61969d837b91960f4abbf0e374f03aa39d022036b5c58b754bd44cb5c7d34806c89d9778ea1a1c900618a841e9fbfbe805ff9b00"
          "47"
          "3044022044e3b59b06931d46f857c82fa1d53d89b116a40a581527eac35c5eb5b7f0785302207d0f8b5d063ffc6749fb4e133db7916162b540c70dee40ec0b21e142d8843b3a00"
          "cf"
          "56210307b8ae49ac90a048e9b53357a2354b3334e9c8bee813ecb98e99a7e07e8c3ba32103b28f0c28bfab54554ae8c658ac5c3e0ce6e79ad336331f78c428dd43eea8449b21034b8113d703413d57761b8b9781957b8c0ac1dfe69f492580ca4195f50376ba4a21033400f6afecb833092a9a21cfdf1ed1376e58c5d1f47de74683123987e967a8f42103a6d48b1131e94ba04d9737d61acdaa1322008af9602b3b14862c07a1789aac162102d8b661b0b3302ee2f162b09e07a55ad5dfbe673a9f01d9f0c19617681024306b56ae"
          "00000000" // nLockTime
          ;
      expect(signedTx, expected);
    });

    test('Sign_NegativeNoUtxos', () {
      final hash0 = parse_hex(
          "fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f");
      final hash1 = parse_hex(
          "ef51e1b804cc89d182d279655c3aa89e815b1b309fe287d9b2b55d57b90ec68a");

      // Setup input
      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(335790000),
        byteFee: $fixnum.Int64(1),
        toAddress: '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx',
        changeAddress: '1FQc5LdgGHMHEN9nwkjmz6tWkxhPpxBvBU',
      );

      final scriptPub1 = TWBitcoinScript.createWithBytes(
          parse_hex('00141d0f172a0ecb48aee1be1f2687d2963ae33f71a1'));
      final scriptHash = scriptPub1.matchPayToWitnessPublicKeyHash()!;
      final scriptHashHex = hex(scriptHash);
      expect(scriptHashHex, '1d0f172a0ecb48aee1be1f2687d2963ae33f71a1');

      final redeemScript = TWBitcoinScript.buildPayToPublicKeyHash(scriptHash);
      input.scripts[scriptHashHex] = redeemScript.data;

      {
        // plan returns empty, as there are 0 utxos
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(
            verifyPlan(
                plan, [], 0, 0, Common.SigningError.Error_missing_input_utxos),
            true);
      }

      // Invoke Sign nonetheless
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      // Fails as there are 0 utxos
      expect(result.error, Common.SigningError.Error_missing_input_utxos);
    });

    test('Sign_NegativeInvalidAddress', () {
      final hash0 = parse_hex(
          "fff7f7881a8099afa6940d42d1e7f6362bec38171ea3edf433541db4e4ad969f");
      final hash1 = parse_hex(
          "ef51e1b804cc89d182d279655c3aa89e815b1b309fe287d9b2b55d57b90ec68a");

      // Setup input
      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(335790000),
        byteFee: $fixnum.Int64(1),
        toAddress: 'THIS-IS-NOT-A-BITCOIN-ADDRESS',
        changeAddress: 'THIS-IS-NOT-A-BITCOIN-ADDRESS-EITHER',
      );

      final utxoKey0 = TWPrivateKey.createWithHexString(
          'bbc27228ddcb9209d7fd6f36b02f7dfa6252af40bb2f1cbc7a557da8027ff866');
      input.privateKey.add(utxoKey0.data);

      final utxoKey1 = TWPrivateKey.createWithHexString(
          '619c335025c7f4012e556c2a58b2506e30b8511b53ade95ea316fd8c3286feb9');
      input.privateKey.add(utxoKey1.data);

      final scriptPub1 = TWBitcoinScript.createWithBytes(
          parse_hex('00141d0f172a0ecb48aee1be1f2687d2963ae33f71a1'));
      final scriptHash = scriptPub1.matchPayToWitnessPublicKeyHash()!;
      final scriptHashHex = hex(scriptHash);
      expect(scriptHashHex, '1d0f172a0ecb48aee1be1f2687d2963ae33f71a1');

      final redeemScript = TWBitcoinScript.buildPayToPublicKeyHash(scriptHash);
      input.scripts[scriptHashHex] = redeemScript.data;

      final utxo0Script = TWBitcoinScript.createWithBytes(parse_hex(
          "2103c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432ac"));
      final utxo1Script = TWBitcoinScript.createWithBytes(
          parse_hex("00141d0f172a0ecb48aee1be1f2687d2963ae33f71a1"));
      input.utxo.addAll([
        Bitcoin.UnspentTransaction(
          script: utxo0Script.data,
          amount: $fixnum.Int64(625000000),
          outPoint: Bitcoin.OutPoint(
            hash: hash0,
            index: 0,
            sequence: UINT32_MAX,
          ),
        ),
        Bitcoin.UnspentTransaction(
          script: utxo1Script.data,
          amount: $fixnum.Int64(600000000),
          outPoint: Bitcoin.OutPoint(
            hash: hash1,
            index: 1,
            sequence: UINT32_MAX,
          ),
        ),
      ]);

      {
        // plan returns empty, as there are 0 utxos
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [625000000], 335790000, 174), true);
      }

      // Invoke Sign nonetheless
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      // Fails as there are 0 utxos
      expect(result.error, Common.SigningError.Error_invalid_address);
    });

    test('Plan_10input_MaxAmount', () {
      final ownAddress = "bc1q0yy3juscd3zfavw76g4h3eqdqzda7qyf58rj4m";
      final ownPrivateKey =
          "eb696a065ef48a2192da5b28b694f87544b30fae8327c4510137a922f32c6dcf";

      final input = Bitcoin.SigningInput();

      for (int i = 0; i < 10; ++i) {
        final utxoScript = TWBitcoinScript.lockScriptForAddress(
            ownAddress, TWCoinType.TWCoinTypeBitcoin);
        final keyHash = utxoScript.matchPayToWitnessPublicKeyHash()!;
        expectHex(keyHash, '79091972186c449eb1ded22b78e40d009bdf0089');

        final redeemScript = TWBitcoinScript.buildPayToPublicKeyHash(keyHash);
        input.scripts[hex(keyHash)] = redeemScript.data;

        final utxo = Bitcoin.UnspentTransaction(
          script: utxoScript.data,
          amount: $fixnum.Int64(1000000 + i * 10000),
          outPoint: Bitcoin.OutPoint(
            hash: parse_hex(
                    'a85fd6a9a7f2f54cacb57e83dfd408e51c0a5fc82885e3fa06be8692962bc407')
                .reversed
                .toList(),
            index: 0,
            sequence: UINT32_MAX,
          ),
        );
        input.utxo.add(utxo);
      }

      input.coinType = TWCoinType.TWCoinTypeBitcoin;
      input.hashType =
          TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoin);
      input.useMaxAmount = true;
      input.amount = $fixnum.Int64(2000000);
      input.byteFee = $fixnum.Int64(1);
      input.toAddress = "bc1qauwlpmzamwlf9tah6z4w0t8sunh6pnyyjgk0ne";
      input.changeAddress = ownAddress;

      // Plan.
      // Estimated size: witness size: 10 * (1 + 1 + 72 + 1 + 33) + 2 = 1082; base 451; raw 451 + 1082 = 1533; vsize 451 + 1082/4 --> 722
      // Actual size:    witness size:                                  1078; base 451; raw 451 + 1078 = 1529; vsize 451 + 1078/4 --> 721
      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(
          verifyPlan(
              plan,
              [
                1000000,
                1010000,
                1020000,
                1030000,
                1040000,
                1050000,
                1060000,
                1070000,
                1080000,
                1090000
              ],
              10449278,
              722),
          true);

      // Extend input with keys, reuse plan, Sign
      final privKey = TWPrivateKey.createWithHexString(ownPrivateKey);
      input.privateKey.add(privKey.data);
      input.plan = plan;

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.OK);
      expect(result.encoded.length, 1529);
    });

    test('PlanAndSign_LitecoinReal_8435', () {
      final coin = TWCoinType.TWCoinTypeLitecoin;
      final ownAddress = "ltc1q0dvup9kzplv6yulzgzzxkge8d35axkq4n45hum";
      final ownPrivateKey =
          "690b34763f34e0226ad2a4d47098269322e0402f847c97166e8f39959fcaff5a";

      // Setup input for Plan
      final input = Bitcoin.SigningInput(
        coinType: coin,
        hashType: TWBitcoinScript.hashTypeForCoin(coin),
        amount: $fixnum.Int64(1200000),
        useMaxAmount: false,
        byteFee: $fixnum.Int64(1),
        toAddress: 'ltc1qt36tu30tgk35tyzsve6jjq3dnhu2rm8l8v5q00',
        changeAddress: ownAddress,
      );

      final utxo0Script =
          TWBitcoinScript.lockScriptForAddress(ownAddress, coin);
      final keyHash0 = utxo0Script.matchPayToWitnessPublicKeyHash()!;
      expectHex(keyHash0, '7b59c096c20fd9a273e240846b23276c69d35815');

      final redeemScript = TWBitcoinScript.buildPayToPublicKeyHash(keyHash0);
      input.scripts[hex(keyHash0)] = redeemScript.data;

      input.utxo.add(Bitcoin.UnspentTransaction(
        script: utxo0Script.data,
        amount: $fixnum.Int64(3899774),
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
                  "a85fd6a9a7f2f54cacb57e83dfd408e51c0a5fc82885e3fa06be8692962bc407")
              .reversed
              .toList(),
          index: 0,
          sequence: UINT32_MAX,
        ),
      ));

      // Plan
      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
        input.writeToBuffer(),
        coin,
      ));
      expect(verifyPlan(plan, [3899774], 1200000, 141), true);

      // Extend input with keys and plan, for Sign
      final privKey = TWPrivateKey.createWithHexString(ownPrivateKey);
      input.privateKey.add(privKey.data);
      input.plan = plan;

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        coin,
      ));
      expect(result.error, Common.SigningError.OK);
      final signedTx = hex(result.encoded);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "07c42b969286be06fae38528c85f0a1ce508d4df837eb5ac4cf5f2a7a9d65fa8"
        "00000000"
        "00"
        ""
        "ffffffff"
        "02" // outputs
        "804f120000000000"
        "16"
        "00145c74be45eb45a3459050667529022d9df8a1ecff"
        "7131290000000000"
        "16"
        "00147b59c096c20fd9a273e240846b23276c69d35815"
        // witness
        "02"
        "47"
        "304402204139b82927dd80445f27a5d2c29fa4881dbd2911714452a4a706145bc43cc4bf022016fbdf4b09bc5a9c43e79edb1c1061759779a20c35535082bdc469a61ed0771f01"
        "21"
        "02499e327a05cc8bb4b3c34c8347ecfcb152517c9927c092fa273be5379fde3226"
        "00000000" // nLockTime
        ,
      );
    });

    test('Sign_ManyUtxos_400', () {
      final ownAddress = "bc1q0yy3juscd3zfavw76g4h3eqdqzda7qyf58rj4m";
      final ownPrivateKey =
          "eb696a065ef48a2192da5b28b694f87544b30fae8327c4510137a922f32c6dcf";

      // Setup input
      final input = Bitcoin.SigningInput();

      const n = 400;
      var utxoSum = 0;

      for (int i = 0; i < n; ++i) {
        final utxoScript = TWBitcoinScript.lockScriptForAddress(
            ownAddress, TWCoinType.TWCoinTypeBitcoin);
        final keyHash = utxoScript.matchPayToWitnessPublicKeyHash()!;
        expectHex(keyHash, '79091972186c449eb1ded22b78e40d009bdf0089');

        final redeemScript = TWBitcoinScript.buildPayToPublicKeyHash(keyHash);
        input.scripts[hex(keyHash)] = redeemScript.data;

        final utxo = Bitcoin.UnspentTransaction(
          script: utxoScript.data,
          amount: $fixnum.Int64(1000 + (i + 1) * 10),
          outPoint: Bitcoin.OutPoint(
            hash: parse_hex(
                    "a85fd6a9a7f2f54cacb57e83dfd408e51c0a5fc82885e3fa06be8692962bc407")
                .reversed
                .toList(),
            index: 0,
            sequence: UINT32_MAX,
          ),
        );
        input.utxo.add(utxo);
        utxoSum += utxo.amount.toInt();
      }
      expect(utxoSum, 1202000);

      input.coinType = TWCoinType.TWCoinTypeBitcoin;
      input.hashType =
          TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoin);
      input.useMaxAmount = false;
      input.amount = $fixnum.Int64(300000);
      input.byteFee = $fixnum.Int64(1);
      input.toAddress = 'bc1qauwlpmzamwlf9tah6z4w0t8sunh6pnyyjgk0ne';
      input.changeAddress = ownAddress;

      // Plan
      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      // expected result: 66 utxos, with the largest amounts
      final subset = <int>[];
      int subsetSum = 0;
      for (int i = n - 66; i < n; ++i) {
        final val = 1000 + (i + 1) * 10;
        subset.add(val);
        subsetSum += val;
      }
      expect(subset.length, 66);
      expect(subsetSum, 308550);
      expect(verifyPlan(plan, subset, 300000, 4561), true);

      // Extend input with keys, reuse plan, Sign
      final privKey = TWPrivateKey.createWithHexString(ownPrivateKey);
      input.privateKey.add(privKey.data);
      input.plan = plan;

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.OK);
      expect(result.encoded.length, 9871);
    });

    test('Sign_ManyUtxos_2000', () {
      final ownAddress = "bc1q0yy3juscd3zfavw76g4h3eqdqzda7qyf58rj4m";
      final ownPrivateKey =
          "eb696a065ef48a2192da5b28b694f87544b30fae8327c4510137a922f32c6dcf";

      // Setup input
      final input = Bitcoin.SigningInput();

      const n = 2000;
      var utxoSum = 0;

      for (int i = 0; i < n; ++i) {
        final utxoScript = TWBitcoinScript.lockScriptForAddress(
            ownAddress, TWCoinType.TWCoinTypeBitcoin);
        final keyHash = utxoScript.matchPayToWitnessPublicKeyHash()!;
        expectHex(keyHash, '79091972186c449eb1ded22b78e40d009bdf0089');

        final redeemScript = TWBitcoinScript.buildPayToPublicKeyHash(keyHash);
        input.scripts[hex(keyHash)] = redeemScript.data;

        final utxo = Bitcoin.UnspentTransaction(
          script: utxoScript.data,
          amount: $fixnum.Int64(1000 + (i + 1) * 10),
          outPoint: Bitcoin.OutPoint(
            hash: parse_hex(
                    "a85fd6a9a7f2f54cacb57e83dfd408e51c0a5fc82885e3fa06be8692962bc407")
                .reversed
                .toList(),
            index: 0,
            sequence: UINT32_MAX,
          ),
        );
        input.utxo.add(utxo);
        utxoSum += utxo.amount.toInt();
      }
      expect(utxoSum, 22010000);

      input.coinType = TWCoinType.TWCoinTypeBitcoin;
      input.hashType =
          TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoin);
      input.useMaxAmount = false;
      input.amount = $fixnum.Int64(2000000);
      input.byteFee = $fixnum.Int64(1);
      input.toAddress = 'bc1qauwlpmzamwlf9tah6z4w0t8sunh6pnyyjgk0ne';
      input.changeAddress = ownAddress;

      // Plan
      final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));

      // expected result: 66 utxos, with the largest amounts
      final subset = <int>[];
      int subsetSum = 0;
      for (int i = 0; i < 601; ++i) {
        final val = 1000 + (i + 1) * 10;
        subset.add(val);
        subsetSum += val;
      }
      expect(subset.length, 601);
      expect(subsetSum, 2410010);
      expect(verifyPlan(plan, subset, 2000000, 40943), true);

      // Extend input with keys, reuse plan, Sign
      final privKey = TWPrivateKey.createWithHexString(ownPrivateKey);
      input.privateKey.add(privKey.data);
      input.plan = plan;

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.OK);
      expect(result.encoded.length, 89339);
    });

    test('RedeemExtendedPubkeyUTXO', () {
      final wif = "L4BeKzm3AHDUMkxLRVKTSVxkp6Hz9FcMQPh18YCKU1uioXfovzwP";
      final decoded = TWBase58.decode(wif)!;
      final key = TWPrivateKey.createWithData(decoded.sublist(1, 33));
      final pubkey = key
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      final hash = TWHash.sha256RIPEMD(pubkey.data);

      final data = <int>[];
      data.add(0x00);
      data.addAll(hash);
      final address = TWBitcoinAddress.createWithData(Uint8List.fromList(data));
      final addressString = address.description;

      expect(addressString, '1PAmpW5igXUJnuuzRa5yTcsWHwBamZG7Y2');

      // Setup input for Plan
      final input = Bitcoin.SigningInput(
        coinType: TWCoinType.TWCoinTypeBitcoin,
        hashType: TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoin),
        amount: $fixnum.Int64(26972),
        useMaxAmount: true,
        byteFee: $fixnum.Int64(1),
        toAddress: addressString,
      );

      final utxo0Script = TWBitcoinScript.lockScriptForAddress(
          addressString, TWCoinType.TWCoinTypeBitcoin);

      final utxo0 = Bitcoin.UnspentTransaction(
        script: utxo0Script.data,
        amount: $fixnum.Int64(16874),
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
                  "6ae3f1d245521b0ea7627231d27d613d58c237d6bf97a1471341a3532e31906c")
              .reversed
              .toList(),
          index: 0,
          sequence: UINT32_MAX,
        ),
      );
      input.utxo.add(utxo0);

      final utxo1 = Bitcoin.UnspentTransaction(
        script: utxo0Script.data,
        amount: $fixnum.Int64(10098),
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
                  "fd1ea8178228e825d4106df0acb61a4fb14a8f04f30cd7c1f39c665c9427bf13")
              .reversed
              .toList(),
          index: 0,
          sequence: UINT32_MAX,
        ),
      );
      input.utxo.add(utxo1);

      input.privateKey.add(key.data);

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.OK);
      expect(result.encoded.length, 402);
    });

    test('SignP2TR_5df51e', () {
      final privateKey =
          "13fcaabaf9e71ffaf915e242ec58a743d55f102cf836968e5bd4881135e0c52c";
      final ownAddress = "bc1qpjult34k9spjfym8hss2jrwjgf0xjf40ze0pp8";
      final toAddress =
          "bc1ptmsk7c2yut2xah4pgflpygh2s7fh0cpfkrza9cjj29awapv53mrslgd5cf"; // Taproot
      final coin = TWCoinType.TWCoinTypeBitcoin;

      // Setup input
      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinScript.hashTypeForCoin(coin),
        amount: $fixnum.Int64(1100),
        useMaxAmount: false,
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: ownAddress,
        coinType: coin,
      );

      final utxoKey0 = TWPrivateKey.createWithHexString(privateKey);
      final pubKey0 =
          utxoKey0.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      expectHex(pubKey0.data,
          '021e582a887bd94d648a9267143eb600449a8d59a0db0653740b1378067a6d0cee');
      expect(
          TWSegwitAddress.createWithPublicKey(hrpForString('bc'), pubKey0)
              .description,
          ownAddress);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(pubKey0.data));
      expectHex(utxoPubkeyHash, '0cb9f5c6b62c03249367bc20a90dd2425e6926af');
      input.privateKey.add(utxoKey0.data);

      final redeemScript =
          TWBitcoinScript.lockScriptForAddress(input.toAddress, coin);
      expectHex(redeemScript.data,
          '51205ee16f6144e2d46edea1427e1222ea879377e029b0c5d2e252517aee85948ec7');
      final scriptHash = TWHash.ripemd(TWHash.sha256(redeemScript.data));
      expectHex(scriptHash, 'e0a5001e7b394a1a6b2978cdcab272241280bf46');
      input.scripts[hex(scriptHash)] = redeemScript.data;

      final utxo0Script =
          TWBitcoinScript.lockScriptForAddress(ownAddress, coin);
      expectHex(
          utxo0Script.data, '00140cb9f5c6b62c03249367bc20a90dd2425e6926af');
      final utxo0 = Bitcoin.UnspentTransaction(
        script: utxo0Script.data,
        amount: $fixnum.Int64(49429),
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
                  "c24bd72e3eaea797bd5c879480a0db90980297bc7085efda97df2bf7d31413fb")
              .reversed
              .toList(),
          index: 1,
          sequence: UINT32_MAX,
        ),
      );
      input.utxo.add(utxo0);

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          coin,
        ));
        expect(verifyPlan(plan, [49429], 1100, 153), true);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        coin,
      ));
      final signedTx = hex(result.encoded);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "fb1314d3f72bdf97daef8570bc97029890dba08094875cbd97a7ae3e2ed74bc2"
        "01000000"
        "00"
        ""
        "ffffffff"
        "02" // outputs
        "4c04000000000000"
        "22"
        "51205ee16f6144e2d46edea1427e1222ea879377e029b0c5d2e252517aee85948ec7"
        "30bc000000000000"
        "16"
        "00140cb9f5c6b62c03249367bc20a90dd2425e6926af"
        // witness
        "02"
        "47"
        "3044022021cea91157fdab33226e38ee7c1a686538fc323f5e28feb35775cf82ba8c62210220723743b150cea8ead877d8b8d059499779a5df69f9bdc755c9f968c56cfb528f01"
        "21"
        "021e582a887bd94d648a9267143eb600449a8d59a0db0653740b1378067a6d0cee"
        "00000000" // nLockTime
        ,
      );
    });

    test('Sign_OpReturn_THORChainSwap', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '6bd4096fa6f08bd3af2b437244ba0ca2d35045c5233b8d6796df37e61e974de5');
      final publicKey = privateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final ownAddress =
          TWSegwitAddress.createWithPublicKey(hrpForString('bc'), publicKey);
      final ownAddressString = ownAddress.description;
      expect(ownAddressString, 'bc1q2gzg42w98ytatvmsgxfc8vrg6l24c25pydup9u');
      final toAddress = 'bc1qxu5a8gtnjxw3xwdlmr2gl9d76h9fysu3zl656e';
      final utxoAmount = 342101;
      final toAmount = 300000;
      int byteFee = 126;

      final data = TWData.createWithString(
          'SWAP:THOR.RUNE:thor1tpercamkkxec0q0jk6ltdnlqvsw29guap8wmcl:');

      final input = Bitcoin.SigningInput(
        coinType: TWCoinType.TWCoinTypeBitcoin,
        hashType: TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoin),
        amount: $fixnum.Int64(toAmount),
        byteFee: $fixnum.Int64(byteFee),
        toAddress: toAddress,
        changeAddress: ownAddressString,
        privateKey: [privateKey.data],
        outputOpReturn: data.bytes()!,
      );

      final utxo = Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
                  "30b82960291a39de3664ec4c844a815e3e680e29b4d3a919e450f0c119cf4e35")
              .reversed
              .toList(),
          index: 1,
          sequence: UINT32_MAX,
        ),
        amount: $fixnum.Int64(utxoAmount),
      );

      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(publicKey.data));
      expectHex(utxoPubkeyHash, '52048aa9c53917d5b370419383b068d7d55c2a81');
      final utxoScript =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);
      expectHex(
          utxoScript.data, '001452048aa9c53917d5b370419383b068d7d55c2a81');
      utxo.script = utxoScript.data;
      input.utxo.add(utxo);

      {
        // test plan (but do not reuse plan result)
        final plan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          input.writeToBuffer(),
          TWCoinType.TWCoinTypeBitcoin,
        ));
        expect(verifyPlan(plan, [342101], 300000, 26586), true);
        expect(plan.outputOpReturn.length, 59);
      }

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
        input.writeToBuffer(),
        TWCoinType.TWCoinTypeBitcoin,
      ));
      expect(result.error, Common.SigningError.OK);
      final signedTx = hex(result.encoded);
      expect(
        signedTx, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "354ecf19c1f050e419a9d3b4290e683e5e814a844cec6436de391a296029b830"
        "01000000"
        "00"
        ""
        "ffffffff"
        "03" // outputs
        "e093040000000000"
        "16"
        "00143729d3a173919d1339bfd8d48f95bed5ca924391"
        "9b3c000000000000"
        "16"
        "001452048aa9c53917d5b370419383b068d7d55c2a81"
        "0000000000000000"
        "3d"
        "6a3b535741503a54484f522e52554e453a74686f72317470657263616d6b6b7865633071306a6b366c74646e6c7176737732396775617038776d636c3a"
        // witness
        "02"
        "48"
        "3045022100ff6c0aaef512aa52f3036161bfbcef39046ac89eb9617fa461a0c9c43fe45eb3022055d208d3f81736e72e3ad8ef761dc79ac5dd3dc00721174bc69db416a74960e301"
        "21"
        "02c2e5c8b4927812fb37444a7862466ad23978a4ac626f8eaf93e1d1a60d6abb80"
        "00000000" // nLockTime
        ,
      );
    });
  });
}
