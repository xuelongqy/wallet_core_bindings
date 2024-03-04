import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Aeternity.pb.dart' as Aeternity;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('TWAnySignerAeternity', () {
    test('Sign', () {
      final privateKey = TWData.createWithHexString(
              '4646464646464646464646464646464646464646464646464646464646464646')
          .bytes()!;

      final input = Aeternity.SigningInput(
        fromAddress: 'ak_2p5878zbFhxnrm7meL7TmqwtvBaqcBddyp5eGzZbovZ5FeVfcw',
        toAddress: 'ak_Egp9yVdpxmvAfQ7vsXGvpnyfNq71msbdUpkMNYGTeTe8kPL3v',
        amount: intToBytes(10),
        fee: bigIntStringToBytes('20000000000000'),
        payload: 'Hello World',
        ttl: $fixnum.Int64(82757),
        nonce: $fixnum.Int64(49),
        privateKey: privateKey,
      );

      final output = Aeternity.SigningOutput.fromBuffer(TWAnySigner.sign(
          input.writeToBuffer(), TWCoinType.TWCoinTypeAeternity));

      expect(output.encoded,
          'tx_+KkLAfhCuEDZ2XDV5OuHv1iuLn66sFLBUwnzp1K8JW1Zz+fEgmuEh6HEvNu0R112M3IYkVzvTSnT0pJ3TWhVOumgJ+IWwW8HuGH4XwwBoQHuk6T2b40WuBm7m+uf/M383BQS6H/uajJMKpmh4OZxSKEBHxOjsIvwAUAGYqaLadh194A87EwIZH9u1dhMeJe9UKMKhhIwnOVAAIMBQ0Uxi0hlbGxvIFdvcmxkDZqNSg==');
    });
  });
}
