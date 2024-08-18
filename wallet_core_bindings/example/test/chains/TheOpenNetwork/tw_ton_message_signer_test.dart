import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();

  group('TWTONMessageSigner', () {
    test('SignMessage', () {
      final privateKeyBytes = parse_hex(
          '112d4e2e700a468f1eae699329202f1ee671d6b665caa2d92dea038cf3868c18');
      final privateKey = TWPrivateKey.createWithData(privateKeyBytes);
      final message = "Hello world";

      final signature = TWTONMessageSigner.signMessage(privateKey, message);
      expect(signature,
          '2490fbaa72aec0b77b19162bbbe0b0e3f7afd42cc9ef469f0494cd4a366a4bf76643300cd5991f66bce6006336742b8d1d435d541d244dcc013d428472e89504');
    });
  });
}
