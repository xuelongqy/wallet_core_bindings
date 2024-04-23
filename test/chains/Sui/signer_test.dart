import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Sui.pb.dart' as Sui;

import '../../utils.dart';

void main() {
  group('SuiSigner', () {
    const coin = TWCoinType.TWCoinTypeSui;

    test('Transfer', () {
      // Successfully broadcasted https://explorer.sui.io/txblock/HkPo6rYPyDY53x1MBszvSZVZyixVN7CHvCJGX381czAh?network=devnet
      final input = Sui.SigningInput(
        signDirectMessage: Sui.SignDirect(
          unsignedTxMsg:
              'AAACAAgQJwAAAAAAAAAgJZ/4B0q0Jcu0ifI24Y4I8D8aeFa998eih3vWT3OLUBUCAgABAQAAAQEDAAAAAAEBANV1rX8Y6UhGKlz2mPVk7zlKdSpx/sYkk6+KBVwBLA1QAQbywsjB2JZN8QGdZhbpcFcZvrq9kx2idVy5SM635olk7AIAAAAAAAAgYEVuxmf1zRBGdoDr+VDtMpIFF12s2Ua7I2ru1XyGF8/Vda1/GOlIRipc9pj1ZO85SnUqcf7GJJOvigVcASwNUAEAAAAAAAAA0AcAAAAAAAAA',
        ),
        privateKey: parse_hex(
            "3823dce5288ab55dd1c00d97e91933c613417fdb282a0b8b01a7f5f5a533b266"),
      );

      final output = Sui.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.unsignedTx,
          'AAACAAgQJwAAAAAAAAAgJZ/4B0q0Jcu0ifI24Y4I8D8aeFa998eih3vWT3OLUBUCAgABAQAAAQEDAAAAAAEBANV1rX8Y6UhGKlz2mPVk7zlKdSpx/sYkk6+KBVwBLA1QAQbywsjB2JZN8QGdZhbpcFcZvrq9kx2idVy5SM635olk7AIAAAAAAAAgYEVuxmf1zRBGdoDr+VDtMpIFF12s2Ua7I2ru1XyGF8/Vda1/GOlIRipc9pj1ZO85SnUqcf7GJJOvigVcASwNUAEAAAAAAAAA0AcAAAAAAAAA');
      expect(output.signature,
          'APxPduNVvHj2CcRcHOtiP2aBR9qP3vO2Cb0g12PI64QofDB6ks33oqe/i/iCTLcop2rBrkczwrayZuJOdi7gvwNqfN7sFqdcD/Z4e8I1YQlGkDMCK7EOgmydRDqfH8C9jg==');
    });

    test('SuiTransfer', () {
      // Successfully broadcasted: https://suiscan.xyz/mainnet/tx/D4Ay9TdBJjXkGmrZSstZakpEWskEQHaWURP6xWPRXbAm
      final txMsg =
          "AAAEAAjoAwAAAAAAAAAIUMMAAAAAAAAAIKcXWr3V7ZLr4605DbNmxqcGR4zfUXzebPmGMAZc2jd6ACBU6A1215DCd/WkTzzpL1PSb1iUiSvzld7mN1mIh2vmsgMCAAIBAAABAQABAQMAAAAAAQIAAQEDAAABAAEDAFToDXbXkMJ39aRPPOkvU9JvWJSJK/OV3uY3WYiHa+ayAWNgILOn3HsRw6pvQZsX+KnBLn95ox0b3S3mcLTt1jAFeHEaBQAAAAAgGGuNnxrqusosgjP3gQ3jBjnhapGNBlcU0yTaupXpa0BU6A1215DCd/WkTzzpL1PSb1iUiSvzld7mN1mIh2vmsu4CAAAAAAAAwMYtAAAAAAAA";
      final key =
          "7e6682f7bf479ef0f627823cffd4e1a940a7af33e5fb39d9e0f631d2ecc5daff";

      final input = Sui.SigningInput(
        paySui: Sui.PaySui(
          inputCoins: [
            Sui.ObjectRef(
              objectId:
                  '0x636020b3a7dc7b11c3aa6f419b17f8a9c12e7f79a31d1bdd2de670b4edd63005',
              version: $fixnum.Int64(85619064),
              objectDigest: '2eKuWbZSVfpFVfg8FXY9wP6W5AFXnTchSoUdp7obyYZ5',
            ),
          ],
          recipients: [
            '0xa7175abdd5ed92ebe3ad390db366c6a706478cdf517cde6cf98630065cda377a',
            '0x54e80d76d790c277f5a44f3ce92f53d26f5894892bf395dee6375988876be6b2',
          ],
          amounts: [
            $fixnum.Int64(1000),
            $fixnum.Int64(50000),
          ],
        ),
        privateKey: parse_hex(key),
        gasBudget: $fixnum.Int64(3000000),
        referenceGasPrice: $fixnum.Int64(750),
      );

      final output = Sui.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.unsignedTx, txMsg);
      expect(output.signature,
          'AEh44B7iGArEHF1wOLAQJMLNgGnaIwn3gKPC92vtDJqITDETAM5z9plaxio1xomt6/cZReQ5FZaQsMC6l7E0BwmF69FEH+T5VPvl3GB3vwCOEZpeJpKXxvcIPQAdKsh2/g==');
    });
  });
}
