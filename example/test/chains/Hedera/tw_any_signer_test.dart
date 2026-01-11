import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Hedera.pb.dart' as Hedera;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerHedera', () {
    const coin = TWCoinType.Hedera;

    test('Sign', () {
      // Successfully broadcasted: https://hashscan.io/testnet/transaction/0.0.48694347-1667222879-749068449?t=1667222891.440398729&p=1
      final privateKey = TWPrivateKey.createWithHexString(
          'e87a5584c0173263e138db689fdb2a7389025aaae7cb1a18a1017d76012130e8');
      final input = Hedera.SigningInput(
        privateKey: privateKey.data,
        body: Hedera.TransactionBody(
          memo: '',
          nodeAccountID: '0.0.9',
          transactionFee: $fixnum.Int64(100000000),
          transactionValidDuration: $fixnum.Int64(120),
          transfer: Hedera.TransferMessage(
            from: '0.0.48694347',
            to: '0.0.48462050',
            amount: $fixnum.Int64(100000000),
          ),
          transactionID: Hedera.TransactionID(
            transactionValidStart: Hedera.Timestamp(
              seconds: $fixnum.Int64(1667222879),
              nanos: 749068449,
            ),
            accountID: '0.0.48694347',
          ),
        ),
      );

      final result = Hedera.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(hex(result.encoded),
          '0a440a150a0c08df9aff9a0610a1c197e502120518cb889c17120218091880c2d72f22020878721e0a1c0a0c0a0518e2f18d17108084af5f0a0c0a0518cb889c1710ff83af5f12660a640a205d3a70d08b2beafb72c7a68986b3ff819a306078b8c359d739e4966e82e6d40e1a40612589c3b15f1e3ed6084b5a3a5b1b81751578cac8d6c922f31731b3982a5bac80a22558b2197276f5bae49b62503a4d39448ceddbc5ef3ba9bee4c0f302f70c');
    });
  });
}
