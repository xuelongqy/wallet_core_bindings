import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWDataVector, () {
    test('CreateDelete', () {
      final vec = TWDataVector();

      expect(vec.pointer != nullptr, true);
      expect(vec.size, 0);

      vec.delete();
    });

    test('CreateWrapAutoDelete', () {
      final vec = TWDataVector();

      expect(vec.pointer != nullptr, true);
      expect(vec.size, 0);
    });

    test('CreateWithData', () {
      final elem1d = 'deadbeef';
      final elem1 = TWData.createWithHexString(elem1d);
      final vec = TWDataVector.createWithData(elem1.bytes()!);

      expect(vec.pointer != nullptr, true);
      expect(vec.size, 1);

      final readElem1 = vec.get(0);

      expect(TWString.createWithHexBytes(readElem1!).toString(), elem1d);
    });

    test('Add', () {
      final vec = TWDataVector();

      expect(vec.pointer != nullptr, true);
      expect(vec.size, 0);

      final elem1d = 'deadbeef';
      final elem1 = TWData.createWithHexString(elem1d);
      vec.add(elem1.bytes()!);

      expect(vec.size, 1);
      final readElem1 = vec.get(0);
      expect(TWString.createWithHexBytes(readElem1!).toString(), elem1d);

      final elem2d = '0202';
      final elem2 = TWData.createWithHexString(elem2d);
      vec.add(elem2.bytes()!);

      expect(vec.size, 2);
      final readElem2 = vec.get(1);
      expect(TWString.createWithHexBytes(readElem2!).toString(), elem2d);
    });

    test('Get', () {
      final elem1d = 'deadbeef';
      final elem1 = TWData.createWithHexString(elem1d);
      final vec = TWDataVector.createWithData(elem1.bytes()!);

      expect(vec.pointer != nullptr, true);
      expect(vec.size, 1);

      {
        // Get element
        final readElem1 = vec.get(0);
        expect(TWString.createWithHexBytes(readElem1!).toString(), elem1d);
      }

      {
        // Get with bad index
        final readElem1 = vec.get(666);
        expect(readElem1, null);
      }
    });
  });
}
