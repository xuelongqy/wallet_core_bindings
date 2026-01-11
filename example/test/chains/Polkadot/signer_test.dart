import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Polkadot.pb.dart' as Polkadot;

import '../../utils.dart';

void main() async {
  await initWalletCoreImpl();
  final privateKey = TWPrivateKey.createWithData(parse_hex(
      "0xabf8e5bdbe30c65656c0a3cbd181ff8a56294a69dfedd27982aace4a76909115"));
  final privateKeyIOS = TWPrivateKey.createWithData(parse_hex(
      "37932b086586a6675e66e562fe68bd3eeea4177d066619c602fe3efc290ada62"));
  final privateKeyThrow2 = TWPrivateKey.createWithData(parse_hex(
      "70a794d4f1019c3ce002f33062f45029c4f930a56b3d20ec477f7668c6bbc37f"));
  final privateKeyPolkadot = TWPrivateKey.createWithData(parse_hex(
      "298fcced2b497ed48367261d8340f647b3fca2d9415d57c2e3c5ef90482a2266"));
  const addressThrow2 = "14Ztd3KJDaB9xyJtRkREtSZDdhLSbm7UUKt8Z7AwSv7q85G2";
  final toPublicKey = TWPublicKey.createWithData(
      parse_hex(
          "0x8eaf04151687736326c9fea17e25fc5287613693c912909cb226aa4794f26a48"),
      TWPublicKeyType.ED25519);
  final genesisHash = parse_hex(
      "91b171bb158e2d3848fa23a9f1c25182fb8e20313b2c1eb49219da7a70ce90c3");
  const controller1 = "14xKzzU1ZYDnzFj7FgdtDAYSMJNARjDc2gNw4XAFDgr4uXgp";

  group('PolkadotSigner', () {
    const coin = TWCoinType.Polkadot;

    test('SignTransfer_9fd062', () {
      const toAddress = '13ZLCqJNPsRZYEbwjtZZFpWt9GyFzg5WahXCVWKpWdUJqrQ5';

      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: parse_hex(
            "0x5d2143bb808626d63ad7e1cda70fa8697059d670a992e82cd440fbb95ea40351"),
        nonce: $fixnum.Int64(3),
        specVersion: 26,
      );
      {
        final publicKey =
            privateKeyThrow2.getPublicKeyByType(TWPublicKeyType.ED25519);
        final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
        expect(address.description, addressThrow2);
      }
      input.privateKey = privateKeyThrow2.data;
      input.network = coin.ss58Prefix;
      input.transactionVersion = 5;

      // era: for blockhash and block number, use curl -H "Content-Type: application/json" -H "Accept: text/plain" https://<polkadot-rpc-url>/transaction/material?noMeta=true
      input.era = Polkadot.Era(
        blockNumber: $fixnum.Int64(3541050),
        period: $fixnum.Int64(64),
      );

      input.balanceCall = Polkadot.Balance(
        transfer: Polkadot.Balance_Transfer(
          value: intToBytes(2000000000),
          toAddress: toAddress,
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      // https://polkadot.subscan.io/extrinsic/0x9fd06208a6023e489147d8d93f0182b0cb7e45a40165247319b87278e08362d8
      expect(
        hex(output.encoded),
        '3502849dca538b7a925b8ea979cc546464a3c5f81d2398a3a272f6f93bdf4803f2f7830073e59cef381aedf56d7af076bafff9857ffc1e3bd7d1d7484176ff5b58b73f1211a518e1ed1fd2ea201bd31869c0798bba4ffe753998c409d098b65d25dff801a5030c0005007120f76076bcb0efdf94c7219e116899d0163ea61cb428183d71324eb33b2bce0300943577',
      );
    });

    // test('SignTransferDOT', () {
    //   final blockHash = parse_hex(
    //       "0x343a3f4258fd92f5ca6ca5abdf473d86a78b0bcd0dc09c568ca594245cc8c642");
    //   final toAddress =
    //       TWAnyAddress.createWithPublicKey(toPublicKey, coin).description;
    //
    //   final input = Polkadot.SigningInput(
    //     genesisHash: genesisHash,
    //     blockHash: blockHash,
    //     nonce: $fixnum.Int64(0),
    //     specVersion: 17,
    //     privateKey: privateKey.data,
    //     network: coin.ss58Prefix,
    //     transactionVersion: 3,
    //   );
    //
    //   input.era = Polkadot.Era(
    //     blockNumber: $fixnum.Int64(927699),
    //     period: $fixnum.Int64(8),
    //   );
    //
    //   input.balanceCall = Polkadot.Balance(
    //     transfer: Polkadot.Balance_Transfer(
    //       value: intToBytes(12345),
    //       toAddress: toAddress,
    //     ),
    //   );
    //
    //   final output = Polkadot.SigningOutput.fromBuffer(
    //       TWAnySigner.sign(input.writeToBuffer(), coin));
    //
    //   expect(
    //     hex(output.encoded),
    //     '29028488dc3417d5058ec4b4503e0c12ea1a0a89be200fe98922423d4334014fa6b0ee003d91a06263956d8ce3ce5c55455baefff299d9cb2bb3f76866b6828ee4083770b6c03b05d7b6eb510ac78d047002c1fe5c6ee4b37c9c5a8b09ea07677f12e50d3200000005008eaf04151687736326c9fea17e25fc5287613693c912909cb226aa4794f26a48e5c0',
    //   );
    // });

    test('SignTransfer_72dd5b', () {
      final blockHash = parse_hex(
          "7d5fa17b70251d0806f26156b1b698dfd09e040642fa092595ce0a78e9e84fcd");

      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: blockHash,
        nonce: $fixnum.Int64(1),
        specVersion: 28,
        privateKey: privateKeyIOS.data,
        network: coin.ss58Prefix,
        transactionVersion: 6,
      );

      input.era = Polkadot.Era(
        blockNumber: $fixnum.Int64(3910736),
        period: $fixnum.Int64(64),
      );

      input.balanceCall = Polkadot.Balance(
        transfer: Polkadot.Balance_Transfer(
          value: intToBytes(10000000000),
          toAddress: '13ZLCqJNPsRZYEbwjtZZFpWt9GyFzg5WahXCVWKpWdUJqrQ5',
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.encoded),
        '410284008d96660f14babe708b5e61853c9f5929bc90dd9874485bf4d6dc32d3e6f22eaa0038ec4973ab9773dfcbf170b8d27d36d89b85c3145e038d68914de83cf1f7aca24af64c55ec51ba9f45c5a4d74a9917dee380e9171108921c3e5546e05be15206050104000500007120f76076bcb0efdf94c7219e116899d0163ea61cb428183d71324eb33b2bce0700e40b5402',
      );
    });

    test('SignBond_8da66d', () {
      final blockHash = parse_hex(
          "0xf1eee612825f29abd3299b486e401299df2faa55b7ce1e34bf2243bd591905fc");

      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: blockHash,
        nonce: $fixnum.Int64(0),
        specVersion: 26,
      );
      {
        final publicKey =
            privateKeyThrow2.getPublicKeyByType(TWPublicKeyType.ED25519);
        final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
        expect(address.description, addressThrow2);
      }
      input.privateKey = privateKeyThrow2.data;
      input.network = coin.ss58Prefix;
      input.transactionVersion = 5;

      // era: for blockhash and block number, use curl -H "Content-Type: application/json" -H "Accept: text/plain" https://<polkadot-rpc-url>/transaction/material?noMeta=true
      input.era = Polkadot.Era(
        blockNumber: $fixnum.Int64(3540912),
        period: $fixnum.Int64(64),
      );

      input.stakingCall = Polkadot.Staking(
        bond: Polkadot.Staking_Bond(
          value: intToBytes(11000000000), // 1.1
          controller: addressThrow2, // myself
          rewardDestination: Polkadot.RewardDestination.STASH,
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      // https://polkadot.subscan.io/extrinsic/0x8da66d3fe0f592cff714ec107289370365117a1abdb72a19ac91181fdcf62bba
      expect(
        hex(output.encoded),
        '3d02849dca538b7a925b8ea979cc546464a3c5f81d2398a3a272f6f93bdf4803f2f783009025843bc49c1c4fbc99dbbd290c92f9879665d55b02f110abfb4800f0e7630877d2cffd853deae7466c22fbc8616a609e1b92615bb365ea8adccba5ef7624050503000007009dca538b7a925b8ea979cc546464a3c5f81d2398a3a272f6f93bdf4803f2f7830700aea68f0201',
      );
    });

    test('SignBondAndNominate_4955314_2', () {
      final key = parse_hex(
          "7f44b19b391a8015ca4c7d94097b3695867a448d1391e7f3243f06987bdb6858");
      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: genesisHash,
        nonce: $fixnum.Int64(4),
        specVersion: 30,
        privateKey: key,
        network: coin.ss58Prefix,
        transactionVersion: 7,
      );

      input.stakingCall = Polkadot.Staking(
        bondAndNominate: Polkadot.Staking_BondAndNominate(
          value: intToBytes(10000000000), // 1 DOT
          controller: '13ZLCqJNPsRZYEbwjtZZFpWt9GyFzg5WahXCVWKpWdUJqrQ5',
          rewardDestination: Polkadot.RewardDestination.STASH,
          nominators: [
            '1zugcavYA9yCuYwiEYeMHNJm9gXznYjNfXQjZsZukF1Mpow',
            '15oKi7HoBQbwwdQc47k71q4sJJWnu5opn1pqoGx4NAEYZSHs',
          ],
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      // https://polkadot.subscan.io/extrinsic/4955314-2
      expect(
        hex(output.encoded),
        '6103840036092fac541e0e5feda19e537c679b487566d7101141c203ac8322c27e5f076a00a8b1f859d788f11a958e98b731358f89cf3fdd41a667ea992522e8d4f46915f4c03a1896f2ac54bdc5f16e2ce8a2a3bf233d02aad8192332afd2113ed6688e0d0010001a02080700007120f76076bcb0efdf94c7219e116899d0163ea61cb428183d71324eb33b2bce0700e40b540201070508002c2a55b5ffdca266bd0207df97565b03255f70783ca1a349be5ed9f44589c36000d44533a4d21fd9d6f5d57c8cd05c61a6f23f9131cec8ae386b6b437db399ec3d',
      );
    });

    test('SignNominate_452522', () {
      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: parse_hex(
            "0x211787d016e39007ac054547737a10542620013e73648b3134541d536cb44e2c"),
        nonce: $fixnum.Int64(1),
        specVersion: 26,
        privateKey: privateKeyThrow2.data,
        network: coin.ss58Prefix,
        transactionVersion: 5,
      );

      // era: for blockhash and block number, use curl -H "Content-Type: application/json" -H "Accept: text/plain" https://<polkadot-rpc-url>/transaction/material?noMeta=true
      input.era = Polkadot.Era(
        blockNumber: $fixnum.Int64(3540945),
        period: $fixnum.Int64(64),
      );

      input.stakingCall = Polkadot.Staking(
        nominate: Polkadot.Staking_Nominate(
          nominators: [
            controller1,
            '1REAJ1k691g5Eqqg9gL7vvZCBG7FCCZ8zgQkZWd4va5ESih',
          ],
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      // https://polkadot.subscan.io/extrinsic/0x4525224b7d8f3e58de3a54a9fbfd071401c2b737f314c972a2bb087a0ff508a6
      expect(
        hex(output.encoded),
        'a502849dca538b7a925b8ea979cc546464a3c5f81d2398a3a272f6f93bdf4803f2f78300d73ff0dc456704743f70173a56e6c13e88a6e1dddb38a23552a066e44fb64e2c9d8a5e9a76afb9489b8540365f668bddd34b7d9c8dbdc4600e6316080e55a30315010400070508aee72821ca00e62304e4f0d858122a65b87c8df4f0eae224ae064b951d39f610127a30e486492921e58f2564b36ab1ca21ff630672f0e76920edd601f8f2b89a',
      );
    });

    test('SignNominate2', () {
      final blockHash = parse_hex(
          "d22a6b2e3e61325050718bd04a14da9efca1f41c9f0a525c375d36106e25af68");

      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: blockHash,
        nonce: $fixnum.Int64(0),
        specVersion: 17,
        privateKey: privateKey.data,
        network: coin.ss58Prefix,
        transactionVersion: 3,
      );

      input.stakingCall = Polkadot.Staking(
        nominate: Polkadot.Staking_Nominate(
          nominators: [
            // payload size larger than 256, will be hashed
            '1zugcabYjgfQdMLC3cAzQ8tJZMo45tMnGpivpAzpxB4CZyK',
            '1REAJ1k691g5Eqqg9gL7vvZCBG7FCCZ8zgQkZWd4va5ESih',
            '1WG3jyNqniQMRZGQUc7QD2kVLT8hkRPGMSqAb5XYQM1UDxN',
            '16QFrtU6kDdBjxY8qEKz5EEfuDkHxqG8pix3wSGKQzRcuWHo',
            '14ShUZUYUR35RBZW6uVVt1zXDxmSQddkeDdXf1JkMA6P721N',
            '15MUBwP6dyVw5CXF9PjSSv7SdXQuDSwjX86v1kBodCSWVR7c',
          ],
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.encoded),
        'a1048488dc3417d5058ec4b4503e0c12ea1a0a89be200fe98922423d4334014fa6b0ee00135bbc68b67fffadaf7e98b6402c4fc60382765f543225083a024b0e0ff8071d4ec4ddd67a65828113cc76f3208765608be010d2fcfdcd47e8fe342872704c000000000705182c2a55b5a116a4c88aff57e8f2b70ba72dda72dda4b78630e16ad0ca69006f18127a30e486492921e58f2564b36ab1ca21ff630672f0e76920edd601f8f2b89a1650c532ed1a8641e8922aa24ade0ff411d03edd9ed1c6b7fe42f1a801cee37ceee9d5d071a418b51c02b456d5f5cefd6231041ad59b0e8379c59c11ba4a2439984e16482c99cfad1436111e321a86d87d0fac203bf64538f888e45d793b5413c08d5de7a5d97bea2c7ddf516d0635bddc43f326ae2f80e2595b49d4a08c4619',
      );
    });

    test('SignChill', () {
      final blockHash = parse_hex(
          "1d4a1ecc8b1c37bf0ba5d3e0bf14ec5402fbb035eeaf6d8042c07ca5f8c57429");

      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: blockHash,
        nonce: $fixnum.Int64(0),
        specVersion: 17,
        privateKey: privateKey.data,
        network: coin.ss58Prefix,
        transactionVersion: 3,
      );

      input.stakingCall = Polkadot.Staking(
        chill: Polkadot.Staking_Chill(),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.encoded),
        '9d018488dc3417d5058ec4b4503e0c12ea1a0a89be200fe98922423d4334014fa6b0ee0088b5e1cd93ba74b82e329f95e1b22660385970182172b2ae280801fdd1ee5652cf7bf319e5e176ccc299dd8eb1e7fccb0ea7717efaf4aacd7640789dd09c1e070000000706',
      );
    });

    test('SignWithdraw', () {
      final blockHash = parse_hex(
          "7b4d1d1e2573eabcc90a3e96058eb0d8d21d7a0b636e8030d152d9179a345dda");

      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: blockHash,
        nonce: $fixnum.Int64(0),
        specVersion: 17,
        privateKey: privateKey.data,
        network: coin.ss58Prefix,
        transactionVersion: 3,
      );

      input.stakingCall = Polkadot.Staking(
        withdrawUnbonded: Polkadot.Staking_WithdrawUnbonded(
          slashingSpans: 10,
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.encoded),
        'ad018488dc3417d5058ec4b4503e0c12ea1a0a89be200fe98922423d4334014fa6b0ee002e49bf0dec9bef01dd3bd25419e2147dc983613d0860108f889f9ff2d062c5e3267e309e2dbc35dd2fc2b877b57d86a5f12cbeb8217485be32be3c34d2507d0e00000007030a000000',
      );
    });

    test('SignUnbond_070957', () {
      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: parse_hex(
            "0x53040c71c6061bd256346b81fcb3545c13b5c34c7cd0c2c25f00aa6e564b16d5"),
        nonce: $fixnum.Int64(2),
        specVersion: 26,
        privateKey: privateKeyThrow2.data,
        network: coin.ss58Prefix,
        transactionVersion: 5,
      );

      input.era = Polkadot.Era(
        blockNumber: $fixnum.Int64(3540983),
        period: $fixnum.Int64(64),
      );

      input.stakingCall = Polkadot.Staking(
        unbond: Polkadot.Staking_Unbond(
          value: intToBytes(4000000000),
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://polkadot.subscan.io/extrinsic/0x070957ab697adbe11f7d72a1314d0a81d272a747d2e6880818073317125f980a
      expect(
        hex(output.encoded),
        'b501849dca538b7a925b8ea979cc546464a3c5f81d2398a3a272f6f93bdf4803f2f783003a762d9dc3f2aba8922c4babf7e6622ca1d74da17ab3f152d8f29b0ffee53c7e5e150915912a9dfd98ef115d272e096543eef9f513207dd606eea97d023a64087503080007020300286bee',
      );
    });

    test('SignChillAndUnbond', () {
      final blockHash = parse_hex(
          "0x35ba668bb19453e8da6334cadcef2a27c8d4141bfc8b49e78e853c3d73e1ecd0");

      final input = Polkadot.SigningInput(
        genesisHash: genesisHash,
        blockHash: blockHash,
        nonce: $fixnum.Int64(6),
        specVersion: 9200,
        privateKey: privateKeyPolkadot.data,
        network: coin.ss58Prefix,
        transactionVersion: 12,
      );

      input.era = Polkadot.Era(
        blockNumber: $fixnum.Int64(10541373),
        period: $fixnum.Int64(64),
      );

      input.stakingCall = Polkadot.Staking(
        chillAndUnbond: Polkadot.Staking_ChillAndUnbond(
          value: intToBytes(100500000000), // 10.05 DOT
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://polkadot.subscan.io/extrinsic/10541383-2
      expect(
        hex(output.encoded),
        'd10184008361bd08ddca5fda28b5e2aa84dc2621de566e23e089e555a42194c3eaf2da7900c891ba102db672e378945d74cf7f399226a76b43cab502436971599255451597fc2599902e4b62c7ce85ecc3f653c693fef3232be620984b5bb5bcecbbd7b209d50318001a02080706070207004d446617',
      );
    });

    test('Kusama_SignBond_NoController', () {
      // tx on mainnet
      // https://kusama.subscan.io/extrinsic/0x4e52e59b63910cbdb8c5430c2d100908934f473363c8994cddfd6d1501b017f5

      final input = Polkadot.SigningInput(
        network: TWCoinType.Kusama.ss58Prefix,
        blockHash: parse_hex(
            "beb02a3ee782f4bd60ffcfc3de473e3c5a00b2cf124dd302c559b0e77b4331eb"),
        genesisHash: parse_hex(
            "b0a8d493285c2df73290dfb7e61f870f17b41801197a149ca93654499ea3dafe"),
        nonce: $fixnum.Int64(3),
        specVersion: 9430,
        transactionVersion: 23,
        privateKey: privateKey.data,
      );

      input.era = Polkadot.Era(
        blockNumber: $fixnum.Int64(18672490),
        period: $fixnum.Int64(64),
      );

      // Ignore `controller` as it was removed from the `Staking::bond` function at `spec_version = 9430`
      // https://kusama.subscan.io/runtime/Staking?version=9430
      input.stakingCall = Polkadot.Staking(
        bond: Polkadot.Staking_Bond(
          value: bigIntStringToBytes('120000000000'), // 0.12
          rewardDestination: Polkadot.RewardDestination.CONTROLLER,
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.encoded),
        'c101840088dc3417d5058ec4b4503e0c12ea1a0a89be200fe98922423d4334014fa6b0ee00bc4d7a166bd1e7e2bfe9b53e81239c9e340d5a326f17c0a3d2768fcc127f20f4f85d888ecb90aa3ed9a0943f8ae8116b9a19747e563c8d8151dfe3b1b5deb40ca5020c0006000700b08ef01b02',
      );
    });

    test('SignTransfer_KusamaNewSpec', () {
      final toAddress = TWAnyAddress.createSS58(
        string: 'DAbYHrSQTULYZsuA1kvH2cQ33oBsCxxSRPM1XkhzGLeJuHG',
        coin: TWCoinType.Kusama,
        ss58Prefix: TWCoinType.Kusama.ss58Prefix,
      );
      final input = Polkadot.SigningInput(
        network: TWCoinType.Kusama.ss58Prefix,
        genesisHash: parse_hex(
            "0xb0a8d493285c2df73290dfb7e61f870f17b41801197a149ca93654499ea3dafe"),
        blockHash: parse_hex(
            "0x0c731c2b7f5332749432eae61cd5a919592965b28181cf9b73b0a1258ea73303"),
        nonce: $fixnum.Int64(150),
        specVersion: 1002005,
        transactionVersion: 26,
        privateKey: privateKeyThrow2.data,
      );
      {
        final publicKey =
            privateKeyThrow2.getPublicKeyByType(TWPublicKeyType.ED25519);
        final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
        expect(address.description, addressThrow2);
      }
      // era: for blockhash and block number, use curl -H "Content-Type: application/json" -H "Accept: text/plain" https://<polkadot-rpc-url>/transaction/material?noMeta=true
      input.era = Polkadot.Era(
        blockNumber: $fixnum.Int64(23610713),
        period: $fixnum.Int64(64),
      );

      input.balanceCall = Polkadot.Balance(
        transfer: Polkadot.Balance_Transfer(
          value: intToBytes(2000000000),
          toAddress: toAddress.description,
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expectHex(output.encoded,
          '450284009dca538b7a925b8ea979cc546464a3c5f81d2398a3a272f6f93bdf4803f2f78300fc5a463d3b6972ac7e0b701110f9d95d377be5b6a2f356765553104c04765fc0066c235c11dabde650d487760dc310003d607abceaf85a0a0f47f1a90e3680029501590200000400001a2447c661c9b168bba4a2a178baef7d79eee006c1d145ffc832be76ff6ee9ce0300943577');
    });
  });
}
