import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Greenfield.pb.dart' as Greenfield;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('GreenfieldCompiler', () {
    const coin = TWCoinType.TWCoinTypeGreenfield;

    test('PreHashCompile', () {
      // Successfully broadcasted https://greenfieldscan.com/tx/0x9f895cf2dd64fb1f428cefcf2a6585a813c3540fc9fe1ef42db1da2cb1df55ab

      final privateKeyData = parse_hex(
          "9066aa168c379a403becb235c15e7129c133c244e56a757ab07bc369288bcab0");
      final privateKey = TWPrivateKey.createWithData(privateKeyData);
      final publicKey = privateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);

      final input = Greenfield.SigningInput(
        signingMode: Greenfield.SigningMode.Eip712,
        accountNumber: $fixnum.Int64(15560),
        cosmosChainId: 'greenfield_5600-1',
        ethChainId: '5600',
        sequence: $fixnum.Int64(2),
        publicKey: publicKey.data,
        messages: [
          Greenfield.Message(
            sendCoinsMessage: Greenfield.Message_Send(
              fromAddress: '0x9d1d97aDFcd324Bbd603D3872BD78e04098510b1',
              toAddress: '0x280b27f3676db1C4475EE10F75D510Eb527fd155',
              amounts: [
                Greenfield.Amount(
                  denom: 'BNB',
                  amount: '1000000000000000',
                ),
              ],
            ),
          ),
        ],
        fee: Greenfield.Fee(
          gas: $fixnum.Int64(200000),
          amounts: [
            Greenfield.Amount(
              denom: 'BNB',
              amount: '2000000000000000',
            ),
          ],
        ),
      );

      // Step 1: PreHash

      final inputData = input.writeToBuffer();
      final preOutputData =
          TWTransactionCompiler.preImageHashes(coin, inputData);
      final preOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preOutputData);

      expect(preOutput.error, Common.SigningError.OK);
      expectHex(preOutput.dataHash,
          'b8c62654582ca96b37ca94966199682bf70ed934e740d2f874ff54675a0ac344');

      // Step 2: Sign "remotely"

      final signature = privateKey.sign(
          Uint8List.fromList(preOutput.dataHash), TWCurve.TWCurveSECP256k1);

      expectHex(signature,
          'cb3a4684a991014a387a04a85b59227ebb79567c2025addcb296b4ca856e9f810d3b526f2a0d0fad6ad1b126b3b9516f8b3be020a7cca9c03ce3cf47f4199b6d00');

      // Step 3: Compile

      final ouptuData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: inputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      final output = Greenfield.SigningOutput.fromBuffer(ouptuData);

      expect(output.error, Common.SigningError.OK);
      expectHex(output.signature,
          'cb3a4684a991014a387a04a85b59227ebb79567c2025addcb296b4ca856e9f810d3b526f2a0d0fad6ad1b126b3b9516f8b3be020a7cca9c03ce3cf47f4199b6d1b');
      expect(output.serialized,
          '{"mode":"BROADCAST_MODE_SYNC","tx_bytes":"CpQBCpEBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEnEKKjB4OWQxZDk3YURGY2QzMjRCYmQ2MDNEMzg3MkJENzhlMDQwOTg1MTBiMRIqMHgyODBiMjdmMzY3NmRiMUM0NDc1RUUxMEY3NUQ1MTBFYjUyN2ZkMTU1GhcKA0JOQhIQMTAwMDAwMDAwMDAwMDAwMBJ5ClgKTQomL2Nvc21vcy5jcnlwdG8uZXRoLmV0aHNlY3AyNTZrMS5QdWJLZXkSIwohAnnvNAZNoQ2wRjxwSAYWugIHA+w6RQJt73vr0ggvXW/IEgUKAwjIBRgCEh0KFwoDQk5CEhAyMDAwMDAwMDAwMDAwMDAwEMCaDBpByzpGhKmRAUo4egSoW1kifrt5VnwgJa3cspa0yoVun4ENO1JvKg0PrWrRsSazuVFvizvgIKfMqcA8489H9BmbbRs="}');
    });
  });
}
