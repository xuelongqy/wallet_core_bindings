import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Everscale.pb.dart' as Everscale;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('TWAnySignerEverscale', () {
    const coin = TWCoinType.TWCoinTypeEverscale;

    test('SignMessageToDeployWallet', () {
      final input = Everscale.SigningInput(
        transfer: Everscale.Transfer(
          bounce: false,
          behavior: Everscale.MessageBehavior.SimpleTransfer,
          amount: $fixnum.Int64(500000000),
          expiredAt: 1680770631,
          to: '0:db18a67f4626f15ac0537a18445937f685f9b30184f0d7b28be4bdeb92d2fd90',
        ),
      );

      // NOTE: There is `set_encoded_contract_data` because contract was not deployed yet

      final privateKey = parse_hex(
          "542bd4288352f1c6b270046f153d406aec054a0a06000ab9b36b5c6dd3050ad4");
      input.privateKey = privateKey;

      final output = Everscale.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.encoded,
          'te6ccgICAAQAAQAAAUoAAAPhiAG+Ilaz1wTyTEauoymMGl6o+NGqhszIlHS8BXAmXniYrBGMBTen55/RbfcIBoeCrPB1cxPMcHRx7xyBzJmdtewBPaTu/WuHgnqg09jQaxTEcii+Nuqm7p3b6iMq+/6598ggCXUlsUyF0MjgAAAAAHAAAwACAAEAaEIAbYxTP6MTeK1gKb0MIiyb+0L82YDCeGvZRfJe9clpfsgg7msoAAAAAAAAAAAAAAAAAAAAUAAAAABLqS2KOWKN+7Y5OSiKhKisiw6t/h2ovvR3WbapyAtrdctwupwA3v8AIN0gggFMl7ohggEznLqxn3Gw7UTQ0x/THzHXC//jBOCk8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVA==');
    });
  });
}
