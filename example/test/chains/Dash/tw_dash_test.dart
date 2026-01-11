import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('DASH', () {
    test('LockScripts', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'XgkpWEFe59pX3aMhx6PrDawjNnoZKHeZbp', TWCoinType.Dash);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a91442914f5b70c61619eca5359df57d0b9bdcf8ccff88ac');

      final scrip2 = TWBitcoinScript.lockScriptForAddress(
          '7eprxeVjKfVgS8p2RNsZ89K72YV61xg4gq', TWCoinType.Dash);
      final scriptData2 = scrip2.data;
      expectHex(scriptData2, 'a9148835ae54f297ad069552a1401e535dfe5f396f6187');
    });
  });
}
