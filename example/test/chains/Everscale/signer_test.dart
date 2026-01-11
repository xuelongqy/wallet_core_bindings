import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Everscale.pb.dart' as Everscale;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  initTest();
  group('EverscaleSigner', () {
    const coin = TWCoinType.Everscale;

    test('TransferWithDeploy', () {
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

      // Link to the message: https://everscan.io/messages/bfb18e56e9d00d783c7eb1726f08bf613dd0f01a110a130c0f8f91bb13390a39
      expect(output.encoded,
          'te6ccgICAAQAAQAAAUoAAAPhiAG+Ilaz1wTyTEauoymMGl6o+NGqhszIlHS8BXAmXniYrBGMBTen55/RbfcIBoeCrPB1cxPMcHRx7xyBzJmdtewBPaTu/WuHgnqg09jQaxTEcii+Nuqm7p3b6iMq+/6598ggCXUlsUyF0MjgAAAAAHAAAwACAAEAaEIAbYxTP6MTeK1gKb0MIiyb+0L82YDCeGvZRfJe9clpfsgg7msoAAAAAAAAAAAAAAAAAAAAUAAAAABLqS2KOWKN+7Y5OSiKhKisiw6t/h2ovvR3WbapyAtrdctwupwA3v8AIN0gggFMl7ohggEznLqxn3Gw7UTQ0x/THzHXC//jBOCk8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVA==');
    });

    test('Transfer1', () {
      final input = Everscale.SigningInput(
        transfer: Everscale.Transfer(
          bounce: false,
          behavior: Everscale.MessageBehavior.SimpleTransfer,
          amount: $fixnum.Int64(100000000),
          expiredAt: 1680770631,
          to: '0:db18a67f4626f15ac0537a18445937f685f9b30184f0d7b28be4bdeb92d2fd90',
          encodedContractData:
              'te6ccgEBAQEAKgAAUAAAAAFLqS2KOWKN+7Y5OSiKhKisiw6t/h2ovvR3WbapyAtrdctwupw=',
        ),
      );

      final privateKey = parse_hex(
          "542bd4288352f1c6b270046f153d406aec054a0a06000ab9b36b5c6dd3050ad4");
      input.privateKey = privateKey;

      final output = Everscale.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // Link to the message: https://everscan.io/messages/73807b0a3ca2d8564c023dccd5b9da222a270f68338c6fc2c064dda376a2c59d
      expect(output.encoded,
          'te6ccgICAAIAAQAAAKoAAAHfiAG+Ilaz1wTyTEauoymMGl6o+NGqhszIlHS8BXAmXniYrAImASIQKH2jIwoA65IGC6aua4gAA4fFo/Nuxgb3sIRELhZnSXIS7IsE2E4D+8hk3EWGVZX+ICqlN/ka9DvXduhaXUlsUyF0MjgAAAAIHAABAGhCAG2MUz+jE3itYCm9DCIsm/tC/NmAwnhr2UXyXvXJaX7IIC+vCAAAAAAAAAAAAAAAAAAA');
    });

    test('Transfer2', () {
      final input = Everscale.SigningInput(
        transfer: Everscale.Transfer(
          bounce: true,
          behavior: Everscale.MessageBehavior.SendAllBalance,
          amount: $fixnum.Int64(200000000),
          expiredAt: 1680770631,
          to: '0:df112b59eb82792623575194c60d2f547c68d54366644a3a5e02b8132f3c4c56',
          encodedContractData:
              'te6ccgEBAQEAKgAAUAAAAAJLqS2KOWKN+7Y5OSiKhKisiw6t/h2ovvR3WbapyAtrdctwupw=',
        ),
      );

      final privateKey = parse_hex(
          "542bd4288352f1c6b270046f153d406aec054a0a06000ab9b36b5c6dd3050ad4");
      input.privateKey = privateKey;

      final output = Everscale.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // Link to the message: https://everscan.io/messages/e35616cfa88e115580f07c6b41ae3ded1902d2bab1efefb74f677b4aececef24
      expect(output.encoded,
          'te6ccgICAAIAAQAAAKoAAAHfiAG+Ilaz1wTyTEauoymMGl6o+NGqhszIlHS8BXAmXniYrANrT0ivIEpuMGjKoyS9J03Wbl24jowXvdzQdLD6L3USLETUyRGbbmbUfBcNtF1FwKtmIQd0lNR1qIX9K/eloMgaXUlsUyF0MjgAAAAUFAABAGhiAG+Ilaz1wTyTEauoymMGl6o+NGqhszIlHS8BXAmXniYrIF9eEAAAAAAAAAAAAAAAAAAA');
    });
  });
}
