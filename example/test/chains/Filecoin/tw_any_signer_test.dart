import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Filecoin.pb.dart' as Filecoin;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerFilecoin', () {
    const coin = TWCoinType.Filecoin;

    test('Sign', () {
      final privateKey = parse_hex(
          "1d969865e189957b9824bd34f26d5cbf357fda1a6d844cbf0c9ab1ed93fa7dbe");
      const toAddress =
          "f3um6uo3qt5of54xjbx3hsxbw5mbsc6auxzrvfxekn5bv3duewqyn2tg5rhrlx73qahzzpkhuj7a34iq7oifsq";
      int nonce = 2;
      // 600 FIL
      // auto value = parse_hex("2086ac351052600000");
      final value =
          BigInt.from(600) * BigInt.from(1000000000) * BigInt.from(1000000000);
      const gasLimit = 1000;
      // auto gasFeeCap = parse_hex("25f273933db5700000");
      final gasFeeCap =
          BigInt.from(700) * BigInt.from(1000000000) * BigInt.from(1000000000);
      // auto gasPremium = parse_hex("2b5e3af16b18800000");
      final gasPremium =
          BigInt.from(800) * BigInt.from(1000000000) * BigInt.from(1000000000);

      final input = Filecoin.SigningInput(
        privateKey: privateKey,
        to: toAddress,
        nonce: $fixnum.Int64(nonce),
        value: bigIntToBytes(value),
        gasLimit: $fixnum.Int64(gasLimit),
        gasFeeCap: bigIntToBytes(gasFeeCap),
        gasPremium: bigIntToBytes(gasPremium),
      );

      final inputData = input.writeToBuffer();

      final outputData = TWAnySigner.sign(inputData, coin);

      final output = Filecoin.SigningOutput.fromBuffer(outputData);

      expect(output.json,
          '{"Message":{"From":"f1z4a36sc7mfbv4z3qwutblp2flycdui3baffytbq","GasFeeCap":"700000000000000000000","GasLimit":1000,"GasPremium":"800000000000000000000","Method":0,"Nonce":2,"To":"f3um6uo3qt5of54xjbx3hsxbw5mbsc6auxzrvfxekn5bv3duewqyn2tg5rhrlx73qahzzpkhuj7a34iq7oifsq","Value":"600000000000000000000"},"Signature":{"Data":"jMRu+OZ/lfppgmqSfGsntFrRLWZnUg3ZYmJTTRLsVt4V1310vR3VKGJpaE6S4sNvDOE6sEgmN9YmfTkPVK2qMgE=","Type":1}}');
    });

    test('SignJSON', () {
      const jsonStr = '''
        {
          "to": "f3um6uo3qt5of54xjbx3hsxbw5mbsc6auxzrvfxekn5bv3duewqyn2tg5rhrlx73qahzzpkhuj7a34iq7oifsq",
          "nonce": "2",
          "value": "IIasNRBSYAAA",
          "gasLimit": 1000,
          "gasFeeCap": "JfJzkz21cAAA",
          "gasPremium": "K1468WsYgAAA"
        }
      ''';
      final key = parse_hex(
          '1d969865e189957b9824bd34f26d5cbf357fda1a6d844cbf0c9ab1ed93fa7dbe');
      final result = TWAnySigner.signJSON(json: jsonStr, key: key, coin: coin);

      expect(TWAnySigner.supportsJSON(coin), true);
      expect(result,
          '{"Message":{"From":"f1z4a36sc7mfbv4z3qwutblp2flycdui3baffytbq","GasFeeCap":"700000000000000000000","GasLimit":1000,"GasPremium":"800000000000000000000","Method":0,"Nonce":2,"To":"f3um6uo3qt5of54xjbx3hsxbw5mbsc6auxzrvfxekn5bv3duewqyn2tg5rhrlx73qahzzpkhuj7a34iq7oifsq","Value":"600000000000000000000"},"Signature":{"Data":"jMRu+OZ/lfppgmqSfGsntFrRLWZnUg3ZYmJTTRLsVt4V1310vR3VKGJpaE6S4sNvDOE6sEgmN9YmfTkPVK2qMgE=","Type":1}}');
    });
  });
}
