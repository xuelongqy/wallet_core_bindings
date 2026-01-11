import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Stellar.pb.dart' as Stellar;

import '../../utils.dart';

void main() {
  initTest();
  group('StellarTransaction', () {
    const coin = TWCoinType.Stellar;

    test('sign', () {
      const words =
          'indicate rival expand cave giant same grocery burden ugly rose tuna blood';

      final wallet = TWHDWallet.createWithMnemonic(words);
      final privateKey = wallet.getKeyForCoin(coin);

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
        privateKey: privateKey.data,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.signature,
          'AAAAAAmpZryqzBA+OIlrquP4wvBsIf1H3U+GT/DTP5gZ31yiAAAD6AAAAAAAAAACAAAAAAAAAAAAAAABAAAAAAAAAAEAAAAAxYC2MXoOs5v3/NT6PBn9q0uJu6u/YQle5FBa9uzteq4AAAAAAAAAAACYloAAAAAAAAAAARnfXKIAAABAocQZwTnVvGMQlpdGacWvgenxN5ku8YB8yhEGrDfEV48yDqcj6QaePAitDj/N2gxfYD9Q2pJ+ZpkQMsZZG4ACAg==');
    });

    test('signWithMemoText', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '59a313f46ef1c23a9e4f71cea10fc0c56a2a6bb8a4b9ea3d5348823e5a478722');

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GAE2SZV4VLGBAPRYRFV2VY7YYLYGYIP5I7OU7BSP6DJT7GAZ35OKFDYI',
        fee: 1000,
        sequence: $fixnum.Int64(2),
        memoText: Stellar.MemoText(
          text: 'Hello, world!',
        ),
        opPayment: Stellar.OperationPayment(
          destination:
              'GDCYBNRRPIHLHG7X7TKPUPAZ7WVUXCN3VO7WCCK64RIFV5XM5V5K4A52',
          amount: $fixnum.Int64(10000000),
        ),
        privateKey: privateKey.data,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.signature,
          'AAAAAAmpZryqzBA+OIlrquP4wvBsIf1H3U+GT/DTP5gZ31yiAAAD6AAAAAAAAAACAAAAAAAAAAEAAAANSGVsbG8sIHdvcmxkIQAAAAAAAAEAAAAAAAAAAQAAAADFgLYxeg6zm/f81Po8Gf2rS4m7q79hCV7kUFr27O16rgAAAAAAAAAAAJiWgAAAAAAAAAABGd9cogAAAEBQQldEkYJ6rMvOHilkwFCYyroGGUvrNeWVqr/sn3iFFqgz91XxgUT0ou7bMSPRgPROfBYDfQCFfFxbcDPrrCwB');
    });

    test('signWithMemoHash', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '59a313f46ef1c23a9e4f71cea10fc0c56a2a6bb8a4b9ea3d5348823e5a478722');
      final fromHex = parse_hex(
          "315f5bdb76d078c43b8ac0064e4a0164612b1fce77c869345bfc94c75894edd3");

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GAE2SZV4VLGBAPRYRFV2VY7YYLYGYIP5I7OU7BSP6DJT7GAZ35OKFDYI',
        fee: 1000,
        sequence: $fixnum.Int64(2),
        memoHash: Stellar.MemoHash(
          hash: fromHex,
        ),
        opPayment: Stellar.OperationPayment(
          destination:
              'GDCYBNRRPIHLHG7X7TKPUPAZ7WVUXCN3VO7WCCK64RIFV5XM5V5K4A52',
          amount: $fixnum.Int64(10000000),
        ),
        privateKey: privateKey.data,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.signature,
          'AAAAAAmpZryqzBA+OIlrquP4wvBsIf1H3U+GT/DTP5gZ31yiAAAD6AAAAAAAAAACAAAAAAAAAAMxX1vbdtB4xDuKwAZOSgFkYSsfznfIaTRb/JTHWJTt0wAAAAEAAAAAAAAAAQAAAADFgLYxeg6zm/f81Po8Gf2rS4m7q79hCV7kUFr27O16rgAAAAAAAAAAAJiWgAAAAAAAAAABGd9cogAAAECIyh1BG+hER5W+dgHDKe49X6VEYRWIjajM4Ufq3DUG/yw7Xv1MMF4eax3U0TRi7Qwj2fio/DRD3+/Ljtvip2MD');
    });

    test('signWithMemoReturn', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '59a313f46ef1c23a9e4f71cea10fc0c56a2a6bb8a4b9ea3d5348823e5a478722');
      final fromHex = parse_hex(
          "315f5bdb76d078c43b8ac0064e4a0164612b1fce77c869345bfc94c75894edd3");

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GAE2SZV4VLGBAPRYRFV2VY7YYLYGYIP5I7OU7BSP6DJT7GAZ35OKFDYI',
        fee: 1000,
        sequence: $fixnum.Int64(2),
        memoReturnHash: Stellar.MemoHash(
          hash: fromHex,
        ),
        opPayment: Stellar.OperationPayment(
          destination:
              'GDCYBNRRPIHLHG7X7TKPUPAZ7WVUXCN3VO7WCCK64RIFV5XM5V5K4A52',
          amount: $fixnum.Int64(10000000),
        ),
        privateKey: privateKey.data,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.signature,
          'AAAAAAmpZryqzBA+OIlrquP4wvBsIf1H3U+GT/DTP5gZ31yiAAAD6AAAAAAAAAACAAAAAAAAAAQxX1vbdtB4xDuKwAZOSgFkYSsfznfIaTRb/JTHWJTt0wAAAAEAAAAAAAAAAQAAAADFgLYxeg6zm/f81Po8Gf2rS4m7q79hCV7kUFr27O16rgAAAAAAAAAAAJiWgAAAAAAAAAABGd9cogAAAEBd77iui04quoaoWMfeJO06nRfn3Z9bptbAj7Ol44j3ApU8c9dJwVhJbQ7La4mKgIkYviEhGx3AIulFYCkokb8M');
    });

    test('signWithMemoID', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '59a313f46ef1c23a9e4f71cea10fc0c56a2a6bb8a4b9ea3d5348823e5a478722');

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GAE2SZV4VLGBAPRYRFV2VY7YYLYGYIP5I7OU7BSP6DJT7GAZ35OKFDYI',
        fee: 1000,
        sequence: $fixnum.Int64(2),
        memoId: Stellar.MemoId(
          id: $fixnum.Int64(1234567890),
        ),
        opPayment: Stellar.OperationPayment(
          destination:
              'GDCYBNRRPIHLHG7X7TKPUPAZ7WVUXCN3VO7WCCK64RIFV5XM5V5K4A52',
          amount: $fixnum.Int64(10000000),
        ),
        privateKey: privateKey.data,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.signature,
          'AAAAAAmpZryqzBA+OIlrquP4wvBsIf1H3U+GT/DTP5gZ31yiAAAD6AAAAAAAAAACAAAAAAAAAAIAAAAASZYC0gAAAAEAAAAAAAAAAQAAAADFgLYxeg6zm/f81Po8Gf2rS4m7q79hCV7kUFr27O16rgAAAAAAAAAAAJiWgAAAAAAAAAABGd9cogAAAEAOJ8wwCizQPf6JmkCsCNZolQeqet2qN7fgLUUQlwx3TNzM0+/GJ6Qc2faTybjKy111rE60IlnfaPeMl/nyxKIB');
    });

    test('signAcreateAccount', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '59a313f46ef1c23a9e4f71cea10fc0c56a2a6bb8a4b9ea3d5348823e5a478722');

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GAE2SZV4VLGBAPRYRFV2VY7YYLYGYIP5I7OU7BSP6DJT7GAZ35OKFDYI',
        fee: 1000,
        sequence: $fixnum.Int64(2),
        memoId: Stellar.MemoId(
          id: $fixnum.Int64(1234567890),
        ),
        opCreateAccount: Stellar.OperationCreateAccount(
          destination:
              'GDCYBNRRPIHLHG7X7TKPUPAZ7WVUXCN3VO7WCCK64RIFV5XM5V5K4A52',
          amount: $fixnum.Int64(10000000),
        ),
        privateKey: privateKey.data,
      );

      final output = Stellar.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.signature,
          'AAAAAAmpZryqzBA+OIlrquP4wvBsIf1H3U+GT/DTP5gZ31yiAAAD6AAAAAAAAAACAAAAAAAAAAIAAAAASZYC0gAAAAEAAAAAAAAAAAAAAADFgLYxeg6zm/f81Po8Gf2rS4m7q79hCV7kUFr27O16rgAAAAAAmJaAAAAAAAAAAAEZ31yiAAAAQNgqNDqbe0X60gyH+1xf2Tv2RndFiJmyfbrvVjsTfjZAVRrS2zE9hHlqPQKpZkGKEFka7+1ElOS+/m/1JDnauQg=');
    });
  });
}
