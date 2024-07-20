import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

void main() async {
  await initWalletCoreImpl();

  group(TWAnyAddress, () {
    test('Invalid string', () {
      const string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
      final btcAddress = TWAnyAddress(string, TWCoinType.Bitcoin);
      final ethAddress = TWAnyAddress(string, TWCoinType.Ethereum);

      expect(btcAddress.pointer, 0);
      expect(ethAddress.pointer != 0, true);
      expect(ethAddress.coin, TWCoinType.Ethereum);
    });

    test('Data', () {
      // ethereum
      {
        const string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
        final addr = TWAnyAddress(string, TWCoinType.Ethereum);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash, '4e5b2e1dc63f6b91cb6cd759936495434c7e972f');
      }

      // smartBCH
      {
        const string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
        final addr = TWAnyAddress(string, TWCoinType.SmartBitcoinCash);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash, '4e5b2e1dc63f6b91cb6cd759936495434c7e972f');
      }

      // KuCoin Community Chain
      {
        const string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
        final addr = TWAnyAddress(string, TWCoinType.KuCoinCommunityChain);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash, '4e5b2e1dc63f6b91cb6cd759936495434c7e972f');
      }

      // bnb address key hash
      {
        const string = 'bnb1hlly02l6ahjsgxw9wlcswnlwdhg4xhx38yxpd5';
        final addr = TWAnyAddress(string, TWCoinType.Binance);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash, 'bffe47abfaede50419c577f1074fee6dd1535cd1');
      }

      // bitcoin segwit witness program
      {
        const string = 'bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t4';
        final addr = TWAnyAddress(string, TWCoinType.Bitcoin);
        final witness = TWString.createWithHexBytes(addr.data).value!;
        expect(witness, '751e76e8199196d454941c45d1b3a323f1433bd6');
      }

      // bitcoin taproot (segwit v1, bech32m)
      {
        const string =
            'bc1pw508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7kt5nd6y';
        final addr = TWAnyAddress(string, TWCoinType.Bitcoin);
        final witness = TWString.createWithHexBytes(addr.data).value!;
        expect(witness,
            '751e76e8199196d454941c45d1b3a323f1433bd6751e76e8199196d454941c45d1b3a323f1433bd6');
      }

      // bitcoincashaddr
      {
        const string = 'bitcoincash:qzxf0wl63ahx6jsxu8uuldcw7n5aatwppvnteraqaw';
        final addr = TWAnyAddress(string, TWCoinType.BitcoinCash);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash, '8c97bbfa8f6e6d4a06e1f9cfb70ef4e9deadc10b');
      }

      // base58 dogecoin
      {
        const string = 'DQkiL71KkuGEgS9QFCKJkBeHmzM5YFYGkG';
        final addr = TWAnyAddress(string, TWCoinType.Dogecoin);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash, 'd726d32d9ff0560e7df35764987fcf01a6a343cf');
      }

      // decred
      {
        const string = 'Dsb4fb7SfdLPhKVQFapGRGnokncgNiYmkAe';
        final addr = TWAnyAddress(string, TWCoinType.Decred);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash, '6ec8261586091a51ea706a62161eceba4b583b49');
      }

      // zcash
      {
        const string = 't3PkLgT71TnF112nSwBToXsD77yNbx2gJJY';
        final addr = TWAnyAddress(string, TWCoinType.Zcash);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash, '38dfa4066f0032c86024bb5899adfa167c80189c');
      }

      // nano
      {
        const string =
            'nano_1ie9ffzo57nh51p53eaiqen8y6mxe1z5etcnpmucyts77qk7mqzm1x7yiyjk';
        final addr = TWAnyAddress(string, TWCoinType.Nano);
        final pubkey = TWString.createWithHexBytes(addr.data).value!;
        expect(pubkey,
            '41876b7f51968f182c30b110bb286f127d603e366954b4f6af6b252de459dff3');
      }

      // zilliqa
      {
        const string = 'zil1l8ddxvejeam70qang54wnqkgtmlu5mwlgzy64z';
        final addr = TWAnyAddress(string, TWCoinType.Zilliqa);

        const expectedKeyHash = "F9dad33332CF77E783B3452aE982c85effCa6DDf";
        final keyHash = addr.data;
        final checksumed = TWString.createWithRawBytes(keyHash).value!;
        expect(checksumed, expectedKeyHash);
      }

      // kusama
      {
        const string = 'HewiDTQv92L2bVtkziZC8ASxrFUxr6ajQ62RXAnwQ8FDVmg';
        final addr = TWAnyAddress(string, TWCoinType.Kusama);
        final pubkey = TWString.createWithHexBytes(addr.data).value!;
        expect(pubkey,
            'e0b3fcccfe0283cc0f8c105c68b5690aab8c5c1692a868e55eaca836c8779085');
      }

      // polkadot
      {
        const string = '16fir1SPRAaWGtF4ZkKNDq3S6LnD9mbphGXqL923DoH85Exz';
        final addr = TWAnyAddress(string, TWCoinType.Polkadot);
        final pubkey = TWString.createWithHexBytes(addr.data).value!;
        expect(pubkey,
            'fab55af5eaaa1a284b615946dc3dd403c44ce3448c15884d61b2dcba3ddb245a');
      }

      // cardano
      {
        const string =
            'addr1q8043m5heeaydnvtmmkyuhe6qv5havvhsf0d26q3jygsspxlyfpyk6yqkw0yhtyvtr0flekj84u64az82cufmqn65zdsylzk23';
        final addr = TWAnyAddress(string, TWCoinType.Cardano);
        final pubkey = TWString.createWithHexBytes(addr.data).value!;
        expect(pubkey,
            '01df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b');
      }

      // neo
      {
        const string = 'AKmrAHRD9ZDUnu4m3vWWonpsojo4vgSuqp';
        final addr = TWAnyAddress(string, TWCoinType.NEO);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash, '172bdf43265c0adfe105a1a8c45b3f406a38362f24');
      }

      // multiversx
      {
        const string =
            'erd1l453hd0gt5gzdp7czpuall8ggt2dcv5zwmfdf3sd3lguxseux2fsmsgldz';
        final addr = TWAnyAddress(string, TWCoinType.MultiversX);
        final pubkey = TWString.createWithHexBytes(addr.data).value!;
        expect(pubkey,
            'fd691bb5e85d102687d81079dffce842d4dc328276d2d4c60d8fd1c3433c3293');
      }

      // near
      {
        const string = 'NEARTDDWrUMdoC2rA1eU6gNrSU2zyGKdR71TNucTvsQHyfAXjKcJb';
        final addr = TWAnyAddress(string, TWCoinType.NEAR);
        final pubkey = TWString.createWithHexBytes(addr.data).value!;
        expect(pubkey,
            '3b83b07cab54824a59c3d3f2e203a7cd913b7fcdc4439595983e2402c2cf791d');
      }

      // ecashaddr
      {
        const string = 'ecash:qzxf0wl63ahx6jsxu8uuldcw7n5aatwppv2xdgx6me';
        final addr = TWAnyAddress(string, TWCoinType.ECash);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash, '8c97bbfa8f6e6d4a06e1f9cfb70ef4e9deadc10b');
      }

      // solana
      {
        const string = '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST';
        final addr = TWAnyAddress(string, TWCoinType.Solana);
        final keyHash = TWString.createWithHexBytes(addr.data).value!;
        expect(keyHash,
            '18f9d8d877393bbbe8d697a8a2e52879cc7e84f467656d1cce6bab5a8d2637ec');
      }
    });

    test('createFromPubKey', () {
      const pubkey =
          '02753f5c275e1847ba4d2fd3df36ad00af2e165650b35fe3991e9c9c46f68b12bc';
      final pubkeyData = TWData.createWithHexString(pubkey);
      final pubkeyObj = TWPublicKey.createWithData(
          pubkeyData.bytes()!, TWPublicKeyType.SECP256k1);

      final addr =
          TWAnyAddress.createWithPublicKey(pubkeyObj, TWCoinType.Bitcoin);
      expect(addr.description, 'bc1qcj2vfjec3c3luf9fx9vddnglhh9gawmncmgxhz');
    });

    test('createFromPubKeyDerivation', () {
      const pubkey =
          '02753f5c275e1847ba4d2fd3df36ad00af2e165650b35fe3991e9c9c46f68b12bc';
      final pubkeyData = TWData.createWithHexString(pubkey);
      final pubkeyObj = TWPublicKey.createWithData(
          pubkeyData.bytes()!, TWPublicKeyType.SECP256k1);

      {
        final addr = TWAnyAddress.createWithPublicKeyDerivation(
          publicKey: pubkeyObj,
          coin: TWCoinType.Bitcoin,
          derivation: TWDerivation.Default,
        );
        expect(addr.description, 'bc1qcj2vfjec3c3luf9fx9vddnglhh9gawmncmgxhz');
      }

      {
        final addr = TWAnyAddress.createWithPublicKeyDerivation(
          publicKey: pubkeyObj,
          coin: TWCoinType.Bitcoin,
          derivation: TWDerivation.Legacy,
        );
        expect(addr.description, '1JvRfEQFv5q5qy9uTSAezH7kVQf4hqnHXx');
      }

      {
        final addr = TWAnyAddress.createWithPublicKeyDerivation(
          publicKey: pubkeyObj,
          coin: TWCoinType.Bitcoin,
          derivation: TWDerivation.Testnet,
        );
        expect(addr.description, 'tb1qcj2vfjec3c3luf9fx9vddnglhh9gawmnjan4v3');
      }
    });

    test('createFromPubKeyFilecoinAddressType', () {
      const pubkey =
          '0419bf99082cf2fcdaa812d6eba1eba9036ff3a3d84c1817c84954d4e8ae283fec5313e427a0f5f68dec3169b2eda876b1d9f97b1ede7f958baee6a2ce78f6e94a';
      final pubkeyData = TWData.createWithHexString(pubkey);
      final pubkeyObj = TWPublicKey.createWithData(
          pubkeyData.bytes()!, TWPublicKeyType.SECP256k1Extended);

      {
        final addr = TWAnyAddress.createWithPublicKeyFilecoinAddressType(
            pubkeyObj, TWFilecoinAddressType.Default);
        final actual = addr.description;
        expect(actual, 'f1syn25x7infncgfvodhriq2dudvmudabtavm3wyy');
        expect(TWAnyAddress.isValid(actual, TWCoinType.Filecoin), true);
      }

      {
        final addr = TWAnyAddress.createWithPublicKeyFilecoinAddressType(
            pubkeyObj, TWFilecoinAddressType.Delegated);
        final actual = addr.description;
        expect(actual, 'f410fvak24cyg3saddajborn6idt7rrtfj2ptauk5pbq');
        expect(TWAnyAddress.isValid(actual, TWCoinType.Filecoin), true);
      }
    });
  });
}
