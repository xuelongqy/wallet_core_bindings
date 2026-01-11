import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('StellarAddress', () {
    const coin = TWCoinType.Stellar;

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '0103E20EC6B4A39A629815AE02C0A1393B9225E3B890CAE45B59F42FA29BE9668D',
        TWPublicKeyType.ED25519,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final str = address.description;
      expect(str, 'GAB6EDWGWSRZUYUYCWXAFQFBHE5ZEJPDXCIMVZC3LH2C7IU35FTI2NOQ');
    });

    test('FromString', () {
      const stellarAddress =
          "GAB6EDWGWSRZUYUYCWXAFQFBHE5ZEJPDXCIMVZC3LH2C7IU35FTI2NOQ";
      final address = TWAnyAddress(stellarAddress, coin);
      expect(address.description, stellarAddress);
    });

    test('isValid', () {
      const stellarAddress =
          "GABQHYQOY22KHGTCTAK24AWAUE4TXERF4O4JBSXELNM7IL5CTPUWM3SC";
      const bitcoinAddress = "1Ma2DrB78K7jmAwaomqZNRMCvgQrNjE2QC";

      expect(
        TWAnyAddress.isValid(stellarAddress, coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(bitcoinAddress, coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'qc64537q3cvjmc2cgkz10y58waj4294967296r10ccchmrmrdzq03783', coin),
        false,
      );
    });
  });
}
