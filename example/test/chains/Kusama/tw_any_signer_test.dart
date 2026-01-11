import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Polkadot.pb.dart' as Polkadot;

import '../../utils.dart';
import '../Polkadot/tw_any_signer_test.dart';

void main() {
  initTest();
  group('TWAnySignerKusama', () {
    const coin = TWCoinType.Kusama;

    test('SignTransferKSM', () {
      final kusamaPrefix = coin.ss58Prefix;
      final privateKey = TWPrivateKey.createWithHexString(
          '0xabf8e5bdbe30c65656c0a3cbd181ff8a56294a69dfedd27982aace4a76909115');
      final genesisHashKSM = parse_hex(
          "b0a8d493285c2df73290dfb7e61f870f17b41801197a149ca93654499ea3dafe");

      final blockHash = parse_hex(
          "4955dd4813f3e91ef3fd5a825b928af2fc50a71380085f753ccef00bb1582891");

      final input = Polkadot.SigningInput(
        blockHash: blockHash,
        genesisHash: genesisHashKSM,
        nonce: $fixnum.Int64(0),
        specVersion: 2019,
        privateKey: privateKey.data,
        network: kusamaPrefix,
        transactionVersion: 2,
        balanceCall: Polkadot.Balance(
          transfer: Polkadot.Balance_Transfer(
            value: intToBytes(12345),
            toAddress: 'FoQJpPyadYccjavVdTWxpxU7rUEaYhfLCPwXgkfD6Zat9QP',
          ),
        ),
      );

      final preimage = helper_encodePayload(coin, input);
      expectHex(
        preimage,
        '04008eaf04151687736326c9fea17e25fc5287613693c912909cb226aa4794f26a48e5c0000000e307000002000000b0a8d493285c2df73290dfb7e61f870f17b41801197a149ca93654499ea3dafe4955dd4813f3e91ef3fd5a825b928af2fc50a71380085f753ccef00bb1582891',
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(
        hex(output.encoded),
        '25028488dc3417d5058ec4b4503e0c12ea1a0a89be200fe98922423d4334014fa6b0ee000765cfa76cfe19499f4f19ef7dc4527652ec5b2e6b5ecfaf68725dafd48ae2694ad52e61f44152a544784e847de10ddb2c56bee4406574dcbcfdb5e5d35b6d0300000004008eaf04151687736326c9fea17e25fc5287613693c912909cb226aa4794f26a48e5c0',
      );
    });

    test('Sign', () {
      final key = parse_hex(
          "0x8cdc538e96f460da9d639afc5c226f477ce98684d77fb31e88db74c1f1dd86b2");
      final genesisHash = parse_hex(
          "0xb0a8d493285c2df73290dfb7e61f870f17b41801197a149ca93654499ea3dafe");

      final input = Polkadot.SigningInput(
        blockHash: genesisHash,
        genesisHash: genesisHash,
        nonce: $fixnum.Int64(1),
        specVersion: 2019,
        privateKey: key,
        network: coin.ss58Prefix,
        transactionVersion: 2,
        balanceCall: Polkadot.Balance(
          transfer: Polkadot.Balance_Transfer(
            toAddress: 'CtwdfrhECFs3FpvCGoiE4hwRC4UsSiM8WL899HjRdQbfYZY',
            value: intToBytes(10000000000),
          ),
        ),
      );

      final output = Polkadot.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.encoded),
          '350284f41296779fd61a5bed6c2f506cc6c9ea93d6aeb357b9c69717193f434ba24ae700cd78b46eff36c433e642d7e9830805aab4f43eef70067ef32c8b2a294c510673a841c5f8a6e8900c03be40cfa475ae53e6f8aa61961563cb7cc0fa169ef9630d00040004000e33fdfb980e4499e5c3576e742a563b6a4fc0f6f598b1917fd7a6fe393ffc720700e40b5402');
    });
  });
}
