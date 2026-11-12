import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Common.pbenum.dart' as Common;
import 'package:wallet_core_bindings/proto/Sui.pb.dart' as Sui;

import '../../utils.dart';

void main() {
  initTest();
  group('SuiSigner', () {
    const coin = TWCoinType.Sui;

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
      const txMsg =
          "AAAEAAjoAwAAAAAAAAAIUMMAAAAAAAAAIKcXWr3V7ZLr4605DbNmxqcGR4zfUXzebPmGMAZc2jd6ACBU6A1215DCd/WkTzzpL1PSb1iUiSvzld7mN1mIh2vmsgMCAAIBAAABAQABAQMAAAAAAQIAAQEDAAABAAEDAFToDXbXkMJ39aRPPOkvU9JvWJSJK/OV3uY3WYiHa+ayAWNgILOn3HsRw6pvQZsX+KnBLn95ox0b3S3mcLTt1jAFeHEaBQAAAAAgGGuNnxrqusosgjP3gQ3jBjnhapGNBlcU0yTaupXpa0BU6A1215DCd/WkTzzpL1PSb1iUiSvzld7mN1mIh2vmsu4CAAAAAAAAwMYtAAAAAAAA";
      const key =
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

    // Fixed Wallet Core 4.8.7 SIP-58 vectors: sui_sign_address_balance.rs.
    test('SIP58 pay_sui from address balance', () {
      final input = Sui.SigningInput(
        paySui: Sui.PaySui(
          recipients: [
            '0xa7175abdd5ed92ebe3ad390db366c6a706478cdf517cde6cf98630065cda377a',
          ],
          amounts: [$fixnum.Int64(1000000000)],
          addressBalanceAmount: $fixnum.Int64(1000000000),
        ),
        privateKey: parse_hex(
          '7e6682f7bf479ef0f627823cffd4e1a940a7af33e5fb39d9e0f631d2ecc5daff',
        ),
        gasBudget: $fixnum.Int64(5000000),
        referenceGasPrice: $fixnum.Int64(100),
        validDuring: Sui.ValidDuring(
          minEpoch: $fixnum.Int64(1288),
          maxEpoch: $fixnum.Int64(1289),
          chain: '4btiuiMPvEENsttpZC7CZ53DruC3MAgfznDbASZ7DR6S',
          nonce: 12345,
        ),
      );
      final output = Sui.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );
      expect(output.error, Common.SigningError.OK, reason: output.errorMessage);
      expect(
        output.unsignedTx,
        'AAACAgAAypo7AAAAAAAHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIDc3VpA1NVSQAAACCnF1q91e2S6+OtOQ2zZsanBkeM31F83mz5hjAGXNo3egIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIEY29pbgxyZWRlZW1fZnVuZHMBBwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACA3N1aQNTVUkAAQEAAAEBAgAAAQEAVOgNdteQwnf1pE886S9T0m9YlIkr85Xe5jdZiIdr5rIAVOgNdteQwnf1pE886S9T0m9YlIkr85Xe5jdZiIdr5rJkAAAAAAAAAEBLTAAAAAAAAgEIBQAAAAAAAAEJBQAAAAAAAAAAIDWDSorBfKSPsUrI+ZwXyYdH6V3QcpSuQaRrOCJGpEmbOTAAAA==',
      );
      expect(
        output.signature,
        'AL0Td0eKAdFam0WCkSO240Q0Mc5evlwFj5Sr4D8w1TGxtEHoJ2hzWcsytyIIgzhdFjyUgEtPoCHQvXOOCkq5/Q2F69FEH+T5VPvl3GB3vwCOEZpeJpKXxvcIPQAdKsh2/g==',
      );
    });
    test('SIP58 pay_token from address balance', () {
      final input = Sui.SigningInput(
        pay: Sui.Pay(
          recipients: [
            '0xa7175abdd5ed92ebe3ad390db366c6a706478cdf517cde6cf98630065cda377a',
          ],
          amounts: [$fixnum.Int64(7000000)],
          coinType:
              '0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC',
          addressBalanceAmount: $fixnum.Int64(7000000),
        ),
        privateKey: parse_hex(
          '7e6682f7bf479ef0f627823cffd4e1a940a7af33e5fb39d9e0f631d2ecc5daff',
        ),
        gasBudget: $fixnum.Int64(5000000),
        referenceGasPrice: $fixnum.Int64(100),
        validDuring: Sui.ValidDuring(
          minEpoch: $fixnum.Int64(1288),
          maxEpoch: $fixnum.Int64(1289),
          chain: '4btiuiMPvEENsttpZC7CZ53DruC3MAgfznDbASZ7DR6S',
          nonce: 12345,
        ),
      );
      final output = Sui.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );
      expect(output.error, Common.SigningError.OK, reason: output.errorMessage);
      expect(
        output.unsignedTx,
        'AAACAgDAz2oAAAAAAAAH26NGcuMMsGWx+T46tVMYdo/W/vZsFZQsn3y4RuL5AOcEdXNkYwRVU0RDAAAAIKcXWr3V7ZLr4605DbNmxqcGR4zfUXzebPmGMAZc2jd6AgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgRjb2luDHJlZGVlbV9mdW5kcwEH26NGcuMMsGWx+T46tVMYdo/W/vZsFZQsn3y4RuL5AOcEdXNkYwRVU0RDAAEBAAABAQIAAAEBAFToDXbXkMJ39aRPPOkvU9JvWJSJK/OV3uY3WYiHa+ayAFToDXbXkMJ39aRPPOkvU9JvWJSJK/OV3uY3WYiHa+ayZAAAAAAAAABAS0wAAAAAAAIBCAUAAAAAAAABCQUAAAAAAAAAACA1g0qKwXykj7FKyPmcF8mHR+ld0HKUrkGkazgiRqRJmzkwAAA=',
      );
      expect(
        output.signature,
        'AK5moGv2+NcANkUVDvQGsjNbUwYTP++hpPnJlnUgDhD7dfHkHOsv6SHj8Cwoh4ZbTJSQ8i8IYTISYaANmdQ7tQqF69FEH+T5VPvl3GB3vwCOEZpeJpKXxvcIPQAdKsh2/g==',
      );
    });
    test('SIP58 pay_all_sui from address balance', () {
      final input = Sui.SigningInput(
        payAllSui: Sui.PayAllSui(
          recipient:
              '0xa7175abdd5ed92ebe3ad390db366c6a706478cdf517cde6cf98630065cda377a',
          addressBalanceAmount: $fixnum.Int64(2000000000),
        ),
        privateKey: parse_hex(
          '7e6682f7bf479ef0f627823cffd4e1a940a7af33e5fb39d9e0f631d2ecc5daff',
        ),
        gasBudget: $fixnum.Int64(5000000),
        referenceGasPrice: $fixnum.Int64(100),
        validDuring: Sui.ValidDuring(
          minEpoch: $fixnum.Int64(1288),
          maxEpoch: $fixnum.Int64(1289),
          chain: '4btiuiMPvEENsttpZC7CZ53DruC3MAgfznDbASZ7DR6S',
          nonce: 12345,
        ),
      );
      final output = Sui.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );
      expect(output.error, Common.SigningError.OK, reason: output.errorMessage);
      expect(
        output.unsignedTx,
        'AAACAgAAlDV3AAAAAAAHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIDc3VpA1NVSQAAACCnF1q91e2S6+OtOQ2zZsanBkeM31F83mz5hjAGXNo3egIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIEY29pbgxyZWRlZW1fZnVuZHMBBwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACA3N1aQNTVUkAAQEAAAEBAgAAAQEAVOgNdteQwnf1pE886S9T0m9YlIkr85Xe5jdZiIdr5rIAVOgNdteQwnf1pE886S9T0m9YlIkr85Xe5jdZiIdr5rJkAAAAAAAAAEBLTAAAAAAAAgEIBQAAAAAAAAEJBQAAAAAAAAAAIDWDSorBfKSPsUrI+ZwXyYdH6V3QcpSuQaRrOCJGpEmbOTAAAA==',
      );
      expect(
        output.signature,
        'AKwcuOoCM601XIX4mEH4lfy8FqI7XqOEswhP/hbJkiKB1P4hATcV9Tbx4aZE3HScyFPBRCjEH04Dg201O5exywCF69FEH+T5VPvl3GB3vwCOEZpeJpKXxvcIPQAdKsh2/g==',
      );
    });
    test('SIP58 add_stake from address balance', () {
      final input = Sui.SigningInput(
        requestAddStake: Sui.RequestAddStake(
          amount: Sui.Amount(amount: $fixnum.Int64(1000000000)),
          validator:
              '0x61953ea72709eed72f4441dd944eec49a11b4acabfc8e04015e89c63be81b6ab',
          addressBalanceAmount: $fixnum.Int64(1000000000),
        ),
        privateKey: parse_hex(
          '7e6682f7bf479ef0f627823cffd4e1a940a7af33e5fb39d9e0f631d2ecc5daff',
        ),
        gasBudget: $fixnum.Int64(5000000),
        referenceGasPrice: $fixnum.Int64(100),
        validDuring: Sui.ValidDuring(
          minEpoch: $fixnum.Int64(1288),
          maxEpoch: $fixnum.Int64(1289),
          chain: '4btiuiMPvEENsttpZC7CZ53DruC3MAgfznDbASZ7DR6S',
          nonce: 12345,
        ),
      );
      final output = Sui.SigningOutput.fromBuffer(
        TWAnySigner.sign(input.writeToBuffer(), coin),
      );
      expect(output.error, Common.SigningError.OK, reason: output.errorMessage);
      expect(
        output.unsignedTx,
        'AAAEAQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQEAAAAAAAAAAQIAAMqaOwAAAAAABwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACA3N1aQNTVUkAAAAJAQDKmjsAAAAAACBhlT6nJwnu1y9EQd2UTuxJoRtKyr/I4EAV6JxjvoG2qwMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIEY29pbgxyZWRlZW1fZnVuZHMBBwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACA3N1aQNTVUkAAQEBAAUAAQIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwpzdWlfc3lzdGVtGnJlcXVlc3RfYWRkX3N0YWtlX211bF9jb2luAAQBAAACAQABAgABAwBU6A1215DCd/WkTzzpL1PSb1iUiSvzld7mN1mIh2vmsgBU6A1215DCd/WkTzzpL1PSb1iUiSvzld7mN1mIh2vmsmQAAAAAAAAAQEtMAAAAAAACAQgFAAAAAAAAAQkFAAAAAAAAAAAgNYNKisF8pI+xSsj5nBfJh0fpXdBylK5BpGs4IkakSZs5MAAA',
      );
      expect(
        output.signature,
        'AFbsYoHh3yjNs479Y42OEpp+0DYKcRQTxHcJk584SCZv6WAmAk2vTzGdu+/sKR3KP18MkYSDR2tigQfhuRxQgwmF69FEH+T5VPvl3GB3vwCOEZpeJpKXxvcIPQAdKsh2/g==',
      );
    });
  });
}
