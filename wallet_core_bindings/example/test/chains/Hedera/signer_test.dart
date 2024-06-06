import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Hedera.pb.dart' as Hedera;

import '../../utils.dart';

void main() {
  initTest();
  group('HederaSigner', () {
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

    test('SignWithMemo', () {
      // Successfully broadcasted: https://hashscan.io/testnet/transaction/0.0.48694347-1667227300-854561449?t=1667227312.554926003
      final privateKey = TWPrivateKey.createWithHexString(
          'e87a5584c0173263e138db689fdb2a7389025aaae7cb1a18a1017d76012130e8');
      final input = Hedera.SigningInput(
        privateKey: privateKey.data,
        body: Hedera.TransactionBody(
          memo: 'wallet core',
          nodeAccountID: '0.0.7',
          transactionFee: $fixnum.Int64(100000000),
          transactionValidDuration: $fixnum.Int64(120),
          transfer: Hedera.TransferMessage(
            from: '0.0.48694347',
            to: '0.0.48462050',
            amount: $fixnum.Int64(100000000),
          ),
          transactionID: Hedera.TransactionID(
            transactionValidStart: Hedera.Timestamp(
              seconds: $fixnum.Int64(1667227300),
              nanos: 854561449,
            ),
            accountID: '0.0.48694347',
          ),
        ),
      );

      final result = Hedera.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(hex(result.encoded),
          '0a510a150a0c08a4bdff9a0610a9a5be9703120518cb889c17120218071880c2d72f22020878320b77616c6c657420636f7265721e0a1c0a0c0a0518e2f18d17108084af5f0a0c0a0518cb889c1710ff83af5f12660a640a205d3a70d08b2beafb72c7a68986b3ff819a306078b8c359d739e4966e82e6d40e1a40ee1764c9acf79b68a675c1a78c8c43cb7d136f5f230b48b44992ad3e7ba87a8256758b823120a76142e58b94f082a0551000cf68cd3336fc4393c6b2191d8603');
    });

    test('SignWithMemoMainnet', () {
      // Successfully broadcasted: https://hashscan.io/mainnet/transaction/0.0.1377988-1667566445-926176449?t=1667566457.533804616
      final privateKey = TWPrivateKey.createWithHexString(
          '650c5120cbdc6244e3d10001eb27eea4dd3f80c331b3b6969fa434797d4edd50');
      final input = Hedera.SigningInput(
        privateKey: privateKey.data,
        body: Hedera.TransactionBody(
          memo: 'wallet core',
          nodeAccountID: '0.0.12',
          transactionFee: $fixnum.Int64(100000000),
          transactionValidDuration: $fixnum.Int64(120),
          transfer: Hedera.TransferMessage(
            from: '0.0.1377988',
            to: '0.0.19783',
            amount: $fixnum.Int64(100000000),
          ),
          transactionID: Hedera.TransactionID(
            transactionValidStart: Hedera.Timestamp(
              seconds: $fixnum.Int64(1667566445),
              nanos: 926176449,
            ),
            accountID: '0.0.1377988',
          ),
        ),
      );

      final result = Hedera.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(hex(result.encoded),
          '0a4e0a140a0c08ed96949b0610c1a9d1b903120418c48d541202180c1880c2d72f22020878320b77616c6c657420636f7265721c0a1a0a0b0a0418c79a01108084af5f0a0b0a0418c48d5410ff83af5f12660a640a207df3e1ab790b28de4706d36a7aa99a0e043cb3e2c3d6ec6686e4af7f638b08601a4020a527f81c10a256b089fb2fbe2a1fc5917e0d221c0d06b8bb9095a6b26390634610f2034b99025ad70db4d84e08751841c2a70651220e32d1213a4b05ec9906');
    });
  });
}
