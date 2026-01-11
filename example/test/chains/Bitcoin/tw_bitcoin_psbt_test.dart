import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/BitcoinV2.pb.dart' as BitcoinV2;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() async {
  await initWalletCoreImpl();

  const coin = TWCoinType.Bitcoin;

  group('TWBitcoinPsbt', () {
    final gPrivateKey = TWPrivateKey.createWithHexString(
        'f00ffbe44c5c2838c13d2778854ac66b75e04eb6054f0241989e223223ad5e55');
    final gPsbt = parse_hex(
        "70736274ff0100bc0200000001147010db5fbcf619067c1090fec65c131443fbc80fb4aaeebe940e44206098c60000000000ffffffff0360ea000000000000160014f22a703617035ef7f490743d50f26ae08c30d0a70000000000000000426a403d3a474149412e41544f4d3a636f736d6f7331737377797a666d743675396a373437773537753438746778646575393573757a666c6d7175753a303a743a35303e12000000000000160014b139199ec796f36fc42e637f42da8e3e6720aa9d000000000001011f6603010000000000160014b139199ec796f36fc42e637f42da8e3e6720aa9d00000000");

    test('SignThorSwap', () {
      final signing = BitcoinV2.SigningInput(
        psbt: BitcoinV2.Psbt(
          psbt: gPsbt,
        ),
        privateKeys: [
          gPrivateKey.data,
        ],
      );

      final legacy = Bitcoin.SigningInput(
        signingV2: signing,
      );

      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(legacy.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);
      expect(output.hasSigningResultV2(), true);

      final outputV2 = output.signingResultV2;
      expect(outputV2.hasPsbt(), true);
      expectHex(
        outputV2.psbt.psbt,
        '70736274ff0100bc0200000001147010db5fbcf619067c1090fec65c131443fbc80fb4aaeebe940e44206098c60000000000ffffffff0360ea000000000000160014f22a703617035ef7f490743d50f26ae08c30d0a70000000000000000426a403d3a474149412e41544f4d3a636f736d6f7331737377797a666d743675396a373437773537753438746778646575393573757a666c6d7175753a303a743a35303e12000000000000160014b139199ec796f36fc42e637f42da8e3e6720aa9d000000000001011f6603010000000000160014b139199ec796f36fc42e637f42da8e3e6720aa9d01086c02483045022100b1229a008f20691639767bf925d6b8956ea957ccc633ad6b5de3618733a55e6b02205774d3320489b8a57a6f8de07f561de3e660ff8e587f6ac5422c49020cd4dc9101210306d8c664ea8fd2683eebea1d3114d90e0a5429e5783ba49b80ddabce04ff28f300000000',
      );
      expectHex(
        outputV2.encoded,
        '02000000000101147010db5fbcf619067c1090fec65c131443fbc80fb4aaeebe940e44206098c60000000000ffffffff0360ea000000000000160014f22a703617035ef7f490743d50f26ae08c30d0a70000000000000000426a403d3a474149412e41544f4d3a636f736d6f7331737377797a666d743675396a373437773537753438746778646575393573757a666c6d7175753a303a743a35303e12000000000000160014b139199ec796f36fc42e637f42da8e3e6720aa9d02483045022100b1229a008f20691639767bf925d6b8956ea957ccc633ad6b5de3618733a55e6b02205774d3320489b8a57a6f8de07f561de3e660ff8e587f6ac5422c49020cd4dc9101210306d8c664ea8fd2683eebea1d3114d90e0a5429e5783ba49b80ddabce04ff28f300000000',
      );
    });

    test('PlanThorSwap', () {
      final publicKey =
          gPrivateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);

      final inputV2 = BitcoinV2.SigningInput(
        psbt: BitcoinV2.Psbt(
          psbt: gPsbt,
        ),
        publicKeys: [
          publicKey.data,
        ],
      );

      final legacy = Bitcoin.SigningInput(
        signingV2: inputV2,
      );

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(legacy.writeToBuffer(), coin));

      expect(plan.error, Common.SigningError.OK);
      expect(plan.hasPlanningResultV2(), true);

      final planV2 = plan.planningResultV2;
      expect(planV2.sendAmount.toInt(), 66406);
      expect(planV2.feeEstimate.toInt(), 1736);
    });
  });
}
