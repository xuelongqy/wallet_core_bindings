import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('CosmosAddress', () {
    const coin = TWCoinType.TWCoinTypeCosmos;

    test('AddressToData Invalid', () {
      expect(TWAnyAddress('fake', coin).pointer, nullptr);
    });

    test('Valid', () {
      expect(
        TWAnyAddress.isValid('bnb1grpf0955h0ykzq3ar5nmum7y6gdfl6lxfn46h2',
            TWCoinType.TWCoinTypeBinance),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid('bnb1grpf0955h0ykzq3ar6nmum7y6gdfl6lxfn46h2',
            TWCoinType.TWCoinTypeBinance),
        false,
      );
    });

    test('Cosmos_FromPublicKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '80e81ea269e66a0a05b11236df7919fb7fbeedba87452d667489d7403a02f005');
      final publickData = privateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1)
          .data;
      expectHex(publickData,
          '0257286ec3f37d33557bbbaa000b27744ac9023aa9967cae75a181d1ff91fa9dc5');

      final publicKey =
          TWPublicKey(publickData, TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final address =
          TWAnyAddress.createWithPublicKey(publicKey: publicKey, coin: coin);
      expect(
          address.description, 'cosmos1hsk6jryyqjfhp5dhc55tc9jtckygx0eph6dd02');
      expectHex(address.data, 'bc2da90c84049370d1b7c528bc164bc588833f21');
    });
  });
}
