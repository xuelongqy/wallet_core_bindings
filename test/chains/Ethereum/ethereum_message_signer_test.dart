import 'dart:io';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

String load_file(String path) {
  return File(path).readAsStringSync();
}

void main() {
  group('EthereumEip712', () {
    test('SignMessageAndVerifyLegacy', () {
      final ethKey = TWPrivateKey.createWithHexString(
          '03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d');
      final msg = '''
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
                        {"name": "wallet", "type": "address"}
                    ]
                },
                "primaryType": "Person",
                "domain": {
                    "name": "Ether Person",
                    "version": "1",
                    "chainId": 0,
                    "verifyingContract": "0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC"
                },
                "message": {
                    "name": "Cow",
                    "wallet": "CD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826"
                }
            }
      ''';
      final signature = TWEthereumMessageSigner.signTypedMessage(ethKey, msg);
      expect(signature,
          '446434e4c34d6b7456e5f07a1b994b88bf85c057234c68d1e10c936b1c85706c4e19147c0ac3a983bc2d56ebfd7146f8b62bcea6114900fe8e7d7351f44bf3761c');
      final pubKey = ethKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      expect(
          TWEthereumMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });

    test('SignMessageAndVerifyEip155', () {
      final ethKey = TWPrivateKey.createWithHexString(
          '03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d');
      final msg = '''
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
                        {"name": "wallet", "type": "address"}
                    ]
                },
                "primaryType": "Person",
                "domain": {
                    "name": "Ether Person",
                    "version": "1",
                    "chainId": 0,
                    "verifyingContract": "0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC"
                },
                "message": {
                    "name": "Cow",
                    "wallet": "CD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826"
                }
            }
      ''';
      final signature =
          TWEthereumMessageSigner.signTypedMessageEip155(ethKey, msg, 0);
      expect(signature,
          '446434e4c34d6b7456e5f07a1b994b88bf85c057234c68d1e10c936b1c85706c4e19147c0ac3a983bc2d56ebfd7146f8b62bcea6114900fe8e7d7351f44bf37624');
      final pubKey = ethKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      expect(
          TWEthereumMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });

    test('SignMessageAndVerifyInvalidEip155', () {
      final ethKey = TWPrivateKey.createWithHexString(
          '03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d');
      final msg = '''
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
                        {"name": "wallet", "type": "address"}
                    ]
                },
                "primaryType": "Person",
                "domain": {
                    "name": "Ether Person",
                    "version": "1",
                    "chainId": 1,
                    "verifyingContract": "0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC"
                },
                "message": {
                    "name": "Cow",
                    "wallet": "CD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826"
                }
            }
      ''';
      final signature =
          TWEthereumMessageSigner.signTypedMessageEip155(ethKey, msg, 0);
      expect(signature, '');
    });
  });

  group('EthereumEip191', () {
    test('SignMessageAndVerifyLegacy', () {
      final ethKey = TWPrivateKey.createWithHexString(
          '03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d');
      final msg = 'Foo';
      final signature = TWEthereumMessageSigner.signMessage(ethKey, msg);
      expect(signature,
          '21a779d499957e7fd39392d49a079679009e60e492d9654a148829be43d2490736ec72bc4a5644047d979c3cf4ebe2c1c514044cf436b063cb89fc6676be71101b');
      final pubKey = ethKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      expect(
          TWEthereumMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });

    test('SignMessageAndVerifyEip155', () {
      final ethKey = TWPrivateKey.createWithHexString(
          '03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d');
      final msg = 'Foo';
      final signature =
          TWEthereumMessageSigner.signMessageEip155(ethKey, msg, 0);
      expect(signature,
          '21a779d499957e7fd39392d49a079679009e60e492d9654a148829be43d2490736ec72bc4a5644047d979c3cf4ebe2c1c514044cf436b063cb89fc6676be711023');
      final pubKey = ethKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      expect(
          TWEthereumMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });

    test('SignMessageAndVerifyImmutableX', () {
      final ethKey = TWPrivateKey.createWithHexString(
          '03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d');
      final msg =
          'Only sign this request if you’ve initiated an action with Immutable X.\n\nFor internal use:\nbd717ba31dca6e0f3f136f7c4197babce5f09a9f25176044c0b3112b1b6017a3';
      final signature =
          TWEthereumMessageSigner.signMessageImmutableX(ethKey, msg);
      final pubKey = ethKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      expect(
          TWEthereumMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });
  });

  group('TWEthereumMessageSigner', () {
    test('SignAndVerifyImmutableX', () {
      final privKeyData =
          "3b0a61f46fdae924007146eacb6db6642de7a5603ad843ec58e10331d89d4b84";
      final ethKey = TWPrivateKey.createWithHexString(privKeyData);
      final msg =
          "Only sign this request if you’ve initiated an action with Immutable X.\n\nFor internal use:\nbd717ba31dca6e0f3f136f7c4197babce5f09a9f25176044c0b3112b1b6017a3";

      final pubKey = ethKey.getPublicKey(TWCoinType.TWCoinTypeEthereum);
      final signature =
          TWEthereumMessageSigner.signMessageImmutableX(ethKey, msg);
      expect(signature,
          '32cd5a58f3419fc5db672e3d57f76199b853eda0856d491b38f557b629b0a0814ace689412bf354a1af81126d2749207dffae8ae8845160f33948a6b787e17ee01');
      expect(
          TWEthereumMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });

    test('SignAndVerifyLegacy', () {
      final privKeyData =
          "03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d";
      final ethKey = TWPrivateKey.createWithHexString(privKeyData);
      final msg = "Foo";

      final pubKey = ethKey.getPublicKey(TWCoinType.TWCoinTypeEthereum);
      final signature = TWEthereumMessageSigner.signMessage(ethKey, msg);
      expect(signature,
          '21a779d499957e7fd39392d49a079679009e60e492d9654a148829be43d2490736ec72bc4a5644047d979c3cf4ebe2c1c514044cf436b063cb89fc6676be71101b');
      expect(
          TWEthereumMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });

    test('SignAndVerifyEip155', () {
      final privKeyData =
          "03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d";
      final ethKey = TWPrivateKey.createWithHexString(privKeyData);
      final msg = "Foo";

      final pubKey = ethKey.getPublicKey(TWCoinType.TWCoinTypeEthereum);
      final signature =
          TWEthereumMessageSigner.signMessageEip155(ethKey, msg, 0);
      expect(signature,
          '21a779d499957e7fd39392d49a079679009e60e492d9654a148829be43d2490736ec72bc4a5644047d979c3cf4ebe2c1c514044cf436b063cb89fc6676be711023');
      expect(
          TWEthereumMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });
  });

  group('TWEthereumEip712', () {
    test('SignMessageAndVerifyLegacy', () {
      final ethKey = TWPrivateKey.createWithHexString(
          '03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d');
      final msg = '''
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
                        {"name": "wallet", "type": "address"}
                    ]
                },
                "primaryType": "Person",
                "domain": {
                    "name": "Ether Person",
                    "version": "1",
                    "chainId": 0,
                    "verifyingContract": "0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC"
                },
                "message": {
                    "name": "Cow",
                    "wallet": "CD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826"
                }
            }
      ''';
      final signature = TWEthereumMessageSigner.signTypedMessage(ethKey, msg);
      expect(signature,
          '446434e4c34d6b7456e5f07a1b994b88bf85c057234c68d1e10c936b1c85706c4e19147c0ac3a983bc2d56ebfd7146f8b62bcea6114900fe8e7d7351f44bf3761c');
      final pubKey = ethKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      expect(
          TWEthereumMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });

    test('SignMessageAndVerifyEip155', () {
      final ethKey = TWPrivateKey.createWithHexString(
          '03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d');
      final msg = '''
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
                        {"name": "wallet", "type": "address"}
                    ]
                },
                "primaryType": "Person",
                "domain": {
                    "name": "Ether Person",
                    "version": "1",
                    "chainId": 0,
                    "verifyingContract": "0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC"
                },
                "message": {
                    "name": "Cow",
                    "wallet": "CD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826"
                }
            }
      ''';
      final signature =
          TWEthereumMessageSigner.signTypedMessageEip155(ethKey, msg, 0);
      expect(signature,
          '446434e4c34d6b7456e5f07a1b994b88bf85c057234c68d1e10c936b1c85706c4e19147c0ac3a983bc2d56ebfd7146f8b62bcea6114900fe8e7d7351f44bf37624');
      final pubKey = ethKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      expect(
          TWEthereumMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });

    // The test checks if extra types are ordered correctly.
    // The typed message was used to sign a Greenfield transaction:
    // https://greenfieldscan.com/tx/9F895CF2DD64FB1F428CEFCF2A6585A813C3540FC9FE1EF42DB1DA2CB1DF55AB
    test('SignTypedMessageExtraTypesOrder', () {
      final path = TESTS_ROOT + "/chains/Ethereum/Data/eip712_greenfield.json";
      final typeData = load_file(path);

      final ethKey = TWPrivateKey.createWithHexString(
          '9066aa168c379a403becb235c15e7129c133c244e56a757ab07bc369288bcab0');
      final msg = typeData;
      final expected =
          'cb3a4684a991014a387a04a85b59227ebb79567c2025addcb296b4ca856e9f810d3b526f2a0d0fad6ad1b126b3b9516f8b3be020a7cca9c03ce3cf47f4199b6d1b';
      final signature = TWEthereumMessageSigner.signTypedMessage(ethKey, msg);
      expect(signature, expected);
    });

    // Test `TWEthereumMessageSignerSignTypedMessageEip155` where `domain.chainId` is a base10 decimal string.
    // Generated by using https://metamask.github.io/test-dapp/
    test('SignMessageAndVerifyEip155ChainIdStrings', () {
      final ethKey = TWPrivateKey.createWithHexString(
          '9066aa168c379a403becb235c15e7129c133c244e56a757ab07bc369288bcab0');
      // 5600
      final chainId = 0x15e0;

      final msg = '''
                {
                  "domain": {
                    "chainId": "5600",
                    "name": "Ether Mail",
                    "verifyingContract": "0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC",
                    "version": "1"
                  },
                  "message": {
                    "contents": "Hello, Bob!",
                    "from": {
                      "name": "Cow",
                      "wallets": [
                        "0xCD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826",
                        "0xDeaDbeefdEAdbeefdEadbEEFdeadbeEFdEaDbeeF"
                      ]
                    },
                    "to": [
                      {
                        "name": "Bob",
                        "wallets": [
                          "0xbBbBBBBbbBBBbbbBbbBbbbbBBbBbbbbBbBbbBBbB",
                          "0xB0BdaBea57B0BDABeA57b0bdABEA57b0BDabEa57",
                          "0xB0B0b0b0b0b0B000000000000000000000000000"
                        ]
                      }
                    ]
                  },
                  "primaryType": "Mail",
                  "types": {
                    "EIP712Domain": [
                      {
                        "name": "name",
                        "type": "string"
                      },
                      {
                        "name": "version",
                        "type": "string"
                      },
                      {
                        "name": "chainId",
                        "type": "uint256"
                      },
                      {
                        "name": "verifyingContract",
                        "type": "address"
                      }
                    ],
                    "Group": [
                      {
                        "name": "name",
                        "type": "string"
                      },
                      {
                        "name": "members",
                        "type": "Person[]"
                      }
                    ],
                    "Mail": [
                      {
                        "name": "from",
                        "type": "Person"
                      },
                      {
                        "name": "to",
                        "type": "Person[]"
                      },
                      {
                        "name": "contents",
                        "type": "string"
                      }
                    ],
                    "Person": [
                      {
                        "name": "name",
                        "type": "string"
                      },
                      {
                        "name": "wallets",
                        "type": "address[]"
                      }
                    ]
                  }
                }
      ''';
      final signature =
          TWEthereumMessageSigner.signTypedMessageEip155(ethKey, msg, chainId);
      expect(signature,
          '248b45acf2920a9cef00d3b469a875482b5f0e8ce16f6290212d395aaec7f3be0645d6a5cb6fcdfdca9ecefbadd4e77dae656124094ecc984c5fcb9cb4384b05e3');
    });
  });
}
