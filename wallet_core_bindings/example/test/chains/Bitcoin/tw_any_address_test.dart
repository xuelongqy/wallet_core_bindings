import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void testBitcoinAddressFromPublicKeyDerivation(
    String privateKey, TWDerivation derivation, String expectedAddr) {
  final privkey = TWPrivateKey.createWithHexString(privateKey);
  final pubkey = privkey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
  final addr = TWAnyAddress.createWithPublicKeyDerivation(
    publicKey: pubkey,
    coin: TWCoinType.Bitcoin,
    derivation: derivation,
  );
  final addrDescription = addr.description;
  expect(addrDescription, expectedAddr);
}

void main() {
  initTest();
  group('TWBitcoinAnyAddress', () {
    test('CreateFromPublicKey', () {
      testBitcoinAddressFromPublicKeyDerivation(
          "a26b7ffda8ad29cf3aba066cc43ce255cb13b3fba5fa9b638f4685333e3670fd",
          TWDerivation.Default,
          "bc1qj7uu67l9zkajuhx976d8fvj2ylc29gnq3kjm3r");
    });

    test('CreateFromPublicKeyWithDerivationLegacy', () {
      testBitcoinAddressFromPublicKeyDerivation(
          "a8212108f1f2a42b18b642c2dbe6e388e75de89ca7be9b6f7648bab06cdedabf",
          TWDerivation.BitcoinLegacy,
          "1JspsmYcHGLjRDavb62hodTb7BW8GGia7v");
    });

    test('CreateFromPublicKeyWithDerivationTaproot', () {
      testBitcoinAddressFromPublicKeyDerivation(
          "e5bbc9cab0ff9ec86889bcd84d79ca484b017763614cd4fa3bf4aa49ad9d55a9",
          TWDerivation.BitcoinTaproot,
          "bc1pkup60ng64cthqujp38l57y0eewkyqy35s86tmqjcc5yzgmz9l2gscz37tx");
      testBitcoinAddressFromPublicKeyDerivation(
          "ae39965b1e73944763eb8ddaeb126d9cbde772a5c141e3ad5791f8e7f094a089",
          TWDerivation.BitcoinTaproot,
          "bc1plvzy756f4t2p32n29jy9vrqcrj46g5yka7u7e89tkeufx5urgyss38y98d");
      testBitcoinAddressFromPublicKeyDerivation(
          "e0721275d0f94bf4d0f59bf0bef42179f680e38dfb306e1d0e3c13ab1d797d20",
          TWDerivation.BitcoinTaproot,
          "bc1puu933ez5v6w99w9dqsmwdeajpnrvknc65tlnrdx3xhxwd954mudsa39gum");
    });
  });
}
