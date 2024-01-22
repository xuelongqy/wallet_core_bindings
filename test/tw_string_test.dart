import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWString, () {
    test('All', () {
      TWString string = TWString('test');
      TWString string2 = TWString('test');

      expect(string.toString(), 'test');
      expect(string.size(), 4);
      expect(string.get(1), 'e');
      expect(string.equal(string2), true);
    });
  });
}
