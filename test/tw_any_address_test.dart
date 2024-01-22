import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWAnyAddress, () {
    test('Invalid string', () {
      final string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
      final btcAddress =
          TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeBitcoin);
      final ethAddress =
          TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeEthereum);

      expect(btcAddress.pointer, nullptr);
      expect(ethAddress.pointer != nullptr, true);
      expect(ethAddress.coin(), TWCoinType.TWCoinTypeEthereum);
    });

    test('Data', () {
      // ethereum
      {
        final string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeEthereum);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash, '4e5b2e1dc63f6b91cb6cd759936495434c7e972f');
      }

      // smartBCH
      {
        final string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
        final addr = TWAnyAddress(
            string: string, coin: TWCoinType.TWCoinTypeSmartBitcoinCash);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash, '4e5b2e1dc63f6b91cb6cd759936495434c7e972f');
      }

      // KuCoin Community Chain
      {
        final string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
        final addr = TWAnyAddress(
            string: string, coin: TWCoinType.TWCoinTypeKuCoinCommunityChain);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash, '4e5b2e1dc63f6b91cb6cd759936495434c7e972f');
      }

      // bnb address key hash
      {
        final string = 'bnb1hlly02l6ahjsgxw9wlcswnlwdhg4xhx38yxpd5';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeBinance);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash, 'bffe47abfaede50419c577f1074fee6dd1535cd1');
      }

      // bitcoin segwit witness program
      {
        final string = 'bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t4';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeBitcoin);
        final witness = TWString.createWithHexData(addr.data()).toString();
        expect(witness, '751e76e8199196d454941c45d1b3a323f1433bd6');
      }

      // bitcoin taproot (segwit v1, bech32m)
      {
        final string =
            'bc1pw508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7kt5nd6y';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeBitcoin);
        final witness = TWString.createWithHexData(addr.data()).toString();
        expect(witness,
            '751e76e8199196d454941c45d1b3a323f1433bd6751e76e8199196d454941c45d1b3a323f1433bd6');
      }

      // bitcoincashaddr
      {
        final string = 'bitcoincash:qzxf0wl63ahx6jsxu8uuldcw7n5aatwppvnteraqaw';
        final addr = TWAnyAddress(
            string: string, coin: TWCoinType.TWCoinTypeBitcoinCash);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash, '8c97bbfa8f6e6d4a06e1f9cfb70ef4e9deadc10b');
      }

      // base58 dogecoin
      {
        final string = 'DQkiL71KkuGEgS9QFCKJkBeHmzM5YFYGkG';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeDogecoin);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash, 'd726d32d9ff0560e7df35764987fcf01a6a343cf');
      }

      // decred
      {
        final string = 'Dsb4fb7SfdLPhKVQFapGRGnokncgNiYmkAe';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeDecred);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash, '6ec8261586091a51ea706a62161eceba4b583b49');
      }

      // zcash
      {
        final string = 't3PkLgT71TnF112nSwBToXsD77yNbx2gJJY';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeZcash);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash, '38dfa4066f0032c86024bb5899adfa167c80189c');
      }

      // nano
      {
        final string =
            'nano_1ie9ffzo57nh51p53eaiqen8y6mxe1z5etcnpmucyts77qk7mqzm1x7yiyjk';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeNano);
        final pubkey = TWString.createWithHexData(addr.data()).toString();
        expect(pubkey,
            '41876b7f51968f182c30b110bb286f127d603e366954b4f6af6b252de459dff3');
      }

      // zilliqa
      {
        final string = 'zil1l8ddxvejeam70qang54wnqkgtmlu5mwlgzy64z';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeZilliqa);

        final expectedKeyHash = "F9dad33332CF77E783B3452aE982c85effCa6DDf";
        final keyHash = addr.data().bytes()!;
        final checksumed = TWString.createWithRawBytes(keyHash).toString();
        expect(checksumed, expectedKeyHash);
      }

      // kusama
      {
        final string = 'HewiDTQv92L2bVtkziZC8ASxrFUxr6ajQ62RXAnwQ8FDVmg';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeKusama);
        final pubkey = TWString.createWithHexData(addr.data()).toString();
        expect(pubkey,
            'e0b3fcccfe0283cc0f8c105c68b5690aab8c5c1692a868e55eaca836c8779085');
      }

      // polkadot
      {
        final string = '16fir1SPRAaWGtF4ZkKNDq3S6LnD9mbphGXqL923DoH85Exz';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypePolkadot);
        final pubkey = TWString.createWithHexData(addr.data()).toString();
        expect(pubkey,
            'fab55af5eaaa1a284b615946dc3dd403c44ce3448c15884d61b2dcba3ddb245a');
      }

      // cardano
      {
        final string =
            'addr1q8043m5heeaydnvtmmkyuhe6qv5havvhsf0d26q3jygsspxlyfpyk6yqkw0yhtyvtr0flekj84u64az82cufmqn65zdsylzk23';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeCardano);
        final pubkey = TWString.createWithHexData(addr.data()).toString();
        expect(pubkey,
            '01df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b');
      }

      // neo
      {
        final string = 'AKmrAHRD9ZDUnu4m3vWWonpsojo4vgSuqp';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeNEO);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash, '172bdf43265c0adfe105a1a8c45b3f406a38362f24');
      }

      // multiversx
      {
        final string =
            'erd1l453hd0gt5gzdp7czpuall8ggt2dcv5zwmfdf3sd3lguxseux2fsmsgldz';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeMultiversX);
        final pubkey = TWString.createWithHexData(addr.data()).toString();
        expect(pubkey,
            'fd691bb5e85d102687d81079dffce842d4dc328276d2d4c60d8fd1c3433c3293');
      }

      // near
      {
        final string = 'NEARTDDWrUMdoC2rA1eU6gNrSU2zyGKdR71TNucTvsQHyfAXjKcJb';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeNEAR);
        final pubkey = TWString.createWithHexData(addr.data()).toString();
        expect(pubkey,
            '3b83b07cab54824a59c3d3f2e203a7cd913b7fcdc4439595983e2402c2cf791d');
      }

      // ecashaddr
      {
        final string = 'ecash:qzxf0wl63ahx6jsxu8uuldcw7n5aatwppv2xdgx6me';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeECash);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash, '8c97bbfa8f6e6d4a06e1f9cfb70ef4e9deadc10b');
      }

      // solana
      {
        final string = '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST';
        final addr =
            TWAnyAddress(string: string, coin: TWCoinType.TWCoinTypeSolana);
        final keyHash = TWString.createWithHexData(addr.data()).toString();
        expect(keyHash,
            '18f9d8d877393bbbe8d697a8a2e52879cc7e84f467656d1cce6bab5a8d2637ec');
      }
    });

    test('createFromPubKey', () {
      final pubkey =
          '02753f5c275e1847ba4d2fd3df36ad00af2e165650b35fe3991e9c9c46f68b12bc';
      final pubkey_data = TWData.createWithHexString(pubkey);
      final pubkey_obj = TWPublicKey.createWithData(
          data: pubkey_data, type: TWPublicKeyType.TWPublicKeyTypeSECP256k1);

      final addr = TWAnyAddress.createWithPublicKey(
          publicKey: pubkey_obj, coin: TWCoinType.TWCoinTypeBitcoin);
      expect(addr.description(), 'bc1qcj2vfjec3c3luf9fx9vddnglhh9gawmncmgxhz');
    });

    test('createFromPubKeyDerivation', () {
      final pubkey =
          '02753f5c275e1847ba4d2fd3df36ad00af2e165650b35fe3991e9c9c46f68b12bc';
      final pubkey_data = TWData.createWithHexString(pubkey);
      final pubkey_obj = TWPublicKey.createWithData(
          data: pubkey_data, type: TWPublicKeyType.TWPublicKeyTypeSECP256k1);

      {
        final addr = TWAnyAddress.createWithPublicKeyDerivation(
          publicKey: pubkey_obj,
          coin: TWCoinType.TWCoinTypeBitcoin,
          derivation: TWDerivation.TWDerivationDefault,
        );
        expect(
            addr.description(), 'bc1qcj2vfjec3c3luf9fx9vddnglhh9gawmncmgxhz');
      }

      {
        final addr = TWAnyAddress.createWithPublicKeyDerivation(
          publicKey: pubkey_obj,
          coin: TWCoinType.TWCoinTypeBitcoin,
          derivation: TWDerivation.TWDerivationBitcoinLegacy,
        );
        expect(addr.description(), '1JvRfEQFv5q5qy9uTSAezH7kVQf4hqnHXx');
      }

      {
        final addr = TWAnyAddress.createWithPublicKeyDerivation(
          publicKey: pubkey_obj,
          coin: TWCoinType.TWCoinTypeBitcoin,
          derivation: TWDerivation.TWDerivationBitcoinTestnet,
        );
        expect(
            addr.description(), 'tb1qcj2vfjec3c3luf9fx9vddnglhh9gawmnjan4v3');
      }
    });

    test('createFromPubKeyFilecoinAddressType', () {
      final pubkey =
          '0419bf99082cf2fcdaa812d6eba1eba9036ff3a3d84c1817c84954d4e8ae283fec5313e427a0f5f68dec3169b2eda876b1d9f97b1ede7f958baee6a2ce78f6e94a';
      final pubkey_data = TWData.createWithHexString(pubkey);
      final pubkey_obj = TWPublicKey.createWithData(
          data: pubkey_data,
          type: TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);

      {
        final addr = TWAnyAddress.createWithPublicKeyFilecoinAddressType(
            publicKey: pubkey_obj,
            filecoinAddressType:
                TWFilecoinAddressType.TWFilecoinAddressTypeDefault);
        final actual = addr.description();
        expect(actual, 'f1syn25x7infncgfvodhriq2dudvmudabtavm3wyy');
        expect(
            TWAnyAddress.isValid(actual, TWCoinType.TWCoinTypeFilecoin), true);
      }

      {
        final addr = TWAnyAddress.createWithPublicKeyFilecoinAddressType(
            publicKey: pubkey_obj,
            filecoinAddressType:
                TWFilecoinAddressType.TWFilecoinAddressTypeDelegated);
        final actual = addr.description();
        expect(actual, 'f410fvak24cyg3saddajborn6idt7rrtfj2ptauk5pbq');
        expect(
            TWAnyAddress.isValid(actual, TWCoinType.TWCoinTypeFilecoin), true);
      }
    });
  });
}
