import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('StellarAddress', () {
    const coin = TWCoinType.TWCoinTypeStellar;

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '0103E20EC6B4A39A629815AE02C0A1393B9225E3B890CAE45B59F42FA29BE9668D',
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final str = address.description;
      expect(str, 'GAB6EDWGWSRZUYUYCWXAFQFBHE5ZEJPDXCIMVZC3LH2C7IU35FTI2NOQ');
    });

    test('FromString', () {
      final stellarAddress =
          "GAB6EDWGWSRZUYUYCWXAFQFBHE5ZEJPDXCIMVZC3LH2C7IU35FTI2NOQ";
      final address = TWAnyAddress(stellarAddress, coin);
      expect(address.description, stellarAddress);
    });

    test('isValid', () {
      final stellarAddress =
          "GABQHYQOY22KHGTCTAK24AWAUE4TXERF4O4JBSXELNM7IL5CTPUWM3SC";
      final bitcoinAddress = "1Ma2DrB78K7jmAwaomqZNRMCvgQrNjE2QC";

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