import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Polymesh.pb.dart' as Polymesh;
import 'package:wallet_core_bindings/proto/Polkadot.pb.dart' as Polkadot;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

const polymeshPrefix = 12;

Uint8List helper_encodeTransaction(TWCoinType coin, Polymesh.SigningInput input,
    Uint8List pubKey, Uint8List signature) {
  return Uint8List.fromList(input.compileWithSignatures(
    signatures: [signature],
    publicKeys: [pubKey],
  ).encoded);
}

void main() {
  initTest();
  group('TWAnySignerPolymesh', () {
    const coin = TWCoinType.Polymesh;

    test('PolymeshEncodeAndSign', () {
      // tx on mainnet
      // https://polymesh.subscan.io/extrinsic/0x9a4283cc38f7e769c53ad2d1c5cf292fc85a740ec1c1aa80c180847e51928650

      /// Step 1: Prepare transaction input (protobuf)
      final input = Polymesh.SigningInput(
        network: 12,
        blockHash: parse_hex(
            "898bba6413c38f79a284aec8749f297f6c8734c501f67517b5a6aadc338d1102"),
        genesisHash: parse_hex(
            "6fbd74e5e1d0a61d52ccfe9d4adaed16dd3a7caa37c6bc4d0c2fa12e8b2f4063"),
        nonce: 1.toInt64(),
        specVersion: 3010,
        transactionVersion: 2,
        era: Polkadot.Era(
          blockNumber: 4298130.toInt64(),
          period: 64.toInt64(),
        ),
        runtimeCall: Polymesh.RuntimeCall(
          balanceCall: Polymesh.Balance(
            transfer: Polymesh.Balance_Transfer(
              toAddress: '2FSoQykVV3uWe5ChZuazMDHBoaZmCPPuoYx5KHL5VqXooDQW',
              value: intToBytes(1000000),
              memo: 'MEMO PADDED WITH SPACES',
              callIndices: Polkadot.CallIndices(
                custom: Polkadot.CustomCallIndices(
                  moduleIndex: 0x05,
                  methodIndex: 0x01,
                ),
              ),
            ),
          ),
        ),
      );

      /// Step 2: Obtain preimage hash
      final preSigningOutput = input.preImageHashes();
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = preSigningOutput.data;
      expectHex(
        preImage,
        '050100849e2f6b165d4b28b39ef3d98f86c0520d82bc349536324365c10af08f323f8302093d00014d454d4f2050414444454420574954482053504143455300000000000000000025010400c20b0000020000006fbd74e5e1d0a61d52ccfe9d4adaed16dd3a7caa37c6bc4d0c2fa12e8b2f4063898bba6413c38f79a284aec8749f297f6c8734c501f67517b5a6aadc338d1102',
      );

      final pubKey = parse_hex(
          "4322cf71da08f9d56181a707af7c0c437dfcb93e6caac9825a5aba57548142ee");
      final signature = parse_hex(
          "0791ee378775eaff34ef7e529ab742f0d81d281fdf20ace0aa765ca484f5909c4eea0a59c8dbbc534c832704924b424ba3230c38acd0ad5360cef023ca2a420f");

      /// Step 3: Compile transaction info
      final output = input.compileWithSignatures(
        signatures: [signature],
        publicKeys: [pubKey],
      );

      const ExpectedTx =
          "bd0284004322cf71da08f9d56181a707af7c0c437dfcb93e6caac9825a5aba57548142ee000791ee378775eaff34ef7e529ab742f0d81d281fdf20ace0aa765ca484f5909c4eea0a59c8dbbc534c832704924b424ba3230c38acd0ad5360cef023ca2a420f25010400050100849e2f6b165d4b28b39ef3d98f86c0520d82bc349536324365c10af08f323f8302093d00014d454d4f20504144444544205749544820535041434553000000000000000000";
      {
        expectHex(output.encoded, ExpectedTx);
      }
    });

    test('encodeTransaction_Add_authorization', () {
      // tx on mainnet
      // https://polymesh.subscan.io/extrinsic/0x7d9b9109027b36b72d37ba0648cb70e5254524d3d6752cc6b41601f4bdfb1af0

      final input = Polymesh.SigningInput(
        network: 12,
        blockHash: parse_hex(
            "ce0c2109db498e45abf8fd447580dcfa7b7a07ffc2bfb1a0fbdd1af3e8816d2b"),
        genesisHash: parse_hex(
            "6fbd74e5e1d0a61d52ccfe9d4adaed16dd3a7caa37c6bc4d0c2fa12e8b2f4063"),
        nonce: 5.toInt64(),
        specVersion: 3010,
        transactionVersion: 2,
        era: Polkadot.Era(
          blockNumber: 4395451.toInt64(),
          period: 64.toInt64(),
        ),
        runtimeCall: Polymesh.RuntimeCall(
          identityCall: Polymesh.Identity(
            addAuthorization: Polymesh.Identity_AddAuthorization(
              target: '2HEVN4PHYKj7B1krQ9bctAQXZxHQQkANVNCcfbdYk2gZ4cBR',
              authorization: Polymesh.Identity_AddAuthorization_Authorization(
                joinIdentity: Polymesh.SecondaryKeyPermissions(
                  asset: Polymesh.SecondaryKeyPermissions_AssetPermissions(
                    kind:
                        Polymesh.SecondaryKeyPermissions_RestrictionKind.These,
                  ),
                  extrinsic:
                      Polymesh.SecondaryKeyPermissions_ExtrinsicPermissions(
                    kind:
                        Polymesh.SecondaryKeyPermissions_RestrictionKind.These,
                  ),
                  portfolio:
                      Polymesh.SecondaryKeyPermissions_PortfolioPermissions(
                    kind:
                        Polymesh.SecondaryKeyPermissions_RestrictionKind.These,
                  ),
                ),
              ),
              callIndices: Polkadot.CallIndices(
                custom: Polkadot.CustomCallIndices(
                  moduleIndex: 0x07,
                  methodIndex: 0x0d,
                ),
              ),
            ),
          ),
        ),
      );

      final pubKey = parse_hex(
          "4322cf71da08f9d56181a707af7c0c437dfcb93e6caac9825a5aba57548142ee");
      final signature = parse_hex(
          "81e6561e4391862b5da961d7033baced1c4b25f0e27f938b02321af1118e0b859e1c2bd5607576a258f2c2befbc5f397ea4adb62938f30eb73c8060ab0eabf01");
      final encoded = helper_encodeTransaction(coin, input, pubKey, signature);
      expectHex(
        encoded,
        '490284004322cf71da08f9d56181a707af7c0c437dfcb93e6caac9825a5aba57548142ee0081e6561e4391862b5da961d7033baced1c4b25f0e27f938b02321af1118e0b859e1c2bd5607576a258f2c2befbc5f397ea4adb62938f30eb73c8060ab0eabf01b5031400070d01d3b2f1c41b9b4522eb3e23329b81aca6cc0231167ecfa3580c5a71ff6d0610540501000100010000',
      );
    });

    test('encodeTransaction_JoinIdentityAsKey', () {
      // tx on mainnet
      // https://polymesh.subscan.io/extrinsic/0x9d7297d8b38af5668861996cb115f321ed681989e87024fda64eae748c2dc542

      final input = Polymesh.SigningInput(
        network: 12,
        blockHash: parse_hex(
            "45c80153c47f5d16acc7a66d473870e8d4574437a7d8c813f47da74cae3812c2"),
        genesisHash: parse_hex(
            "6fbd74e5e1d0a61d52ccfe9d4adaed16dd3a7caa37c6bc4d0c2fa12e8b2f4063"),
        nonce: 0.toInt64(),
        specVersion: 3010,
        transactionVersion: 2,
        era: Polkadot.Era(
          blockNumber: 4395527.toInt64(),
          period: 64.toInt64(),
        ),
        runtimeCall: Polymesh.RuntimeCall(
          identityCall: Polymesh.Identity(
            joinIdentityAsKey: Polymesh.Identity_JoinIdentityAsKey(
              authId: 21435.toInt64(),
              callIndices: Polkadot.CallIndices(
                custom: Polkadot.CustomCallIndices(
                  moduleIndex: 0x07,
                  methodIndex: 0x05,
                ),
              ),
            ),
          ),
        ),
      );

      final pubKey = parse_hex(
          "d3b2f1c41b9b4522eb3e23329b81aca6cc0231167ecfa3580c5a71ff6d061054");
      final signature = parse_hex(
          "7f5adbb2749e2f0ace29b409c41dd717681495b1f22dc5358311646a9fb8af8a173fc47f1b19748fb56831c2128773e2976986685adee83c741ab49934d80006");
      final encoded = helper_encodeTransaction(coin, input, pubKey, signature);
      expectHex(
        encoded,
        'c5018400d3b2f1c41b9b4522eb3e23329b81aca6cc0231167ecfa3580c5a71ff6d061054007f5adbb2749e2f0ace29b409c41dd717681495b1f22dc5358311646a9fb8af8a173fc47f1b19748fb56831c2128773e2976986685adee83c741ab49934d80006750000000705bb53000000000000',
      );
    });
  });
}
