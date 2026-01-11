import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('BinanceAddress', () {
    const coin = TWCoinType.Binance;

    test('AddressToData', () {
      // mainnet
      var data =
          TWAnyAddress('bnb1h8xf9htasu9aclra954dnnve8fgcda4ae7qfa8', coin).data;
      expectHex(data, 'b9cc92dd7d870bdc7c7d2d2ad9cd993a5186f6bd');

      // testnet
      data = TWAnyAddress('tbnb1x4hxmtdf7pwea9dghq73dufh3qspm8gp5qht9c',
              TWCoinType.TBinance)
          .data;
      expectHex(data, '356e6dada9f05d9e95a8b83d16f13788201d9d01');

      // invalid address
      expect(
          TWAnyAddress.isValid(
              'tbnb1x4hxmtdf7pwea9dghq73dufh3qspm8gp', TWCoinType.TBinance),
          false);
    });

    test('DeriveAddress', () {
      // mainnet
      const pubkey =
          '02bf9a5e2b514492326e7ba9a5161b6e47df7a4aa970dd2d13c398bec89608d8d0';
      final publicKey = TWPublicKey.createWithHexString(
        pubkey,
        coin.publicKeyType,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'bnb1h8xf9htasu9aclra954dnnve8fgcda4ae7qfa8');

      // testnet
      final tPublicKey = TWPublicKey.createWithHexString(
        pubkey,
        TWCoinType.TBinance.publicKeyType,
      );
      final tAddress =
          TWAnyAddress.createWithPublicKey(tPublicKey, TWCoinType.TBinance);
      expect(
          tAddress.description, 'tbnb1h8xf9htasu9aclra954dnnve8fgcda4ahtfdak');
    });
  });
}
