import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cardano.pb.dart' as Cardano;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

const privateKeyTest1 =
    "40b03ce671f57c56b3483a9f946d4650ed03b1583357018b40aeef3bec81e74df8472ff07b6dfe76e83ea50102f7063595fb24aedaaf01dd9b2cd526a5c7f2db2275254e04a05729852388f1be93a47f859f42087c22e4c78f9d4f6f09d9557820716973437afb26051f2493813d22fc356a1fbdd91ab44f3294ca26ec81e74d7729d9e2323846c7545e6d780bbeb2df204c1a9a1b58abfac647200aefa3cbc1e0746aaad10f546ceb656c75e4d6dadffa5197cf9dc58579f1348a6b3d397d58";
const ownAddress1 =
    "addr1qx2v7hcfyctmv9vv42yntu40um8t67lxkdzq24gvkfjmy8mlajpf8n6kj3v2sprfkaqfqhtayzjy7nx6apm0vn3j0dqs8x4237";
const stakingAddress1 =
    "stake1u9l7eq5neatfgk9gq35mwsyst47jpfz0fndwsahkfce8ksgsx8ef2";
const dRepAddressCIP129 =
    "drep1y29h2q6cst2pvkl2sqqvf5ljcy36uv7pmy482xnczddzgqshus24w";
const dRepAddressCIP105 =
    "drep13d6sxkyz6st9h65qqrzd8ukpywhr8swe9f6357qntgjqye0gttd";

void main() {
  initTest();
  group('CardanoVoteDelegation', () {
    const coin = TWCoinType.Cardano;

    test('DelegateToSpecificDRepCIP129', () {
      final privateKeyData = parse_hex(privateKeyTest1);
      final publicKey = TWPrivateKey.createWithData(privateKeyData)
          .getPublicKeyByType(TWPublicKeyType.ED25519Cardano);
      final ownAddress =
          TWAnyAddress.createWithPublicKey(publicKey, coin).description;
      expect(ownAddress, ownAddress1);
      final stakingAddress = TWCardano.getStakingAddress(ownAddress);
      expect(stakingAddress, stakingAddress1);

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "b02dfc255f1048260d1915c9ebcfcdb69bab7677e75d45ec1245c468f0283d7e"),
              outputIndex: 0.toInt64(),
            ),
            address: ownAddress,
            amount: 4790541.toInt64(),
          ),
        ],
        privateKey: [privateKeyData],
        transferMessage: Cardano.Transfer(
          toAddress: ownAddress,
          changeAddress: ownAddress,
          useMaxAmount: true,
        ),
        ttl: 148398202.toInt64(),
        // Vote delegate to always abstain
        voteDelegation: Cardano.VoteDelegation(
          stakingAddress: stakingAddress,
          drepType: Cardano.VoteDelegation_DRepType.DREP_ID,
          drepId: dRepAddressCIP129,
        ),
      );

      final plan = Cardano.TransactionPlan(
        amount: 4617164.toInt64(),
        fee: 173377.toInt64(),
        change: 0.toInt64(),
        utxos: input.utxos,
        error: Common.SigningError.OK,
      );
      input.plan = plan;

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);

      // Broadcasted here: https://cardanoscan.io/transaction/290f07d69f75f396e78b4ee65088dbf7dc63b86d5b3a5bb7d6aeec59bd487d25
      final txid = output.txId;
      expectHex(txid,
          '290f07d69f75f396e78b4ee65088dbf7dc63b86d5b3a5bb7d6aeec59bd487d25');

      final encoded = output.encoded;
      expectHex(encoded,
          '84a50081825820b02dfc255f1048260d1915c9ebcfcdb69bab7677e75d45ec1245c468f0283d7e0001818258390194cf5f092617b6158caa8935f2afe6cebd7be6b34405550cb265b21f7fec8293cf569458a80469b740905d7d20a44f4cdae876f64e327b411a004673cc021a0002a541031a08d8607a048183098200581c7fec8293cf569458a80469b740905d7d20a44f4cdae876f64e327b418200581c8b75035882d4165bea8000c4d3f2c123ae33c1d92a751a78135a2402a10082825820b4ccb8cb788b37b038d327f0da87b32c6abedf4b131c87103637ef2ed04710365840c3f26171f723e4876cccbbac40edb373c64ccee8b5eec1b39bfa2a478f0b963540a7e91f10423b2a42b43732c5fbbe536c85dbc228e9b395889c05bf5cb1190982582064982cd6a2a0f49aa8225ab48b3ae3bffab2e19e486f932b303052dc227bc4035840518b68bcca2b0d732614b114f384abfffe79b92877d599bf7e9810642f4eef2df696ea113b698eff6a6e25a791d342faef0ef565aaeed3226c7b88f357ba1900f5f6');
    });

    test('DelegateToSpecificDRepCIP105', () {
      final privateKeyData = parse_hex(privateKeyTest1);
      final publicKey = TWPrivateKey.createWithData(privateKeyData)
          .getPublicKeyByType(TWPublicKeyType.ED25519Cardano);
      final ownAddress =
          TWAnyAddress.createWithPublicKey(publicKey, coin).description;
      expect(ownAddress, ownAddress1);
      final stakingAddress = TWCardano.getStakingAddress(ownAddress);
      expect(stakingAddress, stakingAddress1);

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "b02dfc255f1048260d1915c9ebcfcdb69bab7677e75d45ec1245c468f0283d7e"),
              outputIndex: 0.toInt64(),
            ),
            address: ownAddress,
            amount: 4790541.toInt64(),
          ),
        ],
        privateKey: [privateKeyData],
        transferMessage: Cardano.Transfer(
          toAddress: ownAddress,
          changeAddress: ownAddress,
          useMaxAmount: true,
        ),
        ttl: 148398202.toInt64(),
        // Vote delegate to always abstain
        voteDelegation: Cardano.VoteDelegation(
          stakingAddress: stakingAddress,
          drepType: Cardano.VoteDelegation_DRepType.DREP_ID,
          drepId: dRepAddressCIP105,
        ),
      );

      final plan = Cardano.TransactionPlan(
        amount: 4617164.toInt64(),
        availableAmount: 4790541.toInt64(),
        fee: 173377.toInt64(),
        change: 0.toInt64(),
        utxos: input.utxos,
        error: Common.SigningError.OK,
      );
      input.plan = plan;

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);

      // Broadcasted here: https://cardanoscan.io/transaction/290f07d69f75f396e78b4ee65088dbf7dc63b86d5b3a5bb7d6aeec59bd487d25
      final txid = output.txId;
      expectHex(txid,
          '290f07d69f75f396e78b4ee65088dbf7dc63b86d5b3a5bb7d6aeec59bd487d25');

      final encoded = output.encoded;
      expectHex(encoded,
          '84a50081825820b02dfc255f1048260d1915c9ebcfcdb69bab7677e75d45ec1245c468f0283d7e0001818258390194cf5f092617b6158caa8935f2afe6cebd7be6b34405550cb265b21f7fec8293cf569458a80469b740905d7d20a44f4cdae876f64e327b411a004673cc021a0002a541031a08d8607a048183098200581c7fec8293cf569458a80469b740905d7d20a44f4cdae876f64e327b418200581c8b75035882d4165bea8000c4d3f2c123ae33c1d92a751a78135a2402a10082825820b4ccb8cb788b37b038d327f0da87b32c6abedf4b131c87103637ef2ed04710365840c3f26171f723e4876cccbbac40edb373c64ccee8b5eec1b39bfa2a478f0b963540a7e91f10423b2a42b43732c5fbbe536c85dbc228e9b395889c05bf5cb1190982582064982cd6a2a0f49aa8225ab48b3ae3bffab2e19e486f932b303052dc227bc4035840518b68bcca2b0d732614b114f384abfffe79b92877d599bf7e9810642f4eef2df696ea113b698eff6a6e25a791d342faef0ef565aaeed3226c7b88f357ba1900f5f6');
    });

    test('DelegateToAlwaysAbstain', () {
      final privateKeyData = parse_hex(privateKeyTest1);
      final publicKey = TWPrivateKey.createWithData(privateKeyData)
          .getPublicKeyByType(TWPublicKeyType.ED25519Cardano);
      final ownAddress =
          TWAnyAddress.createWithPublicKey(publicKey, coin).description;
      expect(ownAddress, ownAddress1);
      final stakingAddress = TWCardano.getStakingAddress(ownAddress);
      expect(stakingAddress, stakingAddress1);

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "6a96dc0aaa9a7ec6cd7dfcea679a71ff55e7661d609772829f3a4a33a0b7c942"),
              outputIndex: 0.toInt64(),
            ),
            address: ownAddress,
            amount: 5307944.toInt64(),
          ),
        ],
        privateKey: [privateKeyData],
        transferMessage: Cardano.Transfer(
          toAddress: ownAddress,
          changeAddress: ownAddress,
          useMaxAmount: true,
        ),
        ttl: 148390086.toInt64(),
        // Vote delegate to always abstain
        voteDelegation: Cardano.VoteDelegation(
          stakingAddress: stakingAddress,
          drepType: Cardano.VoteDelegation_DRepType.DREP_ALWAYS_ABSTAIN,
        ),
      );

      final plan = Cardano.TransactionPlan(
        amount: 5135887.toInt64(),
        availableAmount: 5307944.toInt64(),
        fee: 172057.toInt64(),
        change: 0.toInt64(),
        utxos: input.utxos,
        error: Common.SigningError.OK,
      );
      input.plan = plan;

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);

      // Broadcasted here: https://cardanoscan.io/transaction/99b8a9d39e6c0c7df8ff3004097b68f7e6acd0e382182126afa00859c37b1bda
      final txid = output.txId;
      expectHex(txid,
          '99b8a9d39e6c0c7df8ff3004097b68f7e6acd0e382182126afa00859c37b1bda');

      final encoded = output.encoded;
      expectHex(encoded,
          '84a500818258206a96dc0aaa9a7ec6cd7dfcea679a71ff55e7661d609772829f3a4a33a0b7c9420001818258390194cf5f092617b6158caa8935f2afe6cebd7be6b34405550cb265b21f7fec8293cf569458a80469b740905d7d20a44f4cdae876f64e327b411a004e5e0f021a0002a019031a08d840c6048183098200581c7fec8293cf569458a80469b740905d7d20a44f4cdae876f64e327b418102a10082825820b4ccb8cb788b37b038d327f0da87b32c6abedf4b131c87103637ef2ed04710365840c5ff299707cab2067d4c7d62cc1e72fd73c510d5d509376fea25ec8e7545fdb686db986a88b9a50c7100b61d564dd40fb796c1aeb1a2a1d3555df2d0cc086e0282582064982cd6a2a0f49aa8225ab48b3ae3bffab2e19e486f932b303052dc227bc4035840555ee0ed2bc5ed50e3a22981b08e61867353c6a591265e5b66aec736ba0ee12eb5b181a38e678175df84b7bc8686b74fbf37e1bc3773748d5af002f1501a5d00f5f6');
    });

    test('DelegateToNoConfidence', () {
      final privateKeyData = parse_hex(privateKeyTest1);
      final publicKey = TWPrivateKey.createWithData(privateKeyData)
          .getPublicKeyByType(TWPublicKeyType.ED25519Cardano);
      final ownAddress =
          TWAnyAddress.createWithPublicKey(publicKey, coin).description;
      expect(ownAddress, ownAddress1);
      final stakingAddress = TWCardano.getStakingAddress(ownAddress);
      expect(stakingAddress, stakingAddress1);

      final input = Cardano.SigningInput(
        utxos: [
          Cardano.TxInput(
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  "8de1ec78274095fbc02ad579b471c9394665d402f29fc8329f8de61039328bbf"),
              outputIndex: 1.toInt64(),
            ),
            address: ownAddress,
            amount: 5000000.toInt64(),
          ),
        ],
        privateKey: [privateKeyData],
        transferMessage: Cardano.Transfer(
          toAddress: ownAddress,
          changeAddress: ownAddress,
          useMaxAmount: true,
        ),
        ttl: 148393182.toInt64(),
        // Vote delegate to always abstain
        voteDelegation: Cardano.VoteDelegation(
          stakingAddress: stakingAddress,
          drepType: Cardano.VoteDelegation_DRepType.DREP_NO_CONFIDENCE,
        ),
      );

      final plan = Cardano.TransactionPlan(
        amount: 4827943.toInt64(),
        availableAmount: 5000000.toInt64(),
        fee: 172057.toInt64(),
        change: 0.toInt64(),
        utxos: input.utxos,
        error: Common.SigningError.OK,
      );
      input.plan = plan;

      final output = Cardano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);

      // Broadcasted here: https://cardanoscan.io/transaction/b2fa7c73261af656bd7dd3869d3f3e57e527d7c0777f82766c851a627defb4e2
      final txid = output.txId;
      expectHex(txid,
          'b2fa7c73261af656bd7dd3869d3f3e57e527d7c0777f82766c851a627defb4e2');

      final encoded = output.encoded;
      expectHex(encoded,
          '84a500818258208de1ec78274095fbc02ad579b471c9394665d402f29fc8329f8de61039328bbf0101818258390194cf5f092617b6158caa8935f2afe6cebd7be6b34405550cb265b21f7fec8293cf569458a80469b740905d7d20a44f4cdae876f64e327b411a0049ab27021a0002a019031a08d84cde048183098200581c7fec8293cf569458a80469b740905d7d20a44f4cdae876f64e327b418103a10082825820b4ccb8cb788b37b038d327f0da87b32c6abedf4b131c87103637ef2ed04710365840ee72cde1827222eb587ada0f4dc4a6f4a35a3059d91c8cebdca0d8424126f322db540f985e0e8968e526c5bdd15a63b04afcd7864bd45a038de38ce057bbf00982582064982cd6a2a0f49aa8225ab48b3ae3bffab2e19e486f932b303052dc227bc4035840895174677319cfc209030d64b6d50bce1604f6b30b873d5905bb3d33551e01bb7d340a5f3f36e60e6fa42befcb2bec4f0f890e1ec6977b064b21511837e8cc0ff5f6');
    });
  });
}
