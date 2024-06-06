import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Sui.pb.dart' as Sui;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('SuiCompiler', () {
    const coin = TWCoinType.Sui;

    test('PreHashAndCompile', () {
      // Successfully broadcasted https://explorer.sui.io/txblock/HkPo6rYPyDY53x1MBszvSZVZyixVN7CHvCJGX381czAh?network=devnet
      final expectedData = parse_hex(
          "000000000002000810270000000000000020259ff8074ab425cbb489f236e18e08f03f1a7856bdf7c7a2877bd64f738b50150202000101000001010300000000010100d575ad7f18e948462a5cf698f564ef394a752a71fec62493af8a055c012c0d500106f2c2c8c1d8964df1019d6616e9705719bebabd931da2755cb948ceb7e68964ec020000000000002060456ec667f5cd10467680ebf950ed329205175dacd946bb236aeed57c8617cfd575ad7f18e948462a5cf698f564ef394a752a71fec62493af8a055c012c0d500100000000000000d00700000000000000");
      final expectedHash = TWHash.blake2b(expectedData, 32);

      final input = Sui.SigningInput(
        signDirectMessage: Sui.SignDirect(
          unsignedTxMsg:
              'AAACAAgQJwAAAAAAAAAgJZ/4B0q0Jcu0ifI24Y4I8D8aeFa998eih3vWT3OLUBUCAgABAQAAAQEDAAAAAAEBANV1rX8Y6UhGKlz2mPVk7zlKdSpx/sYkk6+KBVwBLA1QAQbywsjB2JZN8QGdZhbpcFcZvrq9kx2idVy5SM635olk7AIAAAAAAAAgYEVuxmf1zRBGdoDr+VDtMpIFF12s2Ua7I2ru1XyGF8/Vda1/GOlIRipc9pj1ZO85SnUqcf7GJJOvigVcASwNUAEAAAAAAAAA0AcAAAAAAAAA',
        ),
      );

      final txInputData = input.writeToBuffer();

      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashesData);

      expect(preSigningOutput.data, expectedData);
      expect(preSigningOutput.dataHash, expectedHash);

      final privateKey = TWPrivateKey.createWithHexString(
          '3823dce5288ab55dd1c00d97e91933c613417fdb282a0b8b01a7f5f5a533b266');
      final publicKey = privateKey.getPublicKeyEd25519().data;
      final signature = privateKey.sign(expectedHash, TWCurve.ED25519);

      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey],
      );

      final output = Sui.SigningOutput.fromBuffer(outputData);

      expect(output.error, Common.SigningError.OK);
      expect(output.signature,
          'APxPduNVvHj2CcRcHOtiP2aBR9qP3vO2Cb0g12PI64QofDB6ks33oqe/i/iCTLcop2rBrkczwrayZuJOdi7gvwNqfN7sFqdcD/Z4e8I1YQlGkDMCK7EOgmydRDqfH8C9jg==');
    });
  });
}
