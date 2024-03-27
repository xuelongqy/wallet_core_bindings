import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cardano.pb.dart' as Cardano;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

final privateKeyTest1 =
    "089b68e458861be0c44bf9f7967f05cc91e51ede86dc679448a3566990b7785bd48c330875b1e0d03caaed0e67cecc42075dce1c7a13b1c49240508848ac82f603391c68824881ae3fc23a56a1a75ada3b96382db502e37564e84a5413cfaf1290dbd508e5ec71afaea98da2df1533c22ef02a26bb87b31907d0b2738fb7785b38d53aa68fc01230784c9209b2b2a2faf28491b3b1f1d221e63e704bbd0403c4154425dfbb01a2c5c042da411703603f89af89e57faae2946e2a5c18b1c5ca0e";
final ownAddress1 =
    "addr1q8043m5heeaydnvtmmkyuhe6qv5havvhsf0d26q3jygsspxlyfpyk6yqkw0yhtyvtr0flekj84u64az82cufmqn65zdsylzk23";
final stakingAddress1 =
    "stake1u80jysjtdzqt88jt4jx93h5lumfr67d273r4vwyasfa2pxcwxllmx";
final poolIdNufi = "7d7ac07a2f2a25b7a4db868a40720621c4939cf6aefbb9a11464f1a6";

void main() {
  group('CardanoStaking', () {
    const coin = TWCoinType.TWCoinTypeCardano;

    test('RegisterStakingKey', () {
      final privateKeyData = parse_hex(privateKeyTest1);
      final publicKey = TWPrivateKey.createWithData(privateKeyData)
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519Cardano);
      final ownAddress =
          TWAnyAddress.createWithPublicKey(publicKey: publicKey, coin: coin)
              .description;
      expect(ownAddress, ownAddress1);
      final stakingAddress = TWCardano.getStakingAddress(ownAddress);
      expect(stakingAddress, stakingAddress1);
      final poolId = parse_hex(poolIdNufi);

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "cba84549f07f2128410c0a22731f2c57f2a617746e8edc61b295cd8792638dca"),
              outputIndex: $fixnum.Int64(1),
            ),
            address: ownAddress,
            amount: $fixnum.Int64(10000000),
          ),
        ],
        privateKey: [privateKeyData],
        transferMessage: Cardano.Transfer(
          toAddress: ownAddress,
          changeAddress: ownAddress,
          amount: $fixnum.Int64(5000000),
          useMaxAmount: true,
        ),
        ttl: $fixnum.Int64(69986091),
        // Register staking key, 2 ADA deposit
        registerStakingKey: Cardano.RegisterStakingKey(
          stakingAddress: stakingAddress,
          depositAmount: $fixnum.Int64(2000000),
        ),
      );

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);

      final encoded = output.encoded;
      expectHex(encoded,
          '83a50081825820cba84549f07f2128410c0a22731f2c57f2a617746e8edc61b295cd8792638dca01018182583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a007772fa021a00029f06031a042be72b048182008200581cdf22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09ba100828258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df2905840d08ed71da87d0928090edd9e226496ab109f2eee7926ac2ce51e7abe89a4f513c4afe2b85b71595e862e7f6fc992d14d2416a6e53a1961da7d26d3cf3f823400825820e554163344aafc2bbefe778a6953ddce0583c2f8e0a0686929c020ca33e06932584079ed55400cebc70c56ca87ba09009dfc298c64768f90a9139bf2e7f134250927c614ee846253fac33e652f1b50373d349fdfe13c207968c2a10991824fe2a10ef6');
      final txid = output.txId;
      expectHex(txid,
          '6a206fe4df76e12499b4fd9722f33429f4d93f8a996f9f523fa6c02a8301386b');
    });

    test('DeregisterStakingKey', () {
      final privateKeyData = parse_hex(privateKeyTest1);
      final publicKey = TWPrivateKey.createWithData(privateKeyData)
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519Cardano);
      final ownAddress =
          TWAnyAddress.createWithPublicKey(publicKey: publicKey, coin: coin)
              .description;
      expect(ownAddress, ownAddress1);
      final stakingAddress = TWCardano.getStakingAddress(ownAddress);
      expect(stakingAddress, stakingAddress1);
      final poolId = parse_hex(poolIdNufi);

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "cba84549f07f2128410c0a22731f2c57f2a617746e8edc61b295cd8792638dca"),
              outputIndex: $fixnum.Int64(1),
            ),
            address: ownAddress,
            amount: $fixnum.Int64(10000000),
          ),
        ],
        privateKey: [privateKeyData],
        transferMessage: Cardano.Transfer(
          toAddress: ownAddress,
          changeAddress: ownAddress,
          amount: $fixnum.Int64(5000000),
          useMaxAmount: true,
        ),
        ttl: $fixnum.Int64(69986091),
        // Deregister staking key, get back 2 ADA deposit
        deregisterStakingKey: Cardano.DeregisterStakingKey(
          stakingAddress: stakingAddress,
          undepositAmount: $fixnum.Int64(2000000),
        ),
      );

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);

      final encoded = output.encoded;
      expectHex(encoded,
          '83a50081825820cba84549f07f2128410c0a22731f2c57f2a617746e8edc61b295cd8792638dca01018182583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a00b47bfa021a00029f06031a042be72b048182018200581cdf22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09ba100828258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df290584056619a7d6192b6f68c31a43e927c893161fd994d5c1bcc16f3710cf5e5e652e01f118d55f0110e9de34edc050d509748bea637db5c34f4fe342ae262ccb5520d825820e554163344aafc2bbefe778a6953ddce0583c2f8e0a0686929c020ca33e069325840d23680fdd8aa63e10efccc550eb726743b653008952f9d731d076d1df8106b0401823ebb195127b211389f1bc2c3f6ededbcec04bc8f0de93607a2409421e006f6');
      final txid = output.txId;
      expectHex(txid,
          '1caae2456e5471cc77e73410da475fb0a23874c18c1ea55f9267c59767caef0a');
    });

    test('Redelegate', () {
      final privateKeyData = parse_hex(privateKeyTest1);
      final publicKey = TWPrivateKey.createWithData(privateKeyData)
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519Cardano);
      final ownAddress =
          TWAnyAddress.createWithPublicKey(publicKey: publicKey, coin: coin)
              .description;
      expect(ownAddress, ownAddress1);
      final stakingAddress = TWCardano.getStakingAddress(ownAddress);
      expect(stakingAddress, stakingAddress1);
      final poolId = parse_hex(poolIdNufi);

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "cba84549f07f2128410c0a22731f2c57f2a617746e8edc61b295cd8792638dca"),
              outputIndex: $fixnum.Int64(1),
            ),
            address: ownAddress,
            amount: $fixnum.Int64(10000000),
          ),
        ],
        privateKey: [privateKeyData],
        transferMessage: Cardano.Transfer(
          toAddress: ownAddress,
          changeAddress: ownAddress,
          amount: $fixnum.Int64(5000000),
          useMaxAmount: true,
        ),
        ttl: $fixnum.Int64(69986091),
        // Delegate, no deposit
        delegate: Cardano.Delegate(
          stakingAddress: stakingAddress,
          poolId: poolId,
          depositAmount: $fixnum.Int64(0),
        ),
      );

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);

      final encoded = output.encoded;
      expectHex(encoded,
          '83a50081825820cba84549f07f2128410c0a22731f2c57f2a617746e8edc61b295cd8792638dca01018182583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a0095f251021a0002a42f031a042be72b048183028200581cdf22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b581c7d7ac07a2f2a25b7a4db868a40720621c4939cf6aefbb9a11464f1a6a100828258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df2905840fb48f3ddbfc2d4ca231a0581c5b456019aa4215ed5a2447ba89a4860569f9e7296afd3a0a81506882d8bda33683e623e6d8033786275369f7e247d866e017c06825820e554163344aafc2bbefe778a6953ddce0583c2f8e0a0686929c020ca33e069325840e26f696a6cd1c34101623568c9efe3796ff5855ada0e2e0cf557c7fc2148f6b2af176aff40a1f9c13fb29d9636c49f774d4a967c71f052f865cfaf0d02d5bb05f6');
      final txid = output.txId;
      expectHex(txid,
          '985f613fb8b86dad35f075599099776e50fc2a6aa74ee4b37c14fd9f2c0f0891');
    });

    test('RegisterAndDelegate_similar53339b', () {
      final privateKeyData = parse_hex(privateKeyTest1);
      final publicKey = TWPrivateKey.createWithData(privateKeyData)
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519Cardano);
      final ownAddress =
          TWAnyAddress.createWithPublicKey(publicKey: publicKey, coin: coin)
              .description;
      expect(ownAddress, ownAddress1);
      final stakingAddress = TWCardano.getStakingAddress(ownAddress);
      expect(stakingAddress, stakingAddress1);
      final poolId = parse_hex(poolIdNufi);

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "9b06de86b253549b99f6a050b61217d8824085ca5ed4eb107a5e7cce4f93802e"),
              outputIndex: $fixnum.Int64(0),
            ),
            address: ownAddress,
            amount: $fixnum.Int64(4000000),
          ),
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "9b06de86b253549b99f6a050b61217d8824085ca5ed4eb107a5e7cce4f93802e"),
              outputIndex: $fixnum.Int64(1),
            ),
            address: ownAddress,
            amount: $fixnum.Int64(26651312),
          ),
        ],
        privateKey: [privateKeyData],
        transferMessage: Cardano.Transfer(
          toAddress: ownAddress,
          changeAddress: ownAddress,
          amount: $fixnum.Int64(4000000),
          useMaxAmount: true,
        ),
        ttl: $fixnum.Int64(69885081),
        // Register staking key, 2 ADA desposit
        registerStakingKey: Cardano.RegisterStakingKey(
          stakingAddress: stakingAddress,
          depositAmount: $fixnum.Int64(2000000),
        ),
        // Delegate, no deposit
        delegate: Cardano.Delegate(
          stakingAddress: stakingAddress,
          poolId: poolId,
          depositAmount: $fixnum.Int64(0),
        ),
      );

      {
        // run plan and check result
        final plan = Cardano.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));

        final amount = 28475125;
        final availAmount = 30651312;
        expect(plan.availableAmount.toInt(), availAmount);
        expect(plan.amount.toInt(), amount);
        final fee = 176187;
        expect(plan.fee.toInt(), fee);
        expect(plan.change.toInt(), availAmount - 2000000 - amount - fee);
        expect(plan.change.toInt(), 0);

        // perform sign with default plan
        final output = Cardano.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));

        expect(output.error, Common.SigningError.OK);

        final encoded = output.encoded;
        expectHex(encoded,
            '83a500828258209b06de86b253549b99f6a050b61217d8824085ca5ed4eb107a5e7cce4f93802e008258209b06de86b253549b99f6a050b61217d8824085ca5ed4eb107a5e7cce4f93802e01018182583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a01b27ef5021a0002b03b031a042a5c99048282008200581cdf22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b83028200581cdf22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b581c7d7ac07a2f2a25b7a4db868a40720621c4939cf6aefbb9a11464f1a6a100828258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df2905840677c901704be027d9a1734e8aa06f0700009476fa252baaae0de280331746a320a61456d842d948ea5c0e204fc36f3bd04c88ca7ee3d657d5a38014243c37c07825820e554163344aafc2bbefe778a6953ddce0583c2f8e0a0686929c020ca33e0693258401fa21bdc62b85ca217bf08cbacdeba2fadaf33dc09ee3af9cc25b40f24822a1a42cfbc03585cc31a370ef75aaec4d25db6edcf329e40a4e725ec8718c94f220af6');
        final txid = output.txId;
        expectHex(txid,
            '96a781fd6481b6a7fd3926da110265e8c44b53947b81daa84da5b148825d02aa');
      }

      // set different plan, with exact fee
      final amount = 28467322;
      input.plan = Cardano.TransactionPlan(
        amount: $fixnum.Int64(amount),
        availableAmount: $fixnum.Int64(28651312),
        fee: $fixnum.Int64(183990),
        change: $fixnum.Int64(0),
        utxos: [
          input.utxos[0],
          input.utxos[1],
        ],
        error: Common.SigningError.OK,
      );

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // Similar to (but with different key): https://cardanoscan.io/transaction/53339b758009a0896a87e9569cadcdb5a095ffe0c100cc7483d72e817e81b60b
      final encoded = output.encoded;
      expectHex(encoded,
          '83a500828258209b06de86b253549b99f6a050b61217d8824085ca5ed4eb107a5e7cce4f93802e008258209b06de86b253549b99f6a050b61217d8824085ca5ed4eb107a5e7cce4f93802e01018182583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a01b2607a021a0002ceb6031a042a5c99048282008200581cdf22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b83028200581cdf22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b581c7d7ac07a2f2a25b7a4db868a40720621c4939cf6aefbb9a11464f1a6a100828258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df29058405d8b21c993aec7a7bdf0c832e5688920b64b665e1e36a2e6040d6dd8ad195e7774df3c1377047737d8b676fa4115e38fbf6ef854904db6d9c8ee3e26e8561408825820e554163344aafc2bbefe778a6953ddce0583c2f8e0a0686929c020ca33e06932584088a3f6387693f9077d11a6e245e024b791074bcaa26c034e687d67f3324b6f90a437d33d0343e11c7dee1a28270c223e02080e452fe97cdc93d26c720ab6b805f6');
      final txid = output.txId;
      expectHex(txid,
          '23e1d1bc27f6de57e323d232d44c909fb41ee2ebfff28b82ca8cae6947866ea7');
    });

    test('Withdraw_similarf48098', () {
      final privateKeyData = parse_hex(privateKeyTest1);
      final publicKey = TWPrivateKey.createWithData(privateKeyData)
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519Cardano);
      final ownAddress =
          TWAnyAddress.createWithPublicKey(publicKey: publicKey, coin: coin)
              .description;
      expect(ownAddress, ownAddress1);
      final stakingAddress = TWCardano.getStakingAddress(ownAddress);
      expect(stakingAddress, stakingAddress1);
      final poolId = parse_hex(poolIdNufi);

      final withdrawAmount = 3468;

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "7dfd2c579794314b1f84efc9db932a098e440ccefb874945591f1d4e85a9152a"),
              outputIndex: $fixnum.Int64(0),
            ),
            address: ownAddress,
            amount: $fixnum.Int64(6305913),
          ),
        ],
        privateKey: [privateKeyData],
        transferMessage: Cardano.Transfer(
          toAddress: ownAddress,
          changeAddress: ownAddress,
          amount: $fixnum.Int64(6000000),
          useMaxAmount: true,
        ),
        ttl: $fixnum.Int64(71678326),
        // Withdraw available amount
        withdraw: Cardano.Withdraw(
          stakingAddress: stakingAddress,
          withdrawAmount: $fixnum.Int64(withdrawAmount),
        ),
      );

      {
        // run plan and check result
        final plan = Cardano.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));

        final amount = 6137599;
        final availAmount = 6305913;
        expect(plan.availableAmount.toInt(), availAmount);
        expect(plan.amount.toInt(), amount);
        final fee = 171782;
        expect(plan.fee.toInt(), fee);
        expect(
            plan.change.toInt(), availAmount + withdrawAmount - amount - fee);
        expect(plan.change.toInt(), 0);

        // perform sign with default plan
        final output = Cardano.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));

        expect(output.error, Common.SigningError.OK);

        final encoded = output.encoded;
        expectHex(encoded,
            '83a500818258207dfd2c579794314b1f84efc9db932a098e440ccefb874945591f1d4e85a9152a00018182583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a005da6ff021a00029f06031a0445b97605a1581de1df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b190d8ca100828258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df29058401ebaca2876fd17122404912a2558a98109cdf0f990a938d2917fa2c3b8c4e55e18a2cbabfa82fff03fa0d7ab8b88ca01ed18e42af3bfc4cda7f423a3aa30c00b825820e554163344aafc2bbefe778a6953ddce0583c2f8e0a0686929c020ca33e069325840777f04fa8f083fe562aecf78898aaaaac36e2cc6ca962f6ffb01e84a421cae1860496db79b2c5fb2879524c3d5121060b9ea1e693336230c6e5338e14c4c3303f6');
        final txid = output.txId;
        expectHex(txid,
            '6dcf3956232953fc25b8355fb1ded1e912b5802090fd21434d789087d6329683');
      }
      // set different plan, with exact fee
      final amount = 6137599;
      input.plan = Cardano.TransactionPlan(
        amount: $fixnum.Int64(amount),
        availableAmount: $fixnum.Int64(6305913),
        fee: $fixnum.Int64(171782),
        change: $fixnum.Int64(0),
        utxos: [
          input.utxos[0],
        ],
        error: Common.SigningError.OK,
      );

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // Similar to (but with different key): https://cardanoscan.io/transaction/f480985662886e419a22673d31944455ab8891a80940bf392a37d9288ea9cf01?tab=withdrawals
      final encoded = output.encoded;
      expectHex(encoded,
          '83a500818258207dfd2c579794314b1f84efc9db932a098e440ccefb874945591f1d4e85a9152a00018182583901df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b1a005da6ff021a00029f06031a0445b97605a1581de1df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b190d8ca100828258206d8a0b425bd2ec9692af39b1c0cf0e51caa07a603550e22f54091e872c7df29058401ebaca2876fd17122404912a2558a98109cdf0f990a938d2917fa2c3b8c4e55e18a2cbabfa82fff03fa0d7ab8b88ca01ed18e42af3bfc4cda7f423a3aa30c00b825820e554163344aafc2bbefe778a6953ddce0583c2f8e0a0686929c020ca33e069325840777f04fa8f083fe562aecf78898aaaaac36e2cc6ca962f6ffb01e84a421cae1860496db79b2c5fb2879524c3d5121060b9ea1e693336230c6e5338e14c4c3303f6');
      final txid = output.txId;
      expectHex(txid,
          '6dcf3956232953fc25b8355fb1ded1e912b5802090fd21434d789087d6329683');
    });
  });
}
