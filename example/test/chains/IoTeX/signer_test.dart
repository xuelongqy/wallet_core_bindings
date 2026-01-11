import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/IoTeX.pb.dart' as IoTeX;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerIoTeX', () {
    const coin = TWCoinType.IoTeX;

    test('Build', () {
      final input = IoTeX.SigningInput(
        version: 1,
        nonce: $fixnum.Int64(123),
        gasLimit: $fixnum.Int64(888),
        gasPrice: '999',
        privateKey: parse_hex(
            "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f"),
        transfer: IoTeX.Transfer(
          amount: '456',
          recipient: 'io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j',
          payload: parse_hex("68656c6c6f20776f726c6421"), // "hello world!"
        ),
      );

      final output = IoTeX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(hex(output.encoded),
          '0a4c0801107b18f8062203393939523e0a033435361229696f313837777a703038766e686a6a706b79646e723937716c68386b683064706b6b797466616d386a1a0c68656c6c6f20776f726c64211241044e18306ae9ef4ec9d07bf6e705442d4d1a75e6cdf750330ca2d880f2cc54607c9c33deb9eae9c06e06e04fe9ce3d43962cc67d5aa34fbeb71270d4bad3d648d91a41555cc8af4181bf85c044c3201462eeeb95374f78aa48c67b87510ee63d5e502372e53082f03e9a11c1e351de539cedf85d8dff87de9d003cb9f92243541541a000');
      final h = output.hash; // signed action's hash
      expect(hex(h),
          '6c84ac119058e859a015221f87a4e187c393d0c6ee283959342eac95fad08c33');
    });
  });
}
