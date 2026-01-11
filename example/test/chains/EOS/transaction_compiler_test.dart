import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/EOS.pb.dart' as EOS;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  initTest();
  group('EOSCompiler', () {
    const coin = TWCoinType.EOS;

    test('CompileWithSignatures', () {
      final key = parse_hex(
          "559aead08264d5795d3909718cdd05abd49572e84fe55590eef31a88a08fdffd");

      /// Step 1: Prepare transaction input (protobuf)
      final input = EOS.SigningInput(
        asset: EOS.Asset(
          amount: $fixnum.Int64(300000),
          decimals: 4,
          symbol: 'TKN',
        ),
        chainId: parse_hex(
            "cf057bbfb72640471fd910bcb67639c22df9f92470936cddc1ade0e2f2e7dc4f"),
        referenceBlockId: parse_hex(
            "000067d6f6a7e7799a1f3d487439a679f8cf95f1c986f35c0d2fa320f51a7144"),
        referenceBlockTime: 1554209118,
        currency: 'token',
        sender: 'token',
        recipient: 'eosio',
        memo: 'my second transfer',
        privateKey: key,
        privateKeyType: EOS.KeyType.MODERNK1,
      );

      final txInputData = input.writeToBuffer();

      {
        final output = EOS.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));

        expect(output.error, Common.SigningError.OK);
        expect(output.jsonEncoded,
            '{"compression":"none","packed_context_free_data":"","packed_trx":"6e67a35cd6679a1f3d4800000000010000000080a920cd000000572d3ccdcd010000000080a920cd00000000a8ed3232330000000080a920cd0000000000ea3055e09304000000000004544b4e00000000126d79207365636f6e64207472616e7366657200","signatures":["SIG_K1_K9RdLC7DEDWjTfR64GU8BtDHcAjzR1ntcT651JMcfHNTpdsvDrUwfyzF1FkvL9fxEi2UCtGJZ9zYoNbJoMF1fbU64cRiJ7"]}');
      }

      /// Step 2: Obtain preimage hash
      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      expect(preImageHashes.isNotEmpty, true);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHash = preSigningOutput.dataHash;
      expectHex(preImageHash,
          '14fc3299ee3e1113096bf1869dfa14c04a7ffdedd8ebdabf530683e4cfcd726c');

      // Simulate signature, normally obtained from signature server
      final publicKey = TWPrivateKey.createWithData(key)
          .getPublicKeyByType(TWPublicKeyType.NIST256p1);
      final signature = parse_hex(
          "1f6c4efceb5a6dadab271fd7e2153d97d22690938475b23f017cf9ec29e20d25725e90e541e130daa83c38fc4c933725f05837422c3f4a51f8c1d07208c8fd5e0b"); // data("SIG_K1_K9RdLC7DEDWjTfR64GU8BtDHcAjzR1ntcT651JMcfHNTpdsvDrUwfyzF1FkvL9fxEi2UCtGJZ9zYoNbJoMF1fbU64cRiJ7");

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );

      const ExpectedTx =
          '{"compression":"none","packed_context_free_data":"","packed_trx":"6e67a35cd6679a1f3d4800000000010000000080a920cd000000572d3ccdcd010000000080a920cd00000000a8ed3232330000000080a920cd0000000000ea3055e09304000000000004544b4e00000000126d79207365636f6e64207472616e7366657200","signatures":["SIG_K1_K9RdLC7DEDWjTfR64GU8BtDHcAjzR1ntcT651JMcfHNTpdsvDrUwfyzF1FkvL9fxEi2UCtGJZ9zYoNbJoMF1fbU64cRiJ7"]}';

      {
        final output = EOS.SigningOutput.fromBuffer(outputData);

        expect(output.jsonEncoded, ExpectedTx);
      }

      input.privateKeyType = EOS.KeyType.LEGACY;
      {
        if (isTestWasm) {
          expect(() => TWAnySigner.sign(input.writeToBuffer(), coin),
              throwsException);
        } else {
          final output = EOS.SigningOutput.fromBuffer(
              TWAnySigner.sign(input.writeToBuffer(), coin));

          expect(output.error, Common.SigningError.Error_internal);
          expect(output.jsonEncoded.isEmpty, true);
        }
      }
    });
  });
}
