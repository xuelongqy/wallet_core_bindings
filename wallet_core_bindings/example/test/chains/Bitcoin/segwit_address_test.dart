import 'dart:typed_data';

import 'package:bech32/bech32.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

const valid_checksum = [
  "A12UEL5L",
  "an83characterlonghumanreadablepartthatcontainsthenumber1andtheexcludedcharactersbio1tt5tgs",
  "abcdef1qpzry9x8gf2tvdw0s3jn54khce6mua7lmqqqxw",
  "11qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqc8247j",
  "split1checkupstagehandshakeupstreamerranterredcaperred2y9e3w",
];

const invalid_checksum = [
  " 1nwldj5",
  "\x7f" "1axkwrx",
  "an124characterslonghumanreadablepartthatcontainsthenumber1andtheexcludedcharactersbio1569pvx0123456789012345678901234567890123456789",
  "pzry9x0s0muk",
  "1pzry9x0s0muk",
  "x1b4n0q5v",
  "li1dgmt3",
  "de1lg7wt\xff",
];

class valid_address_data {
  final String address;
  final String scriptPubKeyHex;

  const valid_address_data(this.address, this.scriptPubKeyHex);
}

class invalid_address_data {
  final String hrp;
  final int version;
  final int program_length;

  const invalid_address_data(this.hrp, this.version, this.program_length);
}

const valid_address = [
  valid_address_data("BC1QW508D6QEJXTDG4Y5R3ZARVARY0C5XW7KV8F3T4",
      "0014751e76e8199196d454941c45d1b3a323f1433bd6"),
  valid_address_data(
      "tb1qrp33g0q5c5txsp9arysrx4k6zdkfs4nce4xj0gdcccefvpysxf3q0sl5k7",
      "00201863143c14c5166804bd19203356da136c985678cd4d27a1b8c6329604903262"),
  // valid_address_data("bc1pw508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7k7grplx", "5128751e76e8199196d454941c45d1b3a323f1433bd6751e76e8199196d454941c45d1b3a323f1433bd6"),
  // valid_address_data("BC1SW50QA3JX3S", "6002751e"),
  // valid_address_data("bc1zw508d6qejxtdg4y5r3zarvaryvg6kdaj", "5210751e76e8199196d454941c45d1b3a323"),
  valid_address_data(
      "tb1qqqqqp399et2xygdj5xreqhjjvcmzhxw4aywxecjdzew6hylgvsesrxh6hy",
      "0020000000c4a5cad46221b2a187905e5266362b99d5e91c6ce24d165dab93e86433"),
  valid_address_data("bc1qpjult34k9spjfym8hss2jrwjgf0xjf40ze0pp8",
      "00140cb9f5c6b62c03249367bc20a90dd2425e6926af"),
  valid_address_data("bc1qm9jzmujvdqjj6y28hptk859zs3yyv78hpqqjfj",
      "0014d9642df24c68252d1147b85763d0a284484678f7"),
  valid_address_data(
      "bc1ptmsk7c2yut2xah4pgflpygh2s7fh0cpfkrza9cjj29awapv53mrslgd5cf",
      "51205ee16f6144e2d46edea1427e1222ea879377e029b0c5d2e252517aee85948ec7"), // Taproot

  /// test vectors from BIP350
  valid_address_data(
      "bc1pw508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7kt5nd6y",
      "5128751e76e8199196d454941c45d1b3a323f1433bd6751e76e8199196d454941c45d1b3a323f1433bd6"),
  valid_address_data("BC1SW50QGDZ25J", "6002751e"),
  valid_address_data("bc1zw508d6qejxtdg4y5r3zarvaryvaxxpcs",
      "5210751e76e8199196d454941c45d1b3a323"),
  valid_address_data(
      "tb1qqqqqp399et2xygdj5xreqhjjvcmzhxw4aywxecjdzew6hylgvsesrxh6hy",
      "0020000000c4a5cad46221b2a187905e5266362b99d5e91c6ce24d165dab93e86433"),
  valid_address_data(
      "tb1pqqqqp399et2xygdj5xreqhjjvcmzhxw4aywxecjdzew6hylgvsesf3hn0c",
      "5120000000c4a5cad46221b2a187905e5266362b99d5e91c6ce24d165dab93e86433"),
  valid_address_data(
      "bc1p0xlxvlhemja6c4dqv22uapctqupfhlxm9h8z3k2e72q4k9hcz7vqzk5jj0",
      "512079be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798"),
];

const invalid_address = [
  /// test vectors from BIP73
  //"tc1qw508d6qejxtdg4y5r3zarvary0c5xw7kg3g4ty", // Invalid human-readable part
  "bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t5", // Invalid checksum
  "BC13W508D6QEJXTDG4Y5R3ZARVARY0C5XW7KN40WF2", // Invalid witness version
  "bc1rw5uspcuh", // Invalid program length
  "bc10w508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7kw5rljs90", // Invalid program length
  "BC1QR508D6QEJXTDG4Y5R3ZARVARYV98GJ9P", // Invalid program length for witness version 0 (per BIP141)
  "tb1qrp33g0q5c5txsp9arysrx4k6zdkfs4nce4xj0gdcccefvpysxf3q0sL5k7", // Mixed case
  "bc1zw508d6qejxtdg4y5r3zarvaryvqyzf3du", // zero padding of more than 4 bits
  "tb1qrp33g0q5c5txsp9arysrx4k6zdkfs4nce4xj0gdcccefvpysxf3pjxtptv", // Non-zero padding in 8-to-5 conversion
  "bc1gmk9yu", // Empty data section

  /// test vectors from BIP350
  //"tc1p0xlxvlhemja6c4dqv22uapctqupfhlxm9h8z3k2e72q4k9hcz7vq5zuyut", // Invalid human-readable part
  "bc1p0xlxvlhemja6c4dqv22uapctqupfhlxm9h8z3k2e72q4k9hcz7vqh2y7hd", // Invalid checksum (Bech32 instead of Bech32m)
  "tb1z0xlxvlhemja6c4dqv22uapctqupfhlxm9h8z3k2e72q4k9hcz7vqglt7rf", // Invalid checksum (Bech32 instead of Bech32m)
  "BC1S0XLXVLHEMJA6C4DQV22UAPCTQUPFHLXM9H8Z3K2E72Q4K9HCZ7VQ54WELL", // Invalid checksum (Bech32 instead of Bech32m)
  "bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kemeawh", // Invalid checksum (Bech32m instead of Bech32)
  "tb1q0xlxvlhemja6c4dqv22uapctqupfhlxm9h8z3k2e72q4k9hcz7vq24jc47", // Invalid checksum (Bech32m instead of Bech32)
  "bc1p38j9r5y49hruaue7wxjce0updqjuyyx0kh56v8s25huc6995vvpql3jow4", // Invalid character in checksum
  "BC130XLXVLHEMJA6C4DQV22UAPCTQUPFHLXM9H8Z3K2E72Q4K9HCZ7VQ7ZWS8R", // Invalid witness version
  "bc1pw5dgrnzv", // Invalid program length (1 byte)
  "bc1p0xlxvlhemja6c4dqv22uapctqupfhlxm9h8z3k2e72q4k9hcz7v8n0nx0muaewav253zgeav", // Invalid program length (41 bytes)
  "BC1QR508D6QEJXTDG4Y5R3ZARVARYV98GJ9P", // Invalid program length for witness version 0 (per BIP141)
  "tb1p0xlxvlhemja6c4dqv22uapctqupfhlxm9h8z3k2e72q4k9hcz7vq47Zagq", // Mixed case
  "bc1p0xlxvlhemja6c4dqv22uapctqupfhlxm9h8z3k2e72q4k9hcz7v07qwwzcrf", // zero padding of more than 4 bits
  "tb1p0xlxvlhemja6c4dqv22uapctqupfhlxm9h8z3k2e72q4k9hcz7vpggkg4j", // Non-zero padding in 8-to-5 conversion
  "bc1gmk9yu", // Empty data section

  "an84characterslonghumanreadablepartthatcontainsthetheexcludedcharactersbioandnumber11d6pts4", // overall max length exceeded
  "bc1q9zpgru", // 1 byte data (only version byte)
  "BC1SW50QA3JX3S", // version = 16
  "bc1zw508d6qejxtdg4y5r3zarvaryvg6kdaj", // version = 2
];

const invalid_address_enc = [
  invalid_address_data("BC", 0, 20),
  invalid_address_data("bc", 0, 21),
  invalid_address_data("bc", 17, 32),
  invalid_address_data("bc", 1, 1),
  invalid_address_data("bc", 16, 41),
];

Uint8List segwit_scriptpubkey(int witver, Uint8List witprog) {
  List<int> ret = [];
  ret.add(witver != 0 ? (0x50 + (witver & 0x1f)) : 0);
  ret.add(witprog.length);
  ret.addAll(witprog);
  return Uint8List.fromList(ret);
}

bool case_insensitive_equal(String s1, String s2) {
  return s1.toLowerCase() == s2.toLowerCase();
}

Bech32Codec bech32 = const Bech32Codec();

void main() {
  initTest();
  group('SegwitAddress', () {
    test('ValidChecksum', () {
      for (var checksum in valid_checksum) {
        final dec = bech32.decode(checksum);
        expect(dec.hrp.isEmpty, false);

        final recode = bech32.encode(Bech32(dec.hrp, dec.data));
        expect(recode.isEmpty, false);

        expect(case_insensitive_equal(recode, checksum), true);
      }
    });

    test('InvalidChecksum', () {
      for (var checksum in invalid_checksum) {
        try {
          final dec = bech32.decode(checksum);
          expect(dec.data.isNotEmpty || dec.hrp.isNotEmpty, false);
        } catch (e) {
          expect(e.toString().isEmpty, false);
        }
      }
    });

    test('ValidAddress', () {
      for (var td in valid_address) {
        final dec = TWSegwitAddress(td.address);
        expect(dec.witnessProgram.isNotEmpty, true);
        expect(dec.hrp.hrp > -1, true);

        // recode
        final recode = dec.description;
        expect(case_insensitive_equal(td.address, recode), true);

        final spk = segwit_scriptpubkey(dec.witnessVersion, dec.witnessProgram);
        expectHex(spk, td.scriptPubKeyHex);
      }
    });

    test('InvalidAddress', () {
      for (var addr in invalid_address) {
        expect(TWSegwitAddress.isValidString(addr), false);
      }
    });

    test('LegacyAddress', () {
      expect(
          TWSegwitAddress.isValidString('TLWEciM1CjP5fJqM2r9wymAidkkYtTU5k3'),
          false);
    });

    test('Equals', () {
      final dec1 =
          TWSegwitAddress('bc1qpjult34k9spjfym8hss2jrwjgf0xjf40ze0pp8');
      expect(dec1.hrp == TWHRP.forString('bc'), true);
      final addr1 = dec1.description;
      final dec2 =
          TWSegwitAddress('bc1qm9jzmujvdqjj6y28hptk859zs3yyv78hpqqjfj');
      expect(dec2.hrp == TWHRP.forString('bc'), true);
      final addr2 = dec2.description;

      expect(addr1 != addr2, true);
    });

    test('TestnetAddress', () {
      const mnemonic1 =
          "ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal";
      const passphrase = "";
      const coin = TWCoinType.Bitcoin;
      final wallet =
          TWHDWallet.createWithMnemonic(mnemonic1, passphrase: passphrase);

      // default
      {
        final privKey = wallet.getKeyForCoin(coin);
        final pubKey = privKey.getPublicKeySecp256k1(true);
        expectHex(pubKey.data,
            '02df9ef2a7a5552765178b181e1e1afdefc7849985c7dfe9647706dd4fa40df6ac');
        expect(
            TWSegwitAddress.createWithPublicKey(TWHRP.forString('bc'), pubKey)
                .description,
            'bc1qpsp72plnsqe6e2dvtsetxtww2cz36ztmfxghpd');
      }

      // testnet: different derivation path and hrp
      {
        final privKey = wallet.getKey(coin, "m/84'/1'/0'/0/0");
        final pubKey = privKey.getPublicKeySecp256k1(true);
        expectHex(pubKey.data,
            '03eb1a535b59f03894b99319f850c784cf4164f4de07620695c5cf0dc5c1ab2a54');
        expect(
          TWAnyAddress.createWithPublicKeyDerivation(
                  publicKey: pubKey,
                  coin: coin,
                  derivation: TWDerivation.Testnet)
              .description,
          'tb1qq8p994ak933c39d2jaj8n4sg598tnkhnyk5sg5',
        );
        expect(
            TWSegwitAddress.isValidString(
                'tb1qq8p994ak933c39d2jaj8n4sg598tnkhnyk5sg5'),
            true);
      }
    });

    test('SegwitDerivationHDWallet', () {
      const mnemonic1 =
          "ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal";
      const passphrase = "";
      const coin = TWCoinType.Bitcoin;
      final wallet =
          TWHDWallet.createWithMnemonic(mnemonic1, passphrase: passphrase);

      // addresses with different derivations
      expect(wallet.getAddressForCoin(coin),
          'bc1qpsp72plnsqe6e2dvtsetxtww2cz36ztmfxghpd');
      expect(wallet.getAddressDerivation(coin, TWDerivation.Default),
          'bc1qpsp72plnsqe6e2dvtsetxtww2cz36ztmfxghpd');
      expect(wallet.getAddressDerivation(coin, TWDerivation.Segwit),
          'bc1qpsp72plnsqe6e2dvtsetxtww2cz36ztmfxghpd');
      expect(wallet.getAddressDerivation(coin, TWDerivation.Legacy),
          '1GVb4mfQrvymPLz7zeZ3LnQ8sFv3NedZXe');
      expect(wallet.getAddressDerivation(coin, TWDerivation.Testnet),
          'tb1qq8p994ak933c39d2jaj8n4sg598tnkhnyk5sg5');
    });
  });
}
