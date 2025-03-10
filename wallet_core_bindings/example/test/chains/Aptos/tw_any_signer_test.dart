import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Aptos.pb.dart' as Aptos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerAptos', () {
    test('TxSign', () {
      // Successfully broadcasted https://explorer.aptoslabs.com/txn/0xb4d62afd3862116e060dd6ad9848ccb50c2bc177799819f1d29c059ae2042467?network=devnet
      final privateKey = TWPrivateKey.createWithHexString(
          '5d996aa76b3212142792d9130796cd2e11e3c445a93118c08414df4f66bc60ec');
      final input = Aptos.SigningInput(
        sender:
            '0x07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30',
        sequenceNumber: $fixnum.Int64(99),
        transfer: Aptos.TransferMessage(
          to: '0x07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30',
          amount: $fixnum.Int64(1000),
        ),
        maxGasAmount: $fixnum.Int64(3296766),
        gasUnitPrice: $fixnum.Int64(100),
        expirationTimestampSecs: $fixnum.Int64(3664390082),
        chainId: 33,
        privateKey: privateKey.data,
      );
      final output = Aptos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), TWCoinType.Aptos));
      expectHex(output.rawTxn,
          '07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3063000000000000000200000000000000000000000000000000000000000000000000000000000000010d6170746f735f6163636f756e74087472616e7366657200022007968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3008e803000000000000fe4d3200000000006400000000000000c2276ada0000000021');
      expectHex(output.authenticator.signature,
          '5707246db31e2335edc4316a7a656a11691d1d1647f6e864d1ab12f43428aaaf806cf02120d0b608cdd89c5c904af7b137432aacdd60cc53f9fad7bd33578e01');
      expectHex(output.encoded,
          '07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3063000000000000000200000000000000000000000000000000000000000000000000000000000000010d6170746f735f6163636f756e74087472616e7366657200022007968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3008e803000000000000fe4d3200000000006400000000000000c2276ada00000000210020ea526ba1710343d953461ff68641f1b7df5f23b9042ffa2d2a798d3adb3f3d6c405707246db31e2335edc4316a7a656a11691d1d1647f6e864d1ab12f43428aaaf806cf02120d0b608cdd89c5c904af7b137432aacdd60cc53f9fad7bd33578e01');
      const expectedJson = '''
{
    "expiration_timestamp_secs": "3664390082",
    "gas_unit_price": "100",
    "max_gas_amount": "3296766",
    "payload": {
        "arguments": ["0x7968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30","1000"],
        "function": "0x1::aptos_account::transfer",
        "type": "entry_function_payload",
        "type_arguments": []
    },
    "sender": "0x7968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30",
    "sequence_number": "99",
    "signature": {
        "public_key": "0xea526ba1710343d953461ff68641f1b7df5f23b9042ffa2d2a798d3adb3f3d6c",
        "signature": "0x5707246db31e2335edc4316a7a656a11691d1d1647f6e864d1ab12f43428aaaf806cf02120d0b608cdd89c5c904af7b137432aacdd60cc53f9fad7bd33578e01",
        "type": "ed25519_signature"
    }
}
''';
      final parsedJson = output.json;
      expectJson(expectedJson, parsedJson);
    });

    test('TxSignWithABI', () {
      // Successfully broadcasted https://explorer.aptoslabs.com/txn/0x1ee2aa55382bf6b5a9f7a7f2b2066e16979489c6b2868704a2cf2c482f12b5ca/payload?network=mainnet
      final input = Aptos.SigningInput(
        sender:
            '0x07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30',
        sequenceNumber: $fixnum.Int64(69),
        maxGasAmount: $fixnum.Int64(50000),
        gasUnitPrice: $fixnum.Int64(100),
        expirationTimestampSecs: $fixnum.Int64(1735902711),
        chainId: 1,
        anyEncoded: '''
        {
            "function": "0x9770fa9c725cbd97eb50b2be5f7416efdfd1f1554beb0750d4dae4c64e860da3::controller::deposit",
            "type_arguments": [
                "0x1::aptos_coin::AptosCoin"
            ],
            "arguments": [
                "0x4d61696e204163636f756e74",
                "10000000",
                false
            ],
            "type": "entry_function_payload"
        }
        ''',
        abi: '''
        [
          "vector<u8>",
          "u64",
          "bool"
        ]
        ''',
        privateKey: parse_hex(
            '5d996aa76b3212142792d9130796cd2e11e3c445a93118c08414df4f66bc60ec'),
      );
      final output = Aptos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), TWCoinType.Aptos));
      expectHex(
        output.rawTxn,
        '07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f304500000000000000029770fa9c725cbd97eb50b2be5f7416efdfd1f1554beb0750d4dae4c64e860da30a636f6e74726f6c6c6572076465706f736974010700000000000000000000000000000000000000000000000000000000000000010a6170746f735f636f696e094170746f73436f696e00030d0c4d61696e204163636f756e74088096980000000000010050c30000000000006400000000000000f7c577670000000001',
      );
      expectHex(
        output.authenticator.signature,
        '13dcf1636abd31996729ded4d3bf56e9c7869a7188df4f185cbcce42f0dc74b6e1b54d31703ee3babbea2ef72b3338b8c2866cec68cbd761ccc7f80910124304',
      );
      expectHex(
        output.encoded,
        '07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f304500000000000000029770fa9c725cbd97eb50b2be5f7416efdfd1f1554beb0750d4dae4c64e860da30a636f6e74726f6c6c6572076465706f736974010700000000000000000000000000000000000000000000000000000000000000010a6170746f735f636f696e094170746f73436f696e00030d0c4d61696e204163636f756e74088096980000000000010050c30000000000006400000000000000f7c5776700000000010020ea526ba1710343d953461ff68641f1b7df5f23b9042ffa2d2a798d3adb3f3d6c4013dcf1636abd31996729ded4d3bf56e9c7869a7188df4f185cbcce42f0dc74b6e1b54d31703ee3babbea2ef72b3338b8c2866cec68cbd761ccc7f80910124304',
      );
    });
  });
}
