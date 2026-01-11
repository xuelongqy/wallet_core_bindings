import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/EthereumRlp.pb.dart' as EthereumRlp;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  initTest();
  group('TWEthereumRlp', () {
    test('Eip1559', () {
      final chainId = intToBytes(10);
      final nonce = intToBytes(6);
      final maxInclusionFeePerGas = $fixnum.Int64(2000000000);
      final maxFeePerGas = intToBytes(3000000000);
      final gasLimit = intToBytes(21100);
      const to = "0x6b175474e89094c44da98b954eedeac495271d0f";
      final amount = $fixnum.Int64(0);
      final payload = parse_hex(
          "a9059cbb0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000000001ee0c29f50cb1");

      final input = EthereumRlp.EncodingInput(
        item: EthereumRlp.RlpItem(
          list: EthereumRlp.RlpList(
            items: [
              EthereumRlp.RlpItem(
                numberU256: chainId,
              ),
              EthereumRlp.RlpItem(
                numberU256: nonce,
              ),
              EthereumRlp.RlpItem(
                numberU64: maxInclusionFeePerGas,
              ),
              EthereumRlp.RlpItem(
                numberU256: maxFeePerGas,
              ),
              EthereumRlp.RlpItem(
                numberU256: gasLimit,
              ),
              EthereumRlp.RlpItem(
                address: to,
              ),
              EthereumRlp.RlpItem(
                numberU64: amount,
              ),
              EthereumRlp.RlpItem(
                data: payload,
              ),
              // Append an empty `access_list`.
              EthereumRlp.RlpItem(
                list: EthereumRlp.RlpList(
                  items: [],
                ),
              ),
            ],
          ),
        ),
      );

      final inputData = input.writeToBuffer();
      final output = EthereumRlp.EncodingOutput.fromBuffer(
          TWEthereumRlp.encode(TWCoinType.Ethereum, inputData));

      expect(output.error, Common.SigningError.OK);
      expect(output.errorMessage.isEmpty, true);
      expectHex(output.encoded,
          'f86c0a06847735940084b2d05e0082526c946b175474e89094c44da98b954eedeac495271d0f80b844a9059cbb0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000000001ee0c29f50cb1c0');
    });
  });
}
