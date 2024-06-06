import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('StarkExMessageSigner', () {
    test('SignAndVerify', () {
      final starkPrivKey = TWPrivateKey.createWithHexString(
          '04be51a04e718c202e4dca60c2b72958252024cfc1070c090dd0f170298249de');
      final starkPubKey =
          starkPrivKey.getPublicKeyByType(TWPublicKeyType.Starkex);
      const starkMsg =
          "463a2240432264a3aa71a5713f2a4e4c1b9e12bbb56083cd56af6d878217cf";
      final starkSignature =
          TWStarkExMessageSigner.signMessage(starkPrivKey, starkMsg);
      expect(starkSignature,
          '04cf5f21333dd189ada3c0f2a51430d733501a9b1d5e07905273c1938cfb261e05b6013d74adde403e8953743a338c8d414bb96bf69d2ca1a91a85ed2700a528');
      expect(
        TWStarkExMessageSigner.verifyMessage(
          publicKey: starkPubKey,
          message: starkMsg,
          signature: starkSignature,
        ),
        true,
      );
    });

    test('SignAndVerify2', () {
      const privKeyData =
          "04be51a04e718c202e4dca60c2b72958252024cfc1070c090dd0f170298249de";
      final privateKey = TWPrivateKey.createWithHexString(privKeyData);
      const message =
          '463a2240432264a3aa71a5713f2a4e4c1b9e12bbb56083cd56af6d878217cf';

      final pubKey = privateKey.getPublicKeyByType(TWPublicKeyType.Starkex);
      final signature = TWStarkExMessageSigner.signMessage(privateKey, message);
      expect(signature,
          '04cf5f21333dd189ada3c0f2a51430d733501a9b1d5e07905273c1938cfb261e05b6013d74adde403e8953743a338c8d414bb96bf69d2ca1a91a85ed2700a528');
      expect(
        TWStarkExMessageSigner.verifyMessage(
          publicKey: pubKey,
          message: message,
          signature: signature,
        ),
        true,
      );
    });
  });
}
