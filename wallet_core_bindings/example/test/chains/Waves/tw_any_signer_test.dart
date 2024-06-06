import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Waves.pb.dart' as Waves;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerWaves', () {
    const coin = TWCoinType.Waves;

    test('Sign', () {
      final privateKey = TWBase58.decodeNoCheck(
          "83mqJpmgB5Mko1567sVAdqZxVKsT6jccXt3eFSi4G1zE");

      final input = Waves.SigningInput(
        timestamp: $fixnum.Int64(1559146613),
        privateKey: privateKey,
        transferMessage: Waves.TransferMessage(
          amount: $fixnum.Int64(100000000),
          asset: 'DacnEpaUVFRCYk8Fcd1F3cqUZuT4XG7qW9mRyoZD81zq',
          fee: $fixnum.Int64(100000),
          feeAsset: 'DacnEpaUVFRCYk8Fcd1F3cqUZuT4XG7qW9mRyoZD81zq',
          to: '3PPCZQkvdMJpmx7Zrz1cnYsPe9Bt1XT2Ckx',
          attachment: 'hello'.codeUnits,
        ),
      );

      final output = Waves.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // Sign
      expect(hex(output.signature),
          '5d6a77b1fd9b53d9735cd2543ba94215664f2b07d6c7befb081221fcd49f5b6ad6b9ac108582e8d3e74943bdf35fd80d985edf4b4de1fb1c5c427e84d0879f8f');
    });
  });
}
