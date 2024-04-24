import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Zilliqa.pb.dart' as Zilliqa;

import '../../utils.dart';

void main() {
  group('TWAnySignerZilliqa', () {
    const coin = TWCoinType.TWCoinTypeZilliqa;

    test('Sign', () {
      final key = parse_hex(
          "0x68ffa8ec149ce50da647166036555f73d57f662eb420e154621e5f24f6cf9748");
      final amount = intToBytes(1000000000000);
      final gasPrice = intToBytes(1000000000);

      final input = Zilliqa.SigningInput(
        version: 65537,
        nonce: $fixnum.Int64(2),
        to: 'zil10lx2eurx5hexaca0lshdr75czr025cevqu83uz',
        gasPrice: gasPrice,
        gasLimit: $fixnum.Int64(1),
        privateKey: key,
        transaction: Zilliqa.Transaction(
          transfer: Zilliqa.Transaction_Transfer(
            amount: amount,
          ),
        ),
      );

      final output = Zilliqa.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.signature),
        "001fa4df08c11a4a79e96e69399ee48eeecc78231a78b0355a8ca783c77c139436e37934fecc2252ed8dac00e235e22d18410461fb896685c4270642738ed268",
      );

      expect(
        hex(output.json.codeUnits),
        "7b22616d6f756e74223a2231303030303030303030303030222c22636f6465223a22222c2264617461223a22222c226761734c696d6974223a2231222c226761735072696365223a2231303030303030303030222c226e6f6e6365223a322c227075624b6579223a22303366623330623139366365336539373635393365636332646132323064636139636465613863383464323337333737303034326139333062383932616330663563222c227369676e6174757265223a223030316661346466303863313161346137396539366536393339396565343865656563633738323331613738623033353561386361373833633737633133393433366533373933346665636332323532656438646163303065323335653232643138343130343631666238393636383563343237303634323733386564323638222c22746f41646472223a2237464363614366303636613546323645653341466663324544314641393831304465616136333243222c2276657273696f6e223a36353533377d",
      );
    });

    test('SignJSON', () {
      final jsonStr =
          '{"version":65537,"nonce":"2","to":"zil10lx2eurx5hexaca0lshdr75czr025cevqu83uz","gasPrice":"O5rKAA==","gasLimit":"1","transaction":{"transfer":{"amount":"6NSlEAA="}}}';
      final key = parse_hex(
          '0x68ffa8ec149ce50da647166036555f73d57f662eb420e154621e5f24f6cf9748');
      final result = TWAnySigner.signJSON(json: jsonStr, key: key, coin: coin);

      expect(TWAnySigner.supportsJSON(coin), true);
      expect(result,
          '7b22616d6f756e74223a2231303030303030303030303030222c22636f6465223a22222c2264617461223a22222c226761734c696d6974223a2231222c226761735072696365223a2231303030303030303030222c226e6f6e6365223a322c227075624b6579223a22303366623330623139366365336539373635393365636332646132323064636139636465613863383464323337333737303034326139333062383932616330663563222c227369676e6174757265223a223030316661346466303863313161346137396539366536393339396565343865656563633738323331613738623033353561386361373833633737633133393433366533373933346665636332323532656438646163303065323335653232643138343130343631666238393636383563343237303634323733386564323638222c22746f41646472223a2237464363614366303636613546323645653341466663324544314641393831304465616136333243222c2276657273696f6e223a36353533377d');
    });

    test('SigningData', () {
      // https://viewblock.io/zilliqa/tx/0x6228b3d7e69fc3481b84fd00e892cec359a41654f58948ff7b1b932396b00ad9
      final privateKey = TWPrivateKey.createWithHexString(
          '0x68ffa8ec149ce50da647166036555f73d57f662eb420e154621e5f24f6cf9748');
      final pubKey = privateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);

      // 10 ZIL
      final amount = intToBytes(10000000000000);
      final gasPrice = intToBytes(2000000000);

      final jsonData =
          "{\"_tag\":\"DelegateStake\",\"params\":[{\"type\":\"ByStr20\",\"value\":\"0x122219cCeAb410901e96c3A0e55E46231480341b\",\"vname\":\"ssnaddr\"}]}"
              .codeUnits;

      final input = Zilliqa.SigningInput(
        transaction: Zilliqa.Transaction(
          rawTransaction: Zilliqa.Transaction_Raw(
            amount: amount,
            data: jsonData,
          ),
        ),
        version: 65537,
        nonce: $fixnum.Int64(56),
        to: 'zil1g029nmzsf36r99vupp4s43lhs40fsscx3jjpuy',
        gasPrice: gasPrice,
        gasLimit: $fixnum.Int64(5000),
        privateKey: privateKey.data,
      );

      final output = Zilliqa.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.signature),
        "437fb5c3ce2c6b01f9d490f670539fae4533c82a21fa7edfe6b23df70d732937e8c578c8d6ed24be9150f5126f7b7c977a467af8947ef92a720908a761a6eb0d",
      );

      expect(
        output.json,
        r'{"amount":"10000000000000","code":"","data":"{\"_tag\":\"DelegateStake\",\"params\":[{\"type\":\"ByStr20\",\"value\":\"0x122219cCeAb410901e96c3A0e55E46231480341b\",\"vname\":\"ssnaddr\"}]}","gasLimit":"5000","gasPrice":"2000000000","nonce":56,"pubKey":"03fb30b196ce3e976593ecc2da220dca9cdea8c84d2373770042a930b892ac0f5c","signature":"437fb5c3ce2c6b01f9d490f670539fae4533c82a21fa7edfe6b23df70d732937e8c578c8d6ed24be9150f5126f7b7c977a467af8947ef92a720908a761a6eb0d","toAddr":"43D459eC504C7432959c086B0ac7F7855E984306","version":65537}',
      );
    });
  });
}
