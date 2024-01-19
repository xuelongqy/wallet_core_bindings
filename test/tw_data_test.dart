import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWData, () {
    test('Create with hex string', () {
      {
        TWData twData = TWData.createWithHexString('deadbeef');

        expect(twData.size(), 4);
        expect(twData.bytes()[0], 0xde);
        expect(twData.bytes()[1], 0xad);
        expect(twData.bytes()[2], 0xbe);
        expect(twData.bytes()[3], 0xef);

        TWString twString = TWString.createWithHexData(twData);
        expect(twString.toString(), 'deadbeef');
      }

      {
        TWData twData = TWData.createWithHexString('00');

        expect(twData.size(), 1);
        expect(twData.bytes()[0], 0);

        TWString twString = TWString.createWithHexData(twData);
        expect(twString.toString(), '00');
      }

      {
        // with 0x prefix
        TWData twData = TWData.createWithHexString('0xdeadbeef');

        TWString twString = TWString.createWithHexData(twData);
        expect(twString.toString(), 'deadbeef');
      }

      {
        // uppercase
        TWData twData = TWData.createWithHexString('DEADBEEF');

        TWString twString = TWString.createWithHexData(twData);
        expect(twString.toString(), 'deadbeef');
      }

      {
        // odd length is invalid (intended grouping to bytes is not obvious)
        TWData twData = TWData.createWithHexString('012');

        TWString twString = TWString.createWithHexData(twData);
        expect(twString.toString(), '');
      }
    });

    test('Create with bytes', () {
      Uint8List bytes = Uint8List.fromList([0xde, 0xad, 0xbe, 0xef]);
      TWData twData = TWData(bytes);
      TWString twString = TWString.createWithHexData(twData);

      expect(twString.toString(), 'deadbeef');
    });
  });
}
