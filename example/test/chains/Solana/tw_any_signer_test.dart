import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Solana.pb.dart' as Solana;

import '../../utils.dart';

const expectedString1 =
    "3p2kzZ1DvquqC6LApPuxpTg5CCDVPqJFokGSnGhnBHrta4uq7S2EyehV1XNUVXp51D69GxGzQZU"
    "jikfDzbWBG2aFtG3gHT1QfLzyFKHM4HQtMQMNXqay1NAeiiYZjNhx9UvMX4uAQZ4Q6rx6m2AYfQ"
    "7aoMUrejq298q1wBFdtS9XVB5QTiStnzC7zs97FUEK2T4XapjF1519EyFBViTfHpGpnf5bfizDz"
    "sW9kYUtRDW1UC2LgHr7npgq5W9TBmHf9hSmRgM9XXucjXLqubNWE7HUMhbKjuBqkirRM";

void main() {
  initTest();
  group('TWAnySignerSolana', () {
    const coin = TWCoinType.Solana;

    test('SignTransfer', () {
      final privateKey = TWBase58.decodeNoCheck(
          'A7psj2GW7ZMdY4E5hJq14KMeYg7HFjULSsWSrTXZLvYr');
      final input = Solana.SigningInput(
        transferTransaction: Solana.Transfer(
          recipient: 'EN2sCsJ1WDV8UFqsiTXHcUPUxQ4juE71eCknHYYMifkd',
          value: $fixnum.Int64(42),
        ),
        privateKey: privateKey,
        recentBlockhash: '11111111111111111111111111111111',
      );

      final output = Solana.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.encoded, expectedString1);
      expect(output.unsignedTx,
          '87PYsiS4MUU1UqXrsDoCBmD5FcKsXhwEBD8hc4zbq78yePu7bLENmbnmjmVbsj4VvaxnZhy4bERndPFzjSRH5WpwKwMLSCKvn9eSDmPESNcdkqne2UdMfWiFoq8ZeQBnF9h98dP8GM9kfzWPjvLmhjwuwA1E2k5WCtfii7LKQ34v6AtmFQGZqgdKiNqygP7ZKusHWGT8ZkTZ');
    });
  });
}
