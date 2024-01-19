import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWString, () {
    test('All', () {
      TWString twString = TWString('test');
      TWString twString2 = TWString('test');

      expect(twString.toString(), 'test');
      expect(twString.size(), 4);
      expect(twString.get(1), 'e');
      expect(twString.equal(twString2), true);
    });
  });
}
