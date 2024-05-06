import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

TWStoredKey createAStoredKey(
  int coin,
  Uint8List password, {
  int encryption = TWStoredKeyEncryption.TWStoredKeyEncryptionAes128Ctr,
}) {
  final mnemonic =
      'team engine square letter hero song dizzy scrub tornado fabric divert saddle';
  final name = 'name';
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
  int encryption = TWStoredKeyEncryption.TWStoredKeyEncryptionAes128Ctr,
}) {
  final passwordString = 'password';
  final password = TWData.createWithString(passwordString).bytes()!;
  return createAStoredKey(TWCoinType.TWCoinTypeBitcoin, password);
}

void main() {
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
      expect(nokey.pointer, nullptr);
    });

    test('createWallet', () {
      final name = 'name';
      final passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      final key = TWStoredKey.createLevelAndEncryption(
        name: name,
        password: password,
        encryptionLevel:
            TWStoredKeyEncryptionLevel.TWStoredKeyEncryptionLevelDefault,
        encryption: TWStoredKeyEncryption.TWStoredKeyEncryptionAes128Ctr,
      );
      final name2 = key.name;
      expect(name2, 'name');
      final mnemonic = key.decryptMnemonic(password);
      // mnemonic is random, check that it's reasonably long
      expect(mnemonic.length, greaterThan(36));
    });

    test('importPrivateKey', () {
      final privateKeyHex =
          '3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266';
      final privateKey = TWData.createWithHexString(privateKeyHex).bytes()!;
      final name = 'name';
      final passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      final coin = TWCoinType.TWCoinTypeBitcoin;
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
      final privateKeyHex =
          '3a1076bf45ab87712ad64ccb3b10217737f7faacbf2872e88fdd9a537d8fe266';
      final privateKey = TWData.createWithHexString(privateKeyHex).bytes()!;
      final name = 'name';
      final passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      final coin = TWCoinType.TWCoinTypeBitcoin;
      final key = TWStoredKey.importPrivateKeyWithEncryption(
        privateKey: privateKey,
        name: name,
        password: password,
        coin: coin,
        encryption: TWStoredKeyEncryption.TWStoredKeyEncryptionAes256Ctr,
      );
      final privateKey2 = key.decryptPrivateKey(password);
      expectHex(privateKey2, privateKeyHex);

      final privateKey3 = key.privateKey(coin, password);
      final pkData3 = privateKey3.data;
      expectHex(pkData3, privateKeyHex);
      privateKey3.delete();
    });

    test('importHDWallet', () {
      final mnemonic =
          'team engine square letter hero song dizzy scrub tornado fabric divert saddle';
      final name = 'name';
      final passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      final coin = TWCoinType.TWCoinTypeBitcoin;
      final key = TWStoredKey.importHDWallet(
        mnemonic: mnemonic,
        name: name,
        password: password,
        coin: coin,
      );
      expect(key.isMnemonic, true);

      // invalid mnemonic
      final mnemonicInvalid = '_THIS_IS_AN_INVALID_MNEMONIC_';
      final nokey = TWStoredKey.importHDWallet(
        mnemonic: mnemonicInvalid,
        name: name,
        password: password,
        coin: coin,
      );
      expect(nokey.pointer, nullptr);
    });

    test('importHDWalletAES256', () {
      final mnemonic =
          'team engine square letter hero song dizzy scrub tornado fabric divert saddle';
      final name = 'name';
      final passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;
      final coin = TWCoinType.TWCoinTypeBitcoin;
      final key = TWStoredKey.importHDWalletWithEncryption(
        mnemonic: mnemonic,
        name: name,
        password: password,
        coin: coin,
        encryption: TWStoredKeyEncryption.TWStoredKeyEncryptionAes256Ctr,
      );
      expect(key.isMnemonic, true);

      // invalid mnemonic
      final mnemonicInvalid = '_THIS_IS_AN_INVALID_MNEMONIC_';
      final nokey = TWStoredKey.importHDWalletWithEncryption(
        mnemonic: mnemonicInvalid,
        name: name,
        password: password,
        coin: coin,
        encryption: TWStoredKeyEncryption.TWStoredKeyEncryptionAes256Ctr,
      );
      expect(nokey.pointer, nullptr);
    });

    test('addressAddRemove', () {
      final passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      final coin = TWCoinType.TWCoinTypeBitcoin;
      final key = createAStoredKey(coin, password);

      final wallet = key.wallet(password);
      final accountCoin = key.accountForCoin(coin, wallet);
      final accountAddress = accountCoin.address;
      expect(accountAddress, 'bc1qturc268v0f2srjh4r2zu4t6zk4gdutqd5a6zny');

      expect(key.accountCount, 1);
      final accountIndex = key.account(0);

      key.removeAccountForCoin(coin);
      expect(key.accountCount, 0);

      final addressAdd = 'bc1qturc268v0f2srjh4r2zu4t6zk4gdutqd5a6zny';
      final derivationPath = "m/84'/0'/0'/0/0";
      final extPubKeyAdd =
          "zpub6qbsWdbcKW9sC6shTKK4VEhfWvDCoWpfLnnVfYKHLHt31wKYUwH3aFDz4WLjZvjHZ5W4qVEyk37cRwzTbfrrT1Gnu8SgXawASnkdQ994atn";
      final pubKey =
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
      expect(key.account(1001).pointer, nullptr);
    });

    test('addressAddRemoveDerivationPath', () {
      final passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      final coin = TWCoinType.TWCoinTypeBitcoin;
      final key = createAStoredKey(coin, password);

      final wallet = key.wallet(password);
      final accountCoin = key.accountForCoin(coin, wallet);
      final accountAddress = accountCoin.address;
      expect(accountAddress, 'bc1qturc268v0f2srjh4r2zu4t6zk4gdutqd5a6zny');

      expect(key.accountCount, 1);
      final accountIndex = key.account(0);

      final derivationPath0 = "m/84'/0'/0'/0/0";
      final derivationPath1 = "m/84'/0'/0'/1/0";

      key.removeAccountForCoinDerivationPath(coin, derivationPath1);
      expect(key.accountCount, 1);

      key.removeAccountForCoinDerivationPath(coin, derivationPath0);
      expect(key.accountCount, 0);
    });

    test('addressAddDerivation', () {
      final passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      final coin = TWCoinType.TWCoinTypeBitcoin;
      final key = createAStoredKey(coin, password);
      final wallet = key.wallet(password);

      final accountCoin1 = key.accountForCoinDerivation(
        coin: coin,
        derivation: TWDerivation.TWDerivationDefault,
        wallet: wallet,
      );
      final accountAddress1 = accountCoin1.address;
      expect(accountAddress1, 'bc1qturc268v0f2srjh4r2zu4t6zk4gdutqd5a6zny');

      final accountCoin2 = key.accountForCoinDerivation(
        coin: coin,
        derivation: TWDerivation.TWDerivationBitcoinLegacy,
        wallet: wallet,
      );
      final accountAddress2 = accountCoin2.address;
      expect(accountAddress2, '1NyRyFewhZcWMa9XCj3bBxSXPXyoSg8dKz');

      expect(key.accountCount, 2);
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
        encryption: TWStoredKeyEncryption.TWStoredKeyEncryptionAes256Ctr,
      );
      final outFileName = '$projectRoot/test/cache/TWStoredKey_store.json';
      expect(key.store(outFileName), true);

      final file = File(outFileName);
      final json = file.readAsStringSync();
      expect(json.length > 20, true);

      final key2 = TWStoredKey.importJSON(json);
      final name2 = key2.name;
      expect(name2, 'name');
    });

    test('storeAndImportJSON', () {
      final key = createDefaultStoredKey();
      final outFileName = '$projectRoot/test/cache/TWStoredKey_store.json';
      expect(key.store(outFileName), true);

      final file = File(outFileName);
      expect(file.existsSync(), true);
      final json = file.readAsStringSync();
      expect(json.length > 20, true);

      final key2 = TWStoredKey.importJSON(json);
      final name2 = key2.name;
      expect(name2, 'name');
    });

    test('importJsonInvalid', () {
      final jsonInvalidStr = ']]]}}}_THIS_IS_AN_INVALID_JSON_}}}]]]';
      final nokey = TWStoredKey.importJSON(jsonInvalidStr);
      expect(nokey.pointer, nullptr);
    });

    test('fixAddresses', () {
      final passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      final key = createAStoredKey(TWCoinType.TWCoinTypeBitcoin, password);
      expect(key.fixAddresses(password), true);
    });

    test('importInvalidKey', () {
      final data = TWData.createWithHexString(
              'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141')
          .bytes()!;
      final name = 'test';
      final password = TWData.createWithString(name).bytes()!;

      final eth = TWStoredKey.importPrivateKey(
        privateKey: data,
        name: name,
        password: password,
        coin: TWCoinType.TWCoinTypeEthereum,
      );
      final ont = TWStoredKey.importPrivateKey(
        privateKey: data,
        name: name,
        password: password,
        coin: TWCoinType.TWCoinTypeOntology,
      );
      final tezos = TWStoredKey.importPrivateKey(
        privateKey: data,
        name: name,
        password: password,
        coin: TWCoinType.TWCoinTypeTezos,
      );

      expect(eth.pointer, nullptr);
      expect(ont.pointer, nullptr);
      expect(tezos.pointer != nullptr, true);
    });

    test('removeAccountForCoin', () {
      final passwordString = 'password';
      final password = TWData.createWithString(passwordString).bytes()!;

      final name = 'Test KeyStore';
      final key = TWStoredKey(
        name: name,
        password: password,
      );
      final wallet = key.wallet(password);

      expect(
        key
                .accountForCoin(
                  TWCoinType.TWCoinTypeEthereum,
                  wallet,
                )
                .pointer !=
            nullptr,
        true,
      );
      expect(
        key
                .accountForCoin(
                  TWCoinType.TWCoinTypeBitcoin,
                  wallet,
                )
                .pointer !=
            nullptr,
        true,
      );

      expect(key.accountCount, 2);

      key.removeAccountForCoin(TWCoinType.TWCoinTypeBitcoin);

      expect(key.accountCount, 1);

      expect(
        key
                .accountForCoin(
                  TWCoinType.TWCoinTypeEthereum,
                  TWHDWallet.fromPointer(nullptr),
                )
                .pointer !=
            nullptr,
        true,
      );
      expect(
        key
            .accountForCoin(
              TWCoinType.TWCoinTypeBitcoin,
              TWHDWallet.fromPointer(nullptr),
            )
            .pointer,
        nullptr,
      );
    });

    test('getWalletPasswordInvalid', () {
      final name = 'name';
      final passwordString = 'psaaword';
      final password = TWData.createWithString(passwordString).bytes()!;

      final invailString = '_THIS_IS_INVALID_PASSWORD_';
      final invalidPassword = TWData.createWithString(invailString).bytes()!;

      final key = TWStoredKey(
        name: name,
        password: password,
      );
      expect(key.wallet(password).pointer != nullptr, true);
      expect(key.wallet(invalidPassword).pointer, nullptr);
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
