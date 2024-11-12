import 'package:flutter_test/flutter_test.dart';
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
  bool omitPrivateKey = false,
]) {
  final toAddress = (alternateToAddress.isNotEmpty)
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
  initTest();
  group('CardanoSigning', () {
    const coin = TWCoinType.Cardano;

    /// Successfully broadcasted:
    /// https://cardanoscan.io/transaction/87ca43a36b09c0b140f0ef2b71fbdcfcf1fdc88f7aa378b861e8eed3e8974628
    test('SendNft', () {
      const fromAddressPrivKey =
          "d09831a668db6b36ffb747600cb1cd3e3d34f36e1e6feefc11b5f988719b7557a7029ab80d3e6fe4180ad07a59ddf742ea9730f3c4145df6365fa4ae2ee49c3392e19444caf461567727b7fefec40a3763bdb6ce5e0e8c05f5e340355a8fef4528dfe7502cfbda49e38f5a0021962d52dc3dee82834a23abb6750981799b75577d1ed9af9853707f0ef74264274e71b2f12e86e3c91314b6efa75ef750d9711b84cedd742ab873ef2f9566ad20b3fc702232c6d2f5d83ff425019234037d1e58";
      const fromAddress =
          "addr1qy5eme9r6frr0m6q2qpncg282jtrhq5lg09uxy2j0545hj8rv7v2ntdxuv6p4s3eq4lqzg39lewgvt6fk5kmpa0zppesufzjud";
      const toAddress =
          "addr1qy9wjfn6nd8kak6dd8z53u7t5wt9f4lx0umll40px5hnq05avwcsq5r3ytdp36wttzv4558jaq8lvhgqhe3y8nuf5xrquju7z4";
      const nftPolicyId =
          "219820e6cb04316f41a337fea356480f412e7acc147d28f175f21b5e";
      const nftAssetName = "coolcatssociety4567";
      const nftTokenAmount = 1;
      // 1.20249 ADA. Amount locked by the NFT.
      const nftInputAmount = 1202490;
      const ttl = 89130965;

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
        const coinsPerUtxoByte = "4310";

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

      final txHex = hex(output.encoded);
      expect(txHex,
          '83a400838258206a7221dcc28353ed69b733391ffeb984a34c1e72293af111d59f9ddfa863916700825820aba499ec2f23529e70bb256ceaffcc6274a882cf02f29e5670c75ee980d7c2b800825820ee414d635b3bc67831907354d274a31174664777c57c21ae923b9459e5644840000182825839010ae9267a9b4f6edb4d69c548f3cba39654d7e67f37ffd5e1352f303e9d63b100507122da18e9cb58995a50f2e80ff65d00be6243cf89a186821a0012593aa1581c219820e6cb04316f41a337fea356480f412e7acc147d28f175f21b5ea153636f6f6c63617473736f6369657479343536370182583901299de4a3d24637ef4050033c214754963b829f43cbc311527d2b4bc8e36798a9ada6e3341ac239057e012225fe5c862f49b52db0f5e208731a002b1525021a0002b19b031a055007d5a1008182582088bd26e8656fa7dead846c3373588f0192da5bfb90bf5d3fb877decfb3b3fd085840da8656aca0dacc57d4c2d957fc7dff03908f6dcf60c48f1e40b3006e2fd0cfacfa4c24fa02e35a310572526586d4ce0d30bf660ba274c8efd507848cbe177d09f6');
    });

    test('Plan', () {
      final input = createSampleInput(7000000);

      {
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.utxos.length, 2);
        expect(plan.availableAmount.toInt(), 8000000);
        expect(plan.amount.toInt(), 7000000);
        expect(plan.fee.toInt(), 170196);
        expect(plan.change.toInt(), 829804);
        expect(plan.amount + plan.change + plan.fee, plan.availableAmount);
        expect(plan.error, Common.SigningError.OK);
      }
      {
        // very small target amount
        input.transferMessage.amount = $fixnum.Int64(1);
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.utxos.length, 1);
        expect(plan.availableAmount.toInt(), 6500000);
        expect(plan.amount.toInt(), 1);
        expect(plan.fee.toInt(), 168435);
        expect(plan.amount + plan.change + plan.fee, plan.availableAmount);
      }
      {
        // small target amount
        input.transferMessage.amount = $fixnum.Int64(2000000);
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.utxos.length, 1);
        expect(plan.availableAmount.toInt(), 6500000);
        expect(plan.amount.toInt(), 2000000);
        expect(plan.fee.toInt(), 168611);
        expect(plan.amount + plan.change + plan.fee, plan.availableAmount);
      }
      {
        // small target amount requested, but max amount
        input.transferMessage.amount = $fixnum.Int64(2000000);
        input.transferMessage.useMaxAmount = true;
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.utxos.length, 2);
        expect(plan.availableAmount.toInt(), 8000000);
        expect(plan.amount.toInt(), 7832667);
        expect(plan.fee.toInt(), 167333);
        expect(plan.amount + plan.change + plan.fee, plan.availableAmount);
      }
    });

    test('ExtraOutputPlan', () {
      final input = createSampleInput(
        2000000,
        10,
        "addr1q92cmkgzv9h4e5q7mnrzsuxtgayvg4qr7y3gyx97ukmz3dfx7r9fu73vqn25377ke6r0xk97zw07dqr9y5myxlgadl2s0dgke5",
        true,
      );
      // two output
      final txOutput = Cardano.TxOutput(
        address:
            'addr1q92cmkgzv9h4e5q7mnrzsuxtgayvg4qr7y3gyx97ukmz3dfx7r9fu73vqn25377ke6r0xk97zw07dqr9y5myxlgadl2s0dgke5',
        amount: $fixnum.Int64(2000000),
      );
      input.extraOutputs.add(txOutput);
      final plan = Cardano.TransactionPlan.fromBuffer(
        TWAnySigner.plan(input.writeToBuffer(), coin),
      );
      expect(plan.utxos.length, 1);
      expect(plan.availableAmount.toInt(), 6500000);
      expect(plan.amount.toInt(), 2000000);
      expect(plan.fee.toInt(), 171474);
      int extraAmountSum = 0;
      for (var extraOutput in input.extraOutputs) {
        extraAmountSum += extraOutput.amount.toInt();
      }
      expect(plan.amount + plan.change + plan.fee + extraAmountSum,
          plan.availableAmount);
    });

    test('ErrorDoPlan', () {
      {
        // Common::Proto::Error_missing_input_utxos
        final input = createSampleInput(
          2000000,
          0,
          "addr1q92cmkgzv9h4e5q7mnrzsuxtgayvg4qr7y3gyx97ukmz3dfx7r9fu73vqn25377ke6r0xk97zw07dqr9y5myxlgadl2s0dgke5",
          true,
        );
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.error, Common.SigningError.Error_missing_input_utxos);
      }
      {
        // Common::Proto::Error_low_balance
        final input = createSampleInput(
          9000000,
          1,
          "addr1q92cmkgzv9h4e5q7mnrzsuxtgayvg4qr7y3gyx97ukmz3dfx7r9fu73vqn25377ke6r0xk97zw07dqr9y5myxlgadl2s0dgke5",
          true,
        );
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.error, Common.SigningError.Error_low_balance);
      }
    });

    test('PlanForceFee', () {
      const requestedAmount = 6500000;
      const availableAmount = 8000000;
      final input = createSampleInput(requestedAmount);

      {
        const fee = 170147;
        input.transferMessage.forceFee = $fixnum.Int64(fee);
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.availableAmount.toInt(), availableAmount);
        expect(plan.amount.toInt(), requestedAmount);
        expect(plan.fee.toInt(), fee);
        expect(plan.change.toInt(), availableAmount - requestedAmount - fee);
        expect(plan.amount + plan.change + plan.fee, plan.availableAmount);
        expect(plan.error, Common.SigningError.OK);
      }
      {
        // tiny fee
        const fee = 100;
        input.transferMessage.forceFee = $fixnum.Int64(fee);
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.availableAmount.toInt(), availableAmount);
        expect(plan.amount.toInt(), requestedAmount);
        expect(plan.fee.toInt(), fee);
        expect(plan.change.toInt(), availableAmount - requestedAmount - fee);
        expect(plan.amount + plan.change + plan.fee, plan.availableAmount);
      }
      {
        // large fee
        const fee = 1200000;
        input.transferMessage.forceFee = $fixnum.Int64(fee);
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.availableAmount.toInt(), availableAmount);
        expect(plan.amount.toInt(), requestedAmount);
        expect(plan.fee.toInt(), fee);
        expect(plan.change.toInt(), availableAmount - requestedAmount - fee);
        expect(plan.amount + plan.change + plan.fee, plan.availableAmount);
      }
      {
        // very large fee, larger than possible, truncated
        const fee = 3000000;
        input.transferMessage.forceFee = $fixnum.Int64(fee);
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.availableAmount.toInt(), availableAmount);
        expect(plan.amount.toInt(), requestedAmount);
        expect(plan.fee.toInt(), 1500000);
        expect(plan.change.toInt(), 0);
        expect(plan.amount + plan.change + plan.fee, plan.availableAmount);
      }
      {
        // force fee and max amount: fee is used, amount is max, change 0
        const fee = 160000;
        input.transferMessage.forceFee = $fixnum.Int64(fee);
        input.transferMessage.useMaxAmount = true;
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.availableAmount.toInt(), availableAmount);
        expect(plan.amount.toInt(), 7840000);
        expect(plan.fee.toInt(), fee);
        expect(plan.change.toInt(), 0);
        expect(plan.amount + plan.change + plan.fee, plan.availableAmount);
      }
    });

    test('PlanMissingPrivateKey', () {
      final input = createSampleInput(7000000, 10, "", true);

      final plan = Cardano.TransactionPlan.fromBuffer(
        TWAnySigner.plan(input.writeToBuffer(), coin),
      );

      expect(plan.utxos.length, 2);
      expect(plan.availableAmount.toInt(), 8000000);
      expect(plan.amount.toInt(), 7000000);
      expect(plan.fee.toInt(), 170196);
      expect(plan.change.toInt(), 829804);
      expect(plan.amount + plan.change + plan.fee, plan.availableAmount);
      expect(plan.error, Common.SigningError.OK);
    });

    test('SignTransfer1', () {
      final input = createSampleInput(7000000);

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );

      expect(output.error, Common.SigningError.OK);

      final encoded = output.encoded;
      expectHex(encoded,
          '83a40082825820554f2fd942a23d06835d26bbd78f0106fa94c8a551114a0bef81927f66467af000825820f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e76701018282583901558dd902616f5cd01edcc62870cb4748c45403f1228218bee5b628b526f0ca9e7a2c04d548fbd6ce86f358be139fe680652536437d1d6fd51a006acfc082583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a000ca96c021a000298d4031a032dcd55a100818258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df29058407cf591599852b5f5e007fdc241062405c47e519266c0d884b0767c1d4f5eacce00db035998e53ed10ca4ba5ce4aac8693798089717ce6cf4415f345cc764200ef6');
      final txid = output.txId;
      expectHex(txid,
          '9b5b15e133cd73ccaa85307d2986aebc846505118a2eb4e6111e6b4b67d1f389');
    });

    test('PlanAndSignTransfer1', () {
      const amount = 6000000;
      final input = createSampleInput(amount);

      {
        // run plan and check result
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );

        expect(plan.availableAmount.toInt(), 8000000);
        expect(plan.amount.toInt(), amount);
        expect(plan.fee.toInt(), 170196);
        expect(plan.change.toInt(), 8000000 - amount - 170196);
        expect(plan.utxos.length, 2);
        expect(plan.utxos[0].amount.toInt(), 6500000);
        expect(plan.utxos[1].amount.toInt(), 1500000);

        // perform sign with default plan
        final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin),
        );
        expect(output.error, Common.SigningError.OK);

        final encoded = output.encoded;
        expectHex(encoded,
            '83a40082825820554f2fd942a23d06835d26bbd78f0106fa94c8a551114a0bef81927f66467af000825820f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e76701018282583901558dd902616f5cd01edcc62870cb4748c45403f1228218bee5b628b526f0ca9e7a2c04d548fbd6ce86f358be139fe680652536437d1d6fd51a005b8d8082583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a001bebac021a000298d4031a032dcd55a100818258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df29058404abc749ffaffcf2f87970e4f1983c5e44b352ee1515b60017fc65e581d42b3a6ed146d5eb35d04a770460b0541a25afd5aedfd027fdaded82686f43454196a0cf6');
        final txid = output.txId;
        expectHex(txid,
            '3852f809245d7000ad0c5ccb1357e5d333b0dd25158924581e4c7049ec68c564');
      }

      // set different plan, with one input only
      input.plan = Cardano.TransactionPlan(
        amount: $fixnum.Int64(amount),
        availableAmount: $fixnum.Int64(6500000),
        fee: $fixnum.Int64(165489),
        change: $fixnum.Int64(17191988),
        utxos: [input.utxos[0]],
        error: Common.SigningError.OK,
      );

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );
      expect(output.error, Common.SigningError.OK);

      final encoded = output.encoded;
      expectHex(encoded,
          '83a40081825820f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e76701018282583901558dd902616f5cd01edcc62870cb4748c45403f1228218bee5b628b526f0ca9e7a2c04d548fbd6ce86f358be139fe680652536437d1d6fd51a005b8d8082583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a01065434021a00028671031a032dcd55a100818258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df29058408311a058035d75545a47b844fea401aa9c23e99fe7bc8136b554396eef135d4cd93062c5df38e613185c21bb1c98b881d1e0fd1024d3539b163c8e14d1a6e40df6');
      final txid = output.txId;
      expectHex(txid,
          'e319c0bfc99cdb79d64f00b7e8fb8bfbf29fa70554c84f101e92b7dfed172448');
    });

    test('PlanAndSignMaxAmount', () {
      final input = createSampleInput(7000000);
      input.transferMessage.useMaxAmount = true;

      {
        // run plan and check result
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.availableAmount.toInt(), 8000000);
        expect(plan.amount.toInt(), 8000000 - 167333);
        expect(plan.fee.toInt(), 167333);
        expect(plan.change.toInt(), 0);
        expect(plan.utxos.length, 2);
        expect(plan.utxos[0].amount.toInt(), 1500000);
        expect(plan.utxos[1].amount.toInt(), 6500000);
      }

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );

      expect(output.error, Common.SigningError.OK);

      final encoded = output.encoded;
      expectHex(encoded,
          '83a40082825820f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e76701825820554f2fd942a23d06835d26bbd78f0106fa94c8a551114a0bef81927f66467af000018182583901558dd902616f5cd01edcc62870cb4748c45403f1228218bee5b628b526f0ca9e7a2c04d548fbd6ce86f358be139fe680652536437d1d6fd51a0077845b021a00028da5031a032dcd55a100818258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df29058403e64473e08adc863953c0e9f820b658dda0b8a423d6172fdccff73fcd5559956c9df8ed93ff67405331d368a0c11fd18c69781046384946582e1555e9e8ec70bf6');
      final txid = output.txId;
      expectHex(txid,
          'ca0f1e12f20c95011da7d686d206a1eb98df94accd74c4df4ef403c5ce836057');
    });

    test('SignNegative', () {
      {
        // plan with error
        final input = createSampleInput(7000000);
        const error = Common.SigningError.Error_invalid_memo;
        input.plan = Cardano.TransactionPlan(
          error: error,
        );
        final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin),
        );
        expect(output.error, error);
      }
      {
        // zero requested amount
        final input = createSampleInput(0);
        final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin),
        );
        expect(output.error, Common.SigningError.Error_zero_amount_requested);
      }
      {
        // no utxo
        final input = createSampleInput(7000000, 0);
        final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin),
        );
        expect(output.error, Common.SigningError.Error_missing_input_utxos);
      }
      {
        // low balance
        final input = createSampleInput(7000000000);
        final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin),
        );
        expect(output.error, Common.SigningError.Error_low_balance);
      }
      {
        // missing private key
        final input = createSampleInput(7000000, 10, "", true);
        final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin),
        );
        expect(output.error, Common.SigningError.Error_missing_private_key);
      }
    });

    test('SignTransfer_0db1ea', () {
      const amount = 1100000;
      const fee = 170147;

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "81b935447bb994567f041d181b628a0afbcd747d0199c9ff4cd895686bbee8c6"),
              outputIndex: $fixnum.Int64(0),
            ),
            address: ownAddress1,
            amount: $fixnum.Int64(1000000),
          ),
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "3a9068a273cc2af59b45593b78973841d972d01802abe992c55dbeecdffc561b"),
              outputIndex: $fixnum.Int64(0),
            ),
            address: ownAddress1,
            amount: $fixnum.Int64(1800000),
          ),
        ],
        privateKey: [parse_hex(privateKeyTest1)],
        transferMessage: Cardano.Transfer(
          toAddress:
              'addr1qxxe304qg9py8hyyqu8evfj4wln7dnms943wsugpdzzsxnkvvjljtzuwxvx0pnwelkcruy95ujkq3aw6rl0vvg32x35qc92xkq',
          changeAddress: ownAddress1,
          amount: $fixnum.Int64(amount),
          useMaxAmount: false,
          forceFee: $fixnum.Int64(fee),
        ),
        ttl: $fixnum.Int64(54675589),
      );

      {
        // run plan and check result
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );

        expect(plan.availableAmount.toInt(), 2800000);
        expect(plan.amount.toInt(), amount);
        expect(plan.fee.toInt(), fee);
        expect(plan.change.toInt(), 2800000 - amount - fee);
        expect(plan.utxos.length, 2);
      }

      // set plan with specific fee, to match the real transaction
      input.plan = Cardano.TransactionPlan(
        amount: $fixnum.Int64(amount),
        availableAmount: $fixnum.Int64(2800000),
        fee: $fixnum.Int64(fee),
        change: $fixnum.Int64(2800000 - amount - fee),
        utxos: input.utxos,
        error: Common.SigningError.OK,
      );

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );

      // https://cardanoscan.io/transaction/0db1ea8c5c5828bbd027fcef3da02a63b86899db670ad7bb0630cefbe35944fa
      // curl -d '{"txHash":"0db1ea..44fa","txBody":"83a400..06f6"}' -H "Content-Type: application/json" https://<cardano-node>/api/txs/submit
      expect(output.error, Common.SigningError.OK);
      final encoded = output.encoded;
      expectHex(encoded,
          '83a4008282582081b935447bb994567f041d181b628a0afbcd747d0199c9ff4cd895686bbee8c6008258203a9068a273cc2af59b45593b78973841d972d01802abe992c55dbeecdffc561b000182825839018d98bea0414243dc84070f96265577e7e6cf702d62e871016885034ecc64bf258b8e330cf0cdd9fdb03e10b4e4ac08f5da1fdec6222a34681a0010c8e082583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a001757fd021a000298a3031a03424885a100818258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df29058406300b52aaff1e26067a3e0a48ae26f4f068765f46f934fabeab872c1d25535fc94893ec72feacd787f0174fbabd8933727d9a2b319b406e7a855843b0c051806f6');
      final txid = output.txId;
      expectHex(txid,
          '0db1ea8c5c5828bbd027fcef3da02a63b86899db670ad7bb0630cefbe35944fa');
    });

    /// Successfully broadcasted:
    /// https://cardanoscan.io/transaction/0203ce2c91f59f169a26e9ef91254639d2b7911afac9c7c0ae64539f88ba46a5
    test('SignTransferFromLegacy', () {
      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  '8316e5007d61fb90652cabb41141972a38b5bc60954d602cf843476aa3f67f63'),
              outputIndex: $fixnum.Int64(0),
            ),
            address:
                'Ae2tdPwUPEZ6vkqxSjJxaQYmDxHf5DTnxtZ67pFLJGTb9LTnCGkDP6ca3f8',
            amount: $fixnum.Int64(2500000),
          ),
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  'e29392c59c903fefb905730587d22cae8bda30bd8d9aeec3eca082ae77675946'),
              outputIndex: $fixnum.Int64(0),
            ),
            address:
                'Ae2tdPwUPEZ6vkqxSjJxaQYmDxHf5DTnxtZ67pFLJGTb9LTnCGkDP6ca3f8',
            amount: $fixnum.Int64(1700000),
          ),
        ],
      );

      final privateKeyData = parse_hex(
          "98f266d1aac660179bc2f456033941238ee6b2beb8ed0f9f34c9902816781f5a9903d1d395d6ab887b65ea5e344ef09b449507c21a75f0ce8c59d0ed1c6764eba7f484aa383806735c46fd769c679ee41f8952952036a6e2338ada940b8a91f4e890ca4eb6bec44bf751b5a843174534af64d6ad1f44e0613db78a7018781f5aa151d2997f52059466b715d8eefab30a78b874ae6ef4931fa58bb21ef8ce2423d46f19d0fbf75afb0b9a24e31d533f4fd74cee3b56e162568e8defe37123afc4");
      input.privateKey.add(privateKeyData);
      input.transferMessage = Cardano.Transfer(
        toAddress:
            'addr1q90uh2eawrdc9vaemftgd50l28yrh9lqxtjjh4z6dnn0u7ggasexxdyyk9f05atygnjlccsjsggtc87hhqjna32fpv5qeq96ls',
        changeAddress:
            'addr1qx55ymlqemndq8gluv40v58pu76a2tp4mzjnyx8n6zrp2vtzrs43a0057y0edkn8lh9su8vh5lnhs4npv6l9tuvncv8swc7t08',
        amount: $fixnum.Int64(3000000),
        useMaxAmount: false,
      );
      input.ttl = $fixnum.Int64(190000000);

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );

      expect(output.error, Common.SigningError.OK);
      expectHex(output.encoded,
          '83a400828258208316e5007d61fb90652cabb41141972a38b5bc60954d602cf843476aa3f67f6300825820e29392c59c903fefb905730587d22cae8bda30bd8d9aeec3eca082ae77675946000182825839015fcbab3d70db82b3b9da5686d1ff51c83b97e032e52bd45a6ce6fe7908ec32633484b152fa756444e5fc62128210bc1fd7b8253ec5490b281a002dc6c082583901a9426fe0cee6d01d1fe32af650e1e7b5d52c35d8a53218f3d0861531621c2b1ebdf4f11f96da67fdcb0e1d97a7e778566166be55f193c30f1a000f9ec1021a0002b0bf031a0b532b80a20081825820d163c8c4f0be7c22cd3a1152abb013c855ea614b92201497a568c5d93ceeb41e58406a23ab9267867fbf021c1cb2232bc83d2cdd663d651d22d59b6cddbca5cb106d4db99da50672f69a2309ca8a329a3f9576438afe4538b013de4591a6dfcd4d090281845820d163c8c4f0be7c22cd3a1152abb013c855ea614b92201497a568c5d93ceeb41e58406a23ab9267867fbf021c1cb2232bc83d2cdd663d651d22d59b6cddbca5cb106d4db99da50672f69a2309ca8a329a3f9576438afe4538b013de4591a6dfcd4d095820a7f484aa383806735c46fd769c679ee41f8952952036a6e2338ada940b8a91f441a0f6');
      expectHex(output.txId,
          '0203ce2c91f59f169a26e9ef91254639d2b7911afac9c7c0ae64539f88ba46a5');
    });

    test('SignTransferToLegacy', () {
      const toAddressLegacy =
          'DdzFFzCqrhssmYoG5Eca1bKZFdGS8d6iag1mU4wbLeYcSPVvBNF2wRG8yhjzQqErbg63N6KJA4DHqha113tjKDpGEwS5x1dT2KfLSbSJ';

      final input = createSampleInput(7000000, 10, toAddressLegacy);

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      expectHex(output.encoded,
          '83a40082825820554f2fd942a23d06835d26bbd78f0106fa94c8a551114a0bef81927f66467af000825820f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e76701018282584c82d818584283581c6aebd89cf88271c3ee76339930d8956b03f018b2f4871522f88eb8f9a101581e581c692a37dae3bc63dfc3e1463f12011f26655ab1d1e0f4ed4b8fc63708001ad8a9555b1a006acfc082583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a000ca627021a00029c19031a032dcd55a100818258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df2905840db9becdc733f4c08c0e7abc29b5cc6469f9339d32f565df8bf77455439ae1f949facc9b831754e74d3fbb42e99647eedd6c28de1461d18c315485f5d24b5b90af6');
      expectHex(output.txId,
          'f9b713e9987ec1377ac223f50d63c7a5e155915302de43f40d7b2627accabf69');
    });

    test('SignTransferToInvalid', () {
      final input = createSampleInput(7000000, 10, "__INVALID_ADDRESS__");

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.Error_invalid_address);
      expectHex(output.encoded, '');
    });

    test('SignTransferToken', () {
      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  'f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e767'),
              outputIndex: $fixnum.Int64(1),
            ),
            address: ownAddress1,
            amount: $fixnum.Int64(8051373),
            // some token, to be preserved
            tokenAmount: [
              Cardano.TokenAmount(
                policyId: sundaeTokenPolicy,
                assetName: 'CUBY',
                amount: intToBytes(3000000),
              ),
            ],
          ),
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  'f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e767'),
              outputIndex: $fixnum.Int64(2),
            ),
            address: ownAddress1,
            amount: $fixnum.Int64(2000000),
            // some SUNDAE token, to be transferred
            tokenAmount: [
              Cardano.TokenAmount(
                policyId: sundaeTokenPolicy,
                assetNameHex: '53554e444145',
                amount: intToBytes(80996569),
              ),
              // some other token, to be preserved
              Cardano.TokenAmount(
                policyId: sundaeTokenPolicy,
                assetName: 'CUBY',
                // This should be ignored!
                assetNameHex: '00',
                amount: intToBytes(2000000),
              ),
            ],
          ),
        ],
      );
      final privateKeyData = parse_hex(privateKeyTest1);
      input.privateKey.add(privateKeyData);
      input.transferMessage = Cardano.Transfer(
        toAddress:
            'addr1q92cmkgzv9h4e5q7mnrzsuxtgayvg4qr7y3gyx97ukmz3dfx7r9fu73vqn25377ke6r0xk97zw07dqr9y5myxlgadl2s0dgke5',
        changeAddress:
            'addr1qxxe304qg9py8hyyqu8evfj4wln7dnms943wsugpdzzsxnkvvjljtzuwxvx0pnwelkcruy95ujkq3aw6rl0vvg32x35qc92xkq',
        amount: $fixnum.Int64(1500000),
        tokenAmount: Cardano.TokenBundle(
          token: [
            Cardano.TokenAmount(
              policyId: sundaeTokenPolicy,
              assetNameHex: '53554e444145',
              amount: intToBytes(20000000),
            ),
          ],
        ),
        useMaxAmount: false,
      );
      input.ttl = $fixnum.Int64(53333333);

      {
        // check min ADA amount, set it
        final bundleProtoData =
            input.transferMessage.tokenAmount.writeToBuffer();
        final minAdaAmount = TWCardano.minAdaAmount(bundleProtoData);
        expect(minAdaAmount, 1444443);
        input.transferMessage.amount = $fixnum.Int64(minAdaAmount);
      }

      {
        // run plan and check result
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );

        expect(plan.availableAmount.toInt(), 10051373);
        expect(plan.amount.toInt(), 1444443);
        expect(plan.fee.toInt(), 174601);
        expect(plan.change.toInt(), 8432329);
        expect(plan.utxos.length, 2);
        expect(
          bytesToInt(plan.availableTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
                  element.assetName == 'CUBY')
              .amount),
          5000000,
        );
        expect(
          bytesToInt(plan.availableTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
                  element.assetName == 'SUNDAE')
              .amount),
          80996569,
        );
        expect(plan.outputTokens.length, 1);
        // expect(
        //   bytesToInt(plan.outputTokens
        //       .firstWhere((element) =>
        //           element.policyId ==
        //               '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
        //           element.assetName == 'CUBY')
        //       .amount),
        //   0,
        // );
        expect(
          bytesToInt(plan.outputTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
                  element.assetName == 'SUNDAE')
              .amount),
          20000000,
        );
        expect(plan.changeTokens.length, 2);
        expect(
          bytesToInt(plan.changeTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
                  element.assetName == 'CUBY')
              .amount),
          5000000,
        );
        expect(
          bytesToInt(plan.changeTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
                  element.assetName == 'SUNDAE')
              .amount),
          60996569,
        );
      }

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );

      expect(output.error, Common.SigningError.OK);
      final encoded = output.encoded;
      expectHex(encoded,
          '83a40082825820f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e76701825820f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e76702018282583901558dd902616f5cd01edcc62870cb4748c45403f1228218bee5b628b526f0ca9e7a2c04d548fbd6ce86f358be139fe680652536437d1d6fd5821a00160a5ba1581c9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77a14653554e4441451a01312d00825839018d98bea0414243dc84070f96265577e7e6cf702d62e871016885034ecc64bf258b8e330cf0cdd9fdb03e10b4e4ac08f5da1fdec6222a3468821a0080aac9a1581c9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77a244435542591a004c4b404653554e4441451a03a2bbd9021a0002aa09031a032dcd55a100818258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df2905840d90dcfbd190cbe59c42094e59eeb49b3de9d80a85b786cc311f932c5c9302d1c8c6c577b22aa70ff7955c139c700ea918f8cb425c3ba43a27980e1d238e4e908f6');
      final txid = output.txId;
      expectHex(txid,
          '201c537693b005b64a0f0528e366ec67a84be0119ed4363b547f141f2a7770c2');

      {
        // also test proto toProto / fromProto
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.amount.toInt(), 1444443);
        expect(plan.change.toInt(), 8432329);
      }
    });

    test('SignTransferToken_1dd248', () {
      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  'f2d2b11c8c07c5c646f5b5af20fddf2f0a174743c6a1b13cca27e28a6ca34710'),
              outputIndex: $fixnum.Int64(0),
            ),
            address: ownAddress1,
            amount: $fixnum.Int64(1500000),
            // some token
            tokenAmount: [
              Cardano.TokenAmount(
                policyId: sundaeTokenPolicy,
                assetNameHex: '53554e444145',
                amount: intToBytes(20000000),
              ),
            ],
          ),
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  '6975fcf7bbca745c85f50777f956219868fd9cad14ba496fed1371252e8df60f'),
              outputIndex: $fixnum.Int64(0),
            ),
            address: ownAddress1,
            amount: $fixnum.Int64(10258890),
          ),
        ],
      );
      final privateKeyData = parse_hex(privateKeyTest1);
      input.privateKey.add(privateKeyData);
      input.transferMessage = Cardano.Transfer(
        toAddress:
            'addr1qxxe304qg9py8hyyqu8evfj4wln7dnms943wsugpdzzsxnkvvjljtzuwxvx0pnwelkcruy95ujkq3aw6rl0vvg32x35qc92xkq',
        changeAddress: ownAddress1,
        amount: $fixnum.Int64(1600000),
        tokenAmount: Cardano.TokenBundle(
          token: [
            Cardano.TokenAmount(
              policyId: sundaeTokenPolicy,
              assetNameHex: '53554e444145',
              amount: intToBytes(11000000),
            ),
          ],
        ),
        useMaxAmount: false,
      );
      input.ttl = $fixnum.Int64(61232158);

      {
        // check min ADA amount
        final bundleProtoData =
            input.transferMessage.tokenAmount.writeToBuffer();
        expect(TWCardano.minAdaAmount(bundleProtoData), 1444443);
        expect(
          input.transferMessage.amount.toInt() !=
              TWCardano.minAdaAmount(bundleProtoData),
          true,
        );
      }

      {
        // run plan and check result
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );

        expect(plan.availableAmount.toInt(), 11758890);
        expect(plan.amount.toInt(), 11758890 - 9984729 - 174161);
        expect(plan.fee.toInt(), 174161);
        expect(plan.change.toInt(), 9984729);
        expect(plan.utxos.length, 2);
        expect(
          bytesToInt(plan.availableTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
                  element.assetName == 'SUNDAE')
              .amount),
          20000000,
        );
        expect(plan.outputTokens.length, 1);
        expect(
          bytesToInt(plan.outputTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
                  element.assetName == 'SUNDAE')
              .amount),
          11000000,
        );
        expect(plan.changeTokens.length, 1);
        expect(
          bytesToInt(plan.changeTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
                  element.assetName == 'SUNDAE')
              .amount),
          9000000,
        );
      }

      // set plan with specific fee, to match the real transaction
      input.plan = Cardano.TransactionPlan(
        availableAmount: $fixnum.Int64(11758890),
        amount: $fixnum.Int64(1600000),
        fee: $fixnum.Int64(174102),
        change: $fixnum.Int64(9984788),
        availableTokens: [
          Cardano.TokenAmount.fromBuffer(
              input.utxos[0].tokenAmount[0].writeToBuffer()),
        ],
        outputTokens: [
          Cardano.TokenAmount.fromBuffer(
              input.utxos[0].tokenAmount[0].writeToBuffer())
            ..amount = intToBytes(11000000),
        ],
        changeTokens: [
          Cardano.TokenAmount.fromBuffer(
              input.utxos[0].tokenAmount[0].writeToBuffer())
            ..amount = intToBytes(9000000),
        ],
        utxos: [input.utxos[1], input.utxos[0]],
        error: Common.SigningError.OK,
      );

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );

      // https://cardanoscan.io/transaction/1dd24872d93d3b5091b98e19b9f920cd0c4369e4c5ca178e898152c52f00c162
      // curl -d '{"txHash":"1dd248..c162","txBody":"83a400..08f6"}' -H "Content-Type: application/json" https://<cardano-node>/api/txs/submit
      expect(output.error, Common.SigningError.OK);
      final encoded = output.encoded;
      expectHex(encoded,
          '83a400828258206975fcf7bbca745c85f50777f956219868fd9cad14ba496fed1371252e8df60f00825820f2d2b11c8c07c5c646f5b5af20fddf2f0a174743c6a1b13cca27e28a6ca34710000182825839018d98bea0414243dc84070f96265577e7e6cf702d62e871016885034ecc64bf258b8e330cf0cdd9fdb03e10b4e4ac08f5da1fdec6222a3468821a00186a00a1581c9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77a14653554e4441451a00a7d8c082583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b821a00985b14a1581c9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77a14653554e4441451a00895440021a0002a816031a03a6541ea100818258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df2905840c8cdee32bfd584f55cf334b4ec6f734635144736d48f882e647a7a6283f230bc5a67d4dd66a9e523e0c29c812ed1e3589febbcf96547a1fc6d061a7ccfb81308f6');
      final txid = output.txId;
      expectHex(txid,
          '1dd24872d93d3b5091b98e19b9f920cd0c4369e4c5ca178e898152c52f00c162');
    });

    test('SignTransferTokenMaxAmount_620b71', () {
      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  '46964521ad00d9b3f3d41f77c07e1b3093848048dbdf2d95cf900e15cdac0d7f'),
              outputIndex: $fixnum.Int64(0),
            ),
            address: ownAddress1,
            amount: $fixnum.Int64(2170871),
            // some token
            tokenAmount: [
              Cardano.TokenAmount(
                policyId: sundaeTokenPolicy,
                assetNameHex: '53554e444145',
                amount: intToBytes(20000000),
              ),
            ],
          ),
        ],
      );
      final privateKeyData = parse_hex(privateKeyTest1);
      input.privateKey.add(privateKeyData);
      input.transferMessage = Cardano.Transfer(
        toAddress:
            'addr1q92cmkgzv9h4e5q7mnrzsuxtgayvg4qr7y3gyx97ukmz3dfx7r9fu73vqn25377ke6r0xk97zw07dqr9y5myxlgadl2s0dgke5',
        changeAddress: ownAddress1,
        amount: $fixnum.Int64(666),
        tokenAmount: Cardano.TokenBundle(
          token: [
            Cardano.TokenAmount(
              policyId: sundaeTokenPolicy,
              assetNameHex: '53554e444145',
              amount: intToBytes(666),
            ),
          ],
        ),
        useMaxAmount: true,
      );
      input.ttl = $fixnum.Int64(61085916);

      {
        // run plan and check result
        final plan = Cardano.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin),
        );
        expect(plan.availableAmount.toInt(), 2170871);
        expect(plan.amount.toInt(), 2170871 - 167730);
        expect(plan.fee.toInt(), 167730);
        expect(plan.change.toInt(), 0);
        expect(plan.utxos.length, 1);
        expect(plan.availableTokens.length, 1);
        expect(
          bytesToInt(plan.availableTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
                  element.assetName == 'SUNDAE')
              .amount),
          20000000,
        );
        expect(plan.outputTokens.length, 1);
        expect(
          bytesToInt(plan.outputTokens
              .firstWhere((element) =>
                  element.policyId ==
                      '9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77' &&
                  element.assetName == 'SUNDAE')
              .amount),
          20000000,
        );
        expect(plan.changeTokens.length, 0);
      }

      // set plan with specific fee, to match the real transaction
      input.plan = Cardano.TransactionPlan(
        availableAmount: $fixnum.Int64(2170871),
        amount: $fixnum.Int64(1998526),
        fee: $fixnum.Int64(172345),
        change: $fixnum.Int64(0),
        availableTokens: [
          Cardano.TokenAmount.fromBuffer(
              input.utxos[0].tokenAmount[0].writeToBuffer()),
        ],
        outputTokens: [
          Cardano.TokenAmount.fromBuffer(
              input.utxos[0].tokenAmount[0].writeToBuffer()),
        ],
        utxos: [input.utxos[0]],
        error: Common.SigningError.OK,
      );

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );

      // https://cardanoscan.io/transaction/620b719338efb419b0e1417bfbe01fc94a62d5669a4b8cbbf4e32ecc1ca3b872
      // curl -d '{"txHash":"620b71..b872","txBody":"83a400..08f6"}' -H "Content-Type: application/json" https://<cardano-node>/api/txs/submit
      expect(output.error, Common.SigningError.OK);
      final encoded = output.encoded;
      expectHex(encoded,
          '83a4008182582046964521ad00d9b3f3d41f77c07e1b3093848048dbdf2d95cf900e15cdac0d7f00018182583901558dd902616f5cd01edcc62870cb4748c45403f1228218bee5b628b526f0ca9e7a2c04d548fbd6ce86f358be139fe680652536437d1d6fd5821a001e7ebea1581c9a9693a9a37912a5097918f97918d15240c92ab729a0b7c4aa144d77a14653554e4441451a01312d00021a0002a139031a03a418dca100818258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df2905840e1d1565cd747b20b0f10a92f068f3d5faebdee92b4b4a4b96ce14736d975e17d1446f7f51e64997a0bb38e0151dc738468161d574d6cfcd8040e4455ff46bc08f6');
      final txid = output.txId;
      expectHex(txid,
          '620b719338efb419b0e1417bfbe01fc94a62d5669a4b8cbbf4e32ecc1ca3b872');
    });

    test('CardanoSigning', () {
      const ownAddress =
          "addr1q83kuum4jhwu3gxdwftdv2vezr0etmt3tp7phw5assltzl6t4afzguegnkcrdzp79vdcqswly775f33jvtpayl280qeqts960l";
      const privateKey =
          "009aba22621d98e008c266a8d19c493f5f80a3a4f55048a83168a9c856726852fc240e6e95d7dc4e8ea599d09d64f84fdbe951b2282f5e5ed374252d17be9507643b2d078e607b5327397f212e4f6607ff0b6dfc93bdc9ad2bd0a682887edb9f304a573e99c7c2022c925511f004c7c9b89e8569080d09e2c53dfb1d53726852d4735794e3d32eac2b17d4d7c94742a77b7400b66fa11eaeb6ae38ba2dea84612f0c38fd68b9751ed4cb4ac48fb5e19f985f809fff1cfe5303fbfd29aca43d66";
      const gensTokenPolicy =
          "dda5fdb1002f7389b33e036b6afee82a8189becb6cba852e8b79b4fb";
      // Non UTF-8 assetName according to https://github.com/cardano-foundation/CIPs/tree/master/CIP-0067
      const gensTokenNameHex = "0014df1047454e53";
      const currentSlot = 138888357;

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  '7b377e0cf7b83d67bb6919008c38e1a63be86c4831a93ad0cb45778b9f2f7e28'),
              outputIndex: $fixnum.Int64(4),
            ),
            address: ownAddress,
            amount: $fixnum.Int64(1700000),
            // GENS token (asset1266q2ewhgul7jh3xqpvjzqarrepfjuler20akr).
            tokenAmount: [
              Cardano.TokenAmount(
                policyId: gensTokenPolicy,
                assetNameHex: gensTokenNameHex,
                amount: intToBytes(44660987),
              ),
            ],
          ),
        ],
        privateKey: [parse_hex(privateKey)],
        transferMessage: Cardano.Transfer(
          toAddress:
              'addr1q875r037fjeqveg6xv5wke922ff897eyrnshlj3ryp4mypzt4afzguegnkcrdzp79vdcqswly775f33jvtpayl280qeq7zgptp',
          changeAddress: ownAddress,
          amount: $fixnum.Int64(666),
          tokenAmount: Cardano.TokenBundle(
            token: [
              Cardano.TokenAmount(
                policyId: gensTokenPolicy,
                assetNameHex: gensTokenNameHex,
                amount: intToBytes(666),
              )
            ],
          ),
          useMaxAmount: true,
        ),
        ttl: $fixnum.Int64(currentSlot + 7200),
      );

      final plan = Cardano.TransactionPlan.fromBuffer(
        TWAnySigner.plan(input.writeToBuffer(), coin),
      );

      expect(plan.error, Common.SigningError.OK);
      {
        expect(plan.availableAmount, $fixnum.Int64(1700000));
        expect(plan.amount, $fixnum.Int64(1700000 - 167818));
        expect(plan.fee, $fixnum.Int64(167818));
        expect(plan.change, $fixnum.Int64(0));
        expect(plan.utxos.length, 1);
        expect(plan.availableTokens.length, 1);

        expect(plan.availableTokens[0].amount, intToBytes(44660987));
        // `assetName` must be empty as it's not a UTF-8 string.
        expect(plan.availableTokens[0].assetName, '');
        expect(plan.availableTokens[0].assetNameHex, gensTokenNameHex);

        expect(plan.outputTokens.length, 1);
        expect(plan.outputTokens[0].amount, intToBytes(44660987));
        // `assetName` must be empty as it's not a UTF-8 string.
        expect(plan.outputTokens[0].assetName, '');
        expect(plan.outputTokens[0].assetNameHex, gensTokenNameHex);
        expect(plan.changeTokens.length, 0);
      }

      // set plan with specific fee, to match the real transaction
      input.plan = plan;

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );

      // https://cardanoscan.io/transaction/df89e81fbaec7485ba65ac3a2ffe4121a888f4937d085f3ad4f7e8e5192dea74
      // curl -d '{"txHash":"620b71..b872","txBody":"83a400..08f6"}' -H "Content-Type: application/json" https://<cardano-node>/api/txs/submit
      expect(output.error, Common.SigningError.OK);
      final encoded = output.encoded;
      expectHex(encoded,
          '83a400818258207b377e0cf7b83d67bb6919008c38e1a63be86c4831a93ad0cb45778b9f2f7e2804018182583901fd41be3e4cb206651a3328eb64aa525272fb241ce17fca23206bb2044baf522473289db036883e2b1b8041df27bd44c63262c3d27d477832821a00176116a1581cdda5fdb1002f7389b33e036b6afee82a8189becb6cba852e8b79b4fba1480014df1047454e531a02a978fb021a00028f8a031a084760c5a10081825820748022805ee71f9fa31d06e60f14f0715a37c278c0690b565f26e1e1e83f930e5840386c5d05fb5cfdb11f1296e909a80314616cdd2779e5be5ea583e1a938ee8409f58b585c90248e1c0633638cc0f4517c03fdb59f17434267c2955e0fbbb3b609f6');
      final txid = output.txId;
      expectHex(txid,
          'df89e81fbaec7485ba65ac3a2ffe4121a888f4937d085f3ad4f7e8e5192dea74');
    });

    test('SignTransferTwoTokens', () {
      final input = createSampleInput(7000000);
      input.transferMessage.amount = $fixnum.Int64(1500000);
      input.transferMessage.tokenAmount = Cardano.TokenBundle(
        token: [
          Cardano.TokenAmount(
            policyId: sundaeTokenPolicy,
            assetNameHex: '53554e444145',
            amount: intToBytes(40000000),
          ),
          Cardano.TokenAmount(
            policyId: sundaeTokenPolicy,
            assetNameHex: '43554259',
            amount: intToBytes(2000000),
          ),
        ],
      );

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );
      expect(output.error,
          Common.SigningError.Error_invalid_requested_token_amount);
      final encoded = output.encoded;
      expectHex(encoded, '');
    });

    test('SignMessageWithKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          "d809b1b4b4c74734037f76aace501730a3fe2fca30b5102df99ad3f7c0103e48"
          "d54cde47e9041b31f3e6873d700d83f7a937bea746dadfa2c5b0a6a92502356c"
          "69272d81c376382b8a87c21370a7ae9618df8da708d1a9490939ec54ebe43000"
          "1111111111111111111111111111111111111111111111111111111111111111"
          "1111111111111111111111111111111111111111111111111111111111111111"
          "1111111111111111111111111111111111111111111111111111111111111111");

      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.ED25519Cardano);
      expectHex(
        publicKey.data,
        "e6f04522f875c1563682ca876ddb04c2e2e3ae718e3ff9f11c03dd9f9dccf698"
        "69272d81c376382b8a87c21370a7ae9618df8da708d1a9490939ec54ebe43000"
        "857eed804ff087b97f87848f6493e87257a8c5203cb9f422f6e7a7d8a4d299f3"
        "1111111111111111111111111111111111111111111111111111111111111111",
      );

      const sampleMessageStr = "Hello world";
      final sampleMessage = TWData.createWithString(sampleMessageStr);

      final signature = privateKey.sign(
          sampleMessage.bytes()!, TWCurve.ED25519ExtendedCardano);

      const sampleRightSignature =
          "1096ddcfb2ad21a4c0d861ef3fabe18841e8de88105b0d8e36430d7992c588634ead4100c32b2800b31b65e014d54a8238bdda63118d829bf0bcf1b631e86f0e";
      expectHex(signature, sampleRightSignature);
    });

    test('AnySignTransfer1', () {
      final input = createSampleInput(7000000);

      final output = Cardano.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );

      expect(output.error, Common.SigningError.OK);

      final encoded = output.encoded;
      expectHex(encoded,
          '83a40082825820554f2fd942a23d06835d26bbd78f0106fa94c8a551114a0bef81927f66467af000825820f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e76701018282583901558dd902616f5cd01edcc62870cb4748c45403f1228218bee5b628b526f0ca9e7a2c04d548fbd6ce86f358be139fe680652536437d1d6fd51a006acfc082583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a000ca96c021a000298d4031a032dcd55a100818258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df29058407cf591599852b5f5e007fdc241062405c47e519266c0d884b0767c1d4f5eacce00db035998e53ed10ca4ba5ce4aac8693798089717ce6cf4415f345cc764200ef6');
      final txid = output.txId;
      expectHex(txid,
          '9b5b15e133cd73ccaa85307d2986aebc846505118a2eb4e6111e6b4b67d1f389');
    });

    test('AnyPlan1', () {
      final input = createSampleInput(7000000);

      final plan = Cardano.TransactionPlan.fromBuffer(
        TWAnySigner.plan(input.writeToBuffer(), coin),
      );

      expect(plan.error, Common.SigningError.OK);
      expect(plan.amount.toInt(), 7000000);
      expect(plan.availableAmount.toInt(), 8000000);
      expect(plan.fee.toInt(), 170196);
      expect(plan.change.toInt(), 829804);
      expect(plan.utxos.length, 2);
      expect(plan.utxos[0].amount.toInt(), 6500000);
      expect(plan.utxos[1].amount.toInt(), 1500000);

      expectHex(plan.writeToBuffer(),
          '0880a4e80310c09fab0318d4b10a20ecd2324292010a220a20554f2fd942a23d06835d26bbd78f0106fa94c8a551114a0bef81927f66467af01267616464723171383034336d356865656179646e76746d6d6b7975686536717635686176766873663064323671336a7967737370786c796670796b3679716b77307968747976747230666c656b6a3834753634617a38326375666d716e36357a6473796c7a6b323318a0dd8c034293010a240a20f074134aabbfb13b8aec7cf5465b1e5a862bde5cb88532cc7e64619179b3e76710011267616464723171383034336d356865656179646e76746d6d6b7975686536717635686176766873663064323671336a7967737370786c796670796b3679716b77307968747976747230666c656b6a3834753634617a38326375666d716e36357a6473796c7a6b323318e0c65b');
    });
  });
}
