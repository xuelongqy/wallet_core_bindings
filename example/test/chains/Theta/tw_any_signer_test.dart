import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Theta.pb.dart' as Theta;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerTheta', () {
    const coin = TWCoinType.Theta;

    test('Sign', () {
      final privateKey = parse_hex(
          "93a90ea508331dfdf27fb79757d4250b4e84954927ba0073cd67454ac432c737");

      final input = Theta.SigningInput(
        chainId: 'privatenet',
        toAddress: '0x9F1233798E905E173560071255140b4A8aBd3Ec6',
        thetaAmount: intToBytes(10),
        tfuelAmount: intToBytes(20),
        fee: intToBytes(1000000000000),
        sequence: $fixnum.Int64(1),
        privateKey: privateKey,
      );

      final output = Theta.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.encoded),
          '02f887c78085e8d4a51000f863f861942e833968e5bb786ae419c4d13189fb081cc43babc70a85e8d4a5101401b8415190868498d587d074d57298f41853d0109d997f15ddf617f471eb8cbb7fff267cb8fe9134ccdef053ec7cabd18070325c9c436efe1abbacd14eb7561d3fc10501d9d8949f1233798e905e173560071255140b4a8abd3ec6c20a14');
    });
  });
}
