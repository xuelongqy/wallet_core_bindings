import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Polkadot.pb.dart' as Polkadot;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerAcala', () {
    test('Sign', () {
      // Successfully broadcasted: https://acala.subscan.io/extrinsic/3893620-3
      const coin = TWCoinType.Polkadot;
      final secret = TWData.createWithHexString(
              '9066aa168c379a403becb235c15e7129c133c244e56a757ab07bc369288bcab0')
          .bytes()!;

      final genesisHash = TWData.createWithHexString(
              'fc41b9bd8ef8fe53d58c7ea67c794c7ec9a73daf05e6d54b14ff6342c99ba64c')
          .bytes()!;
      final blockHash = TWData.createWithHexString(
              '707ffa05b7dc6cdb6356bd8bd51ff20b2757c3214a76277516080a10f1bc7537')
          .bytes()!;

      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: blockHash,
        nonce: $fixnum.Int64(0),
        specVersion: 2270,
        privateKey: secret,
        network: 10, // Acala
        transactionVersion: 2,
        multiAddress: true,
        era: Polkadot.Era(
          blockNumber: $fixnum.Int64(3893613),
          period: $fixnum.Int64(64),
        ),
        balanceCall: Polkadot.Balance(
          transfer: Polkadot.Balance_Transfer(
            toAddress: '25Qqz3ARAvnZbahGZUzV3xpP1bB3eRrupEprK7f2FNbHbvsz',
            value: bigIntStringToBytes('1000000000000'),
            callIndices: Polkadot.CallIndices(
              custom: Polkadot.CustomCallIndices(
                moduleIndex: 0x0a,
                methodIndex: 0x00,
              ),
            ),
          ),
        ),
      );

      final txInputData = input.writeToBuffer();

      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHashData = Uint8List.fromList(preSigningOutput.dataHash);
      expectHex(
        preImageHashData,
        "0a0000c8c602ded977c56076ae38d98026fa669ca10d6a2b5a0bfc4086ae7668ed1c60070010a5d4e8d502000000de08000002000000fc41b9bd8ef8fe53d58c7ea67c794c7ec9a73daf05e6d54b14ff6342c99ba64c707ffa05b7dc6cdb6356bd8bd51ff20b2757c3214a76277516080a10f1bc753700",
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(
        output.encoded,
        "45028400e9590e4d99264a14a85e21e69537e4a64f66a875d38cb8f76b305f41fabe24a900a9c3111fb98507f929e4da9aea30f996c69d2790e5a1e789f91634dc5d4f6afb155e0f1ea623498c04778f06dbc698109c3490c3e6b4c33d8e58ebab82a0f40bd5020000000a0000c8c602ded977c56076ae38d98026fa669ca10d6a2b5a0bfc4086ae7668ed1c60070010a5d4e8",
      );
    });
  });
}
