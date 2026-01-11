import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Solana.pb.dart' as Solana;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('TWSolanaTransaction', () {
    const coin = TWCoinType.Solana;

    test('UpdateBlockhashAndSign', () {
      // base64 encoded
      // https://explorer.solana.com/tx/3KbvREZUat76wgWMtnJfWbJL74Vzh4U2eabVJa3Z3bb2fPtW8AREP5pbmRwUrxZCESbTomWpL41PeKDcPGbojsej?cluster=devnet
      const encodedTx =
          "AnQTYwZpkm3fs4SdLxnV6gQj3hSLsyacpxDdLMALYWObm722f79IfYFTbZeFK9xHtMumiDOWAM2hHQP4r/GtbARpncaXgOVFv7OgbRLMbuCEJHO1qwcdCbtH72VzyzU8yw9sqqHIAaCUE8xaQTgT6Z5IyZfeyMe2QGJIfOjz65UPAgACBssq8Im1alV3N7wXGODL8jLPWwLhTuCqfGZ1Iz9fb5tXlMOJD6jUvASrKmdtLK/qXNyJns2Vqcvlk+nfJYdZaFpIWiT/tAcEYbttfxyLdYxrLckAKdVRtf1OrNgtZeMCII4SAn6SYaaidrX/AN3s/aVn/zrlEKW0cEUIatHVDKtXO0Qss5EhV/E6kz0BNCgtAytf/s0Botvxt3kGCN8ALqcG3fbh12Whk9nL4UbO63msHLSF7V9bN5E6jPWFfv8Aqe6sdLXiXSDILEtzckCjkjchiSf6zVGpMYiAE5BE2IqHAQUEAgQDAQoMoA8AAAAAAAAG";
      // base58 encoded
      const newBlockhash = 'CyPYVsYWrsJNfVpi8aazu7WsrswNFuDd385z6GNoBGUg';

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
      const newBlockhash = "CyPYVsYWrsJNfVpi8aazu7WsrswNFuDd385z6GNoBGUg";
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

    test('SetPriorityFee', () {
      // base64 encoded
      final privateKey = parse_hex(
          "baf2b2dbbbad7ca96c1fa199c686f3d8fbd2c7b352f307e37e04f33df6741f18");
      const originalTx =
          "AX43+Ir2EDqf2zLEvgzFrCZKRjdr3wCdp8CnvYh6N0G/s86IueX9BbiNUl16iLRGvwREDfi2Srb0hmLNBFw1BwABAAEDODI+iWe7g68B9iwCy8bFkJKvsIEj350oSOpcv4gNnv/st+6qmqipl9lwMK6toB9TiL7LrJVfij+pKwr+pUKxfwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAG6GdPcA92ORzVJe2jfG8KQqqMHr9YTLu30oM4i7MFEoBAgIAAQwCAAAA6AMAAAAAAAA=";

      // Step 1 - Check if there are no price and limit instructions in the original transaction.
      expect(TWSolanaTransaction.getComputeUnitPrice(originalTx), null);
      expect(TWSolanaTransaction.getComputeUnitLimit(originalTx), null);

      // Step 2 - Set price and limit instructions.

      final txWithPrice = TWSolanaTransaction.setComputeUnitPrice(
        originalTx,
        '1000',
      );
      final updatedTx = TWSolanaTransaction.setComputeUnitLimit(
        txWithPrice!,
        '10000',
      )!;

      expect(
        updatedTx,
        'AX43+Ir2EDqf2zLEvgzFrCZKRjdr3wCdp8CnvYh6N0G/s86IueX9BbiNUl16iLRGvwREDfi2Srb0hmLNBFw1BwABAAIEODI+iWe7g68B9iwCy8bFkJKvsIEj350oSOpcv4gNnv/st+6qmqipl9lwMK6toB9TiL7LrJVfij+pKwr+pUKxfwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwZGb+UhFzL/7K26csOb57yM5bvF9xJrLEObOkAAAAAboZ09wD3Y5HNUl7aN8bwpCqowev1hMu7fSgziLswUSgMDAAUCECcAAAICAAEMAgAAAOgDAAAAAAAAAwAJA+gDAAAAAAAA',
      );

      // Step 3 - Check if price and limit instructions are set successfully.

      expect(TWSolanaTransaction.getComputeUnitPrice(updatedTx), '1000');
      expect(TWSolanaTransaction.getComputeUnitLimit(updatedTx), '10000');

      // Step 4 - Decode transaction into a `RawMessage` Protobuf.
      final updatedTxData = TWBase64.decode(updatedTx)!;
      final decodeOutputData = TWTransactionDecoder.decode(coin, updatedTxData);
      final decodeOutput =
          Solana.DecodingTransactionOutput.fromBuffer(decodeOutputData);
      expect(decodeOutput.error, Common.SigningError.OK);

      // Step 5 - Sign the decoded `RawMessage` transaction.
      final input = Solana.SigningInput(
        privateKey: privateKey,
        rawMessage: decodeOutput.transaction,
        txEncoding: Solana.Encoding.Base64,
      );

      final output = Solana.SigningOutput.fromBuffer(
        TWAnySigner.sign(
          input.writeToBuffer(),
          coin,
        ),
      );

      expect(output.error, Common.SigningError.OK);

      // Successfully broadcasted tx:
      // https://explorer.solana.com/tx/2ho7wZUXbDNz12xGfsXg2kcNMqkBAQjv7YNXNcVcuCmbC4p9FZe9ELeM2gMjq9MKQPpmE3nBW5pbdgwVCfNLr1h8
      expect(
        output.encoded,
        'AVUye82Mv+/aWeU2G+B6Nes365mUU2m8iqcGZn/8kFJvw4wY6AgKGG+vJHaknHlCDwE1yi1SIMVUUtNCOm3kHg8BAAIEODI+iWe7g68B9iwCy8bFkJKvsIEj350oSOpcv4gNnv/st+6qmqipl9lwMK6toB9TiL7LrJVfij+pKwr+pUKxfwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwZGb+UhFzL/7K26csOb57yM5bvF9xJrLEObOkAAAAAboZ09wD3Y5HNUl7aN8bwpCqowev1hMu7fSgziLswUSgMDAAUCECcAAAICAAEMAgAAAOgDAAAAAAAAAwAJA+gDAAAAAAAA',
      );
    });

    test('SetFeePayer', () {
      const coin = TWCoinType.Solana;

      // base64 encoded
      const originalTx =
          "AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAQABA2uEKrOPvZNBtdUtSFXcg8+kj4O/Z1Ht/hwvnaqq5s6mTXd3KtwUyJFfRs2PBfeQW8xCEZvNr/5J/Tx8ltbn0pwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACo+QRbvXWNKoOfaOL4cSpfYrmn/2TV+dBmct+HsmmwdAQICAAEMAgAAAACcnwYAAAAAAA==";

      // Step 1 - Add fee payer to the transaction.
      const feePayer = 'Eg5jqooyG6ySaXKbQUu4Lpvu2SqUPZrNkM4zXs9iUDLJ';
      final updatedTx = TWSolanaTransaction.setFeePayer(originalTx, feePayer)!;

      expect(updatedTx,
          'AgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAIAAQTLKvCJtWpVdze8Fxjgy/Iyz1sC4U7gqnxmdSM/X2+bV2uEKrOPvZNBtdUtSFXcg8+kj4O/Z1Ht/hwvnaqq5s6mTXd3KtwUyJFfRs2PBfeQW8xCEZvNr/5J/Tx8ltbn0pwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACo+QRbvXWNKoOfaOL4cSpfYrmn/2TV+dBmct+HsmmwdAQMCAQIMAgAAAACcnwYAAAAAAA==');

      // Step 2 - Decode transaction into a `RawMessage` Protobuf.
      final decodeOutputData =
          TWTransactionDecoder.decode(coin, TWBase64.decode(updatedTx)!);
      final decodeOutput = Solana.DecodingTransactionOutput.fromBuffer(
        decodeOutputData,
      );
      expect(decodeOutput.error, Common.SigningError.OK);

      // Step 3 - Obtain preimage hash.
      final input = Solana.SigningInput(
        rawMessage: decodeOutput.transaction,
        txEncoding: Solana.Encoding.Base64,
      );
      final inputData = input.writeToBuffer();

      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, inputData);
      final preSigningOutput =
          Solana.PreSigningOutput.fromBuffer(preImageHashesData);
      expect(preSigningOutput.signers.length, 2);
      final preImageHash = preSigningOutput.data;
      expectHex(
        preImageHash,
        '8002000104cb2af089b56a557737bc1718e0cbf232cf5b02e14ee0aa7c6675233f5f6f9b576b842ab38fbd9341b5d52d4855dc83cfa48f83bf6751edfe1c2f9daaaae6cea64d77772adc14c8915f46cd8f05f7905bcc42119bcdaffe49fd3c7c96d6e7d29c00000000000000000000000000000000000000000000000000000000000000002a3e4116ef5d634aa0e7da38be1c4a97d8ae69ffd9357e74199cb7e1ec9a6c1d01030201020c02000000009c9f060000000000',
      );

      // Step 4 - Compile transaction info.
      // Simulate signature, normally obtained from signature server.
      final feePayerSignature = parse_hex(
          "feb9f15cc345fa156450676100033860edbe80a6f61dab8199e94fdc47678ecfdb95e3bc10ec0a7f863ab8ef5c38edae72db7e5d72855db225fd935fd59b700a");
      final feePayerPublicKey = parse_hex(
          "cb2af089b56a557737bc1718e0cbf232cf5b02e14ee0aa7c6675233f5f6f9b57");
      final solSenderSignature = parse_hex(
          "936cd6d176e701d1f748031925b2f029f6f1ab4b99aec76e24ccf05649ec269569a08ec0bd80f5fee1cb8d13ecd420bf50c5f64ae74c7afa267458cabb4e5804");
      final solSenderPublicKey = parse_hex(
          "6b842ab38fbd9341b5d52d4855dc83cfa48f83bf6751edfe1c2f9daaaae6cea6");

      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: inputData,
        signatures: [feePayerSignature, solSenderSignature],
        publicKeys: [feePayerPublicKey, solSenderPublicKey],
      );
      const expectedTx =
          "Av658VzDRfoVZFBnYQADOGDtvoCm9h2rgZnpT9xHZ47P25XjvBDsCn+GOrjvXDjtrnLbfl1yhV2yJf2TX9WbcAqTbNbRducB0fdIAxklsvAp9vGrS5mux24kzPBWSewmlWmgjsC9gPX+4cuNE+zUIL9QxfZK50x6+iZ0WMq7TlgEgAIAAQTLKvCJtWpVdze8Fxjgy/Iyz1sC4U7gqnxmdSM/X2+bV2uEKrOPvZNBtdUtSFXcg8+kj4O/Z1Ht/hwvnaqq5s6mTXd3KtwUyJFfRs2PBfeQW8xCEZvNr/5J/Tx8ltbn0pwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACo+QRbvXWNKoOfaOL4cSpfYrmn/2TV+dBmct+HsmmwdAQMCAQIMAgAAAACcnwYAAAAAAA==";
      final output = Solana.SigningOutput.fromBuffer(outputData);
      expect(output.encoded, expectedTx);
      // Successfully broadcasted tx:
      // https://explorer.solana.com/tx/66PAVjxFVGP4ctrkXmyNRhp6BdFT7gDe1k356DZzCRaBDTmJZF1ewGsbujWRjDTrt5utnz8oHZw3mg8qBNyct41w?cluster=devnet
    });
  });
}
