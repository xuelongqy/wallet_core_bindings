import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Nano.pb.dart' as Nano;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerNano', () {
    const coin = TWCoinType.Nano;

    test('sign', () {
      final privateKey = parse_hex(
          "173c40e97fe2afcd24187e74f6b603cb949a5365e72fbdd065a6b165e2189e34");
      final linkBlock = parse_hex(
          "491fca2c69a84607d374aaf1f6acd3ce70744c5be0721b5ed394653e85233507");

      final input = Nano.SigningInput(
        privateKey: privateKey,
        linkBlock: linkBlock,
        representative:
            'xrb_3arg3asgtigae3xckabaaewkx3bzsh7nwz7jkmjos79ihyaxwphhm6qgjps4',
        balance: '96242336390000000000000000000',
      );

      final output = Nano.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        output.json,
        "{\"account\":\"nano_1bhbsc9yuh15anq3owu1izw1nk7bhhqefrkhfo954fyt8dk1q911buk1kk4c\","
        "\"balance\":\"96242336390000000000000000000\","
        "\"link\":\"491fca2c69a84607d374aaf1f6acd3ce70744c5be0721b5ed394653e85233507\","
        "\"link_as_account\":\"nano_1kazsap8mc481zbqbcqjytpf9mmigj87qr5k5fhf97579t4k8fa94octjx6d\","
        "\"previous\":\"0000000000000000000000000000000000000000000000000000000000000000\","
        "\"representative\":\"nano_3arg3asgtigae3xckabaaewkx3bzsh7nwz7jkmjos79ihyaxwphhm6qgjps4\","
        "\"signature\":"
        "\"d247f6b90383b24e612569c75a12f11242f6e03b4914eadc7d941577dcf54a3a7cb7f0a4aba4246a40d9ebb5"
        "ee1e00b4a0a834ad5a1e7bef24e11f62b95a9e09\","
        "\"type\":\"state\"}",
      );
    });

    test('SignJSON', () {
      const jsonStr =
          '{"link_block":"SR/KLGmoRgfTdKrx9qzTznB0TFvgchte05RlPoUjNQc=","representative":"nano_3arg3asgtigae3xckabaaewkx3bzsh7nwz7jkmjos79ihyaxwphhm6qgjps4","balance":"96242336390000000000000000000"}';
      final key = parse_hex(
          "173c40e97fe2afcd24187e74f6b603cb949a5365e72fbdd065a6b165e2189e34");
      final result = TWAnySigner.signJSON(json: jsonStr, key: key, coin: coin);

      expect(TWAnySigner.supportsJSON(coin), true);
      expect(
        result,
        '{"account":"nano_1bhbsc9yuh15anq3owu1izw1nk7bhhqefrkhfo954fyt8dk1q911buk1kk4c","balance":"96242336390000000000000000000","link":"491fca2c69a84607d374aaf1f6acd3ce70744c5be0721b5ed394653e85233507","link_as_account":"nano_1kazsap8mc481zbqbcqjytpf9mmigj87qr5k5fhf97579t4k8fa94octjx6d","previous":"0000000000000000000000000000000000000000000000000000000000000000","representative":"nano_3arg3asgtigae3xckabaaewkx3bzsh7nwz7jkmjos79ihyaxwphhm6qgjps4","signature":"d247f6b90383b24e612569c75a12f11242f6e03b4914eadc7d941577dcf54a3a7cb7f0a4aba4246a40d9ebb5ee1e00b4a0a834ad5a1e7bef24e11f62b95a9e09","type":"state"}',
      );
    });
  });
}
