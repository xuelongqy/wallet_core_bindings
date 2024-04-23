import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Tron.pb.dart' as Tron;

import '../../utils.dart';

void main() {
  group('TWAnySignerTron', () {
    const coin = TWCoinType.TWCoinTypeTron;

    test('SignTransferAsset', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          transferAsset: Tron.TransferAssetContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
            toAddress: 'THTR75o8xXAgCTQqpiot2AFRAjvW1tSbVV',
            amount: $fixnum.Int64(4),
            assetName: '1000959',
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1541890116000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1541890116000),
            txTrieRoot: parse_hex(
                "845ab51bf63c2c21ee71a4dc0ac3781619f07a7cd05e1e0bd8ba828979332ffa"),
            parentHash: parse_hex(
                "00000000003cb800a7e69e9144e3d16f0cf33f33a95c7ce274097822c67243c1"),
            number: $fixnum.Int64(3979265),
            witnessAddress:
                parse_hex("41b487cdc02de90f15ac89a68c82f44cbfe3d915ea"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.signature),
          '77f5eabde31e739d34a66914540f1756981dc7d782c9656f5e14e53b59a15371603a183aa12124adeee7991bf55acc8e488a6ca04fb393b1a8ac16610eeafdfc00');
    });
  });
}
