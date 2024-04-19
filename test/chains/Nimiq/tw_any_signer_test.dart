import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Nimiq.pb.dart' as Nimiq;

import '../../utils.dart';

void main() {
  group('TWAnySignerNimiq', () {
    const coin = TWCoinType.TWCoinTypeNimiq;

    test('Sign', () {
      final privateKey = parse_hex(
          "e3cc33575834add098f8487123cd4bca543ee859b3e8cfe624e7e6a97202b756");

      final input = Nimiq.SigningInput(
        destination: 'NQ86 2H8F YGU5 RM77 QSN9 LYLH C56A CYYR 0MLA',
        fee: $fixnum.Int64(1000),
        value: $fixnum.Int64(42042042),
        validityStartHeight: 314159,
        privateKey: privateKey,
      );

      final output = Nimiq.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.encoded),
          '0070c7492aaa9c9ac7a05bc0d9c5db2dae9372029654f71f0c7f95deed5099b7021450ffc385cd4e7c6ac9a7e91614ca67ff90568a00000000028182ba00000000000003e80004cb2f2a74dc7f6e0ab58a0bf52cc6e8801b0cca132dd4229d9a3e3a3d2f90e4d8f045d981b771bf5fc3851a98f3c617b1a943228f963e910e061808a721cfa0e3cad50b');
    });
  });
}
