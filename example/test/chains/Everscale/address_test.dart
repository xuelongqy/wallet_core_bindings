import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('EverscaleAddress', () {
    const coin = TWCoinType.Everscale;

    test('Valid', () {
      expect(
        TWAnyAddress.isValid(
            '0:83a0352908060fa87839195d8a763a8d9ab28f8fa41468832b398a719cc6469a',
            coin),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid('hello world', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            '83a0352908060fa87839195d8a763a8d9ab28f8fa41468832b398a719cc6469a',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            '1:83a0352908060fa87839195d8a763a8d9ab28f8fa41468832b398a719cc6469a',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            '-2:83a0352908060fa87839195d8a763a8d9ab28f8fa41468832b398a719cc6469a',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            '2147483648:83a0352908060fa87839195d8a763a8d9ab28f8fa41468832b398a719cc6469a',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            '0:83a0352908060fa87839195d8a763a8d9ab28f8fa41468832b398a719cc6469ab',
            coin),
        false,
      );
    });

    test('FromString', () {
      final address = TWAnyAddress(
          '0:83a0352908060fa87839195d8a763a8d9ab28f8fa41468832b398a719cc6469a',
          coin);
      expect(address.description,
          '0:83a0352908060fa87839195d8a763a8d9ab28f8fa41468832b398a719cc6469a');

      final addressUppercase = TWAnyAddress(
          '0:83a0352908060fa87839195d8a763a8d9ab28f8fa41468832b398a719cc6469a',
          coin);
      expect(addressUppercase.description,
          '0:83a0352908060fa87839195d8a763a8d9ab28f8fa41468832b398a719cc6469a');
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '5b59e0372d19b6355c73fa8cc708fa3301ae2ec21bb6277e8b79d386ccb7846f');
      final address = TWAnyAddress.createWithPublicKey(
          privateKey.getPublicKeyByType(TWPublicKeyType.ED25519), coin);
      expect(address.description,
          "0:269fee242eb410786abe1777a14785c8bbeb1e34100c7570e17698b36ad66fb0");
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
          'e4925f9932df8d7fd0042efff3e2178a972028b644ded3a3b66f6d0577f82e78',
          TWPublicKeyType.ED25519);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description,
          "0:269fee242eb410786abe1777a14785c8bbeb1e34100c7570e17698b36ad66fb0");
    });
  });
}
