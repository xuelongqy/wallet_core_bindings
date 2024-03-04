import 'dart:convert';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Binance.pb.dart' as Binance;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/WalletConnect.pb.dart'
    as WalletConnect;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('TWWalletConnectSign', () {
    const coin = TWCoinType.TWCoinTypeBinance;

    test('SendOrder', () {
      final private_key = TWData.createWithHexString(
              '95949f757db1f57ca94a5dff23314accbe7abee89597bf6a3c7382c84d7eb832')
          .bytes()!;
      final payload = json.encode({
        "signerAddress": "bnb1grpf0955h0ykzq3ar5nmum7y6gdfl6lxfn46h2",
        "signDoc": {
          "account_number": "19",
          "chain_id": "chain-bnb",
          "memo": "",
          "data": null,
          "msgs": [
            {
              "inputs": [
                {
                  "address": "bnb1grpf0955h0ykzq3ar5nmum7y6gdfl6lxfn46h2",
                  "coins": [
                    {"amount": 1001000000, "denom": "BNB"}
                  ]
                }
              ],
              "outputs": [
                {
                  "address": "bnb13zeh6hs97d5eu2s5qerguhv8ewwue6u4ywa6yf",
                  "coins": [
                    {"amount": 1001000000, "denom": "BNB"}
                  ]
                }
              ]
            }
          ],
          "sequence": "23",
          "source": "1"
        }
      });

      final parsingInput = WalletConnect.ParseRequestInput(
        method: WalletConnect.Method.CosmosSignAmino,
        payload: payload,
      );

      final parsingInputData = parsingInput.writeToBuffer();
      final outputData = TWWalletConnectRequest.parse(coin, parsingInputData);

      final parsingOutput =
          WalletConnect.ParseRequestOutput.fromBuffer(outputData);

      expect(parsingOutput.error, Common.SigningError.OK);

      // Step 2: Set missing fields.
      expect(parsingOutput.hasBinance(), true);
      final signingInput = parsingOutput.binance;

      signingInput.privateKey = private_key;

      final output = Binance.SigningOutput.fromBuffer(
          TWAnySigner.sign(signingInput.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);
      expectHex(output.signature,
          '3c24c784c6bbf99d54ffabb153edcb6d3c4a774936df5c72a5d32897256f8e062f320fb4753302fb0a96f08c475974d20edfd1a27bbeeda73587f58ddc958975');
      expectJson(
        output.signatureJson,
        json.encode({
          "pub_key": {
            "type": "tendermint/PubKeySecp256k1",
            "value": "Amo1kgCI2Yw4iMpoxT38k/RWRgJgbLuH8P5e5TPbOOUC"
          },
          "signature":
              "PCTHhMa7+Z1U/6uxU+3LbTxKd0k231xypdMolyVvjgYvMg+0dTMC+wqW8IxHWXTSDt/Ronu+7ac1h/WN3JWJdQ=="
        }),
      );
    });
  });
}
