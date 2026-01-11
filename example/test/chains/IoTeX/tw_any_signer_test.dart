import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/IoTeX.pb.dart' as IoTeX;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerIoTeX', () {
    const coin = TWCoinType.IoTeX;

    test('Sign', () {
      final input = IoTeX.SigningInput(
        version: 1,
        nonce: $fixnum.Int64(1),
        gasLimit: $fixnum.Int64(1),
        gasPrice: '1',
        privateKey: parse_hex(
            "68ffa8ec149ce50da647166036555f73d57f662eb420e154621e5f24f6cf9748"),
        transfer: IoTeX.Transfer(
          amount: '1',
          recipient: 'io1e2nqsyt7fkpzs5x7zf2uk0jj72teu5n6aku3tr',
        ),
      );

      final output = IoTeX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(hex(output.encoded),
          '0a39080110011801220131522e0a01311229696f3165326e7173797437666b707a733578377a6632756b306a6a3732746575356e36616b75337472124104fb30b196ce3e976593ecc2da220dca9cdea8c84d2373770042a930b892ac0f5cf762f20459c9100eb9d4d7597f5817bf21e10b53a0120b9ec1ba5cddfdcb669b1a41ec9757ae6c9009315830faaab250b6db0e9535b00843277f596ae0b2b9efc0bd4e14138c056fc4cdfa285d13dd618052b3d1cb7a3f554722005a2941bfede96601');
    });
  });
}
