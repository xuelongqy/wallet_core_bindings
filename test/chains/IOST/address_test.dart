import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('IOSTAddress', () {
    const coin = TWCoinType.TWCoinTypeIOST;

    test('ValidateAccount', () {
      // https://www.iostabc.com/tx/DnR4QuRDJAjUZ2qfJK9MT92p95BBub2FnyigeXn2Z1es
      expect(TWAnyAddress.isValid('12345xusong', coin), true);
      expect(TWAnyAddress.isValid('12345', coin), true);
      expect(TWAnyAddress.isValid('1234_xuson', coin), true);
      expect(
          TWAnyAddress.isValid(
              'EKRQPgX7nKt8hJABwm9m3BKWGj7kcSECkJnCBauHQWin', coin),
          true);

      expect(TWAnyAddress.isValid('1234', coin), false);
      expect(TWAnyAddress.isValid('1234_xusonG', coin), false);
      expect(TWAnyAddress.isValid('12345xusong6', coin), false);
      expect(
          TWAnyAddress.isValid(
              'bc1quvuarfksewfeuevuc6tn0kfyptgjvwsvrprk9d', coin),
          false);
      expect(TWAnyAddress.isValid('DJRFZNg8jkUtjcpo2zJd92FUAzwRjitw6f', coin),
          false);

      expect(
        TWAnyAddress('EKRQPgX7nKt8hJABwm9m3BKWGj7kcSECkJnCBauHQWin', coin)
            .description,
        'EKRQPgX7nKt8hJABwm9m3BKWGj7kcSECkJnCBauHQWin',
      );
      expect(
        TWAnyAddress('Gcv8c2tH8qZrUYnKdEEdTtASsxivic2834MQW6mgxqto', coin)
            .description,
        'Gcv8c2tH8qZrUYnKdEEdTtASsxivic2834MQW6mgxqto',
      );
    });

    test('FromPrivateKey', () {
      final wallet = TWHDWallet.createWithMnemonic(
          "shoot island position soft burden budget tooth cruel issue economy destroy above");
      final address = wallet.getAddressForCoin(coin);
      expect(address, '4av8w81EyzUgHonsVWqfs15WM4Vrpgox4BYYQWhNQDVu');
    });

    test('EqualOperator', () {
      final acnt1 = TWAnyAddress('account1', coin);
      final acnt2 = TWAnyAddress('account2', coin);
      expect(acnt1, acnt1);
      expect(acnt1 != acnt2, true);
    });
  });
}
