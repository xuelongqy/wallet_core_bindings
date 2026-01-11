import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/MultiversX.pb.dart' as MultiversX;

import '../../utils.dart';
import 'address_test.dart';

void main() {
  initTest();
  const coin = TWCoinType.MultiversX;

  group('TWAnySignerMultiversX', () {
    test('Sign', () {
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

    test('SignJSON', () {
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
  });
}
