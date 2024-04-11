import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/EthereumAbi.pb.dart' as EthereumAbi;

import '../../utils.dart';

void main() {
  group('TWEthereumAbi', () {
    test('FuncCreateEmpty', () {
      final func = TWEthereumAbiFunction('baz');
      expect(func.pointer != nullptr, true);

      final type = func.getType();
      expect('baz()', type);
    });

    test('FuncCreate1', () {
      final func = TWEthereumAbiFunction('baz');
      expect(func.pointer != nullptr, true);

      final p1index = func.addParamUInt64(69, false);
      expect(0, p1index);
      final p2index = func.addParamUInt64(9, true);
      expect(0, p2index);
      // check back get value
      final p2val2 = func.getParamUInt64(p2index, true);
      expect(9, p2val2);

      final type = func.getType();
      expect('baz(uint64)', type);
    });

    test('FuncCreate2', () {
      final func = TWEthereumAbiFunction('baz');
      expect(func.pointer != nullptr, true);

      final p1val = parse_hex('0045');
      final p1index = func.addParamUInt256(p1val, false);
      expect(0, p1index);

      final dummy = intToBytes(0);
      final p2index = func.addParamUInt256(dummy, true);
      expect(0, p2index);

      // check back get value
      final p1val2 = func.getParamUInt256(p2index, true);
      expectHex(p1val2, '00');

      final type = func.getType();
      expect('baz(uint256)', type);
    });

    test('EncodeFuncCase1', () {
      final func = TWEthereumAbiFunction('sam');
      expect(func.pointer != nullptr, true);

      expect(0, func.addParamBytes(parse_hex('64617665'), false));
      expect(1, func.addParamBool(true, false));
      final paramArrIdx = func.addParamArray(false);
      expect(2, paramArrIdx);
      expect(0, func.addInArrayParamUInt256(paramArrIdx, parse_hex('01')));
      expect(1, func.addInArrayParamUInt256(paramArrIdx, parse_hex('02')));
      expect(2, func.addInArrayParamUInt256(paramArrIdx, parse_hex('03')));

      final type = func.getType();
      expect('sam(bytes,bool,uint256[])', type);

      final encoded = TWEthereumAbi.encode(func);
      expectHex(
        encoded,
        "a5643bf2"
        "0000000000000000000000000000000000000000000000000000000000000060"
        "0000000000000000000000000000000000000000000000000000000000000001"
        "00000000000000000000000000000000000000000000000000000000000000a0"
        "0000000000000000000000000000000000000000000000000000000000000004"
        "6461766500000000000000000000000000000000000000000000000000000000"
        "0000000000000000000000000000000000000000000000000000000000000003"
        "0000000000000000000000000000000000000000000000000000000000000001"
        "0000000000000000000000000000000000000000000000000000000000000002"
        "0000000000000000000000000000000000000000000000000000000000000003",
      );
    });

    test('EncodeFuncCase2', () {
      final func = TWEthereumAbiFunction('f');
      expect(func.pointer != nullptr, true);

      expect(0, func.addParamUInt256(parse_hex('0123'), false));
      final paramArrIdx = func.addParamArray(false);
      expect(1, paramArrIdx);
      expect(0, func.addInArrayParamUInt32(paramArrIdx, 0x456));
      expect(1, func.addInArrayParamUInt32(paramArrIdx, 0x789));
      expect(2,
          func.addParamBytesFix(10, parse_hex('31323334353637383930'), false));
      expect(3, func.addParamString('Hello, world!', false));

      final type = func.getType();
      expect('f(uint256,uint32[],bytes10,string)', type);

      final encoded = TWEthereumAbi.encode(func);
      expectHex(
        encoded,
        "47b941bf"
        "0000000000000000000000000000000000000000000000000000000000000123"
        "0000000000000000000000000000000000000000000000000000000000000080"
        "3132333435363738393000000000000000000000000000000000000000000000"
        "00000000000000000000000000000000000000000000000000000000000000e0"
        "0000000000000000000000000000000000000000000000000000000000000002"
        "0000000000000000000000000000000000000000000000000000000000000456"
        "0000000000000000000000000000000000000000000000000000000000000789"
        "000000000000000000000000000000000000000000000000000000000000000d"
        "48656c6c6f2c20776f726c642100000000000000000000000000000000000000",
      );
    });

    test('EncodeFuncMonster', () {
      // Monster function with all parameters types
      final func = TWEthereumAbiFunction('monster');
      expect(func.pointer != nullptr, true);

      func.addParamUInt8(1, false);
      func.addParamUInt16(2, false);
      func.addParamUInt32(3, false);
      func.addParamUInt64(4, false);
      func.addParamUIntN(168, parse_hex('0123'), false);
      func.addParamUInt256(parse_hex('0123'), false);
      func.addParamInt8(1, false);
      func.addParamInt16(-3, false);
      func.addParamInt32(3, false);
      func.addParamInt64(4, false);
      func.addParamIntN(168, parse_hex('0123'), false);
      func.addParamInt256(parse_hex('0123'), false);
      func.addParamBool(true, false);
      func.addParamString('Hello, world!', false);
      func.addParamAddress(
          parse_hex('f784682c82526e245f50975190ef0fff4e4fc077'), false);
      func.addParamBytes(parse_hex('3132333435'), false);
      func.addParamBytesFix(5, parse_hex('3132333435'), false);

      func.addInArrayParamUInt8(func.addParamArray(false), 1);
      func.addInArrayParamUInt16(func.addParamArray(false), 2);
      func.addInArrayParamUInt32(func.addParamArray(false), 3);
      func.addInArrayParamUInt64(func.addParamArray(false), 4);
      func.addInArrayParamUIntN(
          func.addParamArray(false), 168, parse_hex('0123'));
      func.addInArrayParamUInt256(func.addParamArray(false), parse_hex('0123'));
      func.addInArrayParamInt8(func.addParamArray(false), 1);
      func.addInArrayParamInt16(func.addParamArray(false), -3);
      func.addInArrayParamInt32(func.addParamArray(false), 3);
      func.addInArrayParamInt64(func.addParamArray(false), 4);
      func.addInArrayParamIntN(
          func.addParamArray(false), 168, parse_hex('0123'));
      func.addInArrayParamInt256(func.addParamArray(false), parse_hex('0123'));
      func.addInArrayParamBool(func.addParamArray(false), true);
      func.addInArrayParamString(func.addParamArray(false), 'Hello, world!');
      func.addInArrayParamAddress(func.addParamArray(false),
          parse_hex('f784682c82526e245f50975190ef0fff4e4fc077'));
      func.addInArrayParamBytes(
          func.addParamArray(false), parse_hex('3132333435'));
      func.addInArrayParamBytesFix(
          func.addParamArray(false), 5, parse_hex('3132333435'));

      // check back out params
      expect(1, func.getParamUInt8(0, false));
      expect(4, func.getParamUInt64(3, false));
      expect(true, func.getParamBool(12, false));
      expect('Hello, world!', func.getParamString(13, false));
      func.getParamAddress(14, false);

      final type = func.getType();
      expect(
        "monster(uint8,uint16,uint32,uint64,uint168,uint256,int8,int16,int32,int64,int168,int256,bool,string,address,bytes,bytes5,"
        "uint8[],uint16[],uint32[],uint64[],uint168[],uint256[],int8[],int16[],int32[],int64[],int168[],int256[],bool[],string[],address[],bytes[],bytes5[])",
        type,
      );

      final encoded = TWEthereumAbi.encode(func);
      expect(4 + 76 * 32, encoded.length);
      expectHex(encoded,
          '70efb5a50000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000012300000000000000000000000000000000000000000000000000000000000001230000000000000000000000000000000000000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000123000000000000000000000000000000000000000000000000000000000000012300000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000440000000000000000000000000f784682c82526e245f50975190ef0fff4e4fc0770000000000000000000000000000000000000000000000000000000000000480313233343500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c000000000000000000000000000000000000000000000000000000000000005000000000000000000000000000000000000000000000000000000000000000540000000000000000000000000000000000000000000000000000000000000058000000000000000000000000000000000000000000000000000000000000005c000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000640000000000000000000000000000000000000000000000000000000000000068000000000000000000000000000000000000000000000000000000000000006c000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000740000000000000000000000000000000000000000000000000000000000000078000000000000000000000000000000000000000000000000000000000000007c00000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000088000000000000000000000000000000000000000000000000000000000000008c00000000000000000000000000000000000000000000000000000000000000940000000000000000000000000000000000000000000000000000000000000000d48656c6c6f2c20776f726c64210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000053132333435000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000012300000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000123000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000001fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000123000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000001230000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000d48656c6c6f2c20776f726c6421000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000f784682c82526e245f50975190ef0fff4e4fc077000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000005313233343500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013132333435000000000000000000000000000000000000000000000000000000');
    });

    test('DecodeOutputFuncCase1', () {
      final func = TWEthereumAbiFunction('readout');
      expect(func.pointer != nullptr, true);

      func.addParamAddress(
          parse_hex('f784682c82526e245f50975190ef0fff4e4fc077'), false);
      func.addParamInt64(1000, false);
      expect(0, func.addParamUInt64(0, true));

      // original output value
      expect(0, func.getParamUInt64(0, true));

      // decode
      final encoded = parse_hex(
          '0000000000000000000000000000000000000000000000000000000000000045');
      expect(true, TWEthereumAbi.decodeOutput(func, encoded));

      // new output value
      expect(0x45, func.getParamUInt64(0, true));
    });

    test('GetParamWrongType', () {
      final func = TWEthereumAbiFunction('func');
      expect(func.pointer != nullptr, true);

      // add parameters
      expect(0, func.addParamUInt8(1, true));
      expect(1, func.addParamUInt64(2, true));

      // GetParameter with correct types
      expect(1, func.getParamUInt8(0, true));
      expect(2, func.getParamUInt64(1, true));

      // GetParameter with wrong type, default value (0) is returned
      expect(0, func.getParamUInt8(1, true));
      expect(0, func.getParamUInt64(0, true));
      expect('00', hex(func.getParamUInt256(0, true)));
      expect(false, func.getParamBool(0, true));
      expect('', func.getParamString(99, true));
      expect('', hex(func.getParamAddress(99, true)));
    });

    test('DecodeCall', () {
      final encodedCall = parse_hex(
          "c47f0027000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000086465616462656566000000000000000000000000000000000000000000000000");
      final abiJson =
          '{"c47f0027":{"constant":false,"inputs":[{"name":"name","type":"string"}],"name":"setName","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"}}';

      final input = EthereumAbi.ContractCallDecodingInput(
        encoded: encodedCall,
        smartContractAbiJson: abiJson,
      );

      final inputData = input.writeToBuffer();
      final outputData = TWEthereumAbi.decodeContractCall(
          TWCoinType.TWCoinTypeEthereum, inputData);

      final output =
          EthereumAbi.ContractCallDecodingOutput.fromBuffer(outputData);

      final expected =
          '{"function":"setName(string)","inputs":[{"name":"name","type":"string","value":"deadbeef"}]}';
      expect(output.decodedJson, expected);
    });

    test('DecodeInvalidCall', () {
      final callHex = 'c47f002700';
      final call = parse_hex(callHex);

      final decoded1 = TWEthereumAbi.decodeCall(call, ",,");
      final decoded2 = TWEthereumAbi.decodeCall(call, "{}");

      expect(decoded1, null);
      expect(decoded2, null);
    });

    test('encodeTyped', () {
      final message = '''
        {
            "types": {
                "EIP712Domain": [
                    {"name": "name", "type": "string"},
                    {"name": "version", "type": "string"},
                    {"name": "chainId", "type": "uint256"},
                    {"name": "verifyingContract", "type": "address"}
                ],
                "Person": [
                    {"name": "name", "type": "string"},
                    {"name": "wallets", "type": "address[]"}
                ],
                "Mail": [
                    {"name": "from", "type": "Person"},
                    {"name": "to", "type": "Person[]"},
                    {"name": "contents", "type": "string"}
                ]
            },
            "primaryType": "Mail",
            "domain": {
                "name": "Ether Mail",
                "version": "1",
                "chainId": 1,
                "verifyingContract": "0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC"
            },
            "message": {
                "from": {
                    "name": "Cow",
                    "wallets": [
                        "CD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826",
                        "DeaDbeefdEAdbeefdEadbEEFdeadbeEFdEaDbeeF"
                    ]
                },
                "to": [
                    {
                        "name": "Bob",
                        "wallets": [
                            "bBbBBBBbbBBBbbbBbbBbbbbBBbBbbbbBbBbbBBbB",
                            "B0BdaBea57B0BDABeA57b0bdABEA57b0BDabEa57",
                            "B0B0b0b0b0b0B000000000000000000000000000"
                        ]
                    }
                ],
                "contents": "Hello, Bob!"
            }
        }
      ''';
      final hash = TWEthereumAbi.encodeTyped(message);

      expectHex(hash,
          'a85c2e2b118698e88db68a8105b794a8cc7cec074e89ef991cb4f5f533819cc2');
    });
  });
}
