import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/Solana.pb.dart' as Solana;

import '../../utils.dart';

void main() {
  initTest();
  group('SolanaMetaplexCore', () {
    const coin = TWCoinType.Solana;
    const asset = 'DdC5i5AFrHCvcaEUEcCktFBiytHoGbMgUQ7JBwfRGihL';
    const collection = 'CCryptUfeFSZ3Fgc9FLeKrhLVAP67FSqi1GuVoj9CRac';
    const owner1 = 'HRqBqsfppNgzcb5EfCKoFWXXz9Y5tru9ZMg1R1WtJCcw';
    const owner2 = 'ArgPLJSF7ujjPZgooHGpRcnFDmftpDSzvhLRNsH94zmo';
    const owner1Key =
        'cb90b1e7b2c559088c5ff6acbbb588ae392e221492046113a62eac0ab254cdf8';
    const owner2Key =
        'fcce99cf0ccb96f689f01f54abc70c3ebf4a0007a0b40bea7b1c1ba8e690fcf1';
    const externalPayerTransaction =
        '6xZ26VwD4b46ZTqDTGQLbmQwtVmh3xzqUhJq2f6hEJ1jmc2ZkbD3hafuZxsiKLXyM6NbPGsjWwCW7n6adHh46XYcJ6EQZFzHbzkovQGvyccZZoJ2VgnWM1PKZqSXNVG7kbPu8JecZY6fhwDcSNdVjUE64Lmkr1EcikKNgNFTUUz4YhBJ3QQy7MVX1N3KxAfsnHQsthc1ruybsMiHuZ23teogeEFu7MDBQSuS927yEGZa4hwKJ7fSvB4aP5AxgS2TtT3LtNvwJWnwc6gwVT95LXbXEadrxHYpC7DNz4rjeV2PRxmS1vmK2VTGtUpHfPxqPvsixtuCakoHALKujYwabR51gvQZAxtzzLmzsu8VQgt2h123HZH2ovoBRFHrYv1rUs617SgmXpdhv7T1i554zHyqWcfV8hcw5ebAi83StbdxrfRhCj3jSLvvv47BQd6EDBnQgiapemfBM';

    // Fixed vectors from Wallet Core 4.9.3 solana_sign.rs and solana_compile.rs.
    test('SignTransferCoreAsset', () {
      final input = Solana.SigningInput(
        privateKey: parse_hex(owner1Key),
        recentBlockhash: '4G8PGaBMdz3Sqi43W9xL1rQHqhorF1ZbVZoabVejs7uv',
        transferCoreAssetTransaction: Solana.TransferCoreAsset(
          assetAddress: asset,
          recipientAddress: owner2,
          collectionAddress: collection,
        ),
      );
      final output = Solana.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );
      expect(output.error, Common.SigningError.OK);
      expect(output.encoded,
          'hq79tP91qTbzV6Qbe7FKZ8ru8wba2gVEN48LBaARqTLZGVZMja8xj9S8v7gKuUpQk6EgaWTk3t8znG9Z7qKvWdNujkJjUbtVmffnkyMi8GdjhgTRc4i1wSytyZpgJaUD8vhCRAJEmcZBzrq4kTCi3iJT776jYuAgB1u3KPC3pPzEpk8ktpz8ocSkKo1A9oXiU6hkhgs8bj8FbCEoLbvAmg67Ut7GoyK8kb9gAYD8SZYNKPN39oerw5EaP3md3DBDGDJ1aLaHPsUwtbG66PyoLYnCWGbgbcRW2WPTBqDc8RdJWUR28VdAj7wTEJ7jSeBaHLiFtYexNCPon8omyVV5KU5eqwHMGNCWMLkWjd6RrwB1p92M42E1M');
    });

    test('SignTransferCoreAssetWithExternalFeePayer', () {
      final input = Solana.SigningInput(
        privateKey: parse_hex(owner2Key),
        feePayerPrivateKey: parse_hex(owner1Key),
        recentBlockhash: '4oAHcxtSmNHddwHPT8dvRyfLRmuE2gUoVYsPStTD2Dyy',
        transferCoreAssetTransaction: Solana.TransferCoreAsset(
          assetAddress: asset,
          recipientAddress: owner1,
          collectionAddress: collection,
        ),
      );
      final output = Solana.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );
      expect(output.error, Common.SigningError.OK);
      expect(output.encoded, externalPayerTransaction);
    });

    test('TransferCoreAssetRejectsInvalidAddresses', () {
      for (final field in ['asset', 'recipient', 'collection']) {
        final input = Solana.SigningInput(
          privateKey: parse_hex(owner1Key),
          recentBlockhash: '4G8PGaBMdz3Sqi43W9xL1rQHqhorF1ZbVZoabVejs7uv',
          transferCoreAssetTransaction: Solana.TransferCoreAsset(
            assetAddress: field == 'asset' ? 'invalid' : asset,
            recipientAddress: field == 'recipient' ? 'invalid' : owner2,
            collectionAddress: field == 'collection' ? 'invalid' : collection,
          ),
        );
        final output = Solana.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin),
        );
        expect(output.error, Common.SigningError.Error_invalid_address,
            reason: field);
        expect(output.encoded, isEmpty);
      }
    });

    test('CompileTransferCoreAssetWithExternalFeePayer', () {
      final input = Solana.SigningInput(
        sender: owner2,
        feePayer: owner1,
        recentBlockhash: '4oAHcxtSmNHddwHPT8dvRyfLRmuE2gUoVYsPStTD2Dyy',
        transferCoreAssetTransaction: Solana.TransferCoreAsset(
          assetAddress: asset,
          recipientAddress: owner1,
          collectionAddress: collection,
        ),
      );
      final inputData = input.writeToBuffer();
      final preimage = Solana.PreSigningOutput.fromBuffer(
        TWTransactionCompiler.preImageHashes(coin, inputData),
      );
      expect(preimage.error, Common.SigningError.OK);
      expect(preimage.signers.map(String.fromCharCodes), [owner1, owner2]);
      expectHex(preimage.data,
          '02010205f4176a56e9fcd9216b52f05bfb8e50789c910286c61ab8d7eeb7c4966383e4a892732cbf84218dc43401df991043f314edcbeba7ec1b6c51a13ebb50f7a5db22bb91ae884a2e6a4bcec425f7f1094800edf870f645626bd0b1f042ab9e3026ffa67a751698f0bf3e1e1a7efa144f4627da21b08b02b5a72ae64acff7844c1ef5af54ab10bd97a542a09ef7b39889dd0cd394a4cce9dfa6cdc97ebe2d235ba74838664740fa14f1aa7337820ab604e7a9d5b16f254690704bf7c40c34ba705f0001040702030001000404020e00');
      final output = Solana.SigningOutput.fromBuffer(
        TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [
            parse_hex(
                '5f34101d0a248c69416c3ce80439c1687d8818229f1c3e2cb066c0048a95fbaa221f7ec57293961eb39e768d77fc3115f172ff1a9c9667197d753e647ef17609'),
            parse_hex(
                '23072fd8b6d58bdfd5bbcf915c92bf2cef27802fdfa3ecdca935aeede8f9cbf9c538b0bcd548c3af2ca1bfb7dbd3cd3ca8fb5457462ee4712b760b369fe34f06')
          ],
          publicKeys: [
            TWBase58.decodeNoCheck(owner1)!,
            TWBase58.decodeNoCheck(owner2)!,
          ],
        ),
      );
      expect(output.error, Common.SigningError.OK);
      expect(output.encoded, externalPayerTransaction);
    });
  });
}
