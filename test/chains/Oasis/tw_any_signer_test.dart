import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Oasis.pb.dart' as Oasis;

import '../../utils.dart';

void main() {
  const coin = TWCoinType.TWCoinTypeOasis;

  group('TWAnySignerOasis', () {
    test('Sign', () {
      final input = Oasis.SigningInput(
        transfer: Oasis.TransferMessage(
          gasPrice: $fixnum.Int64(0),
          gasAmount: '0',
          nonce: $fixnum.Int64(0),
          to: 'oasis1qrrnesqpgc6rfy2m50eew5d7klqfqk69avhv4ak5',
          amount: '10000000',
          context:
              'oasis-core/consensus: tx for chain a245619497e580dd3bc1aa3256c07f68b8dcc13f92da115eadc3b231b083d3c4',
        ),
        privateKey: parse_hex(
            "4f8b5676990b00e23d9904a92deb8d8f428ff289c8939926358f1d20537c21a0"),
      );

      final output = Oasis.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        'a2697369676e6174757265a2697369676e617475726558406e51c18c9b2015c9b49414b3307336597f51ff331873d214ce2db81c9651a34d99529ccaa294a39ccd01c6b0bc2c2239d87c624e5ba4840cf99ac8f9283e240c6a7075626c69635f6b6579582093d8f8a455f50527976a8aa87ebde38d5606efa86cb985d3fb466aff37000e3b73756e747275737465645f7261775f76616c7565585ea463666565a2636761730066616d6f756e74410064626f6479a262746f5500c73cc001463434915ba3f39751beb7c0905b45eb66616d6f756e744400989680656e6f6e636500666d6574686f64707374616b696e672e5472616e73666572',
        hex(output.encoded),
      );
    });
  });

  group('TWAnySignerOasisEscrow', () {
    test('Sign', () {
      final input = Oasis.SigningInput(
        escrow: Oasis.EscrowMessage(
          gasPrice: $fixnum.Int64(0),
          gasAmount: '0',
          nonce: $fixnum.Int64(0),
          account: 'oasis1qrrnesqpgc6rfy2m50eew5d7klqfqk69avhv4ak5',
          amount: '10000000',
          context:
              'oasis-core/consensus: tx for chain a245619497e580dd3bc1aa3256c07f68b8dcc13f92da115eadc3b231b083d3c4',
        ),
        privateKey: parse_hex(
            "4f8b5676990b00e23d9904a92deb8d8f428ff289c8939926358f1d20537c21a0"),
      );

      final output = Oasis.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        'a2697369676e6174757265a2697369676e61747572655840f22235e307a45dbeb0c4201bee58b920c791d80356dc17ebe7fb878dbfe35a5e8e05ac8842c7f6cfaaf7a2b8898528f4cea7f9d501be1ce1275191c3333b00076a7075626c69635f6b6579582093d8f8a455f50527976a8aa87ebde38d5606efa86cb985d3fb466aff37000e3b73756e747275737465645f7261775f76616c75655864a463666565a2636761730066616d6f756e74410064626f6479a266616d6f756e744400989680676163636f756e745500c73cc001463434915ba3f39751beb7c0905b45eb656e6f6e636500666d6574686f64717374616b696e672e416464457363726f77',
        hex(output.encoded),
      );
    });
  });

  group('TWAnySignerOasisReclaimEscrow', () {
    test('Sign', () {
      final input = Oasis.SigningInput(
        reclaimEscrow: Oasis.ReclaimEscrowMessage(
          gasPrice: $fixnum.Int64(0),
          gasAmount: '0',
          nonce: $fixnum.Int64(0),
          account: 'oasis1qrrnesqpgc6rfy2m50eew5d7klqfqk69avhv4ak5',
          shares: '10000000',
          context:
              'oasis-core/consensus: tx for chain a245619497e580dd3bc1aa3256c07f68b8dcc13f92da115eadc3b231b083d3c4',
        ),
        privateKey: parse_hex(
            "4f8b5676990b00e23d9904a92deb8d8f428ff289c8939926358f1d20537c21a0"),
      );

      final output = Oasis.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        'a2697369676e6174757265a2697369676e6174757265584048a3218b453a130dec2a1392556b5e03d54c6dab29600c50944e9bd0e5325b76f98ffe4e9f8b07590cd964480ce76b50d134035e73b03cba1adb7631ab67eb006a7075626c69635f6b6579582093d8f8a455f50527976a8aa87ebde38d5606efa86cb985d3fb466aff37000e3b73756e747275737465645f7261775f76616c75655868a463666565a2636761730066616d6f756e74410064626f6479a2667368617265734400989680676163636f756e745500c73cc001463434915ba3f39751beb7c0905b45eb656e6f6e636500666d6574686f64757374616b696e672e5265636c61696d457363726f77',
        hex(output.encoded),
      );
    });
  });
}
