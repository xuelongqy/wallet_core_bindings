import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Ethereum.pb.dart' as Ethereum;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerRonin', () {
    const coin = TWCoinType.Ronin;

    test('Sign', () {
      // https://explorer.roninchain.com/tx/0xf13a2c4421700f8782ca73eaf16bb8baf82bcf093e23570a1ff062cdd8dbf6c3
      final input = Ethereum.SigningInput(
        chainId: intToBytes(2020),
        nonce: intToBytes(0),
        gasPrice: intToBytes(1000000000),
        gasLimit: intToBytes(21000),
        privateKey: parse_hex(
            "0x4646464646464646464646464646464646464646464646464646464646464646"),
        toAddress: 'ronin:c36edf48e21cf395b206352a1819de658fd7f988',
        transaction: Ethereum.Transaction(
          transfer: Ethereum.Transaction_Transfer(
            amount: intToBytes(276447),
          ),
        ),
      );

      const expected =
          "f86880843b9aca0082520894c36edf48e21cf395b206352a1819de658fd7f988830437df80820feca0442aa06b0d0465bfecf84b28e2ce614a32a1ccc12735dc03a5799517d6659d7aa004e1bf2efa30743f1b6d49dbec2671e9fb5ead1e7da15e352ca1df6fb86a8ba7";

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.encoded), expected);
      expect(TWAnySigner.supportsJSON(coin), true);
    });
  });
}
