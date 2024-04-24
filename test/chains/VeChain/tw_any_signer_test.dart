import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/VeChain.pb.dart' as VeChain;

import '../../utils.dart';

void main() {
  group('TWAnySignerVeChain', () {
    const coin = TWCoinType.TWCoinTypeVeChain;

    test('Sign', () {
      final input = VeChain.SigningInput(
        chainTag: 1,
        blockRef: $fixnum.Int64(1),
        expiration: 1,
        gasPriceCoef: 0,
        gas: $fixnum.Int64(21000),
        nonce: $fixnum.Int64(1),
        privateKey: parse_hex(
            "0x4646464646464646464646464646464646464646464646464646464646464646"),
        clauses: [
          VeChain.Clause(
            to: '0x3535353535353535353535353535353535353535',
            value: parse_hex("31303030"), // 1000
          ),
        ],
      );

      final output = VeChain.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.encoded),
          'f86a010101dcdb943535353535353535353535353535353535353535843130303080808252088001c0b841bf8edf9600e645b5abd677cb52f585e7f655d1361075d511b37f707a9f31da6702d28739933b264527a1d05b046f5b74044b88c30c3f5a09d616bd7a4af4901601');
    });
  });
}
