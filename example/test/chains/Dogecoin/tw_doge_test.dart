import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('Doge', () {
    const coin = TWCoinType.Dogecoin;

    test('LockScripts', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'DLSSSUS3ex7YNDACJDxMER1ZMW579Vy8Zy', coin);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a914a7d191ec42aa113e28cd858cceaa7c733ba2f77788ac');

      final script2 = TWBitcoinScript.lockScriptForAddress(
          'AETZJzedcmLM2rxCM6VqCGF3YEMUjA3jMw', coin);
      final scriptData2 = script2.data;
      expectHex(scriptData2, 'a914f191149f72f235548746654f5b473c58258f7fb687');
    });
  });
}
