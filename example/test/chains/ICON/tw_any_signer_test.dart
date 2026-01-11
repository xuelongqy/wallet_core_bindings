import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Icon.pb.dart' as Icon;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerIcon', () {
    const coin = TWCoinType.ICON;

    test('Sign', () {
      final key = parse_hex(
          "2d42994b2f7735bbc93a3e64381864d06747e574aa94655c516f9ad0a74eed79");
      final input = Icon.SigningInput(
        fromAddress: 'hxbe258ceb872e08851f1f59694dac2558708ece11',
        toAddress: 'hx5bfdb090f43a808005ffc27c25b213145e80b7cd',
        value: bigIntStringToBytes('1000000000000000000'),
        stepLimit: intToBytes(74565),
        networkId: intToBytes(1),
        nonce: intToBytes(1),
        timestamp: $fixnum.Int64(1516942975500598),
        privateKey: key,
      );

      final output = Icon.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      const expected =
          "{\"from\":\"hxbe258ceb872e08851f1f59694dac2558708ece11\",\"nid\":\"0x1\",\"nonce\":\"0x1\",\"signature\":\"xR6wKs+IA+7E91bT8966jFKlK5mayutXCvayuSMCrx9KB7670CsWa0B7LQzgsxU0GLXaovlAT2MLs1XuDiSaZQE=\",\"stepLimit\":\"0x12345\",\"timestamp\":\"0x563a6cf330136\",\"to\":\"hx5bfdb090f43a808005ffc27c25b213145e80b7cd\",\"value\":\"0xde0b6b3a7640000\",\"version\":\"0x3\"}";
      expect(output.encoded, expected);
    });
  });
}
