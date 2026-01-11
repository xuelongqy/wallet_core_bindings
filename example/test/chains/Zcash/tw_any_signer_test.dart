import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/BitcoinV2.pb.dart' as BitcoinV2;
import 'package:wallet_core_bindings/proto/Zcash.pb.dart' as Zcash;
import 'package:wallet_core_bindings/proto/Utxo.pb.dart' as Utxo;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

const SaplingBranchID = [0xbb, 0x09, 0xb8, 0x76];

void main() {
  initTest();
  group('TWAnySignerZcash', () {
    const coin = TWCoinType.Zcash;

    // Tests the BitcoinV2 API through the legacy `SigningInput`.
    // Successfully broadcasted: https://explorer.zcha.in/transactions/ec9033381c1cc53ada837ef9981c03ead1c7c41700ff3a954389cfaddc949256
    test('SignSapplingV2', () {
      final privateKey = parse_hex(
          "a9684f5bebd0e1208aae2e02bc9e9163bd1965ad23d8538644e1df8b99b99559");
      final txId = parse_hex(
              "3a19dd44032dfed61bfca5ba5751aab8a107b30609cbd5d70dc5ef09885b6853")
          .reversed
          .toList();
      const inAmount = 494000;
      const outAmount = 488000;
      const senderAddress = "t1gWVE2uyrET2CxSmCaBiKzmWxQdHhnvMSz";
      const toAddress = "t1QahNjDdibyE4EdYkawUSKBBcVTSqv64CS";

      final signing = BitcoinV2.SigningInput(
        privateKeys: [privateKey],
        chainInfo: BitcoinV2.ChainInfo(
          p2pkhPrefix: 184,
          p2shPrefix: 189,
        ),
        builder: BitcoinV2.TransactionBuilder(
          version: BitcoinV2.TransactionVersion.UseDefault,
          inputSelector: BitcoinV2.InputSelector.UseAll,
          fixedDustThreshold: $fixnum.Int64(546),
          zcashExtraData: Zcash.TransactionBuilderExtraData(
            branchId: SaplingBranchID,
          ),
          inputs: [
            BitcoinV2.Input(
              outPoint: Utxo.OutPoint(
                hash: txId,
                vout: 0,
              ),
              value: $fixnum.Int64(inAmount),
              receiverAddress: senderAddress,
              sighashType: TWBitcoinSigHashType.All.value,
            ),
          ],
          outputs: [
            BitcoinV2.Output(
              value: $fixnum.Int64(outAmount),
              toAddress: toAddress,
            ),
          ],
        ),
      );

      final legacy = Bitcoin.SigningInput(
        coinType: coin.value,
        signingV2: signing,
      );

      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(legacy.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);
      expect(output.hasSigningResultV2(), true);
      expect(output.signingResultV2.error, Common.SigningError.OK);
      expectHex(
        output.signingResultV2.encoded,
        '0400008085202f890153685b8809efc50dd7d5cb0906b307a1b8aa5157baa5fc1bd6fe2d0344dd193a000000006b483045022100ca0be9f37a4975432a52bb65b25e483f6f93d577955290bb7fb0060a93bfc92002203e0627dff004d3c72a957dc9f8e4e0e696e69d125e4d8e275d119001924d3b48012103b243171fae5516d1dc15f9178cfcc5fdc67b0a883055c117b01ba8af29b953f6ffffffff0140720700000000001976a91449964a736f3713d64283fd0018626ba50091c7e988ac00000000000000000000000000000000000000',
      );
      expectHex(
        output.signingResultV2.txid,
        'ec9033381c1cc53ada837ef9981c03ead1c7c41700ff3a954389cfaddc949256',
      );
    });
  });
}
