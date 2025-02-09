import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/MultiversX.pb.dart' as MultiversX;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';
import 'address_test.dart';

void main() {
  initTest();
  const coin = TWCoinType.MultiversX;

  group('MultiversXSigner', () {
    test('SignGenericAction', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          value: '0',
          data: 'foo',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(54500),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "61362540ad012ebff8436aa7fed7567639e7ef3150434b880975d844fde8cbb4e637e5537cb895ba2d0b12014ada866080b379dd96e2a7c150818a9956fb7b00";
      const expected = '''
        {
          "chainID":"1",
          "data":"Zm9v",
          "gasLimit":54500,
          "gasPrice":1000000000,
          "nonce":7,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"61362540ad012ebff8436aa7fed7567639e7ef3150434b880975d844fde8cbb4e637e5537cb895ba2d0b12014ada866080b379dd96e2a7c150818a9956fb7b00",
          "value":"0",
          "version":1
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignGenericActionUnDelegate', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(6),
            sender:
                'erd1aajqh5xjka5fk0c235dwy7qd6lkz2e29tlhy8gncuq0mcr68q34qgswnqa',
            receiver:
                'erd1qqqqqqqqqqqqqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqfhllllscrt56r',
          ),
          value: '0',
          data: 'unDelegate@${hex(bigIntStringToBytes('1000000000000000000'))}',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(12000000),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "89f9683af92f7b835bff4e1d0dbfcff5245b3367df4d23538eb799e0ad0a90be29ac3bd3598ce55b35b35ebef68bfa5738eed39fd01adc33476f65bd1b966e0b";
      const expected = '''
        {
          "chainID":"1",
          "data":"dW5EZWxlZ2F0ZUAwZGUwYjZiM2E3NjQwMDAw",
          "gasLimit":12000000,
          "gasPrice":1000000000,
          "nonce":6,
          "receiver":"erd1qqqqqqqqqqqqqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqfhllllscrt56r",
          "sender":"erd1aajqh5xjka5fk0c235dwy7qd6lkz2e29tlhy8gncuq0mcr68q34qgswnqa",
          "signature":"89f9683af92f7b835bff4e1d0dbfcff5245b3367df4d23538eb799e0ad0a90be29ac3bd3598ce55b35b35ebef68bfa5738eed39fd01adc33476f65bd1b966e0b",
          "value":"0",
          "version":1
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignGenericActionRedelegateRewards', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender:
                'erd1aajqh5xjka5fk0c235dwy7qd6lkz2e29tlhy8gncuq0mcr68q34qgswnqa',
            receiver:
                'erd1qqqqqqqqqqqqqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqfhllllscrt56r',
          ),
          value: '0',
          data: 'reDelegateRewards',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(12000000),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "fc0238d41e4d02a24ac8a502cc3d59e406258b5c186c883e2e9aeffa859a818f5317bf22c9bc6d3838c64529953a46c1d4aabc485f96675a4c4dd642f5f50402";
      const expected = '''
        {
          "chainID":"1",
          "data":"cmVEZWxlZ2F0ZVJld2FyZHM=",
          "gasLimit":12000000,
          "gasPrice":1000000000,
          "nonce":7,
          "receiver":"erd1qqqqqqqqqqqqqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqfhllllscrt56r",
          "sender":"erd1aajqh5xjka5fk0c235dwy7qd6lkz2e29tlhy8gncuq0mcr68q34qgswnqa",
          "signature":"fc0238d41e4d02a24ac8a502cc3d59e406258b5c186c883e2e9aeffa859a818f5317bf22c9bc6d3838c64529953a46c1d4aabc485f96675a4c4dd642f5f50402",
          "value":"0",
          "version":1
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignGenericActionClaimRewards', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender:
                'erd1aajqh5xjka5fk0c235dwy7qd6lkz2e29tlhy8gncuq0mcr68q34qgswnqa',
            receiver:
                'erd1qqqqqqqqqqqqqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqfhllllscrt56r',
          ),
          value: '0',
          data: 'claimRewards',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(6000000),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "c453652214d428045721ad5560194a699ce4194ba7edcbdc1c4f5d1e9a605b82bb0a0fd7dba708322b62518d5d5af3e7380efab0804ac00cdafe7598e7498900";
      const expected = '''
        {
          "chainID":"1",
          "data":"Y2xhaW1SZXdhcmRz",
          "gasLimit":6000000,
          "gasPrice":1000000000,
          "nonce":7,
          "receiver":"erd1qqqqqqqqqqqqqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqfhllllscrt56r",
          "sender":"erd1aajqh5xjka5fk0c235dwy7qd6lkz2e29tlhy8gncuq0mcr68q34qgswnqa",
          "signature":"c453652214d428045721ad5560194a699ce4194ba7edcbdc1c4f5d1e9a605b82bb0a0fd7dba708322b62518d5d5af3e7380efab0804ac00cdafe7598e7498900",
          "value":"0",
          "version":1
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
      // Need to wait 9 days for broadcasting
    });

    test('SignGenericActionWithdrawStake', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender:
                'erd1aajqh5xjka5fk0c235dwy7qd6lkz2e29tlhy8gncuq0mcr68q34qgswnqa',
            receiver:
                'erd1qqqqqqqqqqqqqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqfhllllscrt56r',
          ),
          value: '0',
          data: 'withdraw',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(12000000),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "a2a17498e78e29082c433c009895bd949fc68b2222620d8f5350f821350cde390c15ffe00df4f0e84a074abd892331b79503bf458a35cb90333d1350553d9302";
      const expected = '''
        {
          "chainID":"1",
          "data":"d2l0aGRyYXc=",
          "gasLimit":12000000,
          "gasPrice":1000000000,
          "nonce":7,
          "receiver":"erd1qqqqqqqqqqqqqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqfhllllscrt56r",
          "sender":"erd1aajqh5xjka5fk0c235dwy7qd6lkz2e29tlhy8gncuq0mcr68q34qgswnqa",
          "signature":"a2a17498e78e29082c433c009895bd949fc68b2222620d8f5350f821350cde390c15ffe00df4f0e84a074abd892331b79503bf458a35cb90333d1350553d9302",
          "value":"0",
          "version":1
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
      // Need to wait 9 days for broadcasting
    });

    test('SignGenericActionDelegate', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(1),
            sender:
                'erd1aajqh5xjka5fk0c235dwy7qd6lkz2e29tlhy8gncuq0mcr68q34qgswnqa',
            receiver:
                'erd1qqqqqqqqqqqqqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqfhllllscrt56r',
          ),
          value: '1',
          data: 'delegate',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(12000000),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "3b9164d47a4e3c0330ae387cd29ba6391f9295acf5e43a16a4a2611645e66e5fa46bf22294ca68fe1948adf45cec8cb47b8792afcdb248bd9adec7c6e6c27108";
      const expected = '''
        {
          "chainID":"1",
          "data":"ZGVsZWdhdGU=",
          "gasLimit":12000000,
          "gasPrice":1000000000,
          "nonce":1,
          "receiver":"erd1qqqqqqqqqqqqqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqfhllllscrt56r",
          "sender":"erd1aajqh5xjka5fk0c235dwy7qd6lkz2e29tlhy8gncuq0mcr68q34qgswnqa",
          "signature":"3b9164d47a4e3c0330ae387cd29ba6391f9295acf5e43a16a4a2611645e66e5fa46bf22294ca68fe1948adf45cec8cb47b8792afcdb248bd9adec7c6e6c27108",
          "value":"1",
          "version":1
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
      // Successfully broadcasted https://explorer.multiversx.com/transactions/e5007662780f8ed677b37b156007c24bf60b7366000f66ec3525cfa16a4564e7
    });

    test('SignGenericActionJSON', () {
      // Shuffle some fields, assume arbitrary order in the input
      const input = '''
        {
            "genericAction" : {
                "accounts": {
                    "senderNonce": 7,
                    "receiver": "erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
                    "sender": "erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th"
                },
                "data": "foo",
                "value": "0",
                "version": 1
            }, 
            "gasPrice": 1000000000,
            "gasLimit": 54500,
            "chainId": "1"
        }
      ''';

      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final encoded = TWAnySigner.signJSON(
        json: input,
        key: privateKey.data,
        coin: coin,
      );
      const expected = '''
        {
          "chainID":"1",
          "data":"Zm9v",
          "gasLimit":54500,
          "gasPrice":1000000000,
          "nonce":7,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"61362540ad012ebff8436aa7fed7567639e7ef3150434b880975d844fde8cbb4e637e5537cb895ba2d0b12014ada866080b379dd96e2a7c150818a9956fb7b00",
          "value":"0",
          "version":1
        }
      ''';

      expectJson(encoded, expected);
    });

    test('SignWithoutData', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(0),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          value: '0',
          data: '',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(50000),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "c7253b821c68011584ebd3a5bb050ade19235c2d10260e411e523105826c40a79849b3eeb96fcc2a7a6b1fa140b6756f50b249e005be056ce0cf53125e0b1b00";
      const expected = '''
        {
          "chainID":"1",
          "gasLimit":50000,
          "gasPrice":1000000000,
          "nonce":0,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"c7253b821c68011584ebd3a5bb050ade19235c2d10260e411e523105826c40a79849b3eeb96fcc2a7a6b1fa140b6756f50b249e005be056ce0cf53125e0b1b00",
          "value":"0",
          "version":1
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignJSONWithoutData', () {
      // Shuffle some fields, assume arbitrary order in the input
      const input = '''
        {
            "genericAction" : {
                "accounts": {
                    "senderNonce": 0,
                    "receiver": "erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
                    "sender": "erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th"
                }, 
                "value": "0",
                "version": 1
            },
            "gasPrice": 1000000000,
            "gasLimit": 50000,
            "chainId": "1"
        }
      ''';

      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final encoded = TWAnySigner.signJSON(
        json: input,
        key: privateKey.data,
        coin: coin,
      );
      const expected = '''
        {
          "chainID":"1",
          "gasLimit":50000,
          "gasPrice":1000000000,
          "nonce":0,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"c7253b821c68011584ebd3a5bb050ade19235c2d10260e411e523105826c40a79849b3eeb96fcc2a7a6b1fa140b6756f50b249e005be056ce0cf53125e0b1b00",
          "value":"0",
          "version":1
        }
      ''';

      expectJson(encoded, expected);
    });

    test('SignWithUsernames', () {
      // https://github.com/multiversx/mx-chain-go/blob/master/examples/construction_test.go, scenario "TestConstructTransaction_Usernames".

      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(89),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
            senderUsername: 'alice',
            receiverUsername: 'bob',
          ),
          value: '0',
          data: '',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(50000),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "dfffb303eee7a6df0a027171feffde001637e59164a8b8c61d387da7fcefccd08d90f7b0e6fd0b4bc7357517edc5b6ea4a5088e0fb0be314e7e597e5248a8a03";
      const expected = '''
        {
          "chainID":"1",
          "gasLimit":50000,
          "gasPrice":1000000000,
          "nonce":89,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "receiverUsername": "Ym9i",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "senderUsername": "YWxpY2U=",
          "signature":"dfffb303eee7a6df0a027171feffde001637e59164a8b8c61d387da7fcefccd08d90f7b0e6fd0b4bc7357517edc5b6ea4a5088e0fb0be314e7e597e5248a8a03",
          "value":"0",
          "version":1
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignWithOptions', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(89),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          value: '0',
          data: '',
          version: 2,
          // We'll set a dummy value on the "options" field (merely an example).
          // Currently, the "options" field should be ignored (not set) by applications using TW Core.
          options: 42,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(50000),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "ea478652417dc319c3e898d7f99f3a7b04fd32b62a7d43d5d6822a6a46b9346853426ac2ad5cdc710f0f3c5a6f509b21195e712ed9b3c95f454c7ed85079cb0b";
      const expected = '''
        {
          "chainID":"1",
          "gasLimit":50000,
          "gasPrice":1000000000,
          "nonce":89,
          "options": 42,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"ea478652417dc319c3e898d7f99f3a7b04fd32b62a7d43d5d6822a6a46b9346853426ac2ad5cdc710f0f3c5a6f509b21195e712ed9b3c95f454c7ed85079cb0b",
          "value":"0",
          "version":2
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignEGLDTransfer', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        egldTransfer: MultiversX.EGLDTransfer(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          amount: '1000000000000000000',
        ),
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "0f40dec9d37bde3c67803fc535088e536344e271807bb7c1aa24af3c69bffa9b705e149ff7bcaf21678f4900c4ee72741fa6ef08bf4c67fc6da1c6b0f337730e";
      const expected = '''
        {
          "chainID":"1",
          "gasLimit":50000,
          "gasPrice":1000000000,
          "nonce":7,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"0f40dec9d37bde3c67803fc535088e536344e271807bb7c1aa24af3c69bffa9b705e149ff7bcaf21678f4900c4ee72741fa6ef08bf4c67fc6da1c6b0f337730e",
          "value":"1000000000000000000",
          "version":2
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignESDTTransfer', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        esdtTransfer: MultiversX.ESDTTransfer(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          tokenIdentifier: 'MYTOKEN-1234',
          amount: '10000000000000',
        ),
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "dd7cdc90aa09da6034b00a99e3ba0f1a2a38fa788fad018d53bf2e706f99e1a42c80063c28e6b48a5f2574c4054986f34c8eb36b1da63a22d19cf3ea5990b306";

      // "ESDTTransfer@4d59544f4b454e2d31323334@09184e72a000"
      const expected = '''
        {
          "chainID":"1",
          "data":"RVNEVFRyYW5zZmVyQDRkNTk1NDRmNGI0NTRlMmQzMTMyMzMzNEAwOTE4NGU3MmEwMDA=",
          "gasLimit":425000,
          "gasPrice":1000000000,
          "nonce":7,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"dd7cdc90aa09da6034b00a99e3ba0f1a2a38fa788fad018d53bf2e706f99e1a42c80063c28e6b48a5f2574c4054986f34c8eb36b1da63a22d19cf3ea5990b306",
          "value":"0",
          "version":2
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignESDTNFTTransfer', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        esdtnftTransfer: MultiversX.ESDTNFTTransfer(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          tokenCollection: 'LKMEX-aab910',
          tokenNonce: $fixnum.Int64(4),
          amount: '184300000000000000',
        ),
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "59af89d9a9ece1f35bc34323c42061cae27bb5f9830f5eb26772e680732cbd901a86caa7c3eadacd392fe1024bef4c1f08ce1dfcafec257d6f41444ccea30a0c";

      // "ESDTNFTTransfer@4c4b4d45582d616162393130@04@028ec3dfa01ac000@8049d639e5a6980d1cd2392abcce41029cda74a1563523a202f09641cc2618f8"
      const expected = '''
        {
          "chainID":"1",
          "data":"RVNEVE5GVFRyYW5zZmVyQDRjNGI0ZDQ1NTgyZDYxNjE2MjM5MzEzMEAwNEAwMjhlYzNkZmEwMWFjMDAwQDgwNDlkNjM5ZTVhNjk4MGQxY2QyMzkyYWJjY2U0MTAyOWNkYTc0YTE1NjM1MjNhMjAyZjA5NjQxY2MyNjE4Zjg=",
          "gasLimit":937500,
          "gasPrice":1000000000,
          "nonce":7,
          "receiver":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"59af89d9a9ece1f35bc34323c42061cae27bb5f9830f5eb26772e680732cbd901a86caa7c3eadacd392fe1024bef4c1f08ce1dfcafec257d6f41444ccea30a0c",
          "value":"0",
          "version":2
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignWithUsernames', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(42),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
            guardian: CAROL_BECH32,
          ),
          value: '1000000000000000000',
          data: '',
          version: 2,
          options: 2,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(100000),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "dae30e5cddb4a1f050009f939ce2c90843770870f9e6c77366be07e5cd7b3ebfdda38cd45d04e9070037d57761b6a68cee697e6043057f9dc565a4d0e632480d";
      const expected = '''
        {
          "chainID":"1",
          "gasLimit":100000,
          "gasPrice":1000000000,
          "guardian":"erd1k2s324ww2g0yj38qn2ch2jwctdy8mnfxep94q9arncc6xecg3xaq6mjse8",
          "nonce":42,
          "options":2,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"dae30e5cddb4a1f050009f939ce2c90843770870f9e6c77366be07e5cd7b3ebfdda38cd45d04e9070037d57761b6a68cee697e6043057f9dc565a4d0e632480d",
          "value":"1000000000000000000",
          "version":2
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignEGLDTransferWithGuardian', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        egldTransfer: MultiversX.EGLDTransfer(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
            guardian: CAROL_BECH32,
          ),
          amount: '1000000000000000000',
        ),
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "741dd0d24db4df37a050f693f8481b6e51b8dd6dfc2f01a4f90aa1af3e59c89a8b0ef9d710af33103970e353d9f0cb9fd128a2e174731cbc88265d9737ed5604";
      const expected = '''
        {
          "chainID":"1",
          "gasLimit":100000,
          "gasPrice":1000000000,
          "guardian":"erd1k2s324ww2g0yj38qn2ch2jwctdy8mnfxep94q9arncc6xecg3xaq6mjse8",
          "nonce":7,
          "options":2,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"741dd0d24db4df37a050f693f8481b6e51b8dd6dfc2f01a4f90aa1af3e59c89a8b0ef9d710af33103970e353d9f0cb9fd128a2e174731cbc88265d9737ed5604",
          "value":"1000000000000000000",
          "version":2
        }
      ''';
      expectJson(expected, encoded);
      expect(expectedSignature, signature);
    });

    test('SignGenericActionWithRelayer', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(42),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
            relayer: CAROL_BECH32,
          ),
          value: '1000000000000000000',
          data: '',
          version: 2,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(100000),
        chainId: '1',
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "f0137ce0303a33814691975598dab3b82bb91b017aa251640a48827edc48048aa0f916dd3e7915dd3be27db3304fc238a719123b6ae2285731ab24b794665003";
      const expected = '''
        {
         "chainID":"1",
         "gasLimit":100000,
         "gasPrice":1000000000,
         "relayer":"erd1k2s324ww2g0yj38qn2ch2jwctdy8mnfxep94q9arncc6xecg3xaq6mjse8",
         "nonce":42,
         "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
         "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
         "signature":"f0137ce0303a33814691975598dab3b82bb91b017aa251640a48827edc48048aa0f916dd3e7915dd3be27db3304fc238a719123b6ae2285731ab24b794665003",
         "value":"1000000000000000000",
         "version":2
        }
      ''';
      expect(expectedSignature, signature);
      expectJson(expected, encoded);
    });

    test('SignEGLDTransferWithRelayer', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        egldTransfer: MultiversX.EGLDTransfer(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
            relayer: CAROL_BECH32,
          ),
          amount: '1000000000000000000',
        ),
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      final signature = output.signature;
      final encoded = output.encoded;
      const expectedSignature =
          "c86491a51d553889df9fb7ff75880843e2b21aec97ae3e4004b70801a5494a8958af8daf56906f9720b0af6a25ad2ab82b3af05940fb6dfe0dea529f1bf8d90f";
      const expected = '''
        {
          "chainID":"1",
          "gasLimit":100000,
          "gasPrice":1000000000,
          "relayer":"erd1k2s324ww2g0yj38qn2ch2jwctdy8mnfxep94q9arncc6xecg3xaq6mjse8",
          "nonce":7,
          "receiver":"erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx",
          "sender":"erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th",
          "signature":"c86491a51d553889df9fb7ff75880843e2b21aec97ae3e4004b70801a5494a8958af8daf56906f9720b0af6a25ad2ab82b3af05940fb6dfe0dea529f1bf8d90f",
          "value":"1000000000000000000",
          "version":2
        }
      ''';
      expect(expectedSignature, signature);
      expectJson(expected, encoded);
    });

    test('buildUnsignedTxBytes', () {
      final input = MultiversX.SigningInput(
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          value: '0',
          data: 'foo',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(50000),
        chainId: '1',
      );

      final txInputData = input.writeToBuffer();
      final preImageHashes = TWTransactionCompiler.preImageHashes(
        coin,
        txInputData,
      );
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      final unsignedTxBytes = preSigningOutput.data;
      const expectedData = '''
      {
        "nonce": 7,
        "value": "0",
        "receiver": "$BOB_BECH32",
        "sender": "$ALICE_BECH32",
        "gasPrice": 1000000000,
        "gasLimit": 50000,
        "data": "Zm9v",
        "chainID": "1",
        "version": 1
      }
      ''';

      expectJson(expectedData, String.fromCharCodes(unsignedTxBytes));
    });

    test('buildSigningOutput', () {
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final input = MultiversX.SigningInput(
        privateKey: privateKey.data,
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(7),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          value: '0',
          data: 'foo',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(50000),
        chainId: '1',
      );

      final txInputData = input.writeToBuffer();
      final preImageHashes = TWTransactionCompiler.preImageHashes(
        coin,
        txInputData,
      );
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      final unsignedTxBytes = preSigningOutput.data;
      final signature = privateKey.sign(
        Uint8List.fromList(unsignedTxBytes),
        TWCurve.ED25519,
      );

      final output = MultiversX.SigningOutput.fromBuffer(
          TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [privateKey.getPublicKeyEd25519().data],
      ));
      const expectedSignatureHex =
          "e8647dae8b16e034d518a1a860c6a6c38d16192d0f1362833e62424f424e5da660770dff45f4b951d9cc58bfb9d14559c977d443449bfc4b8783ff9c84065700";
      expect(expectedSignatureHex, hex(signature));
      const expectedEncoded = '''
      {
        "nonce": 7,
        "value": "0",
        "receiver": "$BOB_BECH32",
        "sender": "$ALICE_BECH32",
        "gasPrice": 1000000000,
        "gasLimit": 50000,
        "data": "Zm9v",
        "chainID": "1",
        "version": 1,
        "signature": "$expectedSignatureHex"
      }
      ''';
      expect(output.signature, expectedSignatureHex);
      expectJson(output.encoded, expectedEncoded);
    });
  });
}
