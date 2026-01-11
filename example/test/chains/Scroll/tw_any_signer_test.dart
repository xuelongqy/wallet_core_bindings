import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Ethereum.pb.dart' as Ethereum;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerScroll', () {
    const coin = TWCoinType.Scroll;

    /// Successfully broadcasted:
    /// https://blockscout.scroll.io/tx/0x5a7ba291e0490079bddda54ca5592e5990d6b0eb49f8d239202941e3f63d32bc
    test('Sign', () {
      final input = Ethereum.SigningInput(
        chainId: intToBytes(534352),
        nonce: intToBytes(1),
        gasPrice: intToBytes(1000000),
        gasLimit: intToBytes(200000),
        privateKey: parse_hex(
            "ba4c9bceece0677d2c92be11c2338652e34b10675dc4cec5546a20a314fe7a73"),
        toAddress: '0xa6BC5EE0B1e904DD0773c5555D2F6833fE937A68',
        transaction: Ethereum.Transaction(
          transfer: Ethereum.Transaction_Transfer(
            amount: intToBytes(200000000000000),
          ),
        ),
      );

      const expected =
          "f86c01830f424083030d4094a6bc5ee0b1e904dd0773c5555d2f6833fe937a6886b5e620f480008083104ec3a0c43ee3d34f7758e05e2f54df227eb7780ad97d06e91e03ef6a3c91d4bea6e42fa07d075f20776f7f485faca6f057110fd2745a5cdd6cf121682ef7791619a03ade";

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.encoded), expected);
      expect(TWAnySigner.supportsJSON(coin), true);
    });
  });
}
