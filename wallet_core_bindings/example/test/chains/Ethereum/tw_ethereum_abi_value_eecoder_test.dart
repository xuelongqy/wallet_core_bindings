import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWEthereumAbiValue', () {
    test('decodeUInt256', () {
      const expected = "10020405371567";
      final inputs = [
        "091d0eb3e2af",
        "0000000000000000000000000000000000000000000000000000091d0eb3e2af",
        "0000000000000000000000000000000000000000000000000000091d0eb3e2af0000000000000000000000000000000000000000000000000000000000000000",
        "0000000000000000000000000000000000000000000000000000091d0eb3e2af00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ];
      for (var input in inputs) {
        final data = parse_hex(input);
        final result = TWEthereumAbiValue.decodeUInt256(data);
        expect(result, expected);
      }
    });

    test('decodeValue', () {
      {
        const input =
            "000000000000000000000000000000000000000000000000000000000000002a";
        const type = "uint";
        const expected = "42";
        final data = parse_hex(input);
        final result = TWEthereumAbiValue.decodeValue(data, type);
        expect(result, expected);
      }
      {
        const input =
            "0000000000000000000000000000000000000000000000000000000000000018";
        const type = "uint8";
        const expected = "24";
        final data = parse_hex(input);
        final result = TWEthereumAbiValue.decodeValue(data, type);
        expect(result, expected);
      }
      {
        const input =
            "000000000000000000000000f784682c82526e245f50975190ef0fff4e4fc077";
        const type = "address";
        const expected = "0xF784682C82526e245F50975190EF0fff4E4fC077";
        final data = parse_hex(input);
        final result = TWEthereumAbiValue.decodeValue(data, type);
        expect(result, expected);
      }
      {
        const input =
            "000000000000000000000000000000000000000000000000000000000000002c"
            "48656c6c6f20576f726c64212020202048656c6c6f20576f726c642120202020"
            "48656c6c6f20576f726c64210000000000000000000000000000000000000000";
        const type = "string";
        const expected = "Hello World!    Hello World!    Hello World!";
        final data = parse_hex(input);
        final result = TWEthereumAbiValue.decodeValue(data, type);
        expect(result, expected);
      }
      {
        const input =
            "3132333435363738393000000000000000000000000000000000000000000000";
        const type = "bytes10";
        const expected = "0x31323334353637383930";
        final data = parse_hex(input);
        final result = TWEthereumAbiValue.decodeValue(data, type);
        expect(result, expected);
      }
    });

    test('decodeArray', () {
      {
        // Array of UInt8
        const input =
            "0000000000000000000000000000000000000000000000000000000000000003"
            "0000000000000000000000000000000000000000000000000000000000000031"
            "0000000000000000000000000000000000000000000000000000000000000032"
            "0000000000000000000000000000000000000000000000000000000000000033";
        const type = "uint8[]";
        const expected = "[49,50,51]";
        final data = parse_hex(input);
        final result = TWEthereumAbiValue.decodeArray(data, type);
        expect(result, expected);
      }
      {
        // Array of Address
        const input =
            "0000000000000000000000000000000000000000000000000000000000000002"
            "000000000000000000000000f784682c82526e245f50975190ef0fff4e4fc077"
            "0000000000000000000000002e00cd222cb42b616d86d037cc494e8ab7f5c9a3";
        const type = "address[]";
        const expected = "[\"0xF784682C82526e245F50975190EF0fff4E4fC077\","
            "\"0x2e00CD222Cb42B616D86D037Cc494e8ab7F5c9a3\"]";
        final data = parse_hex(input);
        final result = TWEthereumAbiValue.decodeArray(data, type);
        expect(result, expected);
      }
      {
        // Array of ByteArray
        const input =
            "0000000000000000000000000000000000000000000000000000000000000002"
            "0000000000000000000000000000000000000000000000000000000000000040"
            "0000000000000000000000000000000000000000000000000000000000000080"
            "0000000000000000000000000000000000000000000000000000000000000002"
            "1011000000000000000000000000000000000000000000000000000000000000"
            "0000000000000000000000000000000000000000000000000000000000000003"
            "1022220000000000000000000000000000000000000000000000000000000000";
        const type = "bytes[]";
        const expected = "[\"0x1011\",\"0x102222\"]";
        final data = parse_hex(input);
        final result = TWEthereumAbiValue.decodeArray(data, type);
        expect(result, expected);
      }
    });
  });
}
