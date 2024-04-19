import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('Nano', () {
    const coin = TWCoinType.TWCoinTypeNano;

    test('DeriveAddress', () {
      // Amongst other things, test that the mnemonic is compatible between different wallets
      final words =
          "edge defense waste choose enrich upon flee junk siren film clown finish luggage leader kid quick brick print evidence swap drill paddle truly occur";
      final passphrase = "some password";

      final wallet =
          TWHDWallet.createWithMnemonic(words, passphrase: passphrase);
      final key = wallet.getKeyForCoin(coin);
      final publicKey = key.getPublicKeyEd25519Blake2b();

      expect(hex(key.data),
          '3be4fc2ef3f3b7374e6fc4fb6e7bb153f8a2998b3b3dab50853eabe128024143');
      expect(hex(publicKey.data),
          '5b65b0e8173ee0802c2c3e6c9080d1a16b06de1176c938a924f58670904e82c4');

      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressString = address.description;

      expect(addressString,
          'nano_1pu7p5n3ghq1i1p4rhmek41f5add1uh34xpb94nkbxe8g4a6x1p69emk8y1d');
    });
  });
}
