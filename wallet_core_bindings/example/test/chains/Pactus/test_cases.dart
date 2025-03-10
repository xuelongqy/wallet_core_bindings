import 'package:wallet_core_bindings/proto/Pactus.pb.dart' as Pactus;
import 'package:fixnum/fixnum.dart' as $fixnum;

const PRIVATE_KEY_HEX =
    '4e51f1f3721f644ac7a193be7f5e7b8c2abaa3467871daf4eacb5d3af080e5d6';

class TransferTransaction extends TestCase {
  // Successfully broadcasted transaction:
  // https://pacviewer.com/transaction/1b6b7226f7935a15f05371d1a1fefead585a89704ce464b7cc1d453d299d235f
  @override
  Pactus.SigningInput createSigningInput() {
    final input = Pactus.SigningInput(
      transaction: Pactus.TransactionMessage(
        lockTime: 2335524,
        fee: $fixnum.Int64(10000000),
        memo: 'wallet-core',
        transfer: Pactus.TransferPayload(
          sender: 'pc1rwzvr8rstdqypr80ag3t6hqrtnss9nwymcxy3lr',
          receiver: 'pc1r0g22ufzn8qtw0742dmfglnw73e260hep0k3yra',
          amount: $fixnum.Int64(200000000),
        ),
      ),
    );
    return input;
  }

  @override
  String get transactionID =>
      "1b6b7226f7935a15f05371d1a1fefead585a89704ce464b7cc1d453d299d235f";
  @override
  String get signature =>
      "4ed8fee3d8992e82660dd05bbe8608fc56ceabffdeeee61e3213b9b49d33a0fc"
      "8dea6d79ee7ec60f66433f189ed9b3c50b2ad6fa004e26790ee736693eda8506";
  @override
  String get dataToSign =>
      "0124a3230080ade2040b77616c6c65742d636f726501037098338e0b6808119d"
      "fd4457ab806b9c2059b89b037a14ae24533816e7faaa6ed28fcdde8e55a7df21"
      "8084af5f";
  @override
  String get signedData =>
      "000124a3230080ade2040b77616c6c65742d636f726501037098338e0b680811"
      "9dfd4457ab806b9c2059b89b037a14ae24533816e7faaa6ed28fcdde8e55a7df"
      "218084af5f4ed8fee3d8992e82660dd05bbe8608fc56ceabffdeeee61e3213b9"
      "b49d33a0fc8dea6d79ee7ec60f66433f189ed9b3c50b2ad6fa004e26790ee736"
      "693eda850695794161374b22c696dabb98e93f6ca9300b22f3b904921fbf560b"
      "b72145f4fa";
}

class BondWithPublicKeyTransaction extends TestCase {
  // Successfully broadcasted transaction:
  // https://pacviewer.com/transaction/d194b445642a04ec78ced4448696e50b733f2f0b517a23871882c0eefaf1c28f
  @override
  Pactus.SigningInput createSigningInput() {
    final input = Pactus.SigningInput(
      transaction: Pactus.TransactionMessage(
        lockTime: 2339009,
        fee: $fixnum.Int64(10000000),
        memo: 'wallet-core',
        bond: Pactus.BondPayload(
          sender: 'pc1rwzvr8rstdqypr80ag3t6hqrtnss9nwymcxy3lr',
          receiver: 'pc1p9y5gmu9l002tt60wak9extgvwm69rq3a9ackrl',
          stake: $fixnum.Int64(1000000000),
          publicKey:
              'public1pnz75msstqdrq5eguvcwanug0zauhqjw2cc4flmez3qethnp68y64ehc4k69amapj7x4na2uda0snqz4yxujgx3jsse4f64fgy7jkh0xauvhrc5ts09vfk48g85t0js66hvajm6xruemsvlxqv3xvkyur8v9v0mtn',
        ),
      ),
    );
    return input;
  }

  @override
  String get transactionID =>
      "d194b445642a04ec78ced4448696e50b733f2f0b517a23871882c0eefaf1c28f";
  @override
  String get signature =>
      "0d7bc6d94927534b89e2f53bcfc9fc849e0e2982438955eda55b4338328adac7"
      "9d4ee3216d143f0e1629764ab650734f8ba188e716d71f9eff65e39ce7006300";
  @override
  String get dataToSign =>
      "01c1b0230080ade2040b77616c6c65742d636f726502037098338e0b6808119d"
      "fd4457ab806b9c2059b89b0129288df0bf7bd4b5e9eeed8b932d0c76f451823d"
      "6098bd4dc20b03460a651c661dd9f10f17797049cac62a9fef228832bbcc3a39"
      "355cdf15b68bddf432f1ab3eab8debe1300aa43724834650866a9d552827a56b"
      "bcdde32e3c517079589b54e83d16f9435abb3b2de8c3e677067cc0644ccb1383"
      "3b8094ebdc03";
  @override
  String get signedData =>
      "0001c1b0230080ade2040b77616c6c65742d636f726502037098338e0b680811"
      "9dfd4457ab806b9c2059b89b0129288df0bf7bd4b5e9eeed8b932d0c76f45182"
      "3d6098bd4dc20b03460a651c661dd9f10f17797049cac62a9fef228832bbcc3a"
      "39355cdf15b68bddf432f1ab3eab8debe1300aa43724834650866a9d552827a5"
      "6bbcdde32e3c517079589b54e83d16f9435abb3b2de8c3e677067cc0644ccb13"
      "833b8094ebdc030d7bc6d94927534b89e2f53bcfc9fc849e0e2982438955eda5"
      "5b4338328adac79d4ee3216d143f0e1629764ab650734f8ba188e716d71f9eff"
      "65e39ce700630095794161374b22c696dabb98e93f6ca9300b22f3b904921fbf"
      "560bb72145f4fa";
}

class BondWithoutPublicKeyTransaction extends TestCase {
  // Successfully broadcasted transaction:
  // https://pacviewer.com/transaction/f83f583a5c40adf93a90ea536a7e4b467d30ca4f308d5da52624d80c42adec80
  @override
  Pactus.SigningInput createSigningInput() {
    final input = Pactus.SigningInput(
      transaction: Pactus.TransactionMessage(
        lockTime: 2335580,
        fee: $fixnum.Int64(10000000),
        memo: 'wallet-core',
        bond: Pactus.BondPayload(
          sender: 'pc1rwzvr8rstdqypr80ag3t6hqrtnss9nwymcxy3lr',
          receiver: 'pc1p6taz5l2kq5ppnxv4agnqj48svnvsy797xpe6wd',
          stake: $fixnum.Int64(1000000000),
        ),
      ),
    );
    return input;
  }

  @override
  String get transactionID =>
      "f83f583a5c40adf93a90ea536a7e4b467d30ca4f308d5da52624d80c42adec80";
  @override
  String get signature =>
      "9e6279fb64067c7d7316ac74630bbb8589df268aa4548f1c7d85c087a8748ff0"
      "715b9149afbd94c5d8ee6b37c787ec63e963cbb38be513ebc436aa58f9a8f00d";
  @override
  String get dataToSign =>
      "015ca3230080ade2040b77616c6c65742d636f726502037098338e0b6808119d"
      "fd4457ab806b9c2059b89b01d2fa2a7d560502199995ea260954f064d90278be"
      "008094ebdc03";
  @override
  String get signedData =>
      "00015ca3230080ade2040b77616c6c65742d636f726502037098338e0b680811"
      "9dfd4457ab806b9c2059b89b01d2fa2a7d560502199995ea260954f064d90278"
      "be008094ebdc039e6279fb64067c7d7316ac74630bbb8589df268aa4548f1c7d"
      "85c087a8748ff0715b9149afbd94c5d8ee6b37c787ec63e963cbb38be513ebc4"
      "36aa58f9a8f00d95794161374b22c696dabb98e93f6ca9300b22f3b904921fbf"
      "560bb72145f4fa";
}

abstract class TestCase {
  Pactus.SigningInput createSigningInput();

  String get transactionID;

  String get signature;

  String get dataToSign;

  String get signedData;
}

final TEST_CASES = [
  TransferTransaction(),
  BondWithPublicKeyTransaction(),
  BondWithoutPublicKeyTransaction(),
];
