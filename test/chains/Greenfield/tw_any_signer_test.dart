import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Greenfield.pb.dart' as Greenfield;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('TWAnySignerGreenfield', () {
    const coin = TWCoinType.TWCoinTypeGreenfield;

    test('Sign', () {
      // Successfully broadcasted: https://greenfieldscan.com/tx/ED8508F3C174C4430B8EE718A6D6F0B02A8C516357BE72B1336CF74356529D19

      final input = Greenfield.SigningInput(
        signingMode: Greenfield.SigningMode.Eip712,
        accountNumber: $fixnum.Int64(15952),
        cosmosChainId: 'greenfield_5600-1',
        ethChainId: '5600',
        sequence: $fixnum.Int64(0),
        mode: Greenfield.BroadcastMode.SYNC,
        memo: 'Trust Wallet test memo',
        messages: [
          Greenfield.Message(
            sendCoinsMessage: Greenfield.Message_Send(
              fromAddress: '0xA815ae0b06dC80318121745BE40e7F8c6654e9f3',
              toAddress: '0x8dbD6c7Ede90646a61Bbc649831b7c298BFd37A0',
              amounts: [
                Greenfield.Amount(
                  denom: 'BNB',
                  amount: '1234500000000000',
                ),
              ],
            ),
          ),
        ],
        fee: Greenfield.Fee(
          gas: $fixnum.Int64(1200),
          amounts: [
            Greenfield.Amount(
              denom: 'BNB',
              amount: '6000000000000',
            ),
          ],
        ),
        privateKey: parse_hex(
            "825d2bb32965764a98338139412c7591ed54c951dd65504cd8ddaeaa0fea7b2a"),
      );

      final output = Greenfield.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);
      expectHex(output.signature,
          'c1b45bd6a1005b06aa55f9a9d4c9fb88c8bbc3057fa0f8b6276796f4d04874da24cbe64bfae7a04bf918f9fba708eaea559f8a6e897dfdd8c057e6d068d501d31c');
      expect(output.serialized,
          '{"mode":"BROADCAST_MODE_SYNC","tx_bytes":"CqwBCpEBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEnEKKjB4QTgxNWFlMGIwNmRDODAzMTgxMjE3NDVCRTQwZTdGOGM2NjU0ZTlmMxIqMHg4ZGJENmM3RWRlOTA2NDZhNjFCYmM2NDk4MzFiN2MyOThCRmQzN0EwGhcKA0JOQhIQMTIzNDUwMDAwMDAwMDAwMBIWVHJ1c3QgV2FsbGV0IHRlc3QgbWVtbxJzClYKTQomL2Nvc21vcy5jcnlwdG8uZXRoLmV0aHNlY3AyNTZrMS5QdWJLZXkSIwohAhm/mQgs8vzaqBLW66HrqQNv86PYTBgXyElU1OiuKD/sEgUKAwjIBRIZChQKA0JOQhINNjAwMDAwMDAwMDAwMBCwCRpBwbRb1qEAWwaqVfmp1Mn7iMi7wwV/oPi2J2eW9NBIdNoky+ZL+uegS/kY+funCOrqVZ+Kbol9/djAV+bQaNUB0xw="}');
    });
  });
}
