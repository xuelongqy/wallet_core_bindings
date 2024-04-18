import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

// Well-known accounts on Testnet & Devnet,
// https://github.com/multiversx/mx-sdk-testwallets:
final ALICE_BECH32 =
    "erd1qyu5wthldzr8wx5c9ucg8kjagg0jfs53s8nr3zpz3hypefsdd8ssycr6th";
final ALICE_PUBKEY_HEX =
    "0139472eff6886771a982f3083da5d421f24c29181e63888228dc81ca60d69e1";
final ALICE_SEED_HEX =
    "413f42575f7f26fad3317a778771212fdb80245850981e48b58a4f25e344e8f9";
final BOB_BECH32 =
    "erd1spyavw0956vq68xj8y4tenjpq2wd5a9p2c6j8gsz7ztyrnpxrruqzu66jx";
final BOB_PUBKEY_HEX =
    "8049d639e5a6980d1cd2392abcce41029cda74a1563523a202f09641cc2618f8";
final BOB_SEED_HEX =
    "b8ca6f8203fb4b545a8e83c5384da033c415db155b53fb5b8eba7ff5a039d639";
final CAROL_BECH32 =
    "erd1k2s324ww2g0yj38qn2ch2jwctdy8mnfxep94q9arncc6xecg3xaq6mjse8";

void main() {
  const coin = TWCoinType.TWCoinTypeMultiversX;

  group('MultiversXAddress', () {
    test('Valid', () {
      expect(TWAnyAddress.isValid(ALICE_BECH32, coin), true);
      expect(TWAnyAddress.isValid(BOB_BECH32, coin), true);
    });

    test('Invalid', () {
      expect(TWAnyAddress.isValid('', coin), false);
      expect(TWAnyAddress.isValid('foo', coin), false);
      expect(
        TWAnyAddress.isValid(
            '10z9xdugayn528ksaesdwlhf006fw5sg2qmmm0h52fvxczwgesyvq5pwemr',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'xerd10z9xdugayn528ksaesdwlhf006fw5sg2qmmm0h52fvxczwgesyvq5pwemr',
            coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'foo10z9xdugayn528ksaesdwlhf006fw5sg2qmmm0h52fvxczwgesyvq5pwemr',
            coin),
        false,
      );
      expect(TWAnyAddress.isValid(ALICE_PUBKEY_HEX, coin), false);
    });

    test('FromString', () {
      final alice = TWAnyAddress(ALICE_BECH32, coin);
      final bob = TWAnyAddress(BOB_BECH32, coin);

      expectHex(alice.data, ALICE_PUBKEY_HEX);
      expectHex(bob.data, BOB_PUBKEY_HEX);
    });

    test('FromPrivateKey', () {
      final aliceKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final alice = TWAnyAddress.createWithPublicKey(
          aliceKey.getPublicKeyEd25519(), coin);
      expect(ALICE_BECH32, alice.description);

      final bobKey = TWPrivateKey.createWithHexString(BOB_SEED_HEX);
      final bob =
          TWAnyAddress.createWithPublicKey(bobKey.getPublicKeyEd25519(), coin);
      expect(BOB_BECH32, bob.description);
    });

    test('FromPublicKey', () {
      final alice = TWPublicKey.createWithHexString(
        ALICE_PUBKEY_HEX,
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      expect(ALICE_BECH32,
          TWAnyAddress.createWithPublicKey(alice, coin).description);

      final bob = TWPublicKey.createWithHexString(
        BOB_PUBKEY_HEX,
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      expect(
          BOB_BECH32, TWAnyAddress.createWithPublicKey(bob, coin).description);
    });
  });
}
