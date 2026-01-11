import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('Decred', () {
    const coin = TWCoinType.Decred;

    test('ExtendedKeys', () {
      final wallet = TWHDWallet.createWithMnemonic(
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
        passphrase: 'TREZOR',
      );
      final dpub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.BIP44,
        coin: coin,
        version: TWHDVersion.DPUB,
      );
      final dprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.BIP44,
        coin: coin,
        version: TWHDVersion.DPRV,
      );
      expect(dpub,
          'dpubZFUmm9oh5zmQkR2Tr2AXS4tCkTWg4B27SpCPFkapZrrAqgU1EwgEFgrmi6EnLGXhak86yDHhXPxFAnGU58W5S4e8NCKG1ASUVaxwRqqNdfP');
      expect(dprv,
          'dprv3oggQ2FQ1chcr18hbW7Aur5x8SxQdES3FGa4WqeTZnFY88SNMzLdB7LkZLroF4bGAqWS8sDm3w4DKyYV7sDKfC6JMSVHnVJdpDLgHioq1vq');
    });

    test('DerivePubkeyFromDpub', () {
      const dpub =
          'dpubZFUmm9oh5zmQkR2Tr2AXS4tCkTWg4B27SpCPFkapZrrAqgU1EwgEFgrmi6EnLGXhak86yDHhXPxFAnGU58W5S4e8NCKG1ASUVaxwRqqNdfP';
      final pubKey0 = TWHDWallet.getPublicKeyFromExtended(
        extended: dpub,
        coin: TWCoinType.Decred,
        derivationPath: "m/44'/42'/0'/0/0",
      );
      final address0 = TWCoinType.Decred.deriveAddressFromPublicKey(pubKey0);

      expect(address0, "DsksmLD2wDoA8g8QfFvm99ASg8KsZL8eJFd");
    });

    test('Lockscripts', () {
      final script = TWBitcoinScript.lockScriptForAddress(
        'Dcur2mcGjmENx4DhNqDctW5wJCVyT3Qeqkx',
        coin,
      );
      final scriptData = script.data;
      expectHex(scriptData, 'a914f5916158e3e2c4551c1796708db8367207ed13bb87');

      final script2 = TWBitcoinScript.lockScriptForAddress(
        'DsfD7KYsJtRraYXPZM61ui7779oYJCakYvH',
        coin,
      );
      final scriptData2 = script2.data;
      expectHex(
          scriptData2, '76a9149c417596dea6570f8e546674555b5ce5087ce2c288ac');
    });
  });
}
