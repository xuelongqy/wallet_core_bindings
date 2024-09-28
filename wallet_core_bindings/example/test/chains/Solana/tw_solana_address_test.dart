import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWSolanaAddress', () {
    const coin = TWCoinType.Solana;

    test('HDWallet', () {
      const mnemonic =
          "shoot island position soft burden budget tooth cruel issue economy destroy above";
      const passphrase = "";

      final wallet =
          TWHDWallet.createWithMnemonic(mnemonic, passphrase: passphrase);

      final privateKey = wallet.getKey(coin, coin.derivationPath);
      final publicKey = privateKey.getPublicKeyEd25519();
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressStr = address.description;
      
      expect(addressStr, '2bUBiBNZyD29gP1oV6de7nxowMLoDBtopMMTGgMvjG5m');
    });

    test('defaultTokenAddress', () {
      const solAddress = "B1iGmDJdvmxyUiYM8UEo2Uw2D58EmUrw4KyLYMmrhf8V";
      const serumToken = "SRMuApVNdxXokk5GT7XD5cUUgXMBCoAz2LHeuAoKWRt";

      final solanaAddress = TWSolanaAddress(solAddress);
      final description = solanaAddress.description;
      final tokenAddress = solanaAddress.defaultTokenAddress(serumToken);
      
      expect(tokenAddress, 'EDNd1ycsydWYwVmrYZvqYazFqwk1QjBgAUKFjBoz1jKP');
      expect(description, 'B1iGmDJdvmxyUiYM8UEo2Uw2D58EmUrw4KyLYMmrhf8V');
    });

    test('defaultTokenAddressError', () {
      const solAddress = "B1iGmDJdvmxyUiYM8UEo2Uw2D58EmUrw4KyLYMmrhf8V";
      // Invalid token mint address.
      const serumToken = "SRMuApVNdxXokk5GT7XD5cUUgXMBCoAz2LHeuAoKW";

      final solanaAddress = TWSolanaAddress(solAddress);
      final description = solanaAddress.description;

      expect(solanaAddress.defaultTokenAddress(serumToken), null);
    });

    test('token2022Address', () {
      const solAddress = "68dzdXkni9BrAwU1asAwurMEdQhXUJq6MNY8niDAny8t";
      const catwifhatToken = "7atgF8KQo4wJrD5ATGX7t1V2zVvykPJbFfNeVf1icFv1";

      final solanaAddress = TWSolanaAddress(solAddress);
      final description = solanaAddress.description;
      final tokenAddress = solanaAddress.token2022Address(catwifhatToken);

      expect(tokenAddress, '3PaFQnebQMHBgthRScup2B932cMxA1GBP7m9roCkomHq');
      expect(description, '68dzdXkni9BrAwU1asAwurMEdQhXUJq6MNY8niDAny8t');
    });

    test('token2022AddressError', () {
      const solAddress = "68dzdXkni9BrAwU1asAwurMEdQhXUJq6MNY8niDAny8t";
      // Invalid token mint address.
      const catwifhatToken = "7atgF8KQo4wJrD5ATGX7t1V2zVvykPJbFfNeVf1icF";

      final solanaAddress = TWSolanaAddress(solAddress);
      final description = solanaAddress.description;

      expect(solanaAddress.token2022Address(catwifhatToken), null);
    });
  });
}
