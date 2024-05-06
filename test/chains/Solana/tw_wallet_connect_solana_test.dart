import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Solana.pb.dart' as Solana;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/WalletConnect.pb.dart'
    as WalletConnect;

void main() {
  group('TWSolanaTransaction', () {
    const coin = TWCoinType.TWCoinTypeSolana;

    test('UpdateBlockhashAndSign', () {
      final privateKey = TWBase58.decodeNoCheck(
          'A7psj2GW7ZMdY4E5hJq14KMeYg7HFjULSsWSrTXZLvYr')!;
      final payload =
          '{"transaction":"AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAEDZsL1CMnFVcrMn7JtiOiN1U4hC7WovOVof2DX51xM0H/GizyJTHgrBanCf8bGbrFNTn0x3pCGq30hKbywSTr6AgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAgIAAQwCAAAAKgAAAAAAAAA="}';

      final parsingInput = WalletConnect.ParseRequestInput(
        method: WalletConnect.Method.SolanaSignTransaction,
        payload: payload,
      );

      final parsingInputData = parsingInput.writeToBuffer();

      final outputData = TWWalletConnectRequest.parse(coin, parsingInputData);

      final parsingOutput =
          WalletConnect.ParseRequestOutput.fromBuffer(outputData);

      expect(parsingOutput.error, Common.SigningError.OK);

      // Step 2: Set missing fields.
      expect(parsingOutput.hasSolana(), true);
      final signingInput = parsingOutput.solana;

      signingInput.privateKey = privateKey;
      signingInput.txEncoding = Solana.Encoding.Base64;

      final output = Solana.SigningOutput.fromBuffer(
          TWAnySigner.sign(signingInput.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);
      expect(
        output.encoded,
        'AQPWaOi7dMdmQpXi8HyQQKwiqIftrg1igGQxGtZeT50ksn4wAnyH4DtDrkkuE0fqgx80LTp4LwNN9a440SrmoA8BAAEDZsL1CMnFVcrMn7JtiOiN1U4hC7WovOVof2DX51xM0H/GizyJTHgrBanCf8bGbrFNTn0x3pCGq30hKbywSTr6AgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAgIAAQwCAAAAKgAAAAAAAAA=',
      );
    });
  });
}
