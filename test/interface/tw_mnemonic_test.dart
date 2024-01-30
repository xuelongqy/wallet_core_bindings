import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWMnemonic, () {
    test('IsValid', () {
      expect(TWMnemonic.isValid('credit expect life fade cover suit response wash pear what skull force'), true);
      expect(TWMnemonic.isValid('ripple scissors hisc mammal hire column oak again sun offer wealth tomorrow'), false);
    });

    test('isValidWord', () {
      expect(TWMnemonic.isValidWord('credit'), true);
      expect(TWMnemonic.isValidWord('hybridous'), false);
    });

    test('suggest', () {
      expect(TWMnemonic.suggest('air'), 'air airport');
      expect(TWMnemonic.suggest('rob'), 'robot robust');
    });
  });
}