import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWNervosAddress', () {
    test('Create', () {
      const ckbAddress =
          "ckb1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqwyk5x9erg8furras980hksatlslfaktks7epf25";
      final addr = TWNervosAddress(ckbAddress);

      final codeCash = addr.codeHash;
      final args = addr.args;
      final hashType = addr.hashType;

      expect(TWNervosAddress.isValidString(ckbAddress), true);
      expectHex(codeCash,
          '9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8');
      expectHex(args, 'c4b50c5c8d074f063ec0a77ded0eaff0fa7b65da');
      expect(hashType, 'type');
    });
  });
}
