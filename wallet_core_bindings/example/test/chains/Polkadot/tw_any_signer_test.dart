import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Polkadot.pb.dart' as Polkadot;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TxCompiler;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

Uint8List helper_encodePayload(TWCoinType coin, Polkadot.SigningInput input) {
  final txInputData = input.writeToBuffer();
  final preImageHashes =
      TWTransactionCompiler.preImageHashes(coin, txInputData);

  final preSigningOutput =
      TxCompiler.PreSigningOutput.fromBuffer(preImageHashes);

  expect(preSigningOutput.error, Common.SigningError.OK);
  return Uint8List.fromList(preSigningOutput.data);
}

void main() {
  initTest();
  group('TWAnySignerPolkadot', () {
    const coin = TWCoinType.Polkadot;

    test('SignTransfer_9fd062', () {
      final polkadotPrefix = coin.ss58Prefix;
      final kusamaPrefix = TWCoinType.Kusama.ss58Prefix;
      const astarPrefix = 5;
      const polymeshPrefix = 12;
      const parallelPrefix = 172;

      final privateKey = TWPrivateKey.createWithHexString(
          '0xabf8e5bdbe30c65656c0a3cbd181ff8a56294a69dfedd27982aace4a76909115');
      final privateKeyThrow2Data = parse_hex(
          '70a794d4f1019c3ce002f33062f45029c4f930a56b3d20ec477f7668c6bbc37f');
      final privateKeyThrow2 =
          TWPrivateKey.createWithData(privateKeyThrow2Data);
      const addressThrow2 = '14Ztd3KJDaB9xyJtRkREtSZDdhLSbm7UUKt8Z7AwSv7q85G2';
      final genesisHash = parse_hex(
          "91b171bb158e2d3848fa23a9f1c25182fb8e20313b2c1eb49219da7a70ce90c3");

      const toAddressStr = '13ZLCqJNPsRZYEbwjtZZFpWt9GyFzg5WahXCVWKpWdUJqrQ5';

      final input = Polkadot.SigningInput(
        blockHash: parse_hex(
            "0x5d2143bb808626d63ad7e1cda70fa8697059d670a992e82cd440fbb95ea40351"),
        genesisHash: genesisHash,
        nonce: $fixnum.Int64(3),
        specVersion: 26,
        privateKey: privateKeyThrow2Data,
        network: coin.ss58Prefix,
        transactionVersion: 5,
        // era: for blockhash and block number, use curl -H "Content-Type: application/json" -H "Accept: text/plain" https://<polkadot-rpc-url>/transaction/material?noMeta=true
        era: Polkadot.Era(
          blockNumber: $fixnum.Int64(3541050),
          period: $fixnum.Int64(64),
        ),
        balanceCall: Polkadot.Balance(
          transfer: Polkadot.Balance_Transfer(
            toAddress: toAddressStr,
            value: intToBytes(2000000000),
          ),
        ),
      );

      {
        final pubKey = privateKeyThrow2.getPublicKeyEd25519();
        final address = TWAnyAddress.createWithPublicKey(pubKey, coin);
        final addressStr = address.description;
        expect(addressStr, addressThrow2);
      }

      final preimage = helper_encodePayload(coin, input);

      expectHex(
        preimage,
        '05007120f76076bcb0efdf94c7219e116899d0163ea61cb428183d71324eb33b2bce0300943577a5030c001a0000000500000091b171bb158e2d3848fa23a9f1c25182fb8e20313b2c1eb49219da7a70ce90c35d2143bb808626d63ad7e1cda70fa8697059d670a992e82cd440fbb95ea40351',
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://polkadot.subscan.io/extrinsic/0x9fd06208a6023e489147d8d93f0182b0cb7e45a40165247319b87278e08362d8
      expect(
        hex(output.encoded),
        '3502849dca538b7a925b8ea979cc546464a3c5f81d2398a3a272f6f93bdf4803f2f7830073e59cef381aedf56d7af076bafff9857ffc1e3bd7d1d7484176ff5b58b73f1211a518e1ed1fd2ea201bd31869c0798bba4ffe753998c409d098b65d25dff801a5030c0005007120f76076bcb0efdf94c7219e116899d0163ea61cb428183d71324eb33b2bce0300943577',
      );
    });
  });
}
