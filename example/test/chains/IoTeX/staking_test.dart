import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/IoTeX.pb.dart' as IoTeX;

import '../../utils.dart';

IoTeX.SigningInput createSigningInput() {
  final keyhex = parse_hex(
      "cfa6ef757dee2e50351620dca002d32b9c090cfda55fb81f37f1d26b273743f1");
  return IoTeX.SigningInput(
    version: 1,
    nonce: $fixnum.Int64(0),
    gasLimit: $fixnum.Int64(1000000),
    gasPrice: '10',
    privateKey: keyhex,
  );
}

void main() {
  initTest();
  group('TWIoTeXStaking', () {
    const coin = TWCoinType.IoTeX;

    test('SignAll', () {
      {
        // sign stakecreate
        final input = createSigningInput();
        input.stakeCreate = IoTeX.Staking_Create(
          candidateName: 'io19d0p3ah4g8ww9d7kcxfq87yxe7fnr8rpth5shj',
          stakedAmount: '100',
          stakedDuration: 10000,
          autoStake: true,
          payload: 'payload'.codeUnits,
        );
        final output = IoTeX.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(
          hex(output.encoded),
          "0a4b080118c0843d22023130c2023e0a29696f313964307033616834673877773964376b63786671"
          "3837797865"
          "37666e7238727074683573686a120331303018904e20012a077061796c6f6164124104755ce6d890"
          "3f6b3793bd"
          "db4ea5d3589d637de2d209ae0ea930815c82db564ee8cc448886f639e8a0c7e94e99a5c1335b583c"
          "0bc76ef30d"
          "d6a1038ed9da8daf331a412e8bac421bab88dcd99c26ac8ffbf27f11ee57a41e7d2537891bfed5ae"
          "d8e2e026d4"
          "6e55d1b856787bc1cd7c1216a6e2534c5b5d1097c3afe8e657aa27cbbb0801",
        );
        // signed action's hash
        expect(hex(output.hash),
            'f1785e47b4200c752bb6518bd18097a41e075438b8c18c9cb00e1ae2f38ce767');
      }

      {
        // sign stakecreate
        final input = createSigningInput();
        input.stakeUnstake = IoTeX.Staking_Reclaim(
          bucketIndex: $fixnum.Int64(10),
          payload: 'payload'.codeUnits,
        );
        final output = IoTeX.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(
          hex(output.encoded),
          "0a18080118c0843d22023130ca020b080a12077061796c6f6164124104755ce6d8903f6b3793bddb4ea5"
          "d3589d637de2d209ae0ea930815c82db564ee8cc448886f639e8a0c7e94e99a5c1335b583c0bc76ef30d"
          "d6a1038ed9da8daf331a4100adee39b48e1d3dbbd65298a57c7889709fc4df39987130da306f6997374a"
          "184b7e7c232a42f21e89b06e6e7ceab81303c6b7483152d08d19ac829b22eb81e601",
        );
        // signed action's hash
        expect(hex(output.hash),
            'bed58b64a6c4e959eca60a86f0b2149ce0e1dd527ac5fd26aef725ebf7c22a7d');
      }

      {
        // sign stakecreate
        final input = createSigningInput();
        input.stakeWithdraw = IoTeX.Staking_Reclaim(
          bucketIndex: $fixnum.Int64(10),
          payload: 'payload'.codeUnits,
        );
        final output = IoTeX.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(
          hex(output.encoded),
          "0a18080118c0843d22023130d2020b080a12077061796c6f6164124104755ce6d8903f6b3793bddb4ea5"
          "d3589d637de2d209ae0ea930815c82db564ee8cc448886f639e8a0c7e94e99a5c1335b583c0bc76ef30d"
          "d6a1038ed9da8daf331a4152644d102186be6640d46b517331f3402e24424b0d85129595421d28503d75"
          "340b2922f5a0d4f667bbd6f576d9816770286b2ce032ba22eaec3952e24da4756b00",
        );
        // signed action's hash
        expect(hex(output.hash),
            '28049348cf34f1aa927caa250e7a1b08778c44efaf73b565b6fa9abe843871b4');
      }

      {
        // sign stakecreate
        final input = createSigningInput();
        input.stakeRestake = IoTeX.Staking_Restake(
          bucketIndex: $fixnum.Int64(10),
          stakedDuration: 1000,
          autoStake: true,
          payload: 'payload'.codeUnits,
        );
        final output = IoTeX.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(
          hex(output.encoded),
          "0a1d080118c0843d22023130e20210080a10e807180122077061796c6f6164124104755ce6d8903f6b37"
          "93bddb4ea5d3589d637de2d209ae0ea930815c82db564ee8cc448886f639e8a0c7e94e99a5c1335b583c"
          "0bc76ef30dd6a1038ed9da8daf331a41e2e763aed5b1fd1a8601de0f0ae34eb05162e34b0389ae3418ee"
          "dbf762f64959634a968313a6516dba3a97b34efba4753bbed3a33d409ecbd45ac75007cd8e9101",
        );
        // signed action's hash
        expect(hex(output.hash),
            '8816e8f784a1fce40b54d1cd172bb6976fd9552f1570c73d1d9fcdc5635424a9');
      }

      {
        // sign stakechangecandidate
        final input = createSigningInput();
        input.stakeChangeCandidate = IoTeX.Staking_ChangeCandidate(
          bucketIndex: $fixnum.Int64(10),
          candidateName: 'io1xpq62aw85uqzrccg9y5hnryv8ld2nkpycc3gza',
          payload: 'payload'.codeUnits,
        );
        final output = IoTeX.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(
          hex(output.encoded),
          "0a43080118c0843d22023130ea0236080a1229696f3178707136326177383575717a7263636739793568"
          "6e727976386c64326e6b7079636333677a611a077061796c6f6164124104755ce6d8903f6b3793bddb4e"
          "a5d3589d637de2d209ae0ea930815c82db564ee8cc448886f639e8a0c7e94e99a5c1335b583c0bc76ef3"
          "0dd6a1038ed9da8daf331a41d519eb3747163b945b862989b7e82a7f8468001e9683757cb88d5ddd95f8"
          "1895047429e858bd48f7d59a88bfec92de231d216293aeba1e4fbe11461d9c9fc99801",
        );
        // signed action's hash
        expect(hex(output.hash),
            '186526b5b9fe74e25beb52c83c41780a69108160bef2ddaf3bffb9f1f1e5e73a');
      }

      {
        // sign staketransfer
        final input = createSigningInput();
        input.stakeTransferOwnership = IoTeX.Staking_TransferOwnership(
          bucketIndex: $fixnum.Int64(10),
          voterAddress: 'io1xpq62aw85uqzrccg9y5hnryv8ld2nkpycc3gza',
          payload: 'payload'.codeUnits,
        );
        final output = IoTeX.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(
          hex(output.encoded),
          "0a43080118c0843d22023130f20236080a1229696f3178707136326177383575717a7263636739793568"
          "6e727976386c64326e6b7079636333677a611a077061796c6f6164124104755ce6d8903f6b3793bddb4e"
          "a5d3589d637de2d209ae0ea930815c82db564ee8cc448886f639e8a0c7e94e99a5c1335b583c0bc76ef3"
          "0dd6a1038ed9da8daf331a41fa26db427ab87a56a129196c1604f2e22c4dd2a1f99b2217bc916260757d"
          "00093d9e6dccdf53e3b0b64e41a69d71c238fbf9281625164694a74dfbeba075d0ce01",
        );
        // signed action's hash
        expect(hex(output.hash),
            '74b2e1d6a09ba5d1298fa422d5850991ae516865077282196295a38f93c78b85');
      }

      {
        // sign candidateupdate
        final input = createSigningInput();
        input.candidateUpdate = IoTeX.Staking_CandidateBasicInfo(
          name: 'test',
          operatorAddress: 'io1cl6rl2ev5dfa988qmgzg2x4hfazmp9vn2g66ng',
          rewardAddress: 'io1juvx5g063eu4ts832nukp4vgcwk2gnc5cu9ayd',
        );
        final output = IoTeX.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(
          hex(output.encoded),
          "0a69080118c0843d2202313082035c0a04746573741229696f31636c36726c3265763564666139383871"
          "6d677a673278346866617a6d7039766e326736366e671a29696f316a7576783567303633657534747338"
          "33326e756b7034766763776b32676e6335637539617964124104755ce6d8903f6b3793bddb4ea5d3589d"
          "637de2d209ae0ea930815c82db564ee8cc448886f639e8a0c7e94e99a5c1335b583c0bc76ef30dd6a103"
          "8ed9da8daf331a4101885c9c6684a4a8f2f5bf11f8326f27be48658f292e8f55ec8a11a604bb0c563a11"
          "ebf12d995ca1c152e00f8e0f0edf288db711aa10dbdfd5b7d73b4a28e1f701",
        );
        // signed action's hash
        expect(hex(output.hash),
            'ca1a28f0e9a58ffc67037cc75066dbdd8e024aa2b2e416e4d6ce16c3d86282e5');
      }

      {
        // sign candidateregister
        final input = createSigningInput();
        input.gasPrice = '1000';
        input.candidateRegister = IoTeX.Staking_CandidateRegister(
          candidate: IoTeX.Staking_CandidateBasicInfo(
            name: 'test',
            operatorAddress: 'io10a298zmzvrt4guq79a9f4x7qedj59y7ery84he',
            rewardAddress: 'io13sj9mzpewn25ymheukte4v39hvjdtrfp00mlyv',
          ),
          stakedAmount: '100',
          stakedDuration: 10000,
          autoStake: false,
          ownerAddress: 'io19d0p3ah4g8ww9d7kcxfq87yxe7fnr8rpth5shj',
          payload: 'payload'.codeUnits,
        );
        final output = IoTeX.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(
          hex(output.encoded),
          "0aaa01080118c0843d220431303030fa029a010a5c0a04746573741229696f3130613239387a6d7a"
          "7672743467"
          "757137396139663478377165646a35397937657279383468651a29696f3133736a396d7a7065776e"
          "3235796d68"
          "65756b74653476333968766a647472667030306d6c7976120331303018904e2a29696f3139643070"
          "3361683467"
          "3877773964376b63786671383779786537666e7238727074683573686a32077061796c6f61641241"
          "04755ce6d8"
          "903f6b3793bddb4ea5d3589d637de2d209ae0ea930815c82db564ee8cc448886f639e8a0c7e94e99"
          "a5c1335b58"
          "3c0bc76ef30dd6a1038ed9da8daf331a417819b5bcb635e3577acc8ca757f2c3d6afa451c2b6ff8a"
          "9179b141ac"
          "68e2c50305679e5d09d288da6f0fb52876a86c74deab6a5247edc6d371de5c2f121e159400",
        );
        // signed action's hash
        expect(hex(output.hash),
            '35f53a536e014b32b85df50483ef04849b80ad60635b3b1979c5ba1096b65237');
      }
    });
  });
}
