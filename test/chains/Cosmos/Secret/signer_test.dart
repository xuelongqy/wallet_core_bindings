import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

void main() {
  group('SecretSigner', () {
    const coin = TWCoinType.TWCoinTypeSecret;

    test('Sign', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(265538),
        chainId: 'secret-4',
        memo: '',
        sequence: $fixnum.Int64(1),
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: 'secret18mdrja40gfuftt5yx6tgj0fn5lurplezyp894y',
              toAddress: 'secret1rnq6hjfnalxeef87rmdeya3nu9dhpc7k9pujs3',
              amounts: [
                Cosmos.Amount(
                  denom: 'uscrt',
                  amount: '100000',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(25000),
          amounts: [
            Cosmos.Amount(
              denom: 'uscrt',
              amount: '2500',
            ),
          ],
        ),
      );

      final privateKey = parse_hex(
          "87201512d132ef7a1e57f9e24905fbc24300bd73f676b5716182be5f3e39dada");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://www.mintscan.io/secret/txs/01F4BD2458BF966F287533775C8D67BBC7CA7214CAEB1752D270A90223E9E82F
      // curl -H 'Content-Type: application/json' --data-binary "{\"tx_bytes\":\"CpIB...c4o=\",\"mode\":\"BROADCAST_MODE_BLOCK\"}" https://scrt-lcd.blockpane.com/cosmos/tx/v1beta1/txs

      expectJson(output.serialized,
          "{\"tx_bytes\":\"CpIBCo8BChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEm8KLXNlY3JldDE4bWRyamE0MGdmdWZ0dDV5eDZ0Z2owZm41bHVycGxlenlwODk0eRItc2VjcmV0MXJucTZoamZuYWx4ZWVmODdybWRleWEzbnU5ZGhwYzdrOXB1anMzGg8KBXVzY3J0EgYxMDAwMDASZwpQCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohAkZqxdKMtPq2w0kGDGwWGejTAed0H7azPMHtrCX0XYZGEgQKAggBGAESEwoNCgV1c2NydBIEMjUwMBCowwEaQOcHd2gHpa5WKZ/5RRerEtrHlyDlojIEzUGhC9xMFgs7UQMWy+kTTN+NRf7zQ8rx3cPkIKeZhv0u1KRc8uRCc4o=\",\"mode\":\"BROADCAST_MODE_BLOCK\"}");
      expectHex(output.signature,
          'e707776807a5ae56299ff94517ab12dac79720e5a23204cd41a10bdc4c160b3b510316cbe9134cdf8d45fef343caf1ddc3e420a79986fd2ed4a45cf2e442738a');
      expect(output.errorMessage, '');
      expect(output.json, '');
    });
  });
}
