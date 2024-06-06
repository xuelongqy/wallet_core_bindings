import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Ethereum.pb.dart' as Ethereum;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerThetaFuel', () {
    const coin = TWCoinType.ThetaFuel;

    /// Successfully broadcasted:
    /// https://explorer.thetatoken.org/txs/0x0e7b0642f89855bf591d094cb7648c325fcef669add66dd273c4e16170fbca01
    test('TfuelTransfer', () {
      final chainId = intToBytes(361);
      final nonce = intToBytes(5);
      final gasLimit = intToBytes(79883);
      final gasPrice = intToBytes(4000000000000); // 0.000004
      const toAddress = "0x8dbD6c7Ede90646a61Bbc649831b7c298BFd37A0";
      final amount = bigIntStringToBytes('100000000000000000'); // 0.1
      final key = parse_hex(
          "0xc99dd0045dff0c1594c383658c07b4b75f39b90af7f8b592d1a7b461e03cc34b");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        gasLimit: gasLimit,
        gasPrice: gasPrice,
        toAddress: toAddress,
        privateKey: key,
        transaction: Ethereum.Transaction(
          transfer: Ethereum.Transaction_Transfer(
            amount: amount,
          ),
        ),
      );

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.encoded),
          'f870058603a3529440008301380b948dbd6c7ede90646a61bbc649831b7c298bfd37a088016345785d8a0000808202f5a0b1857121d66a484798ad0cd0fed0e205ee2e1f7f7f60b45cf84a2dbeb25c8c9fa06ffedd5df33a38f7de958c2800482432b6a8546913fc145f2615cc93f7a7647d');
    });

    /// Successfully broadcasted:
    /// https://explorer.thetatoken.org/txs/0x2c38163d84f031d4276dedc4e4424a6443208f7b22e1bfe6fd2ba0f607af5100
    test('TdropTokenTransfer', () {
      final chainId = intToBytes(361);
      final nonce = intToBytes(4);
      final gasLimit = intToBytes(79883);
      final gasPrice = intToBytes(4000000000000); // 0.000004
      const toAddress = "0x8dbD6c7Ede90646a61Bbc649831b7c298BFd37A0";
      const token = "0x1336739b05c7ab8a526d40dcc0d04a826b5f8b03"; // TDROP
      final amount = bigIntStringToBytes('4000000000000000000'); // 4 TDROP
      final key = parse_hex(
          "0xc99dd0045dff0c1594c383658c07b4b75f39b90af7f8b592d1a7b461e03cc34b");

      final input = Ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        gasLimit: gasLimit,
        gasPrice: gasPrice,
        toAddress: token,
        privateKey: key,
        transaction: Ethereum.Transaction(
          erc20Transfer: Ethereum.Transaction_ERC20Transfer(
            to: toAddress,
            amount: amount,
          ),
        ),
      );

      // sign test
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.encoded),
          'f8ad048603a3529440008301380b941336739b05c7ab8a526d40dcc0d04a826b5f8b0380b844a9059cbb0000000000000000000000008dbd6c7ede90646a61bbc649831b7c298bfd37a00000000000000000000000000000000000000000000000003782dace9d9000008202f6a03c1d37f5fc6adaa018c4ba41e13b9983e91500e7cfa8bc3731bb6365dd28d61ba07500748e46febcb781d6f37dad2479e1bd172479d108614c986122e1c6a4441e');
    });
  });
}
