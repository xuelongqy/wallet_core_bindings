import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

void main() {
  group('THORChainTWAnySigner', () {
    const coin = TWCoinType.TWCoinTypeTHORChain;

    test('SignTx', () {
      final privateKey = parse_hex(
          "7105512f0c020a1dd759e14b865ec0125f59ac31e34d7a2807a228ed50cb343e");

      final fromAddress = "thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r";
      final toAddress = "thor1e2ryt8asq4gu0h6z2sx9u7rfrykgxwkmr9upxn";

      final input = Cosmos.SigningInput(
        accountNumber: $fixnum.Int64(593),
        chainId: 'thorchain',
        sequence: $fixnum.Int64(3),
        privateKey: privateKey,
        memo: '',
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: fromAddress,
              toAddress: toAddress,
              amounts: [
                Cosmos.Amount(
                  denom: 'rune',
                  amount: '10000000',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(200000),
          amounts: [
            Cosmos.Amount(
              denom: 'rune',
              amount: '2000000',
            ),
          ],
        ),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://viewblock.io/thorchain/tx/FD0445AFFC4ED9ACCB7B5D3ADE361DAE4596EA096340F1360F1020381EA454AF
      expectJson(output.json,
          '{"mode":"block","tx":{"fee":{"amount":[{"amount":"2000000","denom":"rune"}],"gas":"200000"},"memo":"","msg":[{"type":"thorchain/MsgSend","value":{"amount":[{"amount":"10000000","denom":"rune"}],"from_address":"thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r","to_address":"thor1e2ryt8asq4gu0h6z2sx9u7rfrykgxwkmr9upxn"}}],"signatures":[{"pub_key":{"type":"tendermint/PubKeySecp256k1","value":"A+2Zfjls9CkvX85aQrukFZnM1dluMTFUp8nqcEneMXx3"},"signature":"qgpMX3WNq4DsNBnYtdmBD4ejiailK4uI/m3/YVqCSNF8AtkUOTmP48ztqCbpkWTFvw1/9S8/ivsFxOcK6AI0jA=="}]}}');
    });
  });
}
