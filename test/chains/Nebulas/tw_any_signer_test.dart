import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Nebulas.pb.dart' as Nebulas;

import '../../utils.dart';

void main() {
  group('TWAnySignerNebulas', () {
    const coin = TWCoinType.TWCoinTypeNebulas;

    test('Sign', () {
      final input = Nebulas.SigningInput(
        fromAddress: 'n1V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY',
        toAddress: 'n1SAeQRVn33bamxN4ehWUT7JGdxipwn8b17',
        nonce: intToBytes(7),
        gasPrice: intToBytes(1000000),
        gasLimit: intToBytes(200000),
        amount: bigIntStringToBytes('11000000000000000000'),
        payload: '',
        timestamp: intToBytes(1560052938),
      );

      final privateKey = parse_hex(
          "d2fd0ec9f6268fc8d1f563e3e976436936708bdf0dc60c66f35890f5967a8d2b");
      input.privateKey = privateKey;
      input.chainId = intToBytes(1);

      final output = Nebulas.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.signature),
          'f53f4a9141ff8e462b094138eccd8c3a5d7865f9e9ab509626c78460a9e0b0fc35f7ed5ba1795ceb81a5e46b7580a6f7fb431d44fdba92515399cf6a8e47e71500');
      expect(output.raw,
          'CiBQXdR2neMqnEu21q/U+OHqZHSBX9Q0hNiRfL2eCZO4hRIaGVefwtw23wEobqA40/7aIwQHghETxH4r+50aGhlXf89CeLWgHFjKu9/6tn4KNbelsMDAIIi2IhAAAAAAAAAAAJin2bgxTAAAKAcwyony5wU6CAoGYmluYXJ5QAFKEAAAAAAAAAAAAAAAAAAPQkBSEAAAAAAAAAAAAAAAAAADDUBYAWJB9T9KkUH/jkYrCUE47M2MOl14Zfnpq1CWJseEYKngsPw19+1boXlc64Gl5Gt1gKb3+0MdRP26klFTmc9qjkfnFQA=');
    });
  });
}
