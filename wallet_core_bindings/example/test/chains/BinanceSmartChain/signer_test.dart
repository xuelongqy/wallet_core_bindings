import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Ethereum.pb.dart' as Ethereum;

import '../../utils.dart';

void main() {
  initTest();
  group('BinanceSmartChain', () {
    test('SignNativeTransfer', () {
      // https://explorer.binance.org/smart-testnet/tx/0x6da28164f7b3bc255d749c3ae562e2a742be54c12bf1858b014cc2fe5700684e

      // addr: 0xB9F5771C27664bF2282D98E09D7F50cEc7cB01a7  mnemonic: isolate dismiss ... cruel note
      final privateKey = TWData.createWithHexString(
              '4f96ed80e9a7555a6f74b3d658afdd9c756b0a40d4ca30c42c2039eb449bb904')
          .bytes();

      final input = Ethereum.SigningInput(
        chainId: intToBytes(97),
        nonce: intToBytes(0),
        gasPrice: bigIntStringToBytes('20000000000'),
        gasLimit: intToBytes(21000),
        toAddress: '0x31BE00EB1fc8e14A696DBC72f746ec3e95f49683',
        privateKey: privateKey,
        transaction: Ethereum.Transaction(
          transfer: Ethereum.Transaction_Transfer(
            amount: bigIntStringToBytes('10000000000000000'),
          ),
        ),
      );

      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), TWCoinType.SmartChain));
      expectHex(output.encoded,
          'f86c808504a817c8008252089431be00eb1fc8e14a696dbc72f746ec3e95f49683872386f26fc100008081e5a057806b486844c5d0b7b5ce34b289f4e8776aa1fe24a3311cef5053995c51050ca07697aa0695de27da817625df0e7e4c64b0ab22d9df30aec92299a7b380be8db7');
    });

    test('SignTokenTransfer', () {
      const toAddress = '0x31BE00EB1fc8e14A696DBC72f746ec3e95f49683';
      final func = TWEthereumAbiFunction('transfer');
      func.addParamAddressHex(toAddress, false);
      func.addParamUInt256(bigIntStringToBytes('10000000000000000'), false);
      final funcData = func.encode();
      expectHex(funcData,
          'a9059cbb00000000000000000000000031be00eb1fc8e14a696dbc72f746ec3e95f49683000000000000000000000000000000000000000000000000002386f26fc10000');

      // addr: 0xB9F5771C27664bF2282D98E09D7F50cEc7cB01a7  mnemonic: isolate dismiss ... cruel note
      final privateKey = TWData.createWithHexString(
              '4f96ed80e9a7555a6f74b3d658afdd9c756b0a40d4ca30c42c2039eb449bb904')
          .bytes();
      final input = Ethereum.SigningInput(
        chainId: intToBytes(97),
        nonce: intToBytes(30),
        gasPrice: bigIntStringToBytes('20000000000'),
        gasLimit: intToBytes(1000000),
        toAddress: '0xed24fc36d5ee211ea25a80239fb8c4cfd80f12ee',
        privateKey: privateKey,
        transaction: Ethereum.Transaction(
          contractGeneric: Ethereum.Transaction_ContractGeneric(
            data: funcData,
          ),
        ),
      );

      const expected =
          'f8ab1e8504a817c800830f424094ed24fc36d5ee211ea25a80239fb8c4cfd80f12ee80b844a9059cbb00000000000000000000000031be00eb1fc8e14a696dbc72f746ec3e95f49683000000000000000000000000000000000000000000000000002386f26fc1000081e6a0aa9d5e9a947e96f728fe5d3e6467000cd31a693c00270c33ec64b4abddc29516a00bf1d5646139b2bcca1ad64e6e79f45b7d1255de603b5a3765cbd9544ae148d0';

      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), TWCoinType.SmartChain));
      expectHex(output.encoded, expected);
    });
  });
}
