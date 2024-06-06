import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('CosmosAddress', () {
    const coin = TWCoinType.Cosmos;

    test('AddressToData Invalid', () {
      expect(TWAnyAddress('fake', coin).pointer, 0);
    });

    test('Valid', () {
      expect(
        TWAnyAddress.isValid(
            'bnb1grpf0955h0ykzq3ar5nmum7y6gdfl6lxfn46h2', TWCoinType.Binance),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid(
            'bnb1grpf0955h0ykzq3ar6nmum7y6gdfl6lxfn46h2', TWCoinType.Binance),
        false,
      );
    });

    test('Cosmos_FromPublicKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '80e81ea269e66a0a05b11236df7919fb7fbeedba87452d667489d7403a02f005');
      final publickData =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1).data;
      expectHex(publickData,
          '0257286ec3f37d33557bbbaa000b27744ac9023aa9967cae75a181d1ff91fa9dc5');

      final publicKey = TWPublicKey(publickData, TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(
          address.description, 'cosmos1hsk6jryyqjfhp5dhc55tc9jtckygx0eph6dd02');
      expectHex(address.data, 'bc2da90c84049370d1b7c528bc164bc588833f21');
    });

    test('Cosmos_FromString', () {
      final address =
          TWAnyAddress('cosmos1hsk6jryyqjfhp5dhc55tc9jtckygx0eph6dd02', coin);
      expect(
          address.description, 'cosmos1hsk6jryyqjfhp5dhc55tc9jtckygx0eph6dd02');
    });

    test('Cosmos_Valid', () {
      expect(
        TWAnyAddress.isValid(
            'cosmos1hsk6jryyqjfhp5dhc55tc9jtckygx0eph6dd02', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'cosmospub1addwnpepqftjsmkr7d7nx4tmhw4qqze8w39vjq364xt8etn45xqarlu3l2wu2n7pgrq',
            coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'cosmosvaloper1sxx9mszve0gaedz5ld7qdkjkfv8z992ax69k08', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'cosmosvalconspub1zcjduepqjnnwe2jsywv0kfc97pz04zkm7tc9k2437cde2my3y5js9t7cw9mstfg3sa',
            coin),
        true,
      );
    });

    test('Cosmos_Invalid', () {
      expect(
        TWAnyAddress.isValid(
            'cosmos1xsk6jryyqjfhp5dhc55tc9jtckygx0eph6dd02', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'cosmospub1xddwnpepqftjsmkr7d7nx4tmhw4qqze8w39vjq364xt8etn45xqarlu3l2wu2n7pgrq',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'cosmosvaloper1xxx9mszve0gaedz5ld7qdkjkfv8z992ax69k08', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'cosmosvalconspub1xcjduepqjnnwe2jsywv0kfc97pz04zkm7tc9k2437cde2my3y5js9t7cw9mstfg3sa',
            coin),
        false,
      );
    });

    test('ThorFromPublicKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '7105512f0c020a1dd759e14b865ec0125f59ac31e34d7a2807a228ed50cb343e');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      expectHex(publicKey.data,
          '03ed997e396cf4292f5fce5a42bba41599ccd5d96e313154a7c9ea7049de317c77');

      final address =
          TWAnyAddress.createWithPublicKey(publicKey, TWCoinType.THORChain);
      expect(
          address.description, 'thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r');
      expectHex(address.data, '1522e767db6eb19708b0038029bfbd607bc9bd0e');
    });

    test('ThorValid', () {
      expect(
        TWAnyAddress.isValid('thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r',
            TWCoinType.THORChain),
        true,
      );
      expect(
        TWAnyAddress.isValid('thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2s',
            TWCoinType.THORChain),
        false,
      );
    });
  });
}
