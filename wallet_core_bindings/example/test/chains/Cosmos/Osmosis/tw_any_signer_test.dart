import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

const Address1 = "cro1ctwtcwpgksky988dhth6jslxveumgu0d45zgf0";
const Address2 = "cro1xpahy6c7wldxacv6ld99h435mhvfnsup24vcus";
const PrivateKey1 =
    "200e439e39cf1aad465ee3de6166247f914cbc0f823fc2dd48bf16dcd556f39d";

void main() {
  initTest();
  group('TWAnySignerOsmosis', () {
    const coin = TWCoinType.Osmosis;

    test('Sign', () {
      final privateKey = parse_hex(
          "8bbec3772ddb4df68f3186440380c301af116d1422001c1877d6f5e4dba8c8af");

      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(124703),
        chainId: 'osmosis-1',
        memo: '',
        sequence: $fixnum.Int64(0),
        privateKey: privateKey,
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: 'osmo1mky69cn8ektwy0845vec9upsdphktxt0en97f5',
              toAddress: 'osmo18s0hdnsllgcclweu9aymw4ngktr2k0rkvn7jmn',
              amounts: [
                Cosmos.Amount(
                  denom: 'uosmo',
                  amount: '99800',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(200000),
          amounts: [
            Cosmos.Amount(
              denom: 'uosmo',
              amount: '200',
            ),
          ],
        ),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://www.mintscan.io/osmosis/txs/81B4F01BDE72AF7FF4536E5D7E66EB218E9FC9ACAA7C5EB5DB237DD0595D5F5F
      expectJson(output.serialized,
          "{\"tx_bytes\":\"Co0BCooBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEmoKK29zbW8xbWt5Njljbjhla3R3eTA4NDV2ZWM5dXBzZHBoa3R4dDBlbjk3ZjUSK29zbW8xOHMwaGRuc2xsZ2NjbHdldTlheW13NG5na3RyMmswcmt2bjdqbW4aDgoFdW9zbW8SBTk5ODAwEmQKTgpGCh8vY29zbW9zLmNyeXB0by5zZWNwMjU2azEuUHViS2V5EiMKIQLs71zkN6MCxn+VRo3ksx826RH0Z9fmpStBweE+HVY2SRIECgIIARISCgwKBXVvc21vEgMyMDAQwJoMGkAMY//Md5GRUR4lVZhk558hFS3kii9QZYoYKfg4+ac/xgNeyoiEweVDhcmEvlH1orVwjLUOnYs4ly2a/yIurYVj\",\"mode\":\"BROADCAST_MODE_BLOCK\"}");
      expectHex(output.signature,
          '0c63ffcc779191511e25559864e79f21152de48a2f50658a1829f838f9a73fc6035eca8884c1e54385c984be51f5a2b5708cb50e9d8b38972d9aff222ead8563');
      expect(output.json, '');
    });
  });
}
