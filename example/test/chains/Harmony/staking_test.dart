import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Harmony.pb.dart' as Harmony;

import '../../utils.dart';

const coin = TWCoinType.Harmony;

final TEST_ACCOUNT =
    TWAnyAddress('one1a0x3d6xpmr6f8wsyaxd9v36pytvp48zckswvv9', coin);

final PRIVATE_KEY = TWPrivateKey.createWithHexString(
    '4edef2c24995d15b0e25cbd152fb0e2c05d3b79b9c2afd134e6f59f91bf99e48');

void main() {
  initTest();
  group('HarmonyStaking', () {
    test('SignCreateValidator', () {
      final input = Harmony.SigningInput(
        privateKey: PRIVATE_KEY.data,
        chainId: intToBytes(0x2),
        stakingMessage: Harmony.StakingMessage(
          createValidatorMessage: Harmony.DirectiveCreateValidator(
            validatorAddress: TEST_ACCOUNT.description,
            description: Harmony.Description(
              name: 'Alice',
              identity: 'alice',
              website: 'alice.harmony.one',
              securityContact: 'Bob',
              details: "Don't mess with me!!!",
            ),
            commissionRates: Harmony.CommissionRate(
              rate: Harmony.Decimal(
                value: intToBytes(1),
                precision: intToBytes(1),
              ),
              maxRate: Harmony.Decimal(
                value: intToBytes(9),
                precision: intToBytes(1),
              ),
              maxChangeRate: Harmony.Decimal(
                value: intToBytes(5),
                precision: intToBytes(2),
              ),
            ),
            minSelfDelegation: intToBytes(10),
            maxTotalDelegation: intToBytes(3000),
            slotPubKeys: [
              parse_hex(
                "b9486167ab9087ab818dc4ce026edb5bf216863364c32e42df"
                "2af03c5ced1ad181e7d12f0e6dd5307a73b62247608611",
              ),
            ],
            slotKeySigs: [
              parse_hex(
                "4252b0f1210efb0d5061e8a706a7ea9d62292a7947a975472f"
                "b77e1af7278a1c3c2e6eeba73c0581ece398613829940df129"
                "f3071c9a24b4b448bb1e880dc5872a58cb07eed94294c4e01a"
                "5c864771cafef7b96be541cb3c521a98f01838dd94",
              ),
            ],
            amount: intToBytes(100),
          ),
          nonce: intToBytes(0x02),
          gasPrice: intToBytes(0x0),
          gasLimit: intToBytes(0x64),
        ),
      );

      final protoOutput = Harmony.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      const expectEncoded =
          "f9015280f9010894ebcd16e8c1d8f493ba04e99a56474122d81a9c58f83885416c69636585616c696365916"
          "16c6963652e6861726d6f6e792e6f6e6583426f6295446f6e2774206d6573732077697468206d65212121dd"
          "c988016345785d8a0000c9880c7d713b49da0000c887b1a2bc2ec500000a820bb8f1b0b9486167ab9087ab8"
          "18dc4ce026edb5bf216863364c32e42df2af03c5ced1ad181e7d12f0e6dd5307a73b62247608611f862b860"
          "4252b0f1210efb0d5061e8a706a7ea9d62292a7947a975472fb77e1af7278a1c3c2e6eeba73c0581ece3986"
          "13829940df129f3071c9a24b4b448bb1e880dc5872a58cb07eed94294c4e01a5c864771cafef7b96be541cb"
          "3c521a98f01838dd946402806428a00d8437f81be3481b01542e9baef0445f3758cf084c5e1fba93d087ccc"
          "e084cb1a0404c1a42442c2d39f84582353a1c67012451ff83ef6d3622f684041df9bf0072";

      const v = "28";
      const r =
          "0d8437f81be3481b01542e9baef0445f3758cf084c5e1fba93d087ccce084cb1";
      const s =
          "404c1a42442c2d39f84582353a1c67012451ff83ef6d3622f684041df9bf0072";

      expect(hex(protoOutput.encoded), expectEncoded);
      expect(hex(protoOutput.v), v);
      expect(hex(protoOutput.r), r);
      expect(hex(protoOutput.s), s);
    });

    test('SignEditValidator', () {
      final input = Harmony.SigningInput(
        privateKey: PRIVATE_KEY.data,
        chainId: intToBytes(0x2),
        stakingMessage: Harmony.StakingMessage(
          editValidatorMessage: Harmony.DirectiveEditValidator(
            validatorAddress: TEST_ACCOUNT.description,
            description: Harmony.Description(
              name: 'Alice',
              identity: 'alice',
              website: 'alice.harmony.one',
              securityContact: 'Bob',
              details: "Don't mess with me!!!",
            ),
            commissionRate: Harmony.Decimal(
              value: intToBytes(1),
              precision: intToBytes(1),
            ),
            minSelfDelegation: intToBytes(10),
            maxTotalDelegation: intToBytes(3000),
            slotKeyToRemove: parse_hex(
              "b9486167ab9087ab818dc4ce026edb5bf216863364c32e42df"
              "2af03c5ced1ad181e7d12f0e6dd5307a73b62247608611",
            ),
            slotKeyToAdd: parse_hex(
              "b9486167ab9087ab818dc4ce026edb5bf216863364c32e42df"
              "2af03c5ced1ad181e7d12f0e6dd5307a73b62247608611",
            ),
            slotKeyToAddSig: parse_hex(
              "4252b0f1210efb0d5061e8a706a7ea9d62292a7947a975472f"
              "b77e1af7278a1c3c2e6eeba73c0581ece398613829940df129"
              "f3071c9a24b4b448bb1e880dc5872a58cb07eed94294c4e01a"
              "5c864771cafef7b96be541cb3c521a98f01838dd94",
            ),
            active: intToBytes(1),
          ),
          nonce: intToBytes(0x02),
          gasPrice: intToBytes(0x0),
          gasLimit: intToBytes(0x64),
        ),
      );

      final protoOutput = Harmony.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      const expectEncoded =
          "f9016c01f9012294ebcd16e8c1d8f493ba04e99a56474122d81a9c58f83885416c69636585616c69636591616c6963652e6861726d6f6e792e6f6e6583426f6295446f6e2774206d6573732077697468206d65212121c988016345785d8a00000a820bb8b0b9486167ab9087ab818dc4ce026edb5bf216863364c32e42df2af03c5ced1ad181e7d12f0e6dd5307a73b62247608611b0b9486167ab9087ab818dc4ce026edb5bf216863364c32e42df2af03c5ced1ad181e7d12f0e6dd5307a73b62247608611b8604252b0f1210efb0d5061e8a706a7ea9d62292a7947a975472fb77e1af7278a1c3c2e6eeba73c0581ece398613829940df129f3071c9a24b4b448bb1e880dc5872a58cb07eed94294c4e01a5c864771cafef7b96be541cb3c521a98f01838dd940102806427a089d6f87855619c31e933d5f00638ca58737dfffdfdf8b66a048a2e45f103e05da04aafc5c51a95412760c089371b411a5ab8f235b456291a9754d544b162df4eef";

      const v = "27";
      const r =
          "89d6f87855619c31e933d5f00638ca58737dfffdfdf8b66a048a2e45f103e05d";
      const s =
          "4aafc5c51a95412760c089371b411a5ab8f235b456291a9754d544b162df4eef";

      expect(hex(protoOutput.encoded), expectEncoded);
      expect(hex(protoOutput.v), v);
      expect(hex(protoOutput.r), r);
      expect(hex(protoOutput.s), s);
    });

    test('SignDelegate', () {
      final input = Harmony.SigningInput(
        privateKey: PRIVATE_KEY.data,
        chainId: intToBytes(0x2),
        stakingMessage: Harmony.StakingMessage(
          delegateMessage: Harmony.DirectiveDelegate(
            delegatorAddress: TEST_ACCOUNT.description,
            validatorAddress: TEST_ACCOUNT.description,
            amount: intToBytes(0xa),
          ),
          nonce: intToBytes(0x02),
          gasPrice: intToBytes(0x0),
          gasLimit: intToBytes(0x64),
        ),
      );

      final protoOutput = Harmony.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      const expectEncoded =
          "f87302eb94ebcd16e8c1d8f493ba04e99a56474122d81a9c5894ebcd16e8c1d8f493ba04e99a56474122d81a"
          "9c580a02806428a0ada9a8fb49eb3cd74f0f861e16bc1f1d56a0c6e3c25b0391f9e07a7963317e80a05c28dbc4"
          "1763dc2391263e1aae30f842f90734d7ec68cee2352af0d4b0662b54";

      const v = "28";
      const r =
          "ada9a8fb49eb3cd74f0f861e16bc1f1d56a0c6e3c25b0391f9e07a7963317e80";
      const s =
          "5c28dbc41763dc2391263e1aae30f842f90734d7ec68cee2352af0d4b0662b54";

      expect(hex(protoOutput.encoded), expectEncoded);
      expect(hex(protoOutput.v), v);
      expect(hex(protoOutput.r), r);
      expect(hex(protoOutput.s), s);
    });

    test('SignUndelegate', () {
      final input = Harmony.SigningInput(
        privateKey: PRIVATE_KEY.data,
        chainId: intToBytes(0x2),
        stakingMessage: Harmony.StakingMessage(
          undelegateMessage: Harmony.DirectiveUndelegate(
            delegatorAddress: TEST_ACCOUNT.description,
            validatorAddress: TEST_ACCOUNT.description,
            amount: intToBytes(0xa),
          ),
          nonce: intToBytes(0x02),
          gasPrice: intToBytes(0x0),
          gasLimit: intToBytes(0x64),
        ),
      );

      final protoOutput = Harmony.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      const expectEncoded =
          "f87303eb94ebcd16e8c1d8f493ba04e99a56474122d81a9c5894ebcd16e8c1d8f493ba04e99a56474122d81a9c"
          "580a02806428a05bf8c653567defe2c3728732bc9d67dd099a977df91c740a883fd89e03abb6e2a05202c4b516"
          "52d5144c6a30d14d1a7a316b5a4a6b49be985b4bc6980e49f7acb7";

      const v = "28";
      const r =
          "5bf8c653567defe2c3728732bc9d67dd099a977df91c740a883fd89e03abb6e2";
      const s =
          "5202c4b51652d5144c6a30d14d1a7a316b5a4a6b49be985b4bc6980e49f7acb7";

      expect(hex(protoOutput.encoded), expectEncoded);
      expect(hex(protoOutput.v), v);
      expect(hex(protoOutput.r), r);
      expect(hex(protoOutput.s), s);
    });

    test('SignCollectRewards', () {
      final input = Harmony.SigningInput(
        privateKey: PRIVATE_KEY.data,
        chainId: intToBytes(0x2),
        stakingMessage: Harmony.StakingMessage(
          collectRewards: Harmony.DirectiveCollectRewards(
            delegatorAddress: TEST_ACCOUNT.description,
          ),
          nonce: intToBytes(0x02),
          gasPrice: intToBytes(0x0),
          gasLimit: intToBytes(0x64),
        ),
      );

      final protoOutput = Harmony.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      const expectEncoded =
          "f85d04d594ebcd16e8c1d8f493ba04e99a56474122d81a9c5802806428a04c15c72f425"
          "77001083a9c7ff9d9724077aec704a524e53dc7c9afe97ca4e625a055c13ea17c3efd1cd9"
          "1f2988c7e7673950bac5a08c174f2d0af27a82039f1e3d";

      const v = "28";
      const r =
          "4c15c72f42577001083a9c7ff9d9724077aec704a524e53dc7c9afe97ca4e625";
      const s =
          "55c13ea17c3efd1cd91f2988c7e7673950bac5a08c174f2d0af27a82039f1e3d";

      expect(hex(protoOutput.encoded), expectEncoded);
      expect(hex(protoOutput.v), v);
      expect(hex(protoOutput.r), r);
      expect(hex(protoOutput.s), s);
    });
  });
}
