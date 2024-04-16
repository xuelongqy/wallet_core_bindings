import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

final gLayer = "starkex";
final gApplication = "immutablex";
final gIndex = "1";

void main() {
  group('ImmutableX', () {
    test('PathFromAddress', () {
      // https://github.com/immutable/imx-core-sdk-swift/blob/main/Tests/ImmutableXCoreTests/Crypto/Stark/StarkKeyTests.swift#L30
      final res = TWEthereum.eip2645GetPath(
        ethAddress: '0xa76e3eeb2f7143165618ab8feaabcd395b6fac7f',
        layer: gLayer,
        application: gApplication,
        index: gIndex,
      );
      expect(res, "m/2645'/579218131'/211006541'/1534045311'/1431804530'/1");
    });

    test('GetPublicKeyFromPrivateKey', () {
      final privKeyData = parse_hex(
          '058ab7989d625b1a690400dcbe6e070627adedceff7bd196e58d4791026a8afe');
      final privKey = TWPrivateKey.createWithData(privKeyData);
      final pubKey =
          privKey.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeStarkex);
      final pubKeyHex = hex(pubKey.data);
      expect(pubKeyHex,
          '02a4c7332c55d6c1c510d24272d1db82878f2302f05b53bcc38695ed5f78fffd');
    });

    test('SimpleSign', () {
      final privKeyBytes = parse_hex(
          "0139fe4d6f02e666e86a6f58e65060f115cd3c185bd9e98bd829636931458f79");
      final privKey = TWPrivateKey.createWithData(privKeyBytes);
      final digest = parse_hex(
          "06fea80189363a786037ed3e7ba546dad0ef7de49fccae0e31eb658b7dd4ea76");
      final signature = hex(privKey.sign(digest, TWCurve.TWCurveStarkex));
      final expectedSignature =
          "061ec782f76a66f6984efc3a1b6d152a124c701c00abdd2bf76641b4135c770f04e44e759cea02c23568bb4d8a09929bbca8768ab68270d50c18d214166ccd9a";
      expect(signature.length, 128);
      expect(signature.substring(0, 64),
          '061ec782f76a66f6984efc3a1b6d152a124c701c00abdd2bf76641b4135c770f');
      expect(signature.substring(64, 128),
          '04e44e759cea02c23568bb4d8a09929bbca8768ab68270d50c18d214166ccd9a');
      expect(signature, expectedSignature);
    });

    test('VerifySign', () {
      // valid
      {
        final pubKeyData = parse_hex(
            "02c5dbad71c92a45cc4b40573ae661f8147869a91d57b8d9b8f48c8af7f83159");
        final hash = parse_hex(
            "06fea80189363a786037ed3e7ba546dad0ef7de49fccae0e31eb658b7dd4ea76");
        final signature = parse_hex(
            "061ec782f76a66f6984efc3a1b6d152a124c701c00abdd2bf76641b4135c770f04e44e759cea02c23568bb4d8a09929bbca8768ab68270d50c18d214166ccd9a");
        final pubKey = TWPublicKey.createWithData(
            pubKeyData, TWPublicKeyType.TWPublicKeyTypeStarkex);
        expect(pubKey.verify(signature: signature, message: hash), true);
      }

      // invalid
      {
        final pubKeyData = parse_hex(
            "02c5dbad71c92a45cc4b40573ae661f8147869a91d57b8d9b8f48c8af7f83159");
        final hash = parse_hex(
            "06fea80189363a786037ed3e7ba546dad0ef7de49fccae0e31eb658b7dd4ea76");
        final signature = parse_hex(
            "061ec782f76a66f6984efc3a1b6d152a124c701c00abdd2bf76641b4135c770f04e44e759cea02c23568bb4d8a09929bbca8768ab68270d50c18d214166ccd9b");
        final pubKey = TWPublicKey.createWithData(
            pubKeyData, TWPublicKeyType.TWPublicKeyTypeStarkex);
        expect(pubKey.verify(signature: signature, message: hash), false);
      }
    });
  });
}
