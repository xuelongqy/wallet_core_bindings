import 'dart:ffi';
import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWData, () {
    test('Create with hex string', () {
      {
        final data = TWData.createWithHexString('deadbeef');

        expect(data.size, 4);
        expect(data.bytes()![0], 0xde);
        expect(data.bytes()![1], 0xad);
        expect(data.bytes()![2], 0xbe);
        expect(data.bytes()![3], 0xef);

        TWString string = TWString.createWithHexData(data);
        expect(string.toString(), 'deadbeef');
      }

      {
        TWData data = TWData.createWithHexString('00');

        expect(data.size, 1);
        expect(data.bytes()![0], 0);

        TWString string = TWString.createWithHexData(data);
        expect(string.toString(), '00');
      }

      {
        // with 0x prefix
        TWData data = TWData.createWithHexString('0xdeadbeef');

        TWString string = TWString.createWithHexData(data);
        expect(string.toString(), 'deadbeef');
      }

      {
        // uppercase
        TWData data = TWData.createWithHexString('DEADBEEF');

        TWString string = TWString.createWithHexData(data);
        expect(string.toString(), 'deadbeef');
      }

      {
        // odd length is invalid (intended grouping to bytes is not obvious)
        TWData data = TWData.createWithHexString('012');

        TWString string = TWString.createWithHexData(data);
        expect(string.toString(), '');
      }
    });

    test('Create with bytes', () {
      Uint8List bytes = Uint8List.fromList([0xde, 0xad, 0xbe, 0xef]);
      TWData data = TWData(bytes);
      TWString string = TWString.createWithHexData(data);

      expect(string.toString(), 'deadbeef');
    });

    test('Create with size', () {
      final n = 12;
      TWData data = TWData.createWithSize(n);
      for (int i = 0; i < n; i++) {
        expect(data[i], 0);
      }
    });

    test('Create with data', () {
      TWData data1 = TWData.createWithHexString('deadbeef');
      TWData data2 = TWData.createWithData(data1);
      expect(TWString.createWithHexData(data2).toString(), 'deadbeef');
    });

    test('Delete', () {
      TWData data = TWData.createWithSize(8);
      expect(data.pointer != nullptr, true);
      data.delete();
    });

    test('Get', () {
      TWData data = TWData.createWithHexString('deadbeef');
      expect(TWString.createWithHexData(data).toString(), 'deadbeef');
      expect(data[0], 0xde);
      expect(data[1], 0xad);
      expect(data[2], 0xbe);
      expect(data[3], 0xef);
    });

    test('Set', () {
      TWData data = TWData.createWithHexString('deadbeef');
      expect(TWString.createWithHexData(data).toString(), 'deadbeef');
      data[1] = 0xff;
      expect(TWString.createWithHexData(data).toString(), 'deffbeef');
    });

    test('Copy bytes', () {
      TWData data = TWData.createWithHexString('deadbeef');
      expect(TWString.createWithHexData(data).toString(), 'deadbeef');
      Uint8List buffer = data.copyBytes(0, 4);
      TWData data2 = TWData(buffer);
      expect(TWString.createWithHexData(data2).toString(), 'deadbeef');
    });

    test('Replace bytes', () {
      TWData data = TWData.createWithHexString('deadbeef');
      expect(TWString.createWithHexData(data).toString(), 'deadbeef');
      Uint8List bytes = Uint8List.fromList([0x12, 0x34]);
      data.replaceBytes(1, 2, bytes);
      expect(TWString.createWithHexData(data).toString(), 'de1234ef');
    });

    test('Append', () {
      {
        TWData data = TWData.createWithHexString('deadbeef');
        expect(TWString.createWithHexData(data).toString(), 'deadbeef');
        data.appendByte(0x12);
        expect(TWString.createWithHexData(data).toString(), 'deadbeef12');
      }

      {
        TWData data = TWData.createWithHexString('deadbeef');
        expect(TWString.createWithHexData(data).toString(), 'deadbeef');
        data.appendBytes(Uint8List.fromList([0x12, 0x34]));
        expect(TWString.createWithHexData(data).toString(), 'deadbeef1234');
      }

      {
        TWData data = TWData.createWithHexString('deadbeef');
        expect(TWString.createWithHexData(data).toString(), 'deadbeef');
        TWData data2 = TWData.createWithHexString('1234');
        expect(TWString.createWithHexData(data2).toString(), '1234');
        data.appendData(data2);
        expect(TWString.createWithHexData(data).toString(), 'deadbeef1234');
      }
    });

    test('Reverse', () {
      TWData data = TWData.createWithHexString('deadbeef');
      expect(TWString.createWithHexData(data).toString(), 'deadbeef');
      data.reverse();
      expect(TWString.createWithHexData(data).toString(), 'efbeadde');
    });

    test('Reset', () {
      TWData data = TWData.createWithHexString('deadbeef');
      expect(TWString.createWithHexData(data).toString(), 'deadbeef');
      data.reset();
      expect(TWString.createWithHexData(data).toString(), '00000000');
    });

    test('Equal', () {
      TWData data1 = TWData.createWithHexString('deadbeef');
      TWData data2 = TWData.createWithHexString('deadbeef');
      expect(data1 == data2, true);
    });
  });
}
