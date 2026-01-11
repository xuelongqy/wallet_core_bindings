import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  const coin = TWCoinType.TON;

  group('TWTheOpenNetwork', () {
    test('Address', () {
      const mnemonic =
          'stuff diamond cycle federal scan spread pigeon people engage teach snack grain';

      final wallet = TWHDWallet.createWithMnemonic(mnemonic);

      final privateKey = wallet.getKey(coin, coin.derivationPath);
      final publicKey = privateKey.getPublicKeyEd25519();
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressStr = address.description;

      expect(addressStr, 'UQDYW_1eScJVxtitoBRksvoV9cCYo4uKGWLVNIHB1JqRRyQx');
    });

    test('AddressValidate', () {
      const string = 'EQCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsorkdl';

      expect(TWAnyAddress.isValid(string, coin), true);
      final addr = TWAnyAddress(string, coin);

      final keyHash = addr.data;
      expectHex(keyHash,
          '8a8627861a5dd96c9db3ce0807b122da5ed473934ce7568a5b4b1c361cbb28ae');

      final normalized = addr.description;
      expect(normalized, 'UQCKhieGGl3ZbJ2zzggHsSLaXtRzk0znVopbSxw2HLsorhqg');
    });
  });
}
