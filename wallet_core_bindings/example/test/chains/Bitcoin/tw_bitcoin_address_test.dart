import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

const addr1Valid = "1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx";
const addr1Data = "00769bdff96a02f9135a1d19b749db6a78fe07dc90";

void main() {
  initTest();
  group('TWBitcoinAddress', () {
    test('Create', () {
      {
        final addr = TWBitcoinAddress(addr1Valid);
        expect(addr.pointer != 0, true);
      }
      {
        final addr = TWBitcoinAddress.createWithData(TWData.createWithHexString(
                '00769bdff96a02f9135a1d19b749db6a78fe07dc90')
            .bytes()!);
        expect(addr.pointer != 0, true);
      }
    });

    test('IsValid', () {
      expect(TWBitcoinAddress.isValidString(addr1Valid), true);
      expect(
          TWBitcoinAddress.isValid(TWData.createWithHexString(
                  '00769bdff96a02f9135a1d19b749db6a78fe07dc90')
              .bytes()!),
          true);
    });

    test('CreateWithPublicKey', () {
      final pubKey = TWPublicKey.createWithHexString(
        '0239de350077b204f8fa1b63542b33580b8f125c4b9b827d5fc65cbe47fc1d9a52',
        TWPublicKeyType.SECP256k1,
      );
      expect(pubKey.pointer != 0, true);
      final addr = TWBitcoinAddress.createWithPublicKey(
          pubKey, TWCoinType.Bitcoin.p2shPrefix);
      expect(addr.pointer != 0, true);
    });

    test('Description', () {
      final addr = TWBitcoinAddress(addr1Valid);
      expect(addr.pointer != 0, true);
      expect(addr.description, addr1Valid);
    });

    test('PrefixAndHash', () {
      final addr = TWBitcoinAddress(addr1Valid);
      expect(addr.pointer != 0, true);
      expect(addr.prefix, 0x00);
      final keyhash = addr.keyHash;
      expectHex(keyhash, addr1Data.substring(2));
    });

    test('Equal', () {
      final addr1 = TWBitcoinAddress(addr1Valid);
      expect(addr1.pointer != 0, true);
      final addr2 = TWBitcoinAddress.createWithData(
          TWData.createWithHexString(addr1Data).bytes()!);
      expect(addr2.pointer != 0, true);
      expect(addr1 == addr2, true);
    });

    test('CreateWithStringInvalid', () {
      expectWasmWithException(
          () => TWBitcoinAddress('__INVALID__').pointer == 0, true);
    });

    test('CreateWithDataInvalid', () {
      expectWasmWithException(
          () =>
              TWBitcoinAddress.createWithData(
                      TWData.createWithHexString('deadbeef').bytes()!)
                  .pointer ==
              0,
          true);
    });

    test('CreateWithPublicKeyInvalid', () {
      final pubKey = TWPublicKey.createWithHexString(
        'F61CF0BC8E891AD7636E0CD35229D579323AA2DA827EB85D8071407464DC2FA3',
        TWPublicKeyType.ED25519,
      );
      expect(pubKey.pointer != 0, true);
      expectWasmWithException(
          () =>
              TWBitcoinAddress.createWithPublicKey(
                      pubKey, TWCoinType.Bitcoin.p2shPrefix)
                  .pointer ==
              0,
          true);
    });
  });
}
