import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Solana.pb.dart' as Solana;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  group('TWSolanaTransaction', () {
    const coin = TWCoinType.TWCoinTypeSolana;

    test('UpdateBlockhashAndSign', () {
      // base64 encoded
      // https://explorer.solana.com/tx/3KbvREZUat76wgWMtnJfWbJL74Vzh4U2eabVJa3Z3bb2fPtW8AREP5pbmRwUrxZCESbTomWpL41PeKDcPGbojsej?cluster=devnet
      final encodedTx =
          "AnQTYwZpkm3fs4SdLxnV6gQj3hSLsyacpxDdLMALYWObm722f79IfYFTbZeFK9xHtMumiDOWAM2hHQP4r/GtbARpncaXgOVFv7OgbRLMbuCEJHO1qwcdCbtH72VzyzU8yw9sqqHIAaCUE8xaQTgT6Z5IyZfeyMe2QGJIfOjz65UPAgACBssq8Im1alV3N7wXGODL8jLPWwLhTuCqfGZ1Iz9fb5tXlMOJD6jUvASrKmdtLK/qXNyJns2Vqcvlk+nfJYdZaFpIWiT/tAcEYbttfxyLdYxrLckAKdVRtf1OrNgtZeMCII4SAn6SYaaidrX/AN3s/aVn/zrlEKW0cEUIatHVDKtXO0Qss5EhV/E6kz0BNCgtAytf/s0Botvxt3kGCN8ALqcG3fbh12Whk9nL4UbO63msHLSF7V9bN5E6jPWFfv8Aqe6sdLXiXSDILEtzckCjkjchiSf6zVGpMYiAE5BE2IqHAQUEAgQDAQoMoA8AAAAAAAAG";
      // base58 encoded
      final newBlockhash = 'CyPYVsYWrsJNfVpi8aazu7WsrswNFuDd385z6GNoBGUg';

      final myPrivateKey = parse_hex(
          '7f0932159226ddec9e1a4b0b8fe7cdc135049f9e549a867d722aa720dd64f32e');
      final feePayerPrivateKey = parse_hex(
          '4b9d6f57d28b06cbfa1d4cc710953e62d653caf853415c56ffd9d150acdeb7f7');
      final privateKeysVec = [myPrivateKey, feePayerPrivateKey];

      final outputData = TWSolanaTransaction.updateBlockhashAndSign(
        encodedTx: encodedTx,
        recentBlockhash: newBlockhash,
        privateKeys: privateKeysVec,
      );

      final output = Solana.SigningOutput.fromBuffer(outputData);

      expect(output.error, Common.SigningError.OK);
      expect(
        output.encoded,
        'Ajzc/Tke0CG8Cew5qFa6xZI/7Ya3DN0M8Ige6tKPsGzhg8Bw9DqL18KUrEZZ1F4YqZBo4Rv+FsDT8A7Nss7p4A6BNVZzzGprCJqYQeNg0EVIbmPc6mDitNniHXGeKgPZ6QZbM4FElw9O7IOFTpOBPvQFeqy0vZf/aayncL8EK/UEAgACBssq8Im1alV3N7wXGODL8jLPWwLhTuCqfGZ1Iz9fb5tXlMOJD6jUvASrKmdtLK/qXNyJns2Vqcvlk+nfJYdZaFpIWiT/tAcEYbttfxyLdYxrLckAKdVRtf1OrNgtZeMCII4SAn6SYaaidrX/AN3s/aVn/zrlEKW0cEUIatHVDKtXO0Qss5EhV/E6kz0BNCgtAytf/s0Botvxt3kGCN8ALqcG3fbh12Whk9nL4UbO63msHLSF7V9bN5E6jPWFfv8AqbHiki6ThNH3auuyZPQpJntnN0mA//56nMpK/6HIuu8xAQUEAgQDAQoMoA8AAAAAAAAG',
      );
    });

    test('DecodeUpdateBlockhashAndSign', () {
      // base64 encoded
      // https://explorer.solana.com/tx/3KbvREZUat76wgWMtnJfWbJL74Vzh4U2eabVJa3Z3bb2fPtW8AREP5pbmRwUrxZCESbTomWpL41PeKDcPGbojsej?cluster=devnet
      final encodedTx = TWBase64.decode(
          'AnQTYwZpkm3fs4SdLxnV6gQj3hSLsyacpxDdLMALYWObm722f79IfYFTbZeFK9xHtMumiDOWAM2hHQP4r/GtbARpncaXgOVFv7OgbRLMbuCEJHO1qwcdCbtH72VzyzU8yw9sqqHIAaCUE8xaQTgT6Z5IyZfeyMe2QGJIfOjz65UPAgACBssq8Im1alV3N7wXGODL8jLPWwLhTuCqfGZ1Iz9fb5tXlMOJD6jUvASrKmdtLK/qXNyJns2Vqcvlk+nfJYdZaFpIWiT/tAcEYbttfxyLdYxrLckAKdVRtf1OrNgtZeMCII4SAn6SYaaidrX/AN3s/aVn/zrlEKW0cEUIatHVDKtXO0Qss5EhV/E6kz0BNCgtAytf/s0Botvxt3kGCN8ALqcG3fbh12Whk9nL4UbO63msHLSF7V9bN5E6jPWFfv8Aqe6sdLXiXSDILEtzckCjkjchiSf6zVGpMYiAE5BE2IqHAQUEAgQDAQoMoA8AAAAAAAAG')!;
      final newBlockhash = "CyPYVsYWrsJNfVpi8aazu7WsrswNFuDd385z6GNoBGUg";
      final senderPrivateKey = TWBase58.decodeNoCheck(
          "9YtuoD4sH4h88CVM8DSnkfoAaLY7YeGC2TarDJ8eyMS5")!;
      final feePayerPrivateKey = TWBase58.decodeNoCheck(
          "66ApBuKpo2uSzpjGBraHq7HP8UZMUJzp3um8FdEjkC9c")!;

      // Step 1: Decode the transaction.
      final decodeOutputData = TWTransactionDecoder.decode(coin, encodedTx);

      final decodeOutput =
          Solana.DecodingTransactionOutput.fromBuffer(decodeOutputData);

      expect(decodeOutput.error, Common.SigningError.OK);
      expect(decodeOutput.transaction.hasLegacy(), true);
      // Previous fee payer signature.
      expect(
        decodeOutput.transaction.signatures[0].signature,
        '3KbvREZUat76wgWMtnJfWbJL74Vzh4U2eabVJa3Z3bb2fPtW8AREP5pbmRwUrxZCESbTomWpL41PeKDcPGbojsej',
      );
      // Previous sender signature.
      expect(
        decodeOutput.transaction.signatures[1].signature,
        '37UT8U6DdqaWqV6yQuHcRN3JpMefDgVna8LJJPmmDNKYMwmefEgvcreSg9AqSsT7cU2rMBNyDktEtDU19ZqqZvML',
      );

      // Step 2. Prepare a signing input and update the recent-blockhash.

      final signingInput = Solana.SigningInput(
        rawMessage: decodeOutput.transaction,
      );
      signingInput.rawMessage.legacy.recentBlockhash = newBlockhash;
      signingInput.privateKey = senderPrivateKey;
      signingInput.feePayerPrivateKey = feePayerPrivateKey;
      signingInput.txEncoding = Solana.Encoding.Base64;

      // Step 3. Re-sign the updated transaction.

      final output = Solana.SigningOutput.fromBuffer(
          TWAnySigner.sign(signingInput.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);
      expect(
        output.encoded,
        "Ajzc/Tke0CG8Cew5qFa6xZI/7Ya3DN0M8Ige6tKPsGzhg8Bw9DqL18KUrEZZ1F4YqZBo4Rv+FsDT8A7Nss7p4A6BNVZzzGprCJqYQeNg0EVIbmPc6mDitNniHXGeKgPZ6QZbM4FElw9O7IOFTpOBPvQFeqy0vZf/aayncL8EK/UEAgACBssq8Im1alV3N7wXGODL8jLPWwLhTuCqfGZ1Iz9fb5tXlMOJD6jUvASrKmdtLK/qXNyJns2Vqcvlk+nfJYdZaFpIWiT/tAcEYbttfxyLdYxrLckAKdVRtf1OrNgtZeMCII4SAn6SYaaidrX/AN3s/aVn/zrlEKW0cEUIatHVDKtXO0Qss5EhV/E6kz0BNCgtAytf/s0Botvxt3kGCN8ALqcG3fbh12Whk9nL4UbO63msHLSF7V9bN5E6jPWFfv8AqbHiki6ThNH3auuyZPQpJntnN0mA//56nMpK/6HIuu8xAQUEAgQDAQoMoA8AAAAAAAAG",
      );
    });
  });
}
