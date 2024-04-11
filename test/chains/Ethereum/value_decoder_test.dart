import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

String decodeFromHex(String s) {
  final data = parse_hex(s);
  return TWEthereumAbiValue.decodeUInt256(data);
}

void main() {
  group('EthereumAbiValueDecoder', () {
    test('decodeUInt256', () {
      expect('0', decodeFromHex(""));
      expect(
          '0',
          decodeFromHex(
              "0000000000000000000000000000000000000000000000000000000000000000"));
      expect(
          '1',
          decodeFromHex(
              "0000000000000000000000000000000000000000000000000000000000000001"));
      expect('123456', decodeFromHex("01e240"));
      expect(
          '10020405371567',
          decodeFromHex(
              "0000000000000000000000000000000000000000000000000000091d0eb3e2af"));
      expect(
          '10020405371567',
          decodeFromHex(
              "0000000000000000000000000000000000000000000000000000091d0eb3e2af00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"));
    });

    test('decodeValue', () {
      expect(
        '42',
        TWEthereumAbiValue.decodeValue(
          parse_hex(
              '000000000000000000000000000000000000000000000000000000000000002a'),
          'uint',
        ),
      );
      expect(
        '24',
        TWEthereumAbiValue.decodeValue(
          parse_hex(
              '0000000000000000000000000000000000000000000000000000000000000018'),
          'uint8',
        ),
      );
      expect(
        '123456',
        TWEthereumAbiValue.decodeValue(
          parse_hex(
              '000000000000000000000000000000000000000000000000000000000001e240'),
          'uint256',
        ),
      );
      expect(
        '0xF784682C82526e245F50975190EF0fff4E4fC077',
        TWEthereumAbiValue.decodeValue(
          parse_hex(
              '000000000000000000000000f784682c82526e245f50975190ef0fff4e4fc077'),
          'address',
        ),
      );
      expect(
        'Hello World!    Hello World!    Hello World!',
        TWEthereumAbiValue.decodeValue(
          parse_hex(
            "000000000000000000000000000000000000000000000000000000000000002c"
            "48656c6c6f20576f726c64212020202048656c6c6f20576f726c642120202020"
            "48656c6c6f20576f726c64210000000000000000000000000000000000000000",
          ),
          'string',
        ),
      );
      expect(
        '0x31323334353637383930',
        TWEthereumAbiValue.decodeValue(
          parse_hex(
              "3132333435363738393000000000000000000000000000000000000000000000"),
          'bytes10',
        ),
      );
    });
  });
}
