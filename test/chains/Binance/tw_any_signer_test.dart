import 'dart:convert';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Binance.pb.dart' as Binance;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('TWAnySignerBinance', () {
    const coin = TWCoinType.TWCoinTypeBinance;

    test('Sign', () {
      final input = Binance.SigningInput(
        chainId: 'Binance-Chain-Tigris',
        accountNumber: $fixnum.Int64(0),
        sequence: $fixnum.Int64(0),
        source: $fixnum.Int64(0),
        privateKey: TWData.createWithHexString(
                '95949f757db1f57ca94a5dff23314accbe7abee89597bf6a3c7382c84d7eb832')
            .bytes()!,
        sendOrder: Binance.SendOrder(
          inputs: [
            Binance.SendOrder_Input(
              address: TWAnyAddress(
                      'bnb1grpf0955h0ykzq3ar5nmum7y6gdfl6lxfn46h2', coin)
                  .data,
              coins: [
                Binance.SendOrder_Token(
                  denom: 'BNB',
                  amount: $fixnum.Int64(1),
                ),
              ],
            ),
          ],
          outputs: [
            Binance.SendOrder_Output(
              address: TWAnyAddress(
                      'bnb1hlly02l6ahjsgxw9wlcswnlwdhg4xhx38yxpd5', coin)
                  .data,
              coins: [
                Binance.SendOrder_Token(
                  denom: 'BNB',
                  amount: $fixnum.Int64(1),
                ),
              ],
            ),
          ],
        ),
      );

      final output = Binance.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectHex(output.encoded,
          'b801f0625dee0a462a2c87fa0a1f0a1440c2979694bbc961023d1d27be6fc4d21a9febe612070a03424e421001121f0a14bffe47abfaede50419c577f1074fee6dd1535cd112070a03424e421001126a0a26eb5ae98721026a35920088d98c3888ca68c53dfc93f4564602606cbb87f0fe5ee533db38e50212409073e581e1ea4fdf11242fe30a732f96d20799c638354bcf7a242161ac015b9321fbbed93e85b0ef9b5de58fba74dff54ecb1e379ef26e1023be8996003f4899');
    });

    test('SignJSON', () {
      final jsonStr = json.encode({
        "chainId": "Binance-Chain-Tigris",
        "accountNumber": "13186",
        "source": "2",
        "memo": "Testing",
        "sendOrder": {
          "inputs": [
            {
              "address": "EuZU7e+eUIuDNzaph9Bp2lqJrts=",
              "coins": [
                {"denom": "BNB", "amount": "1345227"}
              ]
            }
          ],
          "outputs": [
            {
              "address": "M7vzB7mBRvE9IGk8+UbC13pMryg=",
              "coins": [
                {"denom": "BNB", "amount": "1345227"}
              ]
            }
          ]
        }
      });
      final key = TWData.createWithHexString(
              'f947b3554a1c2fa70e1caa9de53fbda353348d1e856c593848f3a29737d31f11')
          .bytes()!;
      final result = TWAnySigner.signJSON(json: jsonStr, key: key, coin: coin);

      expect(TWAnySigner.supportsJSON(coin), true);
      expect(result,
          'ca01f0625dee0a4a2a2c87fa0a210a1412e654edef9e508b833736a987d069da5a89aedb12090a03424e4210cb8d5212210a1433bbf307b98146f13d20693cf946c2d77a4caf2812090a03424e4210cb8d52126d0a26eb5ae9872102e58176f271a9796b4288908be85094a2ac978e25535fd59a37b58626e3a84d9e1240015b4beb3d6ef366a7a92fd283f66b8f0d8cdb6b152a9189146b27f84f507f047e248517cf691a36ebc2b7f3b7f64e27585ce1c40f1928d119c31af428efcf3e1882671a0754657374696e672002');
    });
  });
}
