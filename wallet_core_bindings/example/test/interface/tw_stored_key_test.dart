import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

TWStoredKey createAStoredKey(
  TWCoinType coin,
  Uint8List password, {
  TWStoredKeyEncryption encryption = TWStoredKeyEncryption.Aes128Ctr,
}) {
  const mnemonic =
      'team engine square letter hero song dizzy scrub tornado fabric divert saddle';
  const name = 'name';
  final key = TWStoredKey.importHDWalletWithEncryption(
    mnemonic: mnemonic,
    name: name,
    password: password,
    coin: coin,
    encryption: encryption,
  );
  return key;
}

TWStoredKey createDefaultStoredKey({
  TWStoredKeyEncryption encryption = TWStoredKeyEncryption.Aes128Ctr,
}) {
  const passwordString = 'password';
  final password = TWData.createWithString(passwordString).bytes()!;
  return createAStoredKey(TWCoinType.Bitcoin, password);
}

void main() {
  initTest();
  group(TWStoredKey, () {
    test('loadPBKDF2Key', () {
      final filename = '$projectRoot/test/common/Keystore/Data/pbkdf2.json';
      final key = TWStoredKey.load(filename);
      final keyId = key.identifier;
      expect(keyId, "3198bc9c-6672-5ab3-d995-4942343ae5b6");
    });

    test('loadNonexistent', () {
      final filename = '$projectRoot/test/_NO_/_SUCH_/_FILE_';
      final nokey = TWStoredKey.load(filename);
      expect(nokey.pointer, 0);
    });

    test('createWallet', () {
      const name = 'name';
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      final key = TWStoredKey.createLevelAndEncryption(
        name: name,
        password: password,
        encryptionLevel: TWStoredKeyEncryptionLevel.Default,
        encryption: TWStoredKeyEncryption.Aes128Ctr,
      );
      final name2 = key.name;
      expect(name2, 'name');
      final mnemonic = key.decryptMnemonic(password);
      // mnemonic is random, check that it's reasonably long
      expect(mnemonic.length, greaterThan(36));
    });

    test('importPrivateKey', () {
      const privateKeyHex =
          '3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266';
      final privateKey = TWData.createWithHexString(privateKeyHex).bytes()!;
      const name = 'name';
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      const coin = TWCoinType.Bitcoin;
      final key = TWStoredKey.importPrivateKey(
        privateKey: privateKey,
        name: name,
        password: password,
        coin: coin,
      );
      final privateKey2 = key.decryptPrivateKey(password);
      expectHex(privateKey2, privateKeyHex);

      final privateKey3 = key.privateKey(coin, password);
      final pkData3 = privateKey3.data;
      expectHex(pkData3, privateKeyHex);
      privateKey3.delete();
    });

    test('importPrivateKeyAes256', () {
      const privateKeyHex =
          '3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266';
      final privateKey = TWData.createWithHexString(privateKeyHex).bytes()!;
      const name = 'name';
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      const coin = TWCoinType.Bitcoin;
      final key = TWStoredKey.importPrivateKeyWithEncryption(
        privateKey: privateKey,
        name: name,
        password: password,
        coin: coin,
        encryption: TWStoredKeyEncryption.Aes256Ctr,
      );
      final privateKey2 = key.decryptPrivateKey(password);
      expectHex(privateKey2, privateKeyHex);

      final privateKey3 = key.privateKey(coin, password);
      final pkData3 = privateKey3.data;
      expectHex(pkData3, privateKeyHex);
      privateKey3.delete();
    });

    test('importPrivateKeyAes256Legacy', () {
      const privateKeyHex =
          '28071bf4e2b0340db41b807ed8a5514139e5d6427ff9d58dbd22b7ed187103a4';
      final privateKey = TWData.createWithHexString(privateKeyHex).bytes()!;
      const name = 'name';
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      const coin = TWCoinType.Bitcoin;
      final key = TWStoredKey.importPrivateKeyWithEncryptionAndDerivation(
        privateKey: privateKey,
        name: name,
        password: password,
        coin: coin,
        encryption: TWStoredKeyEncryption.Aes256Ctr,
        derivation: TWDerivation.BitcoinLegacy,
      );
      final privateKey2 = key.decryptPrivateKey(password);
      expectHex(privateKey2, privateKeyHex);

      final privateKey3 = key.privateKey(coin, password);
      final pkData3 = privateKey3.data;
      expectHex(pkData3, privateKeyHex);
      privateKey3.delete();

      final accountCoin = key.account(0);
      final accountAddress = accountCoin.address;
      expect(accountAddress, '1PeUvjuxyf31aJKX6kCXuaqxhmG78ZUdL1');
    });

    test('importPrivateKeyAes256Taproot', () {
      const privateKeyHex =
          '28071bf4e2b0340db41b807ed8a5514139e5d6427ff9d58dbd22b7ed187103a4';
      final privateKey = TWData.createWithHexString(privateKeyHex).bytes()!;
      const name = 'name';
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      const coin = TWCoinType.Bitcoin;
      final key = TWStoredKey.importPrivateKeyWithEncryptionAndDerivation(
        privateKey: privateKey,
        name: name,
        password: password,
        coin: coin,
        encryption: TWStoredKeyEncryption.Aes256Ctr,
        derivation: TWDerivation.BitcoinSegwit,
      );
      final privateKey2 = key.decryptPrivateKey(password);
      expectHex(privateKey2, privateKeyHex);

      final privateKey3 = key.privateKey(coin, password);
      final pkData3 = privateKey3.data;
      expectHex(pkData3, privateKeyHex);
      privateKey3.delete();

      final accountCoin = key.account(0);
      final accountAddress = accountCoin.address;
      expect(accountAddress, 'bc1qlp5hssx3qstf3m0mt7fd6tzlh90ssm32u2llf4');
    });

    test('importPrivateKeyHexButDecryptEncoded', () {
      const privateKeyHex =
          "3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266";
      final privateKey = TWData.createWithHexString(privateKeyHex).bytes()!;
      const name = 'name';
      const passwordString = 'password';
      final password = Uint8List.fromList(passwordString.codeUnits);
      const coin = TWCoinType.Bitcoin;
      final key = TWStoredKey.importPrivateKey(
        privateKey: privateKey,
        name: name,
        password: password,
        coin: coin,
      );
      final privateKey2 = key.decryptPrivateKey(password);
      expect(hex(privateKey2), privateKeyHex);
      expect(key.hasPrivateKeyEncoded, false);
      final privateKey2Encoded = key.decryptPrivateKeyEncoded(password);
      expect(privateKey2Encoded, privateKeyHex);

      final privateKey3 = key.privateKey(coin, password);
      final pkData3 = privateKey3.data;
      expect(hex(pkData3), privateKeyHex);
    });

    test('importPrivateKeyEncodedHexLegacy', () {
      const privateKeyHex =
          '28071bf4e2b0340db41b807ed8a5514139e5d6427ff9d58dbd22b7ed187103a4';
      const privateKey = privateKeyHex;
      const name = 'name';
      const passwordString = 'password';
      final password = Uint8List.fromList(passwordString.codeUnits);
      const coin = TWCoinType.Bitcoin;
      final key =
          TWStoredKey.importPrivateKeyEncodedWithEncryptionAndDerivation(
        privateKey: privateKey,
        name: name,
        password: password,
        coin: coin,
        encryption: TWStoredKeyEncryption.Aes128Ctr,
        derivation: TWDerivation.BitcoinLegacy,
      );
      final privateKey2 = key.decryptPrivateKey(password);
      expect(hex(privateKey2), privateKeyHex);
      expect(key.hasPrivateKeyEncoded, true);
      final privateKey2Encoded = key.decryptPrivateKeyEncoded(password);
      expect(privateKey2Encoded, privateKeyHex);

      final privateKey3 = key.privateKey(coin, password);
      final pkData3 = privateKey3.data;
      expect(hex(pkData3), privateKeyHex);
      privateKey3.delete();

      final accountCoin = key.account(0);
      final accountAddress = accountCoin.address;
      expect(accountAddress, '1PeUvjuxyf31aJKX6kCXuaqxhmG78ZUdL1');
    });

    test('importPrivateKeyEncodedHex', () {
      const privateKeyHex =
          "3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266";
      final privateKey =
          TWString.createWithHexBytes(parse_hex(privateKeyHex)).value!;
      const name = 'name';
      const passwordString = 'password';
      final password = Uint8List.fromList(passwordString.codeUnits);
      const coin = TWCoinType.Bitcoin;
      final key = TWStoredKey.importPrivateKeyEncoded(
        privateKey: privateKey,
        name: name,
        password: password,
        coin: coin,
      );
      final privateKey2 = key.decryptPrivateKey(password);
      expect(hex(privateKey2), privateKeyHex);
      expect(key.hasPrivateKeyEncoded, true);
      final privateKey2Encoded = key.decryptPrivateKeyEncoded(password);
      expect(privateKey2Encoded, privateKeyHex);

      final privateKey3 = key.privateKey(coin, password);
      final pkData3 = privateKey3.data;
      expect(hex(pkData3), privateKeyHex);
    });

    test('importPrivateKeyEncodedStellar', () {
      const privateKeyEncoded =
          "SAV76USXIJOBMEQXPANUOQM6F5LIOTLPDIDVRJBFFE2MDJXG24TAPUU7";
      const decodedPrivateKeyHex =
          "2bff5257425c161217781b47419e2f56874d6f1a0758a4252934c1a6e6d72607";
      const privateKey = privateKeyEncoded;
      const name = 'name';
      const passwordString = 'password';
      final password = Uint8List.fromList(passwordString.codeUnits);
      const coin = TWCoinType.Stellar;
      final key = TWStoredKey.importPrivateKeyEncoded(
        privateKey: privateKey,
        name: name,
        password: password,
        coin: coin,
      );
      final privateKey2 = key.decryptPrivateKey(password);
      expect(hex(privateKey2), decodedPrivateKeyHex);
      expect(key.hasPrivateKeyEncoded, true);
      final privateKey2Encoded = key.decryptPrivateKeyEncoded(password);
      expect(privateKey2Encoded, privateKeyEncoded);

      final privateKey3 = key.privateKey(coin, password);
      final pkData3 = privateKey3.data;
      expect(hex(pkData3), decodedPrivateKeyHex);
    });

    test('importPrivateKeyEncodedSolana', () {
      const solanaPrivateKey = "A7psj2GW7ZMdY4E5hJq14KMeYg7HFjULSsWSrTXZLvYr";
      const decodedSolanaPrivateKeyHex =
          "8778cc93c6596387e751d2dc693bbd93e434bd233bc5b68a826c56131821cb63";
      const name = 'name';
      const passwordString = 'password';
      final password = Uint8List.fromList(passwordString.codeUnits);
      final solanaKey = TWStoredKey.importPrivateKeyEncoded(
        privateKey: solanaPrivateKey,
        name: name,
        password: password,
        coin: TWCoinType.Solana,
      );
      final solanaPrivateKey2 = solanaKey.decryptPrivateKey(password);
      expect(hex(solanaPrivateKey2), decodedSolanaPrivateKeyHex);
      expect(solanaKey.hasPrivateKeyEncoded, true);
      final solanaPrivateKey2Encoded =
          solanaKey.decryptPrivateKeyEncoded(password);
      expect(solanaPrivateKey2Encoded, solanaPrivateKey);

      final solanaPrivateKey3 =
          solanaKey.privateKey(TWCoinType.Solana, password);
      final solanaPkData3 = solanaPrivateKey3.data;
      expect(hex(solanaPkData3), decodedSolanaPrivateKeyHex);
    });

    test('importPrivateKeyHexEncodedSolana', () {
      const solanaPrivateKey =
          "8778cc93c6596387e751d2dc693bbd93e434bd233bc5b68a826c56131821cb63";
      const name = 'name';
      const passwordString = 'password';
      final password = Uint8List.fromList(passwordString.codeUnits);
      final solanaKey = TWStoredKey.importPrivateKeyEncoded(
        privateKey: solanaPrivateKey,
        name: name,
        password: password,
        coin: TWCoinType.Solana,
      );
      final solanaPrivateKey2 = solanaKey.decryptPrivateKey(password);
      expect(hex(solanaPrivateKey2), solanaPrivateKey);
      expect(solanaKey.hasPrivateKeyEncoded, true);
      final solanaPrivateKey2Encoded =
          solanaKey.decryptPrivateKeyEncoded(password);
      expect(solanaPrivateKey2Encoded, solanaPrivateKey);

      final solanaPrivateKey3 =
          solanaKey.privateKey(TWCoinType.Solana, password);
      final solanaPkData3 = solanaPrivateKey3.data;
      expect(hex(solanaPkData3), solanaPrivateKey);
    });

    test('importPrivateKeyEncodedAes256', () {
      const privateKeyEncoded =
          "SAV76USXIJOBMEQXPANUOQM6F5LIOTLPDIDVRJBFFE2MDJXG24TAPUU7";
      const decodedPrivateKeyHex =
          "2bff5257425c161217781b47419e2f56874d6f1a0758a4252934c1a6e6d72607";
      const privateKey = privateKeyEncoded;
      const name = 'name';
      const passwordString = 'password';
      final password = Uint8List.fromList(passwordString.codeUnits);
      const coin = TWCoinType.Stellar;
      final key = TWStoredKey.importPrivateKeyEncodedWithEncryption(
        privateKey: privateKey,
        name: name,
        password: password,
        coin: coin,
        encryption: TWStoredKeyEncryption.Aes256Ctr,
      );
      final privateKey2 = key.decryptPrivateKey(password);
      expect(hex(privateKey2), decodedPrivateKeyHex);

      final privateKey3 = key.privateKey(coin, password);
      final pkData3 = privateKey3.data;
      expect(hex(pkData3), decodedPrivateKeyHex);
    });

    test('importHDWallet', () {
      const mnemonic =
          'team engine square letter hero song dizzy scrub tornado fabric divert saddle';
      const name = 'name';
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      const coin = TWCoinType.Bitcoin;
      final key = TWStoredKey.importHDWallet(
        mnemonic: mnemonic,
        name: name,
        password: password,
        coin: coin,
      );
      expect(key.isMnemonic, true);

      // invalid mnemonic
      const mnemonicInvalid = '_THIS_IS_AN_INVALID_MNEMONIC_';
      expectWasmWithException(
          () => TWStoredKey.importHDWallet(
                mnemonic: mnemonicInvalid,
                name: name,
                password: password,
                coin: coin,
              ).pointer,
          0);
    });

    test('importHDWalletAES256', () {
      const mnemonic =
          'team engine square letter hero song dizzy scrub tornado fabric divert saddle';
      const name = 'name';
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      const coin = TWCoinType.Bitcoin;
      final key = TWStoredKey.importHDWalletWithEncryption(
        mnemonic: mnemonic,
        name: name,
        password: password,
        coin: coin,
        encryption: TWStoredKeyEncryption.Aes256Ctr,
      );
      expect(key.isMnemonic, true);

      // invalid mnemonic
      const mnemonicInvalid = '_THIS_IS_AN_INVALID_MNEMONIC_';
      expectWasmWithException(
          () => TWStoredKey.importHDWalletWithEncryption(
                mnemonic: mnemonicInvalid,
                name: name,
                password: password,
                coin: coin,
                encryption: TWStoredKeyEncryption.Aes256Ctr,
              ).pointer,
          0);
    });

    test('addressAddRemove', () {
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      const coin = TWCoinType.Bitcoin;
      final key = createAStoredKey(coin, password);

      final wallet = key.wallet(password);
      final accountCoin = key.accountForCoin(coin, wallet);
      final accountAddress = accountCoin.address;
      expect(accountAddress, 'bc1qturc268v0f2srjh4r2zu4t6zk4gdutqd5a6zny');

      expect(key.accountCount, 1);
      final accountIndex = key.account(0);

      key.removeAccountForCoin(coin);
      expect(key.accountCount, 0);

      const addressAdd = 'bc1qturc268v0f2srjh4r2zu4t6zk4gdutqd5a6zny';
      const derivationPath = "m/84'/0'/0'/0/0";
      const extPubKeyAdd =
          "zpub6qbsWdbcKW9sC6shTKK4VEhfWvDCoWpfLnnVfYKHLHt31wKYUwH3aFDz4WLjZvjHZ5W4qVEyk37cRwzTbfrrT1Gnu8SgXawASnkdQ994atn";
      const pubKey =
          "02df6fc590ab3101bbe0bb5765cbaeab9b5dcfe09ac9315d707047cbd13bc7e006";

      key.addAccount(
        address: addressAdd,
        coin: coin,
        derivationPath: derivationPath,
        publicKey: pubKey,
        extendedPublicKey: extPubKeyAdd,
      );
      expect(key.accountCount, 1);

      // invalid account index
      expect(key.account(1001).pointer, 0);
    });

    test('addressAddRemoveDerivationPath', () {
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      const coin = TWCoinType.Bitcoin;
      final key = createAStoredKey(coin, password);

      final wallet = key.wallet(password);
      final accountCoin = key.accountForCoin(coin, wallet);
      final accountAddress = accountCoin.address;
      expect(accountAddress, 'bc1qturc268v0f2srjh4r2zu4t6zk4gdutqd5a6zny');

      expect(key.accountCount, 1);
      final accountIndex = key.account(0);

      const derivationPath0 = "m/84'/0'/0'/0/0";
      const derivationPath1 = "m/84'/0'/0'/1/0";

      key.removeAccountForCoinDerivationPath(coin, derivationPath1);
      expect(key.accountCount, 1);

      key.removeAccountForCoinDerivationPath(coin, derivationPath0);
      expect(key.accountCount, 0);
    });

    test('addressAddDerivation', () {
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      const coin = TWCoinType.Bitcoin;
      final key = createAStoredKey(coin, password);
      final wallet = key.wallet(password);

      final accountCoin1 = key.accountForCoinDerivation(
        coin: coin,
        derivation: TWDerivation.Default,
        wallet: wallet,
      );
      final accountAddress1 = accountCoin1.address;
      expect(accountAddress1, 'bc1qturc268v0f2srjh4r2zu4t6zk4gdutqd5a6zny');

      final accountCoin2 = key.accountForCoinDerivation(
        coin: coin,
        derivation: TWDerivation.BitcoinLegacy,
        wallet: wallet,
      );
      final accountAddress2 = accountCoin2.address;
      expect(accountAddress2, '1NyRyFewhZcWMa9XCj3bBxSXPXyoSg8dKz');

      expect(key.accountCount, 2);

      final accountCoin3 = key.accountForCoinDerivation(
        coin: coin,
        derivation: TWDerivation.BitcoinTaproot,
        wallet: wallet,
      );
      final accountAddress3 = accountCoin3.address;
      expect(accountAddress3,
          "bc1pyqkqf20fmmwmcxf98tv6k63e2sgnjy4zne6d0r32vxwm3au0hnksq6ec57");
    });

    test('exportJSON', () {
      final key = createDefaultStoredKey();
      final json = key.exportJSON();
      // check size and first character
      expect(json!.length > 100, true);
      expect(json[0], '{');
    });

    test('storeAndImportJSONAES256', () {
      final key = createDefaultStoredKey(
        encryption: TWStoredKeyEncryption.Aes256Ctr,
      );
      String json;
      if (isTestWasm) {
        json = key.exportJSON()!;
      } else {
        final outFileName = '$projectRoot/test/cache/TWStoredKey_store.json';
        expect(key.store(outFileName), true);

        final file = File(outFileName);
        json = file.readAsStringSync();
      }
      expect(json.length > 20, true);

      final key2 = TWStoredKey.importJSON(json);
      final name2 = key2.name;
      expect(name2, 'name');
    });

    test('storeAndImportJSON', () {
      final key = createDefaultStoredKey();
      String json;
      if (isTestWasm) {
        json = key.exportJSON()!;
      } else {
        final outFileName = '$projectRoot/test/cache/TWStoredKey_store.json';
        expect(key.store(outFileName), true);

        final file = File(outFileName);
        expect(file.existsSync(), true);
        json = file.readAsStringSync();
      }
      expect(json.length > 20, true);

      final key2 = TWStoredKey.importJSON(json);
      final name2 = key2.name;
      expect(name2, 'name');
    });

    test('importJsonInvalid', () {
      const jsonInvalidStr = ']]]}}}_THIS_IS_AN_INVALID_JSON_}}}]]]';
      expectWasmWithException(
          () => TWStoredKey.importJSON(jsonInvalidStr).pointer, 0);
    });

    test('fixAddresses', () {
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      final key = createAStoredKey(TWCoinType.Bitcoin, password);
      expect(key.fixAddresses(password), true);
    });

    // In this test, we add a TON account with an outdated bounceable (`EQ`) address to the key storage,
    // and then check if `TWStoredKeyUpdateAddress` re-derives non-bounceable `UQ` instead.
    test('UpdateAddressWithMnemonic', () {
      const keyName = 'key';
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      /// Create stored key with a dummy Bitcoin account.
      final key = createAStoredKey(TWCoinType.Bitcoin, password);

      const oldAddress = "EQDSRYDMMez8BdcOuPEiaR6aJZpO6EjlIwmOBFn14mMbnUtk";
      const newAddress = "UQDSRYDMMez8BdcOuPEiaR6aJZpO6EjlIwmOBFn14mMbnRah";
      const derivationPath = "m/44'/607'/0'";
      const extPubKey = "";
      const pubKey =
          "b191d35f81aa8b144aa91c90a6b887e0b165ad9c2933b1c5266eb5c4e8bea241";

      // Add a TON account with an outdated address (bounceable).
      key.addAccount(
        address: oldAddress,
        coin: TWCoinType.TON,
        derivationPath: derivationPath,
        publicKey: pubKey,
        extendedPublicKey: extPubKey,
      );
      expect(key.accountCount, 2);

      // Last step - update TON account address.
      // Expect to have a non-bounceable address in the end.
      expect(key.updateAddress(TWCoinType.TON), true);
      final tonAccount =
          key.accountForCoin(TWCoinType.TON, TWHDWallet.fromPointer(0));
      expect(tonAccount.address, newAddress);
    });

    // In this test, we add an Ethereum account with an outdated lowercase address to the key storage,
    // and then check if `TWStoredKeyUpdateAddress` re-derives checksummed address instead.
    test('UpdateAddressWithPrivateKey', () {
      const keyName = 'key';
      final privateKey = parse_hex(
          '3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266');
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      /// Create stored key with a dummy Bitcoin account.
      final key = TWStoredKey.importPrivateKey(
        privateKey: privateKey,
        name: keyName,
        password: password,
        coin: TWCoinType.Bitcoin,
      );

      const oldAddress = "0xc2d7cf95645d33006175b78989035c7c9061d3f9";
      const newAddress = "0xC2D7CF95645D33006175B78989035C7c9061d3F9";
      const derivationPath = "m/44'/60'/0'";
      const extPubKey = "";
      const pubKey =
          "04efb99d9860f4dec4cb548a5722c27e9ef58e37fbab9719c5b33d55c216db49311221a01f638ce5f255875b194e0acaa58b19a89d2e56a864427298f826a7f887";

      // Add an Ethereum account with an outdated address (lowercase).
      key.addAccount(
        address: oldAddress,
        coin: TWCoinType.Ethereum,
        derivationPath: derivationPath,
        publicKey: pubKey,
        extendedPublicKey: extPubKey,
      );
      expect(key.accountCount, 2);

      // Last step - update Ethereum account address.
      // Expect to have a checksummed address in the end.
      expect(key.updateAddress(TWCoinType.Ethereum), true);
      final tonAccount =
          key.accountForCoin(TWCoinType.Ethereum, TWHDWallet.fromPointer(0));
      expect(tonAccount.address, newAddress);
    });

    test('updateAddressNoAssociatedAccounts', () {
      const keyName = 'key';
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      final key = createAStoredKey(TWCoinType.Bitcoin, password);
      expect(key.updateAddress(TWCoinType.Ethereum), false);
    });

    test('importInvalidKey', () {
      final data = TWData.createWithHexString(
              'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141')
          .bytes()!;
      const name = 'test';
      final password = TWData.createWithString(name).bytes()!;
      expectWasmWithException(
        () => TWStoredKey.importPrivateKey(
          privateKey: data,
          name: name,
          password: password,
          coin: TWCoinType.Ethereum,
        ).pointer,
        0,
      );
      expectWasmWithException(
        () => TWStoredKey.importPrivateKey(
          privateKey: data,
          name: name,
          password: password,
          coin: TWCoinType.Ontology,
        ).pointer,
        0,
      );
      final tezos = TWStoredKey.importPrivateKey(
        privateKey: data,
        name: name,
        password: password,
        coin: TWCoinType.Tezos,
      );
      expect(tezos.pointer != 0, true);
    });

    test('removeAccountForCoin', () {
      const passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      const name = 'Test KeyStore';
      final key = TWStoredKey(
        name: name,
        password: password,
      );
      final wallet = key.wallet(password);

      expect(
        key
                .accountForCoin(
                  TWCoinType.Ethereum,
                  wallet,
                )
                .pointer !=
            0,
        true,
      );
      expect(
        key
                .accountForCoin(
                  TWCoinType.Bitcoin,
                  wallet,
                )
                .pointer !=
            0,
        true,
      );

      expect(key.accountCount, 2);

      key.removeAccountForCoin(TWCoinType.Bitcoin);

      expect(key.accountCount, 1);

      expect(
        key
                .accountForCoin(
                  TWCoinType.Ethereum,
                  TWHDWallet.fromPointer(0),
                )
                .pointer !=
            0,
        true,
      );
      expect(
        key
            .accountForCoin(
              TWCoinType.Bitcoin,
              TWHDWallet.fromPointer(0),
            )
            .pointer,
        0,
      );
    });

    test('getWalletPasswordInvalid', () {
      const name = 'name';
      const passwordString = 'psaaword';
      final password = TWData.createWithString(passwordString).bytes()!;

      const invailString = '_THIS_IS_INVALID_PASSWORD_';
      final invalidPassword = TWData.createWithString(invailString).bytes()!;

      final key = TWStoredKey(
        name: name,
        password: password,
      );
      expect(key.wallet(password).pointer != 0, true);
      expectWasmWithException(() => key.wallet(invalidPassword).pointer, 0);
    });

    test('encryptionParameters', () {
      final key = createDefaultStoredKey();
      final params = key.encryptionParameters!;

      // compare some specific parameters
      final jsonParams = json.decode(params);
      expect(jsonParams['kdfparams']['n'], 16384);
      expect(jsonParams["cipherparams"]["iv"].length, 32);

      // compare all keys, except dynamic ones (like cipherparams/iv)
      jsonParams["cipherparams"] = null;
      jsonParams["ciphertext"] = "<ciphertext>";
      jsonParams["kdfparams"]["salt"] = "<salt>";
      jsonParams["mac"] = "<mac>";
      expect(json.encode(jsonParams),
          '{"cipher":"aes-128-ctr","cipherparams":null,"ciphertext":"<ciphertext>","kdf":"scrypt","kdfparams":{"dklen":32,"n":16384,"p":4,"r":8,"salt":"<salt>"},"mac":"<mac>"}');
    });
  });
}
