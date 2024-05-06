import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/NEAR.pb.dart' as NEAR;

import '../../utils.dart';

void main() {
  const coin = TWCoinType.TWCoinTypeNEAR;

  group('NEARSigner', () {
    test('SignTx', () {
      final publicKey = TWBase58.decodeNoCheck(
          'Anu7LYDfpLtkP7E16LT9imXF694BdQaa9ufVkQiwTQxC')!;

      final input = NEAR.SigningInput(
        signerId: 'test.near',
        nonce: $fixnum.Int64(1),
        receiverId: 'whatever.near',
        actions: [
          NEAR.Action(
            transfer: NEAR.Transfer(
              deposit: List.filled(16, 0)..[0] = 1,
            ),
          ),
        ],
      );

      final blockHash = TWBase58.decodeNoCheck(
          '244ZQ9cgj3CQ6bWBdytfrJMuMQ1jdXLFGnr4HhvtCTnM')!;
      input.blockHash = blockHash;

      final privateKey = TWBase58.decodeNoCheck(
          '3hoMW1HvnRLSFCLZnvPzWeoGwtdHzke34B2cTHM8rhcbG3TbuLKtShTv3DvyejnXKXKBiV7YPkLeqUHN1ghnqpFv')!;
      input.privateKey = privateKey.sublist(0, 32);

      final output = NEAR.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      final signedTransaction = output.signedTransaction;
      final outputInBase64 =
          TWBase64.encode(Uint8List.fromList(signedTransaction));

      expect(outputInBase64,
          'CQAAAHRlc3QubmVhcgCRez0mjUtY9/7BsVC9aNab4+5dTMOYVeNBU4Rlu3eGDQEAAAAAAAAADQAAAHdoYXRldmVyLm5lYXIPpHP9JpAd8pa+atxMxN800EDvokNSJLaYaRDmMML+9gEAAAADAQAAAAAAAAAAAAAAAAAAAACWmoMzIYbul1Xkg5MlUlgG4Ymj0tK7S0dg6URD6X4cTyLe7vAFmo6XExAO2m4ZFE2n6KDvflObIHCLodjQIb0B');
      expect(hex(output.hash),
          'eea6e680f3ea51a7f667e9a801d0bfadf66e03d41ed54975b3c6006351461b32');
    });
  });
}
