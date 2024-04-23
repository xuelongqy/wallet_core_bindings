import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Stellar.pb.dart' as Stellar;

import '../../utils.dart';

void main() {
  group('TWAnySingerStellar', () {
    const coin = TWCoinType.TWCoinTypeStellar;

    test('Sign_Payment', () {
      final key = parse_hex(
          "59a313f46ef1c23a9e4f71cea10fc0c56a2a6bb8a4b9ea3d5348823e5a478722");
      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GAE2SZV4VLGBAPRYRFV2VY7YYLYGYIP5I7OU7BSP6DJT7GAZ35OKFDYI',
        fee: 1000,
        sequence: $fixnum.Int64(2),
        opPayment: Stellar.OperationPayment(
          destination:
              'GDCYBNRRPIHLHG7X7TKPUPAZ7WVUXCN3VO7WCCK64RIFV5XM5V5K4A52',
          amount: $fixnum.Int64(10000000),
        ),
        privateKey: key,
        memoText: Stellar.MemoText(
          text: 'Hello, world!',
        ),
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // curl "https://horizon.stellar.org/transactions/66b5bca4b4293bdd85a6a559b08918482774b76bcc170b4533411f1d6422ce24"
      expect(output.signature,
          'AAAAAAmpZryqzBA+OIlrquP4wvBsIf1H3U+GT/DTP5gZ31yiAAAD6AAAAAAAAAACAAAAAAAAAAEAAAANSGVsbG8sIHdvcmxkIQAAAAAAAAEAAAAAAAAAAQAAAADFgLYxeg6zm/f81Po8Gf2rS4m7q79hCV7kUFr27O16rgAAAAAAAAAAAJiWgAAAAAAAAAABGd9cogAAAEBQQldEkYJ6rMvOHilkwFCYyroGGUvrNeWVqr/sn3iFFqgz91XxgUT0ou7bMSPRgPROfBYDfQCFfFxbcDPrrCwB');
    });

    test('Sign_Payment_66b5', () {
      final key = parse_hex(
          "3c0635f8638605aed6e461cf3fa2d508dd895df1a1655ff92c79bfbeaf88d4b9");
      final privKey = TWPrivateKey.createWithData(key);
      final pubKey =
          privKey.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519);
      final addr = TWAnyAddress.createWithPublicKey(pubKey, coin);
      expect(addr.description,
          'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL');

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL',
        fee: 1000,
        sequence: $fixnum.Int64(144098454883270657),
        opPayment: Stellar.OperationPayment(
          destination:
              'GA3ISGYIE2ZTH3UAKEKBVHBPKUSL3LT4UQ6C5CUGP2IM5F467O267KI7',
          amount: $fixnum.Int64(1000000),
        ),
        privateKey: key,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // curl "https://horizon.stellar.org/transactions/66b5bca4b4293bdd85a6a559b08918482774b76bcc170b4533411f1d6422ce24"
      expect(output.signature,
          'AAAAAMpFJQVVMv16RJUPlzQUTlgZOHVurhw3igGacP1305F1AAAD6AH/8MgAAAABAAAAAAAAAAAAAAABAAAAAAAAAAEAAAAANokbCCazM+6AURQanC9VJL2ufKQ8LoqGfpDOl577te8AAAAAAAAAAAAPQkAAAAAAAAAAAXfTkXUAAABAM9Nhzr8iWKzqnHknrxSVoa4b2qzbTzgyE2+WWxg6XHH50xiFfmvtRKVhzp0Jg8PfhatOb6KNheKRWEw4OvqEDw==');
    });

    test('Sign_Payment_Asset_ea50', () {
      final key = parse_hex(
          "3c0635f8638605aed6e461cf3fa2d508dd895df1a1655ff92c79bfbeaf88d4b9");
      final privKey = TWPrivateKey.createWithData(key);
      final pubKey =
          privKey.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519);
      final addr = TWAnyAddress.createWithPublicKey(pubKey, coin);
      expect(addr.description,
          'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL');

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL',
        fee: 1000,
        sequence: $fixnum.Int64(144098454883270661),
        opPayment: Stellar.OperationPayment(
          destination:
              'GA3ISGYIE2ZTH3UAKEKBVHBPKUSL3LT4UQ6C5CUGP2IM5F467O267KI7',
          asset: Stellar.Asset(
            issuer: 'GA6HCMBLTZS5VYYBCATRBRZ3BZJMAFUDKYYF6AH6MVCMGWMRDNSWJPIH',
            alphanum4: 'MOBI',
          ),
          amount: $fixnum.Int64(12000000),
        ),
        privateKey: key,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // curl "https://horizon.stellar.org/transactions/ea50884cd1288d2d5420065995d13d750d812258e0e79280c4033a434e625c99
      expect(output.signature,
          'AAAAAMpFJQVVMv16RJUPlzQUTlgZOHVurhw3igGacP1305F1AAAD6AH/8MgAAAAFAAAAAAAAAAAAAAABAAAAAAAAAAEAAAAANokbCCazM+6AURQanC9VJL2ufKQ8LoqGfpDOl577te8AAAABTU9CSQAAAAA8cTArnmXa4wEQJxDHOw5SwBaDVjBfAP5lRMNZkRtlZAAAAAAAtxsAAAAAAAAAAAF305F1AAAAQEuWZZvKZuF6SMuSGIyfLqx5sn5O55+Kd489uP4g9jZH4UE7zZ4ME0+74I0BU8YDsYOmmxcfp/vdwTd+n3oGCQw=');
    });

    test('Sign_Change_Trust_ad9c', () {
      final key = parse_hex(
          "3c0635f8638605aed6e461cf3fa2d508dd895df1a1655ff92c79bfbeaf88d4b9");
      final privKey = TWPrivateKey.createWithData(key);
      final pubKey =
          privKey.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519);
      final addr = TWAnyAddress.createWithPublicKey(pubKey, coin);
      expect(addr.description,
          'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL');

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL',
        fee: 10000,
        sequence: $fixnum.Int64(144098454883270659),
        opChangeTrust: Stellar.OperationChangeTrust(
          asset: Stellar.Asset(
            issuer: 'GA6HCMBLTZS5VYYBCATRBRZ3BZJMAFUDKYYF6AH6MVCMGWMRDNSWJPIH',
            alphanum4: 'MOBI',
          ),
          validBefore: $fixnum.Int64(1613336576),
        ),
        privateKey: key,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // curl "https://horizon.stellar.org/transactions/ad9cd0f3d636096b6502ccae07adbcf2cd3c0da5393fc2b07813dbe90ecc0d7b"
      expect(output.signature,
          'AAAAAMpFJQVVMv16RJUPlzQUTlgZOHVurhw3igGacP1305F1AAAnEAH/8MgAAAADAAAAAQAAAAAAAAAAAAAAAGApkAAAAAAAAAAAAQAAAAAAAAAGAAAAAU1PQkkAAAAAPHEwK55l2uMBECcQxzsOUsAWg1YwXwD+ZUTDWZEbZWR//////////wAAAAAAAAABd9ORdQAAAEAnfyXyaNQX5Bq3AEQVBIaYd+cLib+y2sNY7DF/NYVSE51dZ6swGGElz094ObsPefmVmeRrkGsSc/fF5pmth+wJ');
    });

    test('Sign_Change_Trust_2', () {
      final key = parse_hex(
          "3c0635f8638605aed6e461cf3fa2d508dd895df1a1655ff92c79bfbeaf88d4b9");
      final privKey = TWPrivateKey.createWithData(key);
      final pubKey =
          privKey.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519);
      final addr = TWAnyAddress.createWithPublicKey(pubKey, coin);
      expect(addr.description,
          'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL');

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL',
        fee: 10000,
        sequence: $fixnum.Int64(144098454883270659),
        opChangeTrust: Stellar.OperationChangeTrust(
          asset: Stellar.Asset(
            issuer: 'GDUKMGUGDZQK6YHYA5Z6AY2G4XDSZPSZ3SW5UN3ARVMO6QSRDWP5YLEX',
            alphanum4: 'USD',
          ),
          validBefore: $fixnum.Int64(1613336576),
        ),
        privateKey: key,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.signature,
          'AAAAAMpFJQVVMv16RJUPlzQUTlgZOHVurhw3igGacP1305F1AAAnEAH/8MgAAAADAAAAAQAAAAAAAAAAAAAAAGApkAAAAAAAAAAAAQAAAAAAAAAGAAAAAVVTRAAAAAAA6KYahh5gr2D4B3PgY0blxyy+Wdyt2jdgjVjvQlEdn9x//////////wAAAAAAAAABd9ORdQAAAEDMZtN05ZsZB4OKOZSFkQvuRqDIvMME3PYMTAGJPQlO6Ee0nOtaRn2q0uf0IhETSSfqcsK5asAZzNj07tG0SPwM');
    });

    test('Sign_Create_Claimable_Balance_1f1f84', () {
      final key = parse_hex(
          "3c0635f8638605aed6e461cf3fa2d508dd895df1a1655ff92c79bfbeaf88d4b9");
      final privKey = TWPrivateKey.createWithData(key);
      final pubKey =
          privKey.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519);
      final addr = TWAnyAddress.createWithPublicKey(pubKey, coin);
      expect(addr.description,
          'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL');

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL',
        fee: 10000,
        sequence: $fixnum.Int64(144098454883270687),
        opCreateClaimableBalance: Stellar.OperationCreateClaimableBalance(
          amount: $fixnum.Int64(90000000),
          claimants: [
            Stellar.Claimant(
              account:
                  'GC6CJDAY54D3O4RHEH33LUTBKDZGVOTR6NHBOTL4PIWI2CDKVRSZZJGJ',
              predicate: Stellar.ClaimPredicate.Predicate_unconditional,
            ),
          ],
        ),
        privateKey: key,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://stellar.expert/explorer/public/tx/1f1f849ff2560901c91226f2fc866ef4ed1c67d672262c1f5829abe2348ac638
      // curl -X POST -F "tx=AAAAAMpF..Bg==" "https://horizon.stellar.org/transactions"
      expect(output.signature,
          'AAAAAMpFJQVVMv16RJUPlzQUTlgZOHVurhw3igGacP1305F1AAAnEAH/8MgAAAAfAAAAAAAAAAAAAAABAAAAAAAAAA4AAAAAAAAAAAVdSoAAAAABAAAAAAAAAAC8JIwY7we3cich97XSYVDyarpx804XTXx6LI0IaqxlnAAAAAAAAAAAAAAAAXfTkXUAAABAgms/HPhEP/EYtVr5aWwhKJsn3pIVEZGFnTD2Xd/VPVsn8qogI7RYyjyBxSFPiLAljgGsPaUMfU3WFvyJCWNwBg==');
    });

    test('Sign_Claim_Claimable_Balance_c1fb3c', () {
      final key = parse_hex(
          "3c0635f8638605aed6e461cf3fa2d508dd895df1a1655ff92c79bfbeaf88d4b9");
      final privKey = TWPrivateKey.createWithData(key);
      final pubKey =
          privKey.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519);
      final addr = TWAnyAddress.createWithPublicKey(pubKey, coin);
      expect(addr.description,
          'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL');

      final balanceIdHash = parse_hex(
          "9c7b794b7b150f3e4c6dcfa260672bbe0c248b360129112e927e0f7ee2f9faf8");

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GDFEKJIFKUZP26SESUHZONAUJZMBSODVN2XBYN4KAGNHB7LX2OIXLPUL',
        fee: 10000,
        sequence: $fixnum.Int64(144098454883270689),
        opClaimClaimableBalance: Stellar.OperationClaimClaimableBalance(
          balanceId: balanceIdHash,
        ),
        privateKey: key,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://stellar.expert/explorer/public/tx/c1fb3cf348aeb72bb2e1030c1d7f7f9c6c6d1bbab071b3e7c7c1cadafa795e8e
      // curl -X POST -F "tx=AAAAAMpF..DQ==" "https://horizon.stellar.org/transactions"
      expect(output.signature,
          'AAAAAMpFJQVVMv16RJUPlzQUTlgZOHVurhw3igGacP1305F1AAAnEAH/8MgAAAAhAAAAAAAAAAAAAAABAAAAAAAAAA8AAAAAnHt5S3sVDz5Mbc+iYGcrvgwkizYBKREukn4PfuL5+vgAAAAAAAAAAXfTkXUAAABAWL7dKkR1JuPZGFbDTRDgGBHW/vLPMWNRkAew+wPfGiCnZhpJJDcyX197EDDZMsJ7ungPUyhczRaeQOwZKx4DDQ==');

      {
        // negative test: hash wrong size
        final invalidBalanceIdHash = parse_hex("010203");
        input.opClaimClaimableBalance.balanceId = invalidBalanceIdHash;
        final output = Stellar.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(output.signature,
            'AAAAAXfTkXUAAABAFCywEfLs3q5Tv9eZCIcjhkJR0s8J4Us9G5YjVKUSaMoUz/AadC8dM2oQSLhpC5wjrNBi7hevg7jlkPx5/4AJCQ==');
      }
    });
  });
}
