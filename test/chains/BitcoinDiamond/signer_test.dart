import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('BitcoinDiamondSigner', () {
    final coin = TWCoinType.TWCoinTypeBitcoinDiamond;

    test('Sign', () {
      final amount = 17615;
      final fee = 10000;
      final toAddress = "1HevQVTSEc8cEpDm65UpfCdj5erd4xxBhx";

      final toScript = TWBitcoinScript.lockScriptForAddress(toAddress, coin);
      expectHex(
          toScript.data, '76a914b6adfbbf15c8f6fa53f1edb37054dce5c7c145c688ac');

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: '1G15VvshDxwFTnahZZECJfFwEkq9fP79o8',
        coinType: coin,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      '1d4653041a1915b3a52d47aeaa119c8f79ed7634a93692a6e811173067464f03')
                  .reversed
                  .toList(),
              index: 0,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(27615),
          ),
        ],
      );

      final utxoKey0 = TWPrivateKey.createWithHexString(
          'd2b9f2846d3adcead910ee0124a3ba7ae29e8a4729787d27f9bea1f532928eee');
      final utxoAddr0 = TWAnyAddress.createWithPublicKey(
        publicKey: utxoKey0.getPublicKey(coin),
        coin: coin,
      );
      expect(utxoAddr0.description, '1G15VvshDxwFTnahZZECJfFwEkq9fP79o8');
      final script0 = TWBitcoinScript.lockScriptForAddress(
          utxoAddr0.description, coin);
      expectHex(script0.data, '76a914a48da46386ce52cccad178de900c71f06130c31088ac');
    });
  });
}
