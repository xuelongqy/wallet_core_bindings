import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

const address1 = "bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t4";
const address2 = "bc1qr583w2swedy2acd7rung055k8t3n7udp7vyzyg";
const address3Taproot =
    "bc1ptmsk7c2yut2xah4pgflpygh2s7fh0cpfkrza9cjj29awapv53mrslgd5cf";

void main() {
  initTest();
  group(TWSegwitAddress, () {
    test('CreateAndDelete', () {
      {
        final addr = TWSegwitAddress(address1, attach: false);
        expect(addr.pointer != 0, true);
        addr.delete();
      }
      {
        final pkData = parse_hex(
            '0279BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798');
        final publicKey =
            TWPublicKey.createWithData(pkData, TWPublicKeyType.SECP256k1);
        final addr = TWSegwitAddress.createWithPublicKey(
            TWHRP.Bitcoin, publicKey,
            attach: false);
        expect(addr.pointer != 0, true);
        addr.delete();
      }
    });

    test('PublicKeyToAddress', () {
      final pkData = parse_hex(
          '0279BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798');
      final publicKey =
          TWPublicKey.createWithData(pkData, TWPublicKeyType.SECP256k1);

      final address =
          TWSegwitAddress.createWithPublicKey(TWHRP.Bitcoin, publicKey);
      final string = address.description;

      expect(address1, string);

      final addr = TWSegwitAddress(string);
      expect(address, addr);
    });

    test('InitWithAddress', () {
      const string = address1;
      expect(TWSegwitAddress.isValidString(string), true);

      final address = TWSegwitAddress(string);
      final description = address.description;

      expect(address.pointer != 0, true);
      expect(address1, description);

      expect(0, address.witnessVersion);

      expect(TWHRP.Bitcoin, address.hrp);

      final witness = address.witnessProgram;
      expectHex(witness, '751e76e8199196d454941c45d1b3a323f1433bd6');
    });

    test('TaprootString', () {
      const string = address3Taproot;
      final address = TWSegwitAddress(string);
      expect(address.pointer != 0, true);

      final description = address.description;
      expect(address3Taproot, description);

      expect(1, address.witnessVersion);

      expect(TWHRP.Bitcoin, address.hrp);
    });

    test('InvalidAddress', () {
      final strings = [
        'bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t5',
        'bc1rw5uspcuh',
        'bc10w508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7kw5rljs90',
        'BC1QR508D6QEJXTDG4Y5R3ZARVARYV98GJ9P',
        'tb1qrp33g0q5c5txsp9arysrx4k6zdkfs4nce4xj0gdcccefvpysxf3q0sL5k7',
        'bc1zw508d6qejxtdg4y5r3zarvaryvqyzf3du',
        'tb1qrp33g0q5c5txsp9arysrx4k6zdkfs4nce4xj0gdcccefvpysxf3pjxtptv',
        'bc1gmk9yu',
      ];
      for (final string in strings) {
        final invalid = TWSegwitAddress(string).pointer == 0;
        expect(invalid, true);
        if (!invalid) {
          print("Invalid address '$string' reported as valid");
        }
      }
    });
  });
}
