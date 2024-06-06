import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

void main() {
  initTest();
  group('NativeInjectiveSigner', () {
    const coin = TWCoinType.NativeInjective;

    test('Sign', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(17396),
        chainId: 'injective-1',
        sequence: $fixnum.Int64(1),
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: 'inj13u6g7vqgw074mgmf2ze2cadzvkz9snlwcrtq8a',
              toAddress: 'inj1xmpkmxr4as00em23tc2zgmuyy2gr4h3wgcl6vd',
              amounts: [
                Cosmos.Amount(
                  denom: 'inj',
                  amount: '10000000000',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(110000),
          amounts: [
            Cosmos.Amount(
              denom: 'inj',
              amount: '100000000000000',
            ),
          ],
        ),
      );

      final privateKey = parse_hex(
          "9ee18daf8e463877aaf497282abc216852420101430482a28e246c179e2c5ef1");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://www.mintscan.io/injective/txs/135DD2C4A1910E4334A9C0F15125DA992E724EBF23FEB9638FCB71218BB064A5
      expectJson(output.serialized,
          "{\"mode\":\"BROADCAST_MODE_BLOCK\",\"tx_bytes\":\"Co8BCowBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEmwKKmluajEzdTZnN3ZxZ3cwNzRtZ21mMnplMmNhZHp2a3o5c25sd2NydHE4YRIqaW5qMXhtcGtteHI0YXMwMGVtMjN0YzJ6Z211eXkyZ3I0aDN3Z2NsNnZkGhIKA2luahILMTAwMDAwMDAwMDASngEKfgp0Ci0vaW5qZWN0aXZlLmNyeXB0by52MWJldGExLmV0aHNlY3AyNTZrMS5QdWJLZXkSQwpBBFoMa4O4vZgn5QcnDK20mbfjqQlSRvaiITKB94PYd8mLJWdCdBsGOfMXdo/k9MJ2JmDCESKDp2hdgVUH3uMikXMSBAoCCAEYARIcChYKA2luahIPMTAwMDAwMDAwMDAwMDAwELDbBhpAx2vkplmzeK7n3puCFGPWhLd0l/ZC/CYkGl+stH+3S3hiCvIe7uwwMpUlNaSwvT8HwF1kNUp+Sx2m0Uo1x5xcFw==\"}");
    });
  });
}
