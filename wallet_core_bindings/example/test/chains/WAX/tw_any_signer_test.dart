import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/EOS.pb.dart' as EOS;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerWAX', () {
    const coin = TWCoinType.WAX;

    test('Sign', () {
      final chainId = parse_hex(
          "1064487b3cd1a897ce03ae5b6a865651747e2e152090f99c1d19d44e01aea5a4");
      final refBlock = parse_hex(
          "0cffaeda15039f3468398c5b4295d220fcc217f7cf96030c3729773097c6bd76");
      final key = parse_hex(
          "d30d185a296b9591d648cb92fe0aa8f8a42de30ed9d2a21da9e7f69c67e8e355");

      final pubKey = TWPrivateKey.createWithData(key)
          .getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(pubKey, coin);
      expect(address.description,
          'EOS7rC6zYUjuxWkiokZTrwwHqwFvZ15Qdrn5WNxMKVXtHiDDmBWog');

      final input = EOS.SigningInput(
        asset: EOS.Asset(
          amount: $fixnum.Int64(100000000),
          decimals: 4,
          symbol: 'WAX',
        ),
        chainId: chainId,
        referenceBlockId: refBlock,
        referenceBlockTime: 1670507804,
        currency: 'eosio.token',
        sender: 'k52o1qdeh.gm',
        recipient: 'c2lrpvzxb.gm',
        memo: 'sent from wallet-core',
        privateKey: key,
        privateKeyType: EOS.KeyType.MODERNK1,
        expiration: 1670507804 + 30,
      );

      {
        final output = EOS.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(output.error, Common.SigningError.OK);
        const expected =
            '{"compression":"none","packed_context_free_data":"","packed_trx":"3aed9163daae68398c5b000000000100a6823403ea3055000000572d3ccdcd012019682ad940458100000000a8ed3232362019682ad9404581201938fdef7aa34000e1f5050000000004574158000000001573656e742066726f6d2077616c6c65742d636f726500","signatures":["SIG_K1_KAroa9t89dpujjfBgBMgDcZrVhML5yP7iFk5sGNnNqbT4SxTCLqjQwwLZDi1ryx4W7Hy9DE9p1MqUSFVKeY8NtKyiySFjE"]}';
        expect(output.jsonEncoded, expected);
      }
    });
  });
}
