import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Polkadot.pb.dart' as Polkadot;

import '../../utils.dart';

void main() {
  group('TWAnySignerKusama', () {
    const coin = TWCoinType.TWCoinTypeKusama;

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
        network: TWCoinTypeSS58Prefix(coin),
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
