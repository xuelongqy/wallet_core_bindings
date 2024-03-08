import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

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
  });
}
