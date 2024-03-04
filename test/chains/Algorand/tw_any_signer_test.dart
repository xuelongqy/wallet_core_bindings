import 'dart:convert';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Algorand.pb.dart' as Algorand;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('TWAnySignerAlgorand', () {
    test('SignAssetNFTTransfer', () {
      // Successfully broadcasted: https://algoexplorer.io/tx/FFLUH4QKZHG744RIQ2AZNWZUSIIH262KZ4MEWSY4RXMWN5NMOOJA
      final privateKey = TWData.createWithHexString(
              'dc6051ffc7b3ec601bde432f6dea34d40fe3855e4181afa0f0524c42194a6da7')
          .bytes()!;
      final note = TWBase64.decode('VFdUIFRPIFRIRSBNT09O');
      final genesisHash =
          TWBase64.decode('wGHE2Pwdvd7S12BL5FaOP20EGYesN73ktiC1qzkkit8=');

      final input = Algorand.SigningInput(
        assetTransfer: Algorand.AssetTransfer(
          toAddress:
              '362T7CSXNLIOBX6J3H2SCPS4LPYFNV6DDWE6G64ZEUJ6SY5OJIR6SB5CVE',
          amount: $fixnum.Int64(1),
          assetId: $fixnum.Int64(989643841),
        ),
        firstRound: $fixnum.Int64(27963950),
        lastRound: $fixnum.Int64(27964950),
        fee: $fixnum.Int64(1000),
        genesisId: 'mainnet-v1.0',
        genesisHash: genesisHash,
        note: note,
        privateKey: privateKey,
      );

      final output = Algorand.SigningOutput.fromBuffer(TWAnySigner.sign(
          input.writeToBuffer(), TWCoinType.TWCoinTypeAlgorand));

      expectHex(output.encoded,
          '82a3736967c4409d742c0c7d62946dc3228d95426e6d7582977bda39f7dca076a8a49913a966235702f41e2b76af26a823339a3e881c8276aeae3b195bbde0f25662fd9d9c7106a374786e8ba461616d7401a461726376c420dfb53f8a576ad0e0dfc9d9f5213e5c5bf056d7c31d89e37b992513e963ae4a23a3666565cd03e8a26676ce01aab22ea367656eac6d61696e6e65742d76312e30a26768c420c061c4d8fc1dbdded2d7604be4568e3f6d041987ac37bde4b620b5ab39248adfa26c76ce01aab616a46e6f7465c40f54575420544f20544845204d4f4f4ea3736e64c420ca40799dacdb564d1096611d9da6ca7a6a4916f6d681383860725aedafe91617a474797065a56178666572a478616964ce3afcc441');
      expect(output.signature,
          'nXQsDH1ilG3DIo2VQm5tdYKXe9o599ygdqikmROpZiNXAvQeK3avJqgjM5o+iByCdq6uOxlbveDyVmL9nZxxBg==');
    });

    test('Sign', () {
      final privateKey = TWData.createWithHexString(
              'd5b43d706ef0cb641081d45a2ec213b5d8281f439f2425d1af54e2afdaabf55b')
          .bytes()!;
      final note = TWData.createWithHexString('68656c6c6f').bytes()!;
      final genesisHash =
          TWBase64.decode('wGHE2Pwdvd7S12BL5FaOP20EGYesN73ktiC1qzkkit8=');

      final input = Algorand.SigningInput(
        transfer: Algorand.Transfer(
          toAddress:
              'CRLADAHJZEW2GFY2UPEHENLOGCUOU74WYSTUXQLVLJUJFHEUZOHYZNWYR4',
          amount: $fixnum.Int64(1000000000000),
        ),
        firstRound: $fixnum.Int64(1937767),
        lastRound: $fixnum.Int64(1938767),
        fee: $fixnum.Int64(263000),
        genesisId: 'mainnet-v1.0',
        genesisHash: genesisHash,
        note: note,
        privateKey: privateKey,
      );

      final output = Algorand.SigningOutput.fromBuffer(TWAnySigner.sign(
          input.writeToBuffer(), TWCoinType.TWCoinTypeAlgorand));

      expectHex(output.encoded,
          '82a3736967c440baa00062adcdcb5875e4435cdc6885d26bfe5308ab17983c0fda790b7103051fcb111554e5badfc0ac7edf7e1223a434342a9eeed5cdb047690827325051560ba374786e8aa3616d74cf000000e8d4a51000a3666565ce00040358a26676ce001d9167a367656eac6d61696e6e65742d76312e30a26768c420c061c4d8fc1dbdded2d7604be4568e3f6d041987ac37bde4b620b5ab39248adfa26c76ce001d954fa46e6f7465c40568656c6c6fa3726376c42014560180e9c92da3171aa3c872356e30a8ea7f96c4a74bc1755a68929c94cb8fa3736e64c42061bf060efc02e2887dfffc8ed85268c8c091c013eedf315bc50794d02a8791ada474797065a3706179');
    });

    test('SignJSON', () {
      final jsonStr = json.encode({
        "genesisId": "mainnet-v1.0",
        "genesisHash": "wGHE2Pwdvd7S12BL5FaOP20EGYesN73ktiC1qzkkit8=",
        "note": "aGVsbG8=",
        "firstRound": "1937767",
        "lastRound": "1938767",
        "fee": "263000",
        "transfer": {
          "toAddress":
              "CRLADAHJZEW2GFY2UPEHENLOGCUOU74WYSTUXQLVLJUJFHEUZOHYZNWYR4",
          "amount": "1000000000000"
        }
      });
      final key = TWData.createWithHexString(
              'd5b43d706ef0cb641081d45a2ec213b5d8281f439f2425d1af54e2afdaabf55b')
          .bytes()!;

      final result = TWAnySigner.signJSON(
        json: jsonStr,
        key: key,
        coin: TWCoinType.TWCoinTypeAlgorand,
      );

      expect(TWAnySigner.supportsJSON(TWCoinType.TWCoinTypeAlgorand), true);
      expect(result, '82a3736967c440baa00062adcdcb5875e4435cdc6885d26bfe5308ab17983c0fda790b7103051fcb111554e5badfc0ac7edf7e1223a434342a9eeed5cdb047690827325051560ba374786e8aa3616d74cf000000e8d4a51000a3666565ce00040358a26676ce001d9167a367656eac6d61696e6e65742d76312e30a26768c420c061c4d8fc1dbdded2d7604be4568e3f6d041987ac37bde4b620b5ab39248adfa26c76ce001d954fa46e6f7465c40568656c6c6fa3726376c42014560180e9c92da3171aa3c872356e30a8ea7f96c4a74bc1755a68929c94cb8fa3736e64c42061bf060efc02e2887dfffc8ed85268c8c091c013eedf315bc50794d02a8791ada474797065a3706179');
    });
  });
}
