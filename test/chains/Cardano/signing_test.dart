import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cardano.pb.dart' as Cardano;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

const privateKeyTest1 =
    "089b68e458861be0c44bf9f7967f05cc91e51ede86dc679448a3566990b7785bd48c330875b1e0d03caaed0e67cecc42075dce1c7a13b1c49240508848ac82f603391c68824881ae3fc23a56a1a75ada3b96382db502e37564e84a5413cfaf1290dbd508e5ec71afaea98da2df1533c22ef02a26bb87b31907d0b2738fb7785b38d53aa68fc01230784c9209b2b2a2faf28491b3b1f1d221e63e704bbd0403c4154425dfbb01a2c5c042da411703603f89af89e57faae2946e2a5c18b1c5ca0e";
const ownAddress1 =
    "addr1q8043m5heeaydnvtmmkyuhe6qv5havvhsf0d26q3jygsspxlyfpyk6yqkw0yhtyvtr0flekj84u64az82cufmqn65zdsylzk23";
const sundaeTokenPolicy =
    "9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77";

Cardano.SigningInput createSampleInput(
  int amount, [
  int utxoCount = 10,
  String alternateToAddress = '',
  bool omitPrivateKey = true,
]) {
  final toAddress = (alternateToAddress.length > 0)
      ? alternateToAddress
      : "addr1q92cmkgzv9h4e5q7mnrzsuxtgayvg4qr7y3gyx97ukmz3dfx7r9fu73vqn25377ke6r0xk97zw07dqr9y5myxlgadl2s0dgke5";

  final input = Cardano.SigningInput();
  if (utxoCount >= 1) {
    final utxo = Cardano.TxInput(
      outPoint: Cardano.OutPoint(
        txHash: parse_hex(
            "f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e767"),
        outputIndex: $fixnum.Int64(1),
      ),
      address: ownAddress1,
      amount: $fixnum.Int64(1500000),
    );
    input.utxos.add(utxo);
  }
  if (utxoCount >= 2) {
    final utxo2 = Cardano.TxInput(
      outPoint: Cardano.OutPoint(
        txHash: parse_hex(
            "554f2fd942a23d06835d26bbd78f0106fa94c8a551114a0bef81927f66467af0"),
        outputIndex: $fixnum.Int64(0),
      ),
      address: ownAddress1,
      amount: $fixnum.Int64(6500000),
    );
    input.utxos.add(utxo2);
  }

  if (!omitPrivateKey) {
    input.privateKey.add(parse_hex(privateKeyTest1));
  }
  input.transferMessage = Cardano.Transfer(
    toAddress: toAddress,
    changeAddress: ownAddress1,
    amount: $fixnum.Int64(amount),
    useMaxAmount: false,
  );
  input.ttl = $fixnum.Int64(53333333);
  return input;
}

void main() {
  group('CardanoSigning', () {
    const coin = TWCoinType.TWCoinTypeCardano;

    /// Successfully broadcasted:
    /// https://cardanoscan.io/transaction/87ca43a36b09c0b140f0ef2b71fbdcfcf1fdc88f7aa378b861e8eed3e8974628
    test('SendNft', () {
      final fromAddressPrivKey =
          "d09831a668db6b36ffb747600cb1cd3e3d34f36e1e6feefc11b5f988719b7557a7029ab80d3e6fe4180ad07a59ddf742ea9730f3c4145df6365fa4ae2ee49c3392e19444caf461567727b7fefec40a3763bdb6ce5e0e8c05f5e340355a8fef4528dfe7502cfbda49e38f5a0021962d52dc3dee82834a23abb6750981799b75577d1ed9af9853707f0ef74264274e71b2f12e86e3c91314b6efa75ef750d9711b84cedd742ab873ef2f9566ad20b3fc702232c6d2f5d83ff425019234037d1e58";
      final fromAddress =
          "addr1qy5eme9r6frr0m6q2qpncg282jtrhq5lg09uxy2j0545hj8rv7v2ntdxuv6p4s3eq4lqzg39lewgvt6fk5kmpa0zppesufzjud";
      final toAddress =
          "addr1qy9wjfn6nd8kak6dd8z53u7t5wt9f4lx0umll40px5hnq05avwcsq5r3ytdp36wttzv4558jaq8lvhgqhe3y8nuf5xrquju7z4";
      final nftPolicyId =
          "219820e6cb04316f41a337fea356480f412e7acc147d28f175f21b5e";
      final nftAssetName = "coolcatssociety4567";
      final nftTokenAmount = 1;
      // 1.20249 ADA. Amount locked by the NFT.
      final nftInputAmount = 1202490;
      final ttl = 89130965;

      final input = Cardano.SigningInput(
        utxos: [
          // Set the first utxo (NFT token and locked ADA).
          // NFT unspent output.
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "aba499ec2f23529e70bb256ceaffcc6274a882cf02f29e5670c75ee980d7c2b8"),
              outputIndex: $fixnum.Int64(0),
            ),
            address: fromAddress,
            amount: $fixnum.Int64(nftInputAmount),
            tokenAmount: [
              Cardano.TokenAmount(
                policyId: nftPolicyId,
                assetName: nftAssetName,
                amount: intToBytes(nftTokenAmount),
              ),
            ],
          ),
          // Set additional utxos to pay fee.
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "ee414d635b3bc67831907354d274a31174664777c57c21ae923b9459e5644840"),
              outputIndex: $fixnum.Int64(0),
            ),
            address: fromAddress,
            amount: $fixnum.Int64(1000000),
          ),
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "6a7221dcc28353ed69b733391ffeb984a34c1e72293af111d59f9ddfa8639167"),
              outputIndex: $fixnum.Int64(0),
            ),
            address: fromAddress,
            amount: $fixnum.Int64(2000000),
          ),
        ],
        privateKey: [parse_hex(fromAddressPrivKey)],
        // Set an output info.
        transferMessage: Cardano.Transfer(
          toAddress: toAddress,
          changeAddress: fromAddress,
          amount: $fixnum.Int64(nftInputAmount),
          tokenAmount: Cardano.TokenBundle(
            token: [
              Cardano.TokenAmount(
                policyId: nftPolicyId,
                assetName: nftAssetName,
                amount: intToBytes(nftTokenAmount),
              ),
            ],
          ),
        ),
        ttl: $fixnum.Int64(ttl),
      );

      {
        // check min ADA amount
        // The byte cost at the moment when the transaction was constructed.
        // See `ProtocolParams::coinsPerUtxoByte`:
        // https://input-output-hk.github.io/cardano-graphql/
        final coinsPerUtxoByte = "4310";

        final bundleProtoData =
            input.transferMessage.tokenAmount.writeToBuffer();

        final minAdaAmount = TWCardano.outputMinAdaAmount(
          toAddress: toAddress,
          tokenBundle: bundleProtoData,
          coinsPerUtxoByte: coinsPerUtxoByte,
        );
        expect(minAdaAmount, nftInputAmount.toString());
        expect(input.transferMessage.amount.toInt(), nftInputAmount);
      }

      // run plan and check result
      final plan = Cardano.TransactionPlan.fromBuffer(
        TWAnySigner.plan(input.writeToBuffer(), coin),
      );
      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );
      final txid = hex(output.txId);
      expect(txid,
          '87ca43a36b09c0b140f0ef2b71fbdcfcf1fdc88f7aa378b861e8eed3e8974628');

      expect(plan.availableAmount.toInt(), nftInputAmount + 1000000 + 2000000);
      expect(plan.amount.toInt(), nftInputAmount);
      expect(plan.fee.toInt(), 176539);
      expect(plan.change.toInt(), 1000000 + 2000000 - 176539);
      expect(plan.utxos.length, 3);
      expect(plan.availableTokens.length, nftTokenAmount);
      expect(
          bytesToInt(plan.availableTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '219820e6cb04316f41a337fea356480f412e7acc147d28f175f21b5e' &&
                  element.assetName == 'coolcatssociety4567')
              .amount),
          nftTokenAmount);
      expect(plan.outputTokens.length, 1);
      expect(
          bytesToInt(plan.outputTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '219820e6cb04316f41a337fea356480f412e7acc147d28f175f21b5e' &&
                  element.assetName == 'coolcatssociety4567')
              .amount),
          nftTokenAmount);
      expect(plan.changeTokens.length, 0);
    });
  });
}
