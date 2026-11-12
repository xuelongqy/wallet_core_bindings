import 'dart:convert';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/BitcoinV2.pb.dart' as BitcoinV2;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/Utxo.pb.dart' as Utxo;
import 'package:wallet_core_bindings/proto/Zcash.pb.dart' as Zcash;

import '../../utils.dart';

void main() {
  initTest();
  group('ZcashV5', () {
    const coin = TWCoinType.Zcash;
    const sender = 't1NiBn6r7FrgzL63yF34qJBb3FW8su1qYCF';
    const recipient = 't1gUuvGGo2HvZbxTbjyucHCZHrWfaSZrfeS';
    const privateKey =
        'ddc453138b8a482aebdc0d8e606b8ebe84c45160387aad58680e8bbae6e524ad';
    const publicKey =
        '02950ef6f2aab593a487101a47b35fc2b3a6f2f9323afa024f15e5225b365d63fe';
    const encoded =
        '050000800a27a7265b16a537000000001d0f3600013d43c4f646f1d1aec0a53275d631b7e31657b20b37a048b859614085d0df8a22010000006a47304402203672aa890ade97ff91335b490b84584ebc488e35562a247547dc39806156a08a02200bb32dd446123fcb8833c115ef4ec151a5a0991dc429a1f9d02d8dbf19430056012102950ef6f2aab593a487101a47b35fc2b3a6f2f9323afa024f15e5225b365d63feffffffff02a0860100000000001976a914f800474fa2709c3ee9330fc4f85a8996d6fb218a88ac28940200000000001976a9143510a91d51112126751446a639e6dfe84144e7cb88ac000000';
    const txid =
        'f98b289fa014fa21fb3542f59eddc1140895e8f31575b47a5c4482abf8a82565';
    late Bitcoin.SigningInput input;

    setUp(() {
      input = Bitcoin.SigningInput(
        coinType: coin.value,
        signingV2: BitcoinV2.SigningInput(
          chainInfo: BitcoinV2.ChainInfo(p2pkhPrefix: 184, p2shPrefix: 189),
          privateKeys: [parse_hex(privateKey)],
          builder: BitcoinV2.TransactionBuilder(
            version: BitcoinV2.TransactionVersion.UseDefault,
            inputSelector: BitcoinV2.InputSelector.UseAll,
            fixedDustThreshold: $fixnum.Int64(546),
            zcashExtraData: Zcash.TransactionBuilderExtraData(
              branchId: [0x5b, 0x16, 0xa5, 0x37],
              zip0317: true,
              expiryHeight: 3542813,
            ),
            inputs: [
              BitcoinV2.Input(
                outPoint: Utxo.OutPoint(
                  hash: parse_hex(
                          '228adfd085406159b848a0370bb25716e3b731d67532a5c0aed1f146f6c4433d')
                      .reversed
                      .toList(),
                  vout: 1,
                ),
                value: $fixnum.Int64(279000),
                sighashType: TWBitcoinSigHashType.All.value,
                receiverAddress: sender,
              ),
            ],
            outputs: [
              BitcoinV2.Output(
                  value: $fixnum.Int64(100000), toAddress: recipient),
            ],
            changeOutput: BitcoinV2.Output(toAddress: sender),
          ),
        ),
      );
    });

    // Fixed mainnet vectors from Wallet Core 4.9.3 zcash_sign.rs/zcash_compile.rs.
    for (final version in [
      Zcash.TransactionVersion.UseDefault,
      Zcash.TransactionVersion.V5,
    ]) {
      test('SignTransparentV5_$version', () {
        input.signingV2.builder.zcashExtraData.txVersion = version;
        final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.error, Common.SigningError.OK);
        expect(plan.hasPlanningResultV2(), true);
        expect(plan.planningResultV2.error, Common.SigningError.OK);
        expect(plan.planningResultV2.feeEstimate.toInt(), 10000);
        expect(plan.planningResultV2.change.toInt(), 169000);

        final result = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin),
        );
        expect(result.error, Common.SigningError.OK);
        expect(result.hasSigningResultV2(), true);
        final output = result.signingResultV2;
        expect(output.error, Common.SigningError.OK);
        expect(output.hasZcash(), true);
        expectHex(output.encoded, encoded);
        expectHex(output.txid, txid);
        expect(output.fee.toInt(), 10000);
        expect(output.vsize.toInt(), 240);
      });
    }

    test('PreImageHashesTransparentV5', () {
      input.signingV2.privateKeys.clear();
      input.signingV2.publicKeys.add(parse_hex(publicKey));
      input.signingV2.builder.zcashExtraData.txVersion =
          Zcash.TransactionVersion.V5;
      input.signingV2.builder.inputs[0].clearReceiverAddress();
      input.signingV2.builder.inputs[0].scriptBuilder =
          BitcoinV2.Input_InputBuilder(
        p2pkh: BitcoinV2.PublicKeyOrHash(pubkey: parse_hex(publicKey)),
      );
      final inputData = input.writeToBuffer();
      final preimage = Bitcoin.PreSigningOutput.fromBuffer(
        TWTransactionCompiler.preImageHashes(coin, inputData),
      );
      expect(preimage.error, Common.SigningError.OK);
      expect(preimage.hasPreSigningResultV2(), true);
      expect(preimage.preSigningResultV2.error, Common.SigningError.OK);
      expect(preimage.preSigningResultV2.sighashes, hasLength(1));
      final sighash = preimage.preSigningResultV2.sighashes.single;
      expectHex(sighash.publicKey, publicKey);
      expect(sighash.signingMethod,
          BitcoinV2.PreSigningOutput_SigningMethod.Legacy);
      expectHex(sighash.sighash,
          '43f76a654bed58e0fff013e3660d95c3ffe438ed6ed0e645a85d68553c1882a9');
    });

    test('SignPcztV5Mainnet', () {
      input.signingV2.psbt = BitcoinV2.Psbt(
          psbt: base64Decode(
              'UENaVAEAAAAFis6ctQLbrJS9AwEAkJ7YAYUBgwABrpRasmKy2cK4JqsuOSvJPBqfQN+crUtTBH4QeEgQ+mwAAf////8PAAAAiN8XGXapFDUQqR1RESEmdRRGpjnm3+hBROfLiKwAAAEAAAAAAAACoI0GGXapFPgAR0+icJw+6TMPxPhaiZbW+yGKiKwAAAEjdDFnVXV2R0dvMkh2WmJ4VGJqeXVjSENaSHJXZmFTWnJmZVMA2IMRGXapFDUQqR1RESEmdRRGpjnm3+hBROfLiKwAAAEjdDFOaUJuNnI3RnJnekw2M3lGMzRxSkJiM0ZXOHN1MXFZQ0YAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA='));
      final result = Bitcoin.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );
      expect(result.error, Common.SigningError.OK);
      expect(result.hasSigningResultV2(), true);
      final output = result.signingResultV2;
      expect(output.error, Common.SigningError.OK);
      expect(output.hasPsbt(), true);
      expectHex(output.psbt.psbt,
          '50435a5401000000058ace9cb502dbac94bd030100909ed8018501830001ae945ab262b2d9c2b826ab2e392bc93c1a9f40df9cad4b53047e10784810fa6c0001ffffffff0f0000016a47304402200aa3f8f04234d87846179a20346805f43171bc28c2a9124a1e18d69abdc6a0f00220331c4a2a82d5fa2dc627fb9f22cc43cb31149009721eca1e7762f5b37d923d50012102950ef6f2aab593a487101a47b35fc2b3a6f2f9323afa024f15e5225b365d63fe88df171976a9143510a91d51112126751446a639e6dfe84144e7cb88ac00000100000000000002a08d061976a914f800474fa2709c3ee9330fc4f85a8996d6fb218a88ac0000012374316755757647476f3248765a627854626a79756348435a4872576661535a7266655300d883111976a9143510a91d51112126751446a639e6dfe84144e7cb88ac0000012374314e69426e3672374672677a4c363379463334714a42623346573873753171594346000000000000000000000000000000000000000000000000000000000000000000000000000003000100000000000000000000000000000000000000000000000000000000000000000000');
      expectHex(output.encoded,
          '050000800a27a7265b16a53700000000100f360001ae945ab262b2d9c2b826ab2e392bc93c1a9f40df9cad4b53047e10784810fa6c000000006a47304402200aa3f8f04234d87846179a20346805f43171bc28c2a9124a1e18d69abdc6a0f00220331c4a2a82d5fa2dc627fb9f22cc43cb31149009721eca1e7762f5b37d923d50012102950ef6f2aab593a487101a47b35fc2b3a6f2f9323afa024f15e5225b365d63feffffffff02a0860100000000001976a914f800474fa2709c3ee9330fc4f85a8996d6fb218a88acd8410400000000001976a9143510a91d51112126751446a639e6dfe84144e7cb88ac000000');
      expectHex(output.txid,
          '228adfd085406159b848a0370bb25716e3b731d67532a5c0aed1f146f6c4433d');
      expect(output.fee.toInt(), 10000);
      expect(output.vsize.toInt(), 240);
    });
  });
}
