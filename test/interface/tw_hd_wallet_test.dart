import 'dart:ffi';
import 'dart:math';
import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

const wordsStr =
    "ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal";
const gWords = wordsStr;
const gPassphrase = "TREZOR";
const seedHex =
    "7ae6f661157bda6492f6162701e570097fc726b6235011ea5ad09bf04986731ed4d92bc43cbdee047b60ea0dd1b1fa4274377c9bf5bd14ab1982c272d8076f29";
const entropyHex = "ba5821e8c356c05ba5f025d9532fe0f21f65d594";

void expectHex(Uint8List actual, String expected) {
  expect(TWString.createWithHexBytes(actual).value, expected);
}

void main() {
  group(TWHDWallet, () {
    test('CreateFromMnemonic', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      expect(wallet.mnemonic, wordsStr);
      expectHex(wallet.entropy, entropyHex);
      expectHex(wallet.seed, seedHex);
    });

    test('CreateFromEntropy', () {
      final wallet = TWHDWallet.createWithEntropy(
          TWData.createWithHexString(entropyHex).bytes()!,
          passphrase: gPassphrase);
      expect(wallet.mnemonic, wordsStr);
      expectHex(wallet.entropy, entropyHex);
      expectHex(wallet.seed, seedHex);
    });

    test('Generate', () {
      final wallet = TWHDWallet(strength: 128, passphrase: gPassphrase);
      expect(TWMnemonic.isValid(wallet.mnemonic), true);
    });

    test('SeedWithExtraSpaces', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      expectHex(wallet.seed, seedHex);
    });

    test('CreateFromMnemonicNoPassword', () {
      final wallet = TWHDWallet.createWithMnemonic(gWords);
      expectHex(wallet.seed,
          '354c22aedb9a37407adc61f657a6f00d10ed125efa360215f36c6919abd94d6dbc193a5f9c495e21ee74118661e327e84a5f5f11fa373ec33b80897d4697557d');
    });

    test('CreateFromMnemonicCheck', () {
      final wallet = TWHDWallet.createWithMnemonicCheck(gWords, false);
      expectHex(wallet.seed,
          '354c22aedb9a37407adc61f657a6f00d10ed125efa360215f36c6919abd94d6dbc193a5f9c495e21ee74118661e327e84a5f5f11fa373ec33b80897d4697557d');
    });

    test('CreateFromStrengthInvalid', () {
      final wallet = TWHDWallet(strength: 64);
      expect(wallet.pointer, nullptr);
    });

    test('CreateFromStrengthInvalid', () {
      final wallet = TWHDWallet.createWithMnemonic("THIS IS INVALID MNEMONIC");
      expect(wallet.pointer, nullptr);
    });

    test('MasterPrivateKey', () {
      final wallet = TWHDWallet.createWithMnemonic(gWords);
      final key1 = wallet.getMasterKey(TWCurve.TWCurveSECP256k1);
      final hexKey1 = key1.data;

      final key2 = wallet.getMasterKey(TWCurve.TWCurveED25519);
      final hexKey2 = key2.data;

      expectHex(hexKey1,
          'd1b2b553b053f278d510a8494ead811252b1d5ec0da4434d0997a75de92bcea9');
      expectHex(hexKey2,
          'd258c2521f7802b8e83c32f2cc97bd06b69747847390c5e247a3d19faa74202e');
    });

    test('Derive', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      final key0 = wallet.getKeyForCoin(TWCoinType.TWCoinTypeEthereum);

      final publicKey0 = key0.getPublicKeySecp256k1(false);
      final publicKey0Data = publicKey0.data;

      expectHex(publicKey0Data,
          '0414acbe5a06c68210fcbb77763f9612e45a526990aeb69d692d705f276f558a5ae68268e9389bb099ed5ac84d8d6861110f63644f6e5b447e3f86b4bab5dee011');
    });

    test('DeriveBitcoinNonextended', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      final key = wallet.getKeyForCoin(TWCoinType.TWCoinTypeBitcoin);
      final publicKey = key.getPublicKeySecp256k1(false);
      final publickKeyData = publicKey.data;

      expectHex(publickKeyData,
          '047ea5dff03f677502c4a1d73c5ac897200e56b155e876774c8fba0cc22f80b9414ec07cda7b1c9a84c2e04ea2746c21afacc5e91b47427c453c3f1a4a3e983ce5');
      // Note: address derivation does not work with nonextended public key
    });

    test('DeriveBitcoinExtended', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      final key = wallet.getKeyForCoin(TWCoinType.TWCoinTypeBitcoin);
      final publicKey = key.getPublicKeySecp256k1(true);
      final publickKeyData = publicKey.data;

      expectHex(publickKeyData,
          '037ea5dff03f677502c4a1d73c5ac897200e56b155e876774c8fba0cc22f80b941');

      final address = TWCoinTypeDeriveAddressFromPublicKey(
          TWCoinType.TWCoinTypeBitcoin, publicKey);
      expect(address, 'bc1qumwjg8danv2vm29lp5swdux4r60ezptzz7ce85');
    });

    test('GetKeyDerivation', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      {
        final key = wallet.getKeyDerivation(TWCoinType.TWCoinTypeBitcoin,
            TWDerivation.TWDerivationBitcoinSegwit);
        expectHex(key.data,
            '1901b5994f075af71397f65bd68a9fff8d3025d65f5a2c731cf90f5e259d6aac');
        final publicKey = key.getPublicKeySecp256k1(true);
        final publicKeyData = publicKey.data;
        expectHex(publicKeyData,
            '037ea5dff03f677502c4a1d73c5ac897200e56b155e876774c8fba0cc22f80b941');
      }
      {
        final key = wallet.getKeyDerivation(TWCoinType.TWCoinTypeBitcoin,
            TWDerivation.TWDerivationBitcoinLegacy);
        expectHex(key.data,
            '28071bf4e2b0340db41b807ed8a5514139e5d6427ff9d58dbd22b7ed187103a4');
        final publicKey = key.getPublicKeySecp256k1(true);
        final publicKeyData = publicKey.data;
        expectHex(publicKeyData,
            '0240ebf906b948281289405317a5eb9a98045af8a8ab5311b2e3060cfb66c507a1');
      }
    });

    test('DeriveAddressBitcoin', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      final address = wallet.getAddressForCoin(TWCoinType.TWCoinTypeBitcoin);
      expect(address, 'bc1qumwjg8danv2vm29lp5swdux4r60ezptzz7ce85');
    });

    test('DeriveAddressBitcoinDerivation', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      {
        final address = wallet.getAddressDerivation(
            TWCoinType.TWCoinTypeBitcoin,
            TWDerivation.TWDerivationBitcoinSegwit);
        expect(address, 'bc1qumwjg8danv2vm29lp5swdux4r60ezptzz7ce85');
      }
      {
        final address = wallet.getAddressDerivation(
            TWCoinType.TWCoinTypeBitcoin,
            TWDerivation.TWDerivationBitcoinLegacy);
        expect(address, '1PeUvjuxyf31aJKX6kCXuaqxhmG78ZUdL1');
      }
    });

    test('DeriveEthereum', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      final key = wallet.getKeyForCoin(TWCoinType.TWCoinTypeEthereum);
      final key2 = wallet.getKeyForCoin(TWCoinType.TWCoinTypeSmartChain);

      final publicKey = key.getPublicKeySecp256k1(false);
      final publicKey2 = key2.getPublicKeySecp256k1(false);
      final publicKeyData = publicKey.data;

      final address = TWCoinTypeDeriveAddressFromPublicKey(
          TWCoinType.TWCoinTypeEthereum, publicKey);
      final address2 = TWCoinTypeDeriveAddressFromPublicKey(
          TWCoinType.TWCoinTypeSmartChain, publicKey2);

      expectHex(publicKeyData,
          '0414acbe5a06c68210fcbb77763f9612e45a526990aeb69d692d705f276f558a5ae68268e9389bb099ed5ac84d8d6861110f63644f6e5b447e3f86b4bab5dee011');
      expect(address, '0x27Ef5cDBe01777D62438AfFeb695e33fC2335979');
      expect(address2, '0x27Ef5cDBe01777D62438AfFeb695e33fC2335979');
    });

    test('DeriveAddressEthereum', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      final address = wallet.getAddressForCoin(TWCoinType.TWCoinTypeEthereum);
      expect(address, '0x27Ef5cDBe01777D62438AfFeb695e33fC2335979');
    });

    test('DeriveCosmos', () {
      // use `gaiacli keys add key_name` to generate mnemonic words and private key
      final wallet = TWHDWallet.createWithMnemonic(
          'attract term foster morning tail foam excite copper disease measure cheese camera rug enroll cause flip sword waste try local purchase between idea thank');
      final privateKey = wallet.getKeyForCoin(TWCoinType.TWCoinTypeCosmos);
      final privateKeyData = privateKey.data;

      expectHex(privateKeyData,
          '80e81ea269e66a0a05b11236df7919fb7fbeedba87452d667489d7403a02f005');

      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final publicKeyData = publicKey.data;

      expectHex(publicKeyData,
          '0257286ec3f37d33557bbbaa000b27744ac9023aa9967cae75a181d1ff91fa9dc5');
    });

    test('DeriveNimiq', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      final key = wallet.getKeyForCoin(TWCoinType.TWCoinTypeNimiq);
      final publicKey = key.getPublicKeyEd25519();
      final publicKeyData = publicKey.data;

      expectHex(publicKeyData,
          '1937063865fe3294ccf3017837207bb3fea71a53720ae631b77bf9d5ca4f7f4c');
    });

    test('DeriveTezos', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      final key = wallet.getKeyForCoin(TWCoinType.TWCoinTypeTezos);
      final publicKey = key.getPublicKeyEd25519();
      final publicKeyData = publicKey.data;

      expectHex(publicKeyData,
          'c834147f97bcf95bf01f234455646a197f70b25e93089591ffde8122370ad371');
    });

    test('DeriveDoge', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      final key = wallet.getKeyForCoin(TWCoinType.TWCoinTypeDogecoin);
      final publicKey = key.getPublicKeySecp256k1(true);
      final publicKeyData = publicKey.data;

      expectHex(publicKeyData,
          '039fc134623a37c8ee44881f088a599cc44ba8a95f91f860b99d9d3b11f487e4c0');

      final xprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.TWPurposeBIP44,
        coin: TWCoinType.TWCoinTypeDogecoin,
        version: TWHDVersion.TWHDVersionDGPV,
      );
      expect(xprv,
          'dgpv57ru95KiYUB5oWm2CVQH4heh1f7E9dNGdRHHVThcQkLeQ2HHxVJfFYefnpKrWZ6L6EDKJHUVq4Yyd5kPZKnRePfkCz3EzkySTydXKbgjcxN');

      final xpub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.TWPurposeBIP44,
        coin: TWCoinType.TWCoinTypeDogecoin,
        version: TWHDVersion.TWHDVersionDGUB,
      );
      expect(xpub,
          'dgub8rjvUmFc6cqR6NRBEj2FBZCHUDUrykPyv24Vea6bCsPex5PzNFrRtr4KN37XgwuVzzC2MikJRW2Ddcp99Ehsqp2iaU4eerNCJVruKxz6Gci');
    });

    test('DeriveZilliqa', () {
      final wallet =
          TWHDWallet.createWithMnemonic(gWords, passphrase: gPassphrase);
      final key = wallet.getKeyForCoin(TWCoinType.TWCoinTypeZilliqa);
      final publicKey = key.getPublicKeySecp256k1(true);
      final publicKeyData = publicKey.data;

      expectHex(publicKeyData,
          '0262746d4988c63b9972c63272461e9fa080d4dfa2a1fda3dd01285620c0a60c22');
    });

    test('DeriveAionPrivateKey', () {
      final wallet = TWHDWallet.createWithMnemonic(
          'zero behind diesel afraid edge salad drop episode high pear twin resource');
      final privateKey = wallet.getKeyForCoin(TWCoinType.TWCoinTypeAion);
      final privateKeyData = privateKey.data;

      expectHex(privateKeyData,
          'db33ffdf82c7ba903daf68d961d3c23c20471a8ce6b408e52d579fd8add80cc9');
    });

    test('DeriveFIO', () {
      final wallet = TWHDWallet.createWithMnemonic(
          'valley alien library bread worry brother bundle hammer loyal barely dune brave');
      final privateKey = wallet.getKeyForCoin(TWCoinType.TWCoinTypeFIO);
      final privateKeyData = privateKey.data;
      final prefix = TWData(Uint8List.fromList([0x80]));
      prefix.appendBytes(privateKeyData);
      final base58 = TWBase58.encode(prefix.bytes()!);

      expectHex(privateKeyData,
          'ea8eb60b7e5868e218f248e032769020b4fea5dcfd02f2992861eaf4fb534854');
      expect(base58,
          '5Kbb37EAqQgZ9vWUHoPiC2uXYhyGSFNbL6oiDp24Ea1ADxV1qnu');
    });
  });
}
