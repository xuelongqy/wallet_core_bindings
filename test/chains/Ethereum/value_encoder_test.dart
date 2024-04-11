import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void checkLast32BytesEqual(Uint8List data, String expected) {
  expectHex(data.sublist(data.length - 32), expected);
}

void main() {
  group('EthereumAbiValueEncoder', () {
    test('encodeBool', () {
      Uint8List data;
      data = TWEthereumAbiValue.encodeBool(false);
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000000');
      data = TWEthereumAbiValue.encodeBool(true);
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000001');
    });

    test('encodeInt32', () {
      Uint8List data;
      data = TWEthereumAbiValue.encodeInt32(69);
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000045');
      data = TWEthereumAbiValue.encodeInt32(-1);
      checkLast32BytesEqual(data,
          'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff');
      data = TWEthereumAbiValue.encodeInt32(0);
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000000');
      data = TWEthereumAbiValue.encodeInt32(1);
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000001');

      data = TWEthereumAbiValue.encodeUInt32(69);
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000045');
      data = TWEthereumAbiValue.encodeUInt32(0);
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000000');
      data = TWEthereumAbiValue.encodeUInt32(1);
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000001');
    });

    test('encodeUInt256', () {
      Uint8List data;
      data = TWEthereumAbiValue.encodeInt256(intToBytes(69));
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000045');
      data = TWEthereumAbiValue.encodeInt256(intToBytes(0));
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000000');
      data = TWEthereumAbiValue.encodeInt256(intToBytes(1));
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000001');

      data = TWEthereumAbiValue.encodeUInt256(intToBytes(69));
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000045');
      data = TWEthereumAbiValue.encodeUInt256(intToBytes(0));
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000000');
      data = TWEthereumAbiValue.encodeUInt256(intToBytes(1));
      checkLast32BytesEqual(data,
          '0000000000000000000000000000000000000000000000000000000000000001');
    });

    test('encodeAddress', () {
      Uint8List data;
      data = TWEthereumAbiValue.encodeAddress(
          parse_hex('0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed'));
      checkLast32BytesEqual(data,
          '0000000000000000000000005aaeb6053f3e94c9b9a09f33669435e7ef1beaed');
    });

    test('encodeBytes', () {
      Uint8List data;
      data = TWEthereumAbiValue.encodeBytes(parse_hex('45'));
      checkLast32BytesEqual(data,
          '4500000000000000000000000000000000000000000000000000000000000000');
      data = TWEthereumAbiValue.encodeBytes(
          parse_hex('5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed'));
      checkLast32BytesEqual(data,
          '5aaeb6053f3e94c9b9a09f33669435e7ef1beaed000000000000000000000000');
      data = TWEthereumAbiValue.encodeBytes(parse_hex(
          '000102030405060708090a0b0c0d0e0f000102030405060708090a0b0c0d0e0f'));
      checkLast32BytesEqual(data,
          '000102030405060708090a0b0c0d0e0f000102030405060708090a0b0c0d0e0f');
      // too long, truncated
      data = TWEthereumAbiValue.encodeBytes(parse_hex(
          '000102030405060708090a0b0c0d0e0f000102030405060708090a0b0c0d0e0f3333'));
      checkLast32BytesEqual(data,
          '000102030405060708090a0b0c0d0e0f000102030405060708090a0b0c0d0e0f');
    });

    test('encodeBytesDyn', () {
      Uint8List data;
      data = TWEthereumAbiValue.encodeBytesDyn(
          Uint8List.fromList('trustwallet'.codeUnits));
      checkLast32BytesEqual(data,
          '31924c4e2bb082322d1efa718bf67c73ca297b481dac9f76ad35670cff0056a3');
    });
  });
}
