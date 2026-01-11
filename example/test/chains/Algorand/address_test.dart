import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('AlgorandAddress', () {
    const coin = TWCoinType.Algorand;

    test('Validation', () {
      // empty address
      expect(TWAnyAddress.isValid('', coin), false);
      // invalid checksum
      expect(
          TWAnyAddress.isValid(
              'JBCQYJ2FREG667NAN7BFKH4RFIKPT7CYDQJNW3SNN5Z7F7ILFLKQ346TS3',
              coin),
          false);
      // wrong length
      expect(
          TWAnyAddress.isValid(
              'JBCQYJ2FREG667NAN7BFKH4RFIKPT7CYDQJNW3SNN5Z7F7ILFLKQ346TSU ',
              coin),
          false);
      // Stellar address
      expect(
          TWAnyAddress.isValid(
              'GABQHYQOY22KHGTCTAK24AWAUE4TXERF4O4JBSXELNM7IL5CTPUWM3SC', coin),
          false);
      // invalid base32
      expect(
          TWAnyAddress.isValid(
              '0000000000000000000000000000000000000000000000000000000000',
              coin),
          false);

      expect(
          TWAnyAddress.isValid(
              'HXIWBVQGOO6ZWE5NYJO22XMYRUGZ6TGNX2K2EERPT3ZIWPHE5CLJGB2GEA',
              coin),
          true);
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '526d96fffdbfe787b2f00586298538f9a019e97f6587964dc61aae9ad1d7fa23');
      final address = TWAnyAddress.createWithPublicKey(
        privateKey.getPublicKeyByType(TWPublicKeyType.ED25519),
        coin,
      );
      expect(address.description,
          'JBCQYJ2FREG667NAN7BFKH4RFIKPT7CYDQJNW3SNN5Z7F7ILFLKQ346TSU');
    });

    test('FromString', () {
      final address = TWAnyAddress(
        'PITDOF57RHOVLT37KM7DCXDCETLDL3OA5CBAN7LQ44Z36LGFC27IJ2IQ64',
        coin,
      );
      expect(address.description,
          'PITDOF57RHOVLT37KM7DCXDCETLDL3OA5CBAN7LQ44Z36LGFC27IJ2IQ64');
    });
  });
}
