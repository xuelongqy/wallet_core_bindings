import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

class CosmosAddressParameters {
  final String hrp;
  final int coinType;
  final String address;
  final bool standaloneChain;
  final int publicKeyType;
  final String privKey;
  final String publicKey;

  CosmosAddressParameters({
    required this.hrp,
    required this.coinType,
    required this.address,
    this.standaloneChain = true,
    this.publicKeyType = TWPublicKeyType.TWPublicKeyTypeSECP256k1,
    this.privKey =
        'a498a9ee41af9bab5ef2a8be63d5c970135c3c109e70efc8c56c534e6636b433',
    this.publicKey =
        '02cbfdb5e472893322294e60cf0883d43df431e1089d29ecb447a9e6d55045aae5',
  });
}

class TWCosmosTestsInternal {
  static void isValidAddress(CosmosAddressParameters addressParameters) {
    final address = addressParameters.address;
    final hrp = addressParameters.hrp;
    expect(
      TWAnyAddress.isValidBech32(
        string: address,
        coin: TWCoinType.TWCoinTypeCosmos,
        hrp: hrp,
      ),
      true,
    );
    expect(TWAnyAddress.isValid(address, addressParameters.coinType), true);
    expect(
      TWAnyAddress.isValidBech32(
        string: address,
        coin: TWCoinType.TWCoinTypeBitcoin,
        hrp: hrp,
      ),
      false,
    );
    if (addressParameters.coinType != TWCoinType.TWCoinTypeCosmos) {
      expect(TWAnyAddress.isValid(address, TWCoinType.TWCoinTypeCosmos), false);
    }
    expect(TWAnyAddress.isValid(address, TWCoinType.TWCoinTypeBitcoin), false);
  }

  static void testCreateFromPubKeyWrapper(
      CosmosAddressParameters addressParameters) {
    if (addressParameters.standaloneChain) {
      final hrp = addressParameters.hrp;
      final data = parse_hex(addressParameters.publicKey);
      final pubkey = TWPublicKey.createWithData(
          data, TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final twAddress = TWAnyAddress.createBech32WithPublicKey(
        publicKey: pubkey,
        coin: TWCoinType.TWCoinTypeCosmos,
        hrp: hrp,
      );
      final twData = twAddress.data;
      final hexData = hex(twData);
      expect(
        hex(TWAnyAddress.createBech32WithPublicKey(
          publicKey: pubkey,
          coin: TWCoinType.TWCoinTypeCosmos,
          hrp: hrp,
        ).data),
        hexData,
      );
      final address = twAddress.description;
      expect(addressParameters.address, address);
    }

    // With coin type
    {
      final publicKey = TWPublicKey.createWithData(
        parse_hex(addressParameters.publicKey),
        addressParameters.publicKeyType,
      );
      final address = TWAnyAddress.createWithPublicKey(
        publicKey: publicKey,
        coin: addressParameters.coinType,
      );
    }
  }

  static void testCreateFromPrivKey(CosmosAddressParameters addressParameters) {
    final privateKey =
        TWPrivateKey.createWithHexString(addressParameters.privKey);
    final address = TWAnyAddress.createWithPublicKey(
      publicKey: privateKey.getPublicKeyByType(addressParameters.publicKeyType),
      coin: addressParameters.coinType,
    );
    expect(address.description, addressParameters.address);
  }

  static void testCreateFromString(CosmosAddressParameters addressParameters) {
    // BECH32
    if (addressParameters.standaloneChain) {
      final address = addressParameters.address;
      final hrp = addressParameters.hrp;
      final anyAddr = TWAnyAddress.createBech32(
        string: address,
        coin: TWCoinType.TWCoinTypeCosmos,
        hrp: hrp,
      );
      final addrDescription = anyAddr.description;
      expect(
        TWAnyAddress.isValidBech32(
          string: addrDescription,
          coin: TWCoinType.TWCoinTypeCosmos,
          hrp: hrp,
        ),
        true,
      );
    }

    // With Coin Type
    {
      final address = addressParameters.address;
      final anyAddr = TWAnyAddress(address, addressParameters.coinType);
      final addrDescription = anyAddr.description;
      expect(
        TWAnyAddress.isValid(addrDescription, addressParameters.coinType),
        true,
      );
    }
  }
}

class TWCosmosTests {
  static void TestCosmosAddressParameters(
      CosmosAddressParameters addressParameters) {
    TWCosmosTestsInternal.isValidAddress(addressParameters);
    TWCosmosTestsInternal.testCreateFromPubKeyWrapper(addressParameters);
    TWCosmosTestsInternal.testCreateFromPrivKey(addressParameters);
    TWCosmosTestsInternal.testCreateFromString(addressParameters);
  }
}
