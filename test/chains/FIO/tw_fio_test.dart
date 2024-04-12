import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/FIO.pb.dart' as FIO;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

final gChainId = parse_hex(
    "4e46572250454b796d7296eec9e8896327ea82dd40f2cd74cf1b1d8ba90bcd77");
// 5KEDWtAUJcFX6Vz38WXsAQAv2geNqT7UaZC8gYu9kTuryr3qkri FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf
final privKeyBA = TWPrivateKey.createWithHexString(
    'ba0828d5734b65e3bcc2c51c93dfc26dd71bd666cc0273adee77d73d9a322035');
final pubKey6M =
    privKeyBA.getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
final addr6M =
    TWAnyAddress.createWithPublicKey(pubKey6M, TWCoinType.TWCoinTypeFIO);

void main() {
  group('TWFIO', () {
    const coin = TWCoinType.TWCoinTypeFIO;

    test('Address', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'ba0828d5734b65e3bcc2c51c93dfc26dd71bd666cc0273adee77d73d9a322035');
      expect(privateKey.pointer != nullptr, true);
      final publicKey = privateKey.getPublicKeySecp256k1(false);
      expect(publicKey.pointer != nullptr, true);
      expect(publicKey.data.length, 65);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressString = address.description;
      expect(addressString,
          'FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf');

      final address2 = TWAnyAddress(
          'FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf', coin);
      expect(address2.pointer != nullptr, true);
      final address2String = address2.description;
      expect(address2String,
          'FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf');

      expect(address, address2);
    });

    test('RegisterFioAddress', () {
      final input = FIO.SigningInput(
        expiry: 1579784511,
        chainParams: FIO.ChainParams(
          chainId: gChainId,
          headBlockNumber: $fixnum.Int64(39881),
          refBlockPrefix: $fixnum.Int64(4279583376),
        ),
        privateKey: privKeyBA.data,
        tpid: 'rewards@wallet',
        action: FIO.Action(
          registerFioAddressMessage: FIO.Action_RegisterFioAddress(
            fioAddress: 'adam@fiotestnet',
            ownerFioPublicKey: addr6M.description,
            fee: $fixnum.Int64(5000000000),
          ),
        ),
      );

      final output = FIO.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      expect(output.json,
          '{"compression":"none","packed_context_free_data":"","packed_trx":"3f99295ec99b904215ff0000000001003056372503a85b0000c6eaa66498ba01102b2f46fca756b200000000a8ed3232650f6164616d4066696f746573746e65743546494f366d31664d645470526b52426e6564765973685843784c4669433573755255384b44667838787874587032686e7478706e6600f2052a01000000102b2f46fca756b20e726577617264734077616c6c657400","signatures":["SIG_K1_K19ugLriG3ApYgjJCRDsy21p9xgsjbDtqBuZrmAEix9XYzndR1kNbJ6fXCngMJMAhxUHfwHAsPnh58otXiJZkazaM1EkS5"]}');
    });

    test('AddPubAddress', () {
      final input = FIO.SigningInput(
        expiry: 1579729429,
        chainParams: FIO.ChainParams(
          chainId: gChainId,
          headBlockNumber: $fixnum.Int64(11565),
          refBlockPrefix: $fixnum.Int64(4281229859),
        ),
        privateKey: privKeyBA.data,
        tpid: 'rewards@wallet',
        action: FIO.Action(
          addPubAddressMessage: FIO.Action_AddPubAddress(
            fioAddress: 'adam@fiotestnet',
            publicAddresses: [
              FIO.PublicAddress(
                coinSymbol: 'BTC',
                address: 'bc1qvy4074rggkdr2pzw5vpnn62eg0smzlxwp70d7v',
              ),
              FIO.PublicAddress(
                coinSymbol: 'ETH',
                address: '0xce5cB6c92Da37bbBa91Bd40D4C9D4D724A3a8F51',
              ),
              FIO.PublicAddress(
                coinSymbol: 'BNB',
                address: 'bnb1ts3dg54apwlvr9hupv2n0j6e46q54znnusjk9s',
              ),
            ],
            fee: $fixnum.Int64(0),
          ),
        ),
      );

      final output = FIO.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      expect(output.json,
          '{"compression":"none","packed_context_free_data":"","packed_trx":"15c2285e2d2d23622eff0000000001003056372503a85b0000c6eaa664523201102b2f46fca756b200000000a8ed3232c9010f6164616d4066696f746573746e65740303425443034254432a626331717679343037347267676b647232707a773576706e6e3632656730736d7a6c787770373064377603455448034554482a30786365356342366339324461333762624261393142643430443443394434443732344133613846353103424e4203424e422a626e6231747333646735346170776c76723968757076326e306a366534367135347a6e6e75736a6b39730000000000000000102b2f46fca756b20e726577617264734077616c6c657400","signatures":["SIG_K1_K3zimaMKU8cBhVRPw46KM2u7uQWaAKXrnoeYZ7MEbp6sVJcDQmQR2RtdavpUPwkAnYUkd8NqLun8H48tcxZBcTUgkiPGVJ"]}');
    });

    test('Transfer', () {
      final input = FIO.SigningInput(
        expiry: 1579790000,
        chainParams: FIO.ChainParams(
          chainId: gChainId,
          headBlockNumber: $fixnum.Int64(50000),
          refBlockPrefix: $fixnum.Int64(4000123456),
        ),
        privateKey: privKeyBA.data,
        tpid: 'rewards@wallet',
        action: FIO.Action(
          transferMessage: FIO.Action_Transfer(
            payeePublicKey:
                'FIO7uMZoeei5HtXAD24C4yCkpWWbf24bjYtrRNjWdmGCXHZccwuiE',
            amount: $fixnum.Int64(1000000000),
            fee: $fixnum.Int64(250000000),
          ),
        ),
      );

      final output = FIO.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      expect(output.json,
          '{"compression":"none","packed_context_free_data":"","packed_trx":"b0ae295e50c3400a6dee00000000010000980ad20ca85be0e1d195ba85e7cd01102b2f46fca756b200000000a8ed32325d3546494f37754d5a6f6565693548745841443234433479436b70575762663234626a597472524e6a57646d474358485a63637775694500ca9a3b0000000080b2e60e00000000102b2f46fca756b20e726577617264734077616c6c657400","signatures":["SIG_K1_K9VRCnvaTYN7vgcoVKVXgyJTdKUGV8hLXgFLoEbvqAcFxy7DXQ1rSnAfEuabi4ATkgmvnpaSBdVFN7TBtM1wrbZYqeJQw9"]}');
    });

    test('RenewFioAddress', () {
      final input = FIO.SigningInput(
        expiry: 1579785000,
        chainParams: FIO.ChainParams(
          chainId: gChainId,
          headBlockNumber: $fixnum.Int64(39881),
          refBlockPrefix: $fixnum.Int64(4279583376),
        ),
        privateKey: privKeyBA.data,
        tpid: 'rewards@wallet',
        action: FIO.Action(
          renewFioAddressMessage: FIO.Action_RenewFioAddress(
            fioAddress: 'nick@fiotestnet',
            ownerFioPublicKey: addr6M.description,
            fee: $fixnum.Int64(3000000000),
          ),
        ),
      );

      final output = FIO.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      expect(output.json,
          '{"compression":"none","packed_context_free_data":"","packed_trx":"289b295ec99b904215ff0000000001003056372503a85b80b1ba2919aea6ba01102b2f46fca756b200000000a8ed32322f0f6e69636b4066696f746573746e6574005ed0b200000000102b2f46fca756b20e726577617264734077616c6c657400","signatures":["SIG_K1_Jxz7oCJ7Z4ECsxqb2utqBcyP3zPQCeQCBws9wWQjyptUKoWVk2AyCVEqtdMHJwqtLniio5Z7npMnaZB8E4pa2G75P9uGkb"]}');
    });

    test('NewFundsRequest', () {
      final input = FIO.SigningInput(
        expiry: 1579785000,
        chainParams: FIO.ChainParams(
          chainId: gChainId,
          headBlockNumber: $fixnum.Int64(39881),
          refBlockPrefix: $fixnum.Int64(4279583376),
        ),
        privateKey: privKeyBA.data,
        tpid: 'rewards@wallet',
        action: FIO.Action(
          newFundsRequestMessage: FIO.Action_NewFundsRequest(
            payerFioName: 'mario@fiotestnet',
            payerFioAddress:
                'FIO5kJKNHwctcfUM5XZyiWSqSTM5HTzznJP9F3ZdbhaQAHEVq575o',
            content: FIO.NewFundsContent(
              payeePublicAddress: 'bc1qvy4074rggkdr2pzw5vpnn62eg0smzlxwp70d7v',
              amount: '5',
              coinSymbol: 'BTC',
              memo: 'Memo',
              hash: 'Hash',
              offlineUrl: 'https://trustwallet.com',
            ),
            fee: $fixnum.Int64(3000000000),
          ),
        ),
      );
      input.action.newFundsRequestMessage.payeeFioName = 'alice@fiotestnet';

      final output = FIO.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);
      // Packed transaction varies, as there is no way to control encryption IV parameter from this level.
      // Therefore full equality cannot be checked, tail is cut off.  The first N chars are checked, works in this case.
      expect(output.json.substring(0, 195),
          '{"compression":"none","packed_context_free_data":"","packed_trx":"289b295ec99b904215ff000000000100403ed4aa0ba85b00acba384dbdb89a01102b2f46fca756b200000000a8ed32328802106d6172696f4066696f746573746');
    });
  });
}
