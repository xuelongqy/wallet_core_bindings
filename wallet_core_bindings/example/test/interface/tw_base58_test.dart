import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

void main() {
  initTest();

  group(TWBase58, () {
    test('Encode', () {
      final data = TWData.createWithHexString(
          '00769bdff96a02f9135a1d19b749db6a78fe07dc90');
      final result = TWBase58.encode(data.bytes()!);
      expect(result, '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx');
    });

    test('EncodeNoCheck', () {
      final data = TWData.createWithHexString(
          '00769bdff96a02f9135a1d19b749db6a78fe07dc90c3507da5');
      final result = TWBase58.encodeNoCheck(data.bytes()!);
      expect(result, '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx');
    });

    test('EncodeNoCheck2', () {
      final data = TWData.createWithHexString(
          '00769bdff96a02f9135a1d19b749db6a78fe07dc90deadbeef');
      final result = TWBase58.encodeNoCheck(data.bytes()!);
      expect(result, '1Bp9U1ogV3A14FMvKbRJms7ctyso5FdSz2');
    });

    test('Decode', () {
      const input = '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx';
      final result = TWBase58.decode(input);
      expect(TWString.createWithHexBytes(result!).value!,
          '00769bdff96a02f9135a1d19b749db6a78fe07dc90');
    });

    test('DecodeNoCheck', () {
      const input = '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx';
      final result = TWBase58.decodeNoCheck(input);
      expect(TWString.createWithHexBytes(result!).value!,
          '00769bdff96a02f9135a1d19b749db6a78fe07dc90c3507da5');
    });

    test('Decode wrong checksum', () {
      const input = '1Bp9U1ogV3A14FMvKbRJms7ctyso5FdSz2';
      final result = TWBase58.decode(input);
      expect(result == null, true);
    });

    test('DecodeNoCheck wrong checksum', () {
      const input = '1Bp9U1ogV3A14FMvKbRJms7ctyso5FdSz2';
      final result = TWBase58.decodeNoCheck(input);
      // decodes despite wrong checksum
      expect(TWString.createWithHexBytes(result!).value!,
          '00769bdff96a02f9135a1d19b749db6a78fe07dc90deadbeef');
    });

    test('Decode invalid char', () {
      const input = '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tc0';
      final result = TWBase58.decode(input);
      expect(result == null, true);
    });

    test('DecodeNoCheck invalid char', () {
      const input = '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tc0';
      final result = TWBase58.decodeNoCheck(input);
      expect(result == null, true);
    });
  });
}
