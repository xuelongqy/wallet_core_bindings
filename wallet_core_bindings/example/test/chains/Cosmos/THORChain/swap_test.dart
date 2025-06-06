import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:wallet_core_bindings/proto/Binance.pb.dart' as Binance;
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Ethereum.pb.dart' as Ethereum;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/THORChainSwap.pb.dart'
    as THORChainSwap;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

// Addresses for wallet 'isolate dismiss fury ... note'
const Address1Btc = "bc1qpjult34k9spjfym8hss2jrwjgf0xjf40ze0pp8";
const Address1Eth = "0xb9f5771c27664bf2282d98e09d7f50cec7cb01a7";
const Address1Bnb = "bnb1us47wdhfx08ch97zdueh3x3u5murfrx30jecrx";
const Address1Thor = "thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r";
final TestKey1Btc = parse_hex(
    "13fcaabaf9e71ffaf915e242ec58a743d55f102cf836968e5bd4881135e0c52c");
final TestKey1Eth = parse_hex(
    "4f96ed80e9a7555a6f74b3d658afdd9c756b0a40d4ca30c42c2039eb449bb904");
final TestKey1Bnb = parse_hex(
    "bcf8b072560dda05122c99390def2c385ec400e1a93df0657a85cf6b57a715da");
const VaultBtc = "bc1q6m9u2qsu8mh8y7v8rr2ywavtj8g5arzlyhcej7";
const VaultEth = "0x1091c4De6a3cF09CdA00AbDAeD42c7c3B69C83EC";
const VaultBnb = "bnb1n9esxuw8ca7ts8l6w66kdh800s09msvul6vlse";
const RouterEth = "0x42A5Ed456650a09Dc10EBc6361A7480fDd61f27B";

Uint8List SwapTest_ethAddressStringToData(String asString) {
  if (asString.isEmpty) {
    return Uint8List(0);
  }
  final address = TWAnyAddress(asString, TWCoinType.Ethereum);
  return address.data;
}

void main() {
  initTest();
  group('THORChainSwap', () {
    test('OverflowFixEth', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.ETH,
          symbol: 'ETH',
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BTC,
          symbol: 'BTC',
        ),
        fromAddress: Address1Eth,
        toAddress: Address1Btc,
        vaultAddress: VaultEth,
        fromAmount: '1234000000000000000000',
        toAmountLimit: '5285656144',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
    });

    test('SwapBtcEth', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BTC,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.ETH,
          symbol: 'ETH',
        ),
        fromAddress: Address1Btc,
        toAddress: Address1Eth,
        vaultAddress: VaultBtc,
        fromAmount: '1000000',
        toAmountLimit: '140000000000000000',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.bitcoin.writeToBuffer(),
          '080110c0843d1801222a62633171366d397532717375386d68387937763872723279776176746a38673561727a6c796863656a372a2a62633171706a756c7433346b3973706a66796d38687373326a72776a676630786a6634307a65307070386a473d3a4554482e4554483a3078623966353737316332373636346266323238326439386530396437663530636563376362303161373a313430303030303030303030303030303030');

      final tx = Bitcoin.SigningInput.fromBuffer(out.bitcoin.writeToBuffer());

      // check fields
      expect(tx.amount.toInt(), 1000000);
      expect(tx.toAddress, VaultBtc);
      expect(tx.changeAddress, Address1Btc);
      expect(String.fromCharCodes(tx.outputOpReturn),
          '=:ETH.ETH:0xb9f5771c27664bf2282d98e09d7f50cec7cb01a7:140000000000000000');
      expect(tx.coinType, 0);
      expect(tx.privateKey.length, 0);
      expect(tx.hasPlan(), false);

      // set few fields before signing
      tx.byteFee = $fixnum.Int64(20);
      expect(
        TWSegwitAddress.createWithPublicKey(
                TWHRP.forString('bc'),
                TWPrivateKey.createWithData(TestKey1Btc)
                    .getPublicKeyByType(TWPublicKeyType.SECP256k1))
            .description,
        Address1Btc,
      );
      tx.privateKey.add(TestKey1Btc);
      tx.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
              '1234000000000000000000000000000000000000000000000000000000005678'),
          index: 0,
          sequence: UINT32_MAX,
        ),
        script: TWBitcoinScript.lockScriptForAddress(
                Address1Btc, TWCoinType.Bitcoin)
            .data,
        amount: $fixnum.Int64(50000000),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Bitcoin));
      expect(output.error, Common.SigningError.OK);
      expectHex(
        output.encoded, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "1234000000000000000000000000000000000000000000000000000000005678"
        "00000000"
        "00"
        ""
        "ffffffff"
        "03" // outputs
        "40420f0000000000"
        "16"
        "0014d6cbc5021c3eee72798718d447758b91d14e8c5f"
        "d49ceb0200000000"
        "16"
        "00140cb9f5c6b62c03249367bc20a90dd2425e6926af"
        "0000000000000000"
        "49"
        "6a473d3a4554482e4554483a3078623966353737316332373636346266323238326439386530396437663530636563376362303161373a313430303030303030303030303030303030"
        // witness
        "02"
        "48"
        "3045022100a67f84cbde5affbb46ffff2b33c1453ff2de70ef990fc974175d9a609e5a87ed0220589c57d958208f866c9477c7d6c9075dea4c58622debb02eab85032b8b6d373001"
        "21"
        "021e582a887bd94d648a9267143eb600449a8d59a0db0653740b1378067a6d0cee"
        "00000000",
      );
    });

    test('SwapDogeBusd', () {
      const vaultDoge = "DExct9oTfqr7pfnbP2hkCHP1Z2eUDgqXya";
      const fromAddressDoge = "DKftkYCtCyYxQy2TRAuAzQXoyKDdYsEBnw";
      const toAddressBnb = "bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2";
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.DOGE,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
          symbol: 'BNB',
          tokenId: 'BUSD-BD1',
        ),
        fromAddress: fromAddressDoge,
        toAddress: toAddressBnb,
        vaultAddress: vaultDoge,
        fromAmount: '10000000000',
        toAmountLimit: '789627468',
        affiliateFeeAddress: 't',
        affiliateFeeRateBp: '0',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.bitcoin.writeToBuffer(),
          '08011080c8afa025180122224445786374396f546671723770666e625032686b434850315a3265554467715879612a22444b66746b5943744379597851793254524175417a51586f794b4464597345426e7750036a473d3a424e422e425553442d4244313a626e623173346b616c6c786e67707973707a6d366e72657a6b6d6c3972677977366b78707734666872323a3738393632373436383a743a30');

      final tx = Bitcoin.SigningInput.fromBuffer(out.bitcoin.writeToBuffer());

      // check fields
      expect(tx.amount.toInt(), 10000000000);
      expect(tx.toAddress, vaultDoge);
      expect(tx.changeAddress, fromAddressDoge);
      expect(String.fromCharCodes(tx.outputOpReturn),
          '=:BNB.BUSD-BD1:bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2:789627468:t:0');
      expect(tx.coinType, TWCoinType.Dogecoin.value);
      expect(tx.privateKey.length, 0);
      expect(tx.hasPlan(), false);

      final dogeKey = parse_hex(
          "3785864c91ed408ebaeae473962a471eb4d68ce998c2957e8e5f6be7a525f2d7");
      tx.privateKey.add(dogeKey);
      tx.byteFee = $fixnum.Int64(1000);
      tx.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
                  '9989c36afdd1755a679226875425b368816031186c0f1b4a363ab2ef6d0a2fe8')
              .reversed
              .toList(),
          index: 1,
          sequence: UINT32_MAX - 3,
        ),
        script: TWBitcoinScript.lockScriptForAddress(
                fromAddressDoge, TWCoinType.Dogecoin)
            .data,
        amount: $fixnum.Int64(16845776096),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Dogecoin));
      expect(output.error, Common.SigningError.OK);
      expectHex(output.encoded,
          '0100000001e82f0a6defb23a364a1b0f6c1831608168b32554872692675a75d1fd6ac38999010000006b4830450221008660de3d3123a9e6831517265fb84c4fb2bfc4b98366dbfb4b63bc78a5812cce02201a0673af15edab604d9cd89f0e2842ccdd973e107ff9cd08dcf45d8c0b27c5dd0121039535d01e184b4a6d624e7ab007612e2558697fbed29274e6474f17e70d31ce5afcffffff0300e40b54020000001976a9146bb602e5e8eca75c7f6f25f766254658581db71688ac40490698010000001976a9149f64d0c07876a1dbce40cdce328bc7ecd8182b2288ac0000000000000000496a473d3a424e422e425553442d4244313a626e623173346b616c6c786e67707973707a6d366e72657a6b6d6c3972677977366b78707734666872323a3738393632373436383a743a3000000000');

      // similar real transaction:
      // https://viewblock.io/thorchain/tx/E7588A6A4C6B9DBA8B9AD8B0834655F9D9E5861744B5493E711623E320B981A5
      // https://dogechain.info/tx/e7588a6a4c6b9dba8b9ad8b0834655f9d9e5861744b5493e711623e320b981a5
      // https://binance.mintscan.io/txs/A5943D315BFD501DD5FC212F5A505772A20DDB154A8B5760A9897ABB8114CBDB
    });

    test('SwapLtcBusd', () {
      const vaultLTC = "ltc1qmca5runvg3hygarulu34evdulcdfda7z7zquhn";
      const fromAddressLTC = "ltc1qyu9qvkukx99r6yadxlk3t2x78a7dxe73s3r4x3";
      const toAddressBnb = "bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2";

      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.LTC,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
          symbol: 'BNB',
          tokenId: 'BUSD-BD1',
        ),
        fromAddress: fromAddressLTC,
        toAddress: toAddressBnb,
        vaultAddress: vaultLTC,
        fromAmount: '15000000',
        toAmountLimit: '977240514',
        affiliateFeeAddress: 't',
        affiliateFeeRateBp: '0',
      );
      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.bitcoin.writeToBuffer(),
          '080110c0c393071801222b6c746331716d63613572756e7667336879676172756c753334657664756c6364666461377a377a7175686e2a2b6c7463317179753971766b756b7839397236796164786c6b3374327837386137647865373373337234783350026a473d3a424e422e425553442d4244313a626e623173346b616c6c786e67707973707a6d366e72657a6b6d6c3972677977366b78707734666872323a3937373234303531343a743a30');

      final tx = Bitcoin.SigningInput.fromBuffer(out.bitcoin.writeToBuffer());

      // check fields
      expect(tx.amount.toInt(), 15000000);
      expect(tx.toAddress, vaultLTC);
      expect(tx.changeAddress, fromAddressLTC);
      expect(String.fromCharCodes(tx.outputOpReturn),
          '=:BNB.BUSD-BD1:bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2:977240514:t:0');
      expect(tx.coinType, TWCoinType.Litecoin.value);
      expect(tx.privateKey.length, 0);
      expect(tx.hasPlan(), false);

      final ltcKey = parse_hex(
          "6affb3d4e2c4f5a23b711e67ca94d0bd93550e203f5c8258df74cc62282d1494");
      tx.privateKey.add(ltcKey);
      tx.byteFee = $fixnum.Int64(140);
      tx.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
                  '6e71e6da1898584ccf92c362db3d7c16326f9daae6687132c69abfdb043cc749')
              .reversed
              .toList(),
          index: 0,
          sequence: UINT32_MAX - 3,
        ),
        script: TWBitcoinScript.lockScriptForAddress(
                fromAddressLTC, TWCoinType.Litecoin)
            .data,
        amount: $fixnum.Int64(34183600),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Litecoin));
      expect(output.error, Common.SigningError.OK);
      expectHex(output.encoded,
          '0100000000010149c73c04dbbf9ac6327168e6aa9d6f32167c3ddb62c392cf4c589818dae6716e0000000000fcffffff03c0e1e40000000000160014de3b41f26c446e44747cff235cb1bcfe1a96f7c2fc3d240100000000160014270a065b96314a3d13ad37ed15a8de3f7cd367d10000000000000000496a473d3a424e422e425553442d4244313a626e623173346b616c6c786e67707973707a6d366e72657a6b6d6c3972677977366b78707734666872323a3937373234303531343a743a3002483045022100fb9df5ef12c26648a50af298c5319ec52ea0287aa1405e07d817c606bb17a23502206520b087a9155a7d8c04b54b8ee3405fad9c3d22cf2c7cac06197ce555d56077012103acefb7d95b8c1da28f17400740d7e1124dbee3cfbe55646deb28198d570ea26b00000000');

      // https://viewblock.io/thorchain/tx/FBB450335ED839C5FE3DCB9CBC0999DA6E6E52B787D1B165D3FA47E6273CCF5F
      // https://blockchair.com/litecoin/transaction/fbb450335ed839c5fe3dcb9cbc0999da6e6e52b787d1b165d3fa47e6273ccf5f
      // https://binance.mintscan.io/txs/7071DF040641D9C62EAA5D7AE5CDAC0C408FE64406261EC32417BD919684707C
    });

    test('SwapBchBusd', () {
      const vaultBCH = "qpsfh5xvk7mgf9e6kl4e045nm6awl5hmks9x7h5ad6";
      const fromAddressBCH = "qr50u7hy3xcr3j0w9j5nfx2gevjqgfm42ykc2hqgy4";
      const toAddressBnb = "bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2";

      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BCH,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
          symbol: 'BNB',
          tokenId: 'BUSD-BD1',
        ),
        fromAddress: fromAddressBCH,
        toAddress: toAddressBnb,
        vaultAddress: vaultBCH,
        fromAmount: '10000000',
        toAmountLimit: '977240514',
        affiliateFeeAddress: 't',
        affiliateFeeRateBp: '0',
      );
      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.bitcoin.writeToBuffer(),
          '08411080ade2041801222a71707366683578766b376d67663965366b6c34653034356e6d3661776c35686d6b7339783768356164362a2a717235307537687933786372336a3077396a356e6678326765766a7167666d3432796b633268716779345091016a473d3a424e422e425553442d4244313a626e623173346b616c6c786e67707973707a6d366e72657a6b6d6c3972677977366b78707734666872323a3937373234303531343a743a30');

      final tx = Bitcoin.SigningInput.fromBuffer(out.bitcoin.writeToBuffer());

      // check fields
      expect(tx.amount.toInt(), 10000000);
      expect(tx.toAddress, vaultBCH);
      expect(tx.changeAddress, fromAddressBCH);
      expect(String.fromCharCodes(tx.outputOpReturn),
          '=:BNB.BUSD-BD1:bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2:977240514:t:0');
      expect(tx.coinType, TWCoinType.BitcoinCash.value);
      expect(tx.privateKey.length, 0);
      expect(tx.hasPlan(), false);

      final bchKey = parse_hex(
          "1a3b0105a08908734ed0525f4c6fadca068514cdeb732d7ebca5b0fcbe6952a7");
      tx.privateKey.add(bchKey);
      tx.byteFee = $fixnum.Int64(3);
      tx.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
                  '651e5d3a60f8110a6cfb745005168bdfcaf21e7f2f4371873a24b5cd894564da')
              .reversed
              .toList(),
          index: 1,
          sequence: UINT32_MAX - 3,
        ),
        script: TWBitcoinScript.lockScriptForAddress(
                fromAddressBCH, TWCoinType.BitcoinCash)
            .data,
        amount: $fixnum.Int64(14118938),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Litecoin));
      expect(output.error, Common.SigningError.OK);
      expectHex(output.encoded,
          '0100000001da644589cdb5243a8771432f7f1ef2cadf8b16055074fb6c0a11f8603a5d1e65010000006a4730440220392fab53b86e02bef19638077fd378dd713dd6b1968d07f4507e28feb022d52a02200240bb2f2e8b8eb7673c4bc69b485e28a0d56c735d84e3f794c303c1b71759e941210393dc5157b5879cd602f25529437e01b3d4892a4b9b8d9efcaa640d842b27438efcffffff0380969800000000001976a914609bd0ccb7b684973ab7eb97d693debaefd2fbb488ac8ed63e00000000001976a914e8fe7ae489b038c9ee2ca9349948cb240427755188ac0000000000000000496a473d3a424e422e425553442d4244313a626e623173346b616c6c786e67707973707a6d366e72657a6b6d6c3972677977366b78707734666872323a3937373234303531343a743a3000000000');

      // https://viewblock.io/thorchain/tx/FBB450335ED839C5FE3DCB9CBC0999DA6E6E52B787D1B165D3FA47E6273CCF5F
      // https://blockchair.com/litecoin/transaction/fbb450335ed839c5fe3dcb9cbc0999da6e6e52b787d1b165d3fa47e6273ccf5f
      // https://binance.mintscan.io/txs/7071DF040641D9C62EAA5D7AE5CDAC0C408FE64406261EC32417BD919684707C
    });

    test('SwapBtcBnb', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BTC,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
          symbol: 'BNB',
        ),
        fromAddress: Address1Btc,
        toAddress: Address1Bnb,
        vaultAddress: VaultBtc,
        fromAmount: '200000',
        toAmountLimit: '140000000',
      );
      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.bitcoin.writeToBuffer(),
          '080110c09a0c1801222a62633171366d397532717375386d68387937763872723279776176746a38673561727a6c796863656a372a2a62633171706a756c7433346b3973706a66796d38687373326a72776a676630786a6634307a65307070386a3e3d3a424e422e424e423a626e62317573343777646866783038636839377a6475656833783375356d757266727833306a656372783a313430303030303030');

      final tx = Bitcoin.SigningInput.fromBuffer(out.bitcoin.writeToBuffer());

      // check fields
      expect(tx.amount.toInt(), 200000);
      expect(tx.toAddress, VaultBtc);
      expect(tx.changeAddress, Address1Btc);
      expect(String.fromCharCodes(tx.outputOpReturn),
          '=:BNB.BNB:bnb1us47wdhfx08ch97zdueh3x3u5murfrx30jecrx:140000000');
      expect(tx.coinType, 0);
      expect(tx.privateKey.length, 0);
      expect(tx.hasPlan(), false);

      // set few fields before signing
      tx.byteFee = $fixnum.Int64(80);
      expect(
        TWSegwitAddress.createWithPublicKey(
                TWHRP.forString('bc'),
                TWPrivateKey.createWithData(TestKey1Btc)
                    .getPublicKeyByType(TWPublicKeyType.SECP256k1))
            .description,
        Address1Btc,
      );
      tx.privateKey.add(TestKey1Btc);
      tx.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
                  '8eae5c3a4c75058d4e3facd5d72f18a40672bcd3d1f35ebf3094bd6c78da48eb')
              .reversed
              .toList(),
          index: 0,
          sequence: UINT32_MAX - 3,
        ),
        script: TWBitcoinScript.lockScriptForAddress(
                Address1Btc, TWCoinType.Bitcoin)
            .data,
        amount: $fixnum.Int64(450000),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Bitcoin));
      expect(output.error, Common.SigningError.OK);
      expectHex(
        output.encoded, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "eb48da786cbd9430bf5ef3d1d3bc7206a4182fd7d5ac3f4e8d05754c3a5cae8e"
        "00000000"
        "00"
        ""
        "fcffffff"
        "03" // outputs
        "400d030000000000"
        "16"
        "0014d6cbc5021c3eee72798718d447758b91d14e8c5f"
        "b08d030000000000"
        "16"
        "00140cb9f5c6b62c03249367bc20a90dd2425e6926af"
        "0000000000000000"
        "40"
        "6a3e3d3a424e422e424e423a626e62317573343777646866783038636839377a6475656833783375356d757266727833306a656372783a313430303030303030"
        // witness
        "02"
        "48"
        "3045022100e17d8cf207c79edfb7afa16102842b434e1f908bd9858553fd54970f1a8b4334022059583f89c3a126df0da46d92947bcbe7c265a1bb838b696c0e7ea7fc8761c2bf01210"
        "21"
        "e582a887bd94d648a9267143eb600449a8d59a0db0653740b1378067a6d0cee"
        "00000000", // nLockTime
      );

      // similar real transaction:
      // https://blockchair.com/bitcoin/transaction/1cd9056b212b85d9d7d34d0795a746dd8691b8cd34ef56df0aa9622fbdec5f88
      // https://viewblock.io/thorchain/tx/1CD9056B212B85D9D7D34D0795A746DD8691B8CD34EF56DF0AA9622FBDEC5F88
      // https://explorer.binance.org/tx/8D78469069118E9B9546696214CCD46E63D3FA0D7E854C094D63C8F6061278B7
    });

    test('SwapUsdtBsc', () {
      const myAddress = "0x0d6aA74992eDDaaf430eadca63B87f4C99Aef8dE";
      const vaultAddress = "0x1f3b3c6ac151bf32409fe139a5d55f3d9444729c";
      const routerAddress = "0xD37BbE5744D730a1d98d8DC97c42F0Ca46aD7146";
      const usdtTokenId = "0xdAC17F958D2ee523a2206206994597C13D831ec7";
      const amount = 70000000;
      const expirationTime = 1775669796;

      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.ETH,
          symbol: 'USDT',
          tokenId: usdtTokenId,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BSC,
          symbol: 'BSC',
          tokenId: 'BNB',
        ),
        fromAddress: myAddress,
        toAddress: myAddress,
        vaultAddress: vaultAddress,
        routerAddress: routerAddress,
        fromAmount: amount.toString(),
        expirationTime: $fixnum.Int64(expirationTime),
        affiliateFeeAddress: 'tr',
        affiliateFeeRateBp: '0',
        streamParams: THORChainSwap.StreamParams(
          interval: '1',
          quantity: '0',
        ),
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);

      final tx = Ethereum.SigningInput.fromBuffer(out.ethereum.writeToBuffer());

      // check fields
      expect(tx.toAddress, routerAddress);
      expect(tx.transaction.hasContractGeneric(), true);

      final func = TWEthereumAbiFunction('depositWithExpiry');
      func.addParamAddressHex(vaultAddress, false);
      func.addParamAddressHex(usdtTokenId, false);
      func.addParamUInt256(intToBytes(amount), false);
      func.addParamString(
          "=:BSC.BNB:0x0d6aA74992eDDaaf430eadca63B87f4C99Aef8dE:0/1/0:tr:0",
          false);
      func.addParamUInt256(intToBytes(expirationTime), false);
      final funcData = func.encode();
      expectHex(funcData,
          '44bc937b0000000000000000000000001f3b3c6ac151bf32409fe139a5d55f3d9444729c000000000000000000000000dac17f958d2ee523a2206206994597c13d831ec700000000000000000000000000000000000000000000000000000000042c1d8000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000069d69224000000000000000000000000000000000000000000000000000000000000003f3d3a4253432e424e423a3078306436614137343939326544446161663433306561646361363342383766344339394165663864453a302f312f303a74723a3000');
      expectHex(tx.transaction.contractGeneric.amount, '00');
      expectHexBytes(tx.transaction.contractGeneric.data, funcData);
    });

    test('SwapAtomBnb', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.ATOM,
          symbol: 'ATOM',
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
          symbol: 'BNB',
        ),
        fromAddress: 'cosmos1v4e6vpehwrfez2dqepnw9g6t4fl83xzegd5ac9',
        toAddress: 'bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2',
        vaultAddress: 'cosmos154t5ycejlr7ax3ynmed9z05yg5a27y9u6pj5hq',
        fromAmount: '300000',
        toAmountLimit: '819391',
        affiliateFeeAddress: 't',
        affiliateFeeRateBp: '0',
      );
      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);

      expectHex(out.cosmos.writeToBuffer(),
          '08011a0b636f736d6f736875622d342a3f3d3a424e422e424e423a626e623173346b616c6c786e67707973707a6d366e72657a6b6d6c3972677977366b78707734666872323a3831393339313a743a3042710a6f0a2d636f736d6f73317634653676706568777266657a32647165706e773967367434666c3833787a65676435616339122d636f736d6f7331353474357963656a6c7237617833796e6d6564397a303579673561323779397536706a3568711a0f0a057561746f6d1206333030303030');

      final tx = Cosmos.SigningInput.fromBuffer(out.cosmos.writeToBuffer());
      expect(tx.memo,
          "=:BNB.BNB:bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2:819391:t:0");

      tx.fee = Cosmos.Fee(
        gas: $fixnum.Int64(200000),
        amounts: [
          Cosmos.Amount(
            denom: 'uatom',
            amount: '500',
          ),
        ],
      );
      tx.accountNumber = $fixnum.Int64(1483163);
      tx.sequence = $fixnum.Int64(1);

      final privKey = parse_hex(
          "3eed3f32b8ba90e579ba46f37e7445fb4b34558306aa5bc32c525a93dff486e7");
      tx.privateKey = privKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Cosmos));
      expect(output.errorMessage, '');
      expect(output.serialized,
          "{\"mode\":\"BROADCAST_MODE_BLOCK\",\"tx_bytes\":\"CtMBCo8BChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEm8KLWNvc21vczF2NGU2dnBlaHdyZmV6MmRxZXBudzlnNnQ0Zmw4M3h6ZWdkNWFjORItY29zbW9zMTU0dDV5Y2VqbHI3YXgzeW5tZWQ5ejA1eWc1YTI3eTl1NnBqNWhxGg8KBXVhdG9tEgYzMDAwMDASPz06Qk5CLkJOQjpibmIxczRrYWxseG5ncHlzcHptNm5yZXprbWw5cmd5dzZreHB3NGZocjI6ODE5MzkxOnQ6MBJmClAKRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiEDmmNIYBvR9bnOloFEMOWdk9DHYIGe7naW0T19y+/k1SUSBAoCCAEYARISCgwKBXVhdG9tEgM1MDAQwJoMGkCFqUWtDu0pn1P/cnVQnIJIWF8HFJn/xkJh55Mc7ZLVPF60uXYUOg8nNkt0IQPuTFREw32/yff6lmA5w6KwPen/\"}");

      // https://viewblock.io/thorchain/tx/07F47D71A74245538E205F24ADB4BBB799B49C3A8A8875665D249EA51662AA50
      // https://www.mintscan.io/cosmos/txs/07F47D71A74245538E205F24ADB4BBB799B49C3A8A8875665D249EA51662AA50
      // https://binance.mintscan.io/txs/2C97061737B16B234990B9B18A2BF65F7C7418FF9E39A68E634C832E4E4C59CE
    });

    test('SwapErc20Rune', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.AVAX,
          tokenId: '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.THOR,
          symbol: 'RUNE',
        ),
        fromAddress: '0xbe6523017422A983B900b614Baeac51Ef7C1d0A3',
        toAddress: 'thor1ad6hapypumu7su5ad9qry2d74yt9d56fssa774',
        vaultAddress: '0xa56f6Cb1D66cd80150b1ea79643b4C5900D6E36E',
        routerAddress: '0x8f66c4ae756bebc49ec8b81966dd8bba9f127549',
        fromAmount: '1000000',
        toAmountLimit: '51638857',
        expirationTime: $fixnum.Int64(1775669796),
        affiliateFeeAddress: 't',
        affiliateFeeRateBp: '0',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);

      final tx = Ethereum.SigningInput.fromBuffer(out.ethereum.writeToBuffer());

      // check fields
      expect(tx.toAddress, '0x8f66c4ae756bebc49ec8b81966dd8bba9f127549');
      expect(tx.transaction.hasContractGeneric(), true);

      const vaultAddress = "0xa56f6Cb1D66cd80150b1ea79643b4C5900D6E36E";

      final func = TWEthereumAbiFunction('depositWithExpiry');
      func.addParamAddressHex(vaultAddress, false);
      func.addParamAddressHex(
          '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E', false);
      func.addParamUInt256(intToBytes(1000000), false);
      func.addParamString(
          "=:THOR.RUNE:thor1ad6hapypumu7su5ad9qry2d74yt9d56fssa774:51638857:t:0",
          false);
      func.addParamUInt256(intToBytes(1775669796), false);
      final funcData = func.encode();
      expectHex(funcData,
          '44bc937b000000000000000000000000a56f6cb1d66cd80150b1ea79643b4c5900d6e36e000000000000000000000000b97ef9ef8734c71904d8002f8b6bc66dd9c48a6e00000000000000000000000000000000000000000000000000000000000f424000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000069d6922400000000000000000000000000000000000000000000000000000000000000443d3a54484f522e52554e453a74686f72316164366861707970756d753773753561643971727932643734797439643536667373613737343a35313633383835373a743a3000000000000000000000000000000000000000000000000000000000');
      expectHex(tx.transaction.contractGeneric.amount, '00');
      expectHexBytes(tx.transaction.contractGeneric.data, funcData);

      expectHex(tx.privateKey, '');

      // set few fields before signing
      tx.chainId = intToBytes(43114);
      tx.nonce = intToBytes(6);
      tx.maxInclusionFeePerGas = intToBytes(2000000000);
      tx.maxFeePerGas = intToBytes(25000000000);
      tx.gasLimit = intToBytes(108810);
      tx.privateKey = parse_hex(
          '6649ba1d931059e7b419f97ee41c3f98b8f8054dfeb4cb57b9898bc5b9bbe318');

      // sign and encode resulting input
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Ethereum));
      expectHex(output.encoded,
          '02f9019482a86a0684773594008505d21dba008301a90a948f66c4ae756bebc49ec8b81966dd8bba9f12754980b9012444bc937b000000000000000000000000a56f6cb1d66cd80150b1ea79643b4c5900d6e36e000000000000000000000000b97ef9ef8734c71904d8002f8b6bc66dd9c48a6e00000000000000000000000000000000000000000000000000000000000f424000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000069d6922400000000000000000000000000000000000000000000000000000000000000443d3a54484f522e52554e453a74686f72316164366861707970756d753773753561643971727932643734797439643536667373613737343a35313633383835373a743a3000000000000000000000000000000000000000000000000000000000c080a04a3a01941906579f1c6888771fe0621d66ee78998bfbb87219c0b5970235fc5ca03aefe4bb0c074f90798e078270c380930f4ae75366217f85535dd9be196a4244');
      // https://viewblock.io/thorchain/tx/B5E88D61157E7073995CA8729B75DAB2C1684A7B145DB711327CA4B8FF7DBDE7
      // https://snowtrace.io/tx/0xb5e88d61157e7073995ca8729b75dab2c1684a7b145db711327ca4b8ff7dbde7
      // https://thorchain.net/tx/B5E88D61157E7073995CA8729B75DAB2C1684A7B145DB711327CA4B8FF7DBDE7
    });

    test('SwapBscBnb', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BSC,
          tokenId: '0x0000000000000000000000000000000000000000',
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
          symbol: 'BNB',
        ),
        fromAddress: '0xf8192E9c51c070d199a8F262c12DDD1034274083',
        toAddress: 'bnb1tjcup6q8nere6r0pdt2ucc4g0xcrhm0jy5xql8',
        vaultAddress: '0xcBE4334E4a0fC7C5Fa8083223B28a4b9F695A06C',
        routerAddress: '0xb30eC53F98ff5947EDe720D32aC2da7e52A5f56b',
        fromAmount: '10000000000000000',
        toAmountLimit: '100000',
        expirationTime: $fixnum.Int64(1775669796),
        affiliateFeeAddress: 't',
        affiliateFeeRateBp: '0',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.ethereum.writeToBuffer(),
          '0a01001201002201002a0100422a3078623330654335334639386666353934374544653732304433326143326461376535324135663536625293023290020a072386f26fc1000012840244bc937b000000000000000000000000cbe4334e4a0fc7c5fa8083223b28a4b9f695a06c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002386f26fc1000000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000069d69224000000000000000000000000000000000000000000000000000000000000003f3d3a424e422e424e423a626e6231746a6375703671386e65726536723070647432756363346730786372686d306a793578716c383a3130303030303a743a3000');

      final tx = Ethereum.SigningInput.fromBuffer(out.ethereum.writeToBuffer());

      // check fields
      expect(tx.toAddress, '0xb30eC53F98ff5947EDe720D32aC2da7e52A5f56b');
      expect(tx.transaction.hasContractGeneric(), true);

      expectHex(tx.privateKey, '');

      // set few fields before signing
      tx.chainId = intToBytes(56);
      tx.nonce = intToBytes(0);
      // 0,000000001
      tx.gasPrice = intToBytes(3000000000);
      tx.gasLimit = intToBytes(50000);
      tx.privateKey = parse_hex(
          '74c452b55e0da4139172bc3b32bec469cfefbcdce373edda8e33afcfbf9c0a87');

      // sign and encode resulting input
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Ethereum));
      expectHex(output.encoded,
          'f901718084b2d05e0082c35094b30ec53f98ff5947ede720d32ac2da7e52a5f56b872386f26fc10000b9010444bc937b000000000000000000000000cbe4334e4a0fc7c5fa8083223b28a4b9f695a06c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002386f26fc1000000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000069d69224000000000000000000000000000000000000000000000000000000000000003f3d3a424e422e424e423a626e6231746a6375703671386e65726536723070647432756363346730786372686d306a793578716c383a3130303030303a743a30008194a05b0032d4150a3fa3b39a047648c02cb44b3256b9c34b7780265643c33d2aa2c6a017fece0465a271b7bddf655f7ac77419fb0433f9acf64b455b9aa17183b6eb98');
      // https://viewblock.io/thorchain/tx/4292A5068BAA5619CF7A35861058915423688DF3CAE8F241453D8FCC6E0BF0A9
      // https://bscscan.com/tx/0x4292a5068baa5619cf7a35861058915423688df3cae8f241453d8fcc6e0bf0a9
      // https://explorer.bnbchain.org/tx/88A1B6F9D64F3B48CE1107979CD325E817446C5D6729EE6FC917589A6FADA79D
    });

    test('SwapAvaxBnb', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.AVAX,
          tokenId: '0x0000000000000000000000000000000000000000',
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
          symbol: 'BNB',
        ),
        fromAddress: '0xbB7cF2f05a01DB5394234FE1257D907059edFa66',
        toAddress: 'bnb16gk7gczst59wy8rnxrqnt3yn6f60uw6ec0w6uv',
        vaultAddress: '0x3bd92906c60e5843ce01b2dc54e6dc3575b5215a',
        routerAddress: '0x8f66c4ae756bebc49ec8b81966dd8bba9f127549',
        fromAmount: '150000000000000000',
        toAmountLimit: '297039',
        expirationTime: $fixnum.Int64(1775669796),
        affiliateFeeAddress: 't',
        affiliateFeeRateBp: '0',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.ethereum.writeToBuffer(),
          '0a010012010018012201002a0100422a3078386636366334616537353662656263343965633862383139363664643862626139663132373534395294023291020a080214e8348c4f000012840244bc937b0000000000000000000000003bd92906c60e5843ce01b2dc54e6dc3575b5215a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000214e8348c4f000000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000069d69224000000000000000000000000000000000000000000000000000000000000003f3d3a424e422e424e423a626e623136676b3767637a73743539777938726e7872716e7433796e36663630757736656330773675763a3239373033393a743a3000');

      final tx = Ethereum.SigningInput.fromBuffer(out.ethereum.writeToBuffer());

      // check fields
      expect(tx.toAddress, '0x8f66c4ae756bebc49ec8b81966dd8bba9f127549');
      expect(tx.transaction.hasContractGeneric(), true);

      expectHex(tx.privateKey, '');

      // set few fields before signing
      tx.chainId = intToBytes(43114);
      tx.nonce = intToBytes(5);
      tx.maxInclusionFeePerGas = intToBytes(2000000000);
      tx.maxFeePerGas = intToBytes(25000000000);
      tx.gasLimit = intToBytes(108810);
      tx.privateKey = parse_hex(
          '09da019c250b7e2b140645df36fd839806c5ae8eecf4d8f35e8ff57cf3bd1e57');

      // sign and encode resulting input
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Ethereum));
      expectHex(output.encoded,
          '02f9017c82a86a0584773594008505d21dba008301a90a948f66c4ae756bebc49ec8b81966dd8bba9f127549880214e8348c4f0000b9010444bc937b0000000000000000000000003bd92906c60e5843ce01b2dc54e6dc3575b5215a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000214e8348c4f000000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000069d69224000000000000000000000000000000000000000000000000000000000000003f3d3a424e422e424e423a626e623136676b3767637a73743539777938726e7872716e7433796e36663630757736656330773675763a3239373033393a743a3000c080a0a794b7cd86242df0f69bfc2555adec7841ad1f3a02e478be0d63571da8d41f20a06cd214b052d2a2aee598c2d3d57a972979e4c49a447c52828657101e9ad39737');
      // https://viewblock.io/thorchain/tx/8A29B132443BF1B0A0BD3E00F8155D10FEEEC7737BDC912C4A1AFB0A52E4FD4F
      // https://snowtrace.io/tx/0x8A29B132443BF1B0A0BD3E00F8155D10FEEEC7737BDC912C4A1AFB0A52E4FD4F
      // https://binance.mintscan.io/txs/9D250C8BAC8205B942A597AFB345045439A55CAB8DD588B75870D4E47D751C16
    });

    test('SwapEthBnb', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.ETH,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
          symbol: 'BNB',
        ),
        fromAddress: Address1Eth,
        toAddress: Address1Bnb,
        vaultAddress: VaultEth,
        fromAmount: '50000000000000000',
        toAmountLimit: '600003',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.ethereum.writeToBuffer(),
          '0a010012010018012201002a0100422a30783130393163344465366133634630394364413030416244416544343263376333423639433833454352480a460a07b1a2bc2ec50000123b3d3a424e422e424e423a626e62317573343777646866783038636839377a6475656833783375356d757266727833306a656372783a363030303033');

      final tx = Ethereum.SigningInput.fromBuffer(out.ethereum.writeToBuffer());

      // check fields
      expect(tx.toAddress, VaultEth);
      expect(tx.transaction.hasContractGeneric(), false);

      expectHex(tx.privateKey, '');

      // set few fields before signing
      tx.chainId = intToBytes(1);
      tx.nonce = intToBytes(3);
      tx.gasPrice = intToBytes(30000000000);
      tx.gasLimit = intToBytes(80000);
      tx.privateKey = TestKey1Eth;

      // sign and encode resulting input
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Ethereum));
      expectHex(output.encoded,
          '02f8a60103808083013880941091c4de6a3cf09cda00abdaed42c7c3b69c83ec87b1a2bc2ec50000b83b3d3a424e422e424e423a626e62317573343777646866783038636839377a6475656833783375356d757266727833306a656372783a363030303033c080a00d605807f983650fafbfdcf0c33bdf0c524c7185eae8c1501ae24892faf16b1ba03b51b0a35e4754ab21d1e48fed635d8486048df50c253ba9af4cebdb6a92a450');
    });

    test('SwapBnbBtc', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BTC,
          symbol: 'BTC',
        ),
        fromAddress: Address1Bnb,
        toAddress: Address1Btc,
        vaultAddress: VaultBnb,
        fromAmount: '10000000',
        toAmountLimit: '10000000',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.binance.writeToBuffer(),
          '2a3d3d3a4254432e4254433a62633171706a756c7433346b3973706a66796d38687373326a72776a676630786a6634307a65307070383a313030303030303052480a220a14e42be736e933cf8b97c26f33789a3ca6f8348cd1120a0a03424e421080ade20412220a1499730371c7c77cb81ffa76b566dcef7c1e5dc19c120a0a03424e421080ade204');

      final tx = Binance.SigningInput.fromBuffer(out.binance.writeToBuffer());

      // check fields
      expect(tx.memo,
          "=:BTC.BTC:bc1qpjult34k9spjfym8hss2jrwjgf0xjf40ze0pp8:10000000");
      expect(tx.hasSendOrder(), true);
      expect(tx.sendOrder.inputs.length, 1);
      expect(tx.sendOrder.outputs.length, 1);
      expectHex(tx.sendOrder.inputs[0].address,
          'e42be736e933cf8b97c26f33789a3ca6f8348cd1');
      expectHex(tx.sendOrder.outputs[0].address,
          '99730371c7c77cb81ffa76b566dcef7c1e5dc19c');
      expectHex(tx.privateKey, '');

      // set few fields before signing
      tx.chainId = 'Binance-Chain-Tigris';
      tx.privateKey = TestKey1Bnb;

      // sign and encode resulting input
      final output = Binance.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Binance));
      expectHex(output.encoded,
          'fd01f0625dee0a4c2a2c87fa0a220a14e42be736e933cf8b97c26f33789a3ca6f8348cd1120a0a03424e421080ade20412220a1499730371c7c77cb81ffa76b566dcef7c1e5dc19c120a0a03424e421080ade204126a0a26eb5ae9872103ea4b4bc12dc6f36a28d2c9775e01eef44def32cc70fb54f0e4177b659dbc0e19124086d43e9bdf12508a9a1415f5f970dfa5ff5930dee01d922f99779b63190735ba1d69694bda203b6678939a5c1eab0a52ed32bb67864ec7864de37b333533ae0c1a3d3d3a4254432e4254433a62633171706a756c7433346b3973706a66796d38687373326a72776a676630786a6634307a65307070383a3130303030303030');
    });

    test('SwapBnbEth', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.ETH,
          symbol: 'ETH',
        ),
        fromAddress: Address1Bnb,
        toAddress: Address1Eth,
        vaultAddress: VaultBnb,
        fromAmount: '27000000',
        toAmountLimit: '123456',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.binance.writeToBuffer(),
          '2a3b3d3a4554482e4554483a3078623966353737316332373636346266323238326439386530396437663530636563376362303161373a31323334353652480a220a14e42be736e933cf8b97c26f33789a3ca6f8348cd1120a0a03424e4210c0f9ef0c12220a1499730371c7c77cb81ffa76b566dcef7c1e5dc19c120a0a03424e4210c0f9ef0c');

      final tx = Binance.SigningInput.fromBuffer(out.binance.writeToBuffer());

      // check fields
      expect(tx.memo,
          "=:ETH.ETH:0xb9f5771c27664bf2282d98e09d7f50cec7cb01a7:123456");
      expect(tx.hasSendOrder(), true);
      expect(tx.sendOrder.inputs.length, 1);
      expect(tx.sendOrder.outputs.length, 1);
      expectHex(tx.sendOrder.inputs[0].address,
          'e42be736e933cf8b97c26f33789a3ca6f8348cd1');
      expectHex(tx.sendOrder.outputs[0].address,
          '99730371c7c77cb81ffa76b566dcef7c1e5dc19c');
      expectHex(tx.privateKey, '');

      // set private key and few other fields
      expect(
          TWCoinType.Binance.deriveAddress(
              TWPrivateKey.createWithData(TestKey1Bnb)),
          Address1Bnb);
      tx.privateKey = TestKey1Bnb;
      tx.chainId = 'Binance-Chain-Tigris';
      tx.accountNumber = $fixnum.Int64(1902570);
      tx.sequence = $fixnum.Int64(12);

      // sign and encode resulting input
      final output = Binance.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Binance));
      expectHex(output.encoded,
          '8102f0625dee0a4c2a2c87fa0a220a14e42be736e933cf8b97c26f33789a3ca6f8348cd1120a0a03424e4210c0f9ef0c12220a1499730371c7c77cb81ffa76b566dcef7c1e5dc19c120a0a03424e4210c0f9ef0c12700a26eb5ae9872103ea4b4bc12dc6f36a28d2c9775e01eef44def32cc70fb54f0e4177b659dbc0e1912409ad3d44f3cc8d5dd2701b0bf3758ef674683533fb63e3e94d39728688c0279f8410395d631075dac62dee74b972c320f5a58e88ab81be6f1bb6a9564468ae1b618ea8f74200c1a3b3d3a4554482e4554483a3078623966353737316332373636346266323238326439386530396437663530636563376362303161373a313233343536');
      // real transaction:
      // https://explorer.binance.org/tx/F0CFDB0D9467E83B5BBF6DF92E4E2D04FE9EFF9B0A1C71D88DCEF566233DCAA2
      // https://viewblock.io/thorchain/tx/F0CFDB0D9467E83B5BBF6DF92E4E2D04FE9EFF9B0A1C71D88DCEF566233DCAA2
      // https://etherscan.io/tx/0x8e5bb7d87e17af86e649e402bc5c182ea8c32ddaca153804679de1184e0d9747
    });

    test('SwapBnbRune', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.THOR,
          symbol: 'RUNE',
        ),
        fromAddress: Address1Bnb,
        toAddress: Address1Thor,
        vaultAddress: VaultBnb,
        fromAmount: '4000000',
        toAmountLimit: '121065076',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.binance.writeToBuffer(),
          '2a413d3a54484f522e52554e453a74686f72317a3533777765376d64366365777a39737177717a6e306161767061756e3067773065786e32723a31323130363530373652480a220a14e42be736e933cf8b97c26f33789a3ca6f8348cd1120a0a03424e42108092f40112220a1499730371c7c77cb81ffa76b566dcef7c1e5dc19c120a0a03424e42108092f401');

      final tx = Binance.SigningInput.fromBuffer(out.binance.writeToBuffer());

      // check fields
      expect(tx.memo,
          "=:THOR.RUNE:thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r:121065076");
      expect(tx.hasSendOrder(), true);
      expect(tx.sendOrder.inputs.length, 1);
      expect(tx.sendOrder.outputs.length, 1);
      expectHex(tx.sendOrder.inputs[0].address,
          'e42be736e933cf8b97c26f33789a3ca6f8348cd1');
      expectHex(tx.sendOrder.outputs[0].address,
          '99730371c7c77cb81ffa76b566dcef7c1e5dc19c');
      expectHex(tx.privateKey, '');

      // set private key and few other fields
      expect(
          TWCoinType.Binance.deriveAddress(
              TWPrivateKey.createWithData(TestKey1Bnb)),
          Address1Bnb);
      tx.privateKey = TestKey1Bnb;
      tx.chainId = 'Binance-Chain-Tigris';
      tx.accountNumber = $fixnum.Int64(1902570);
      tx.sequence = $fixnum.Int64(4);

      // sign and encode resulting input
      final output = Binance.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Binance));
      expectHex(output.encoded,
          '8702f0625dee0a4c2a2c87fa0a220a14e42be736e933cf8b97c26f33789a3ca6f8348cd1120a0a03424e42108092f40112220a1499730371c7c77cb81ffa76b566dcef7c1e5dc19c120a0a03424e42108092f40112700a26eb5ae9872103ea4b4bc12dc6f36a28d2c9775e01eef44def32cc70fb54f0e4177b659dbc0e191240f0bd5a0b4936ce73b1564f737a22cb7cfa3c171a3598b1fe42f6c926c516777042673f3b30148d54b591dcfcb88c2aa04bb87b4b492e8d17c72e4d263f57159018ea8f7420041a413d3a54484f522e52554e453a74686f72317a3533777765376d64366365777a39737177717a6e306161767061756e3067773065786e32723a313231303635303736');

      // real transaction:
      // https://explorer.binance.org/tx/84EE429B35945F0568097527A084532A9DE7BBAB0E6A5562E511CEEFB188DE69
      // https://viewblock.io/thorchain/tx/D582E1473FE229F02F162055833C64F49FB4FF515989A4785ED7898560A448FC
    });

    test('SwapBnbBnbToken', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
          symbol: 'BNB',
          tokenId: 'TWT-8C2',
        ),
        fromAddress: 'bnb1us47wdhfx08ch97zdueh3x3u5murfrx30jecrx',
        toAddress: 'bnb1us47wdhfx08ch97zdueh3x3u5murfrx30jecrx',
        vaultAddress: 'bnb1qefsjm654cdw94ejj8g4s49w7z8te75veslusz',
        fromAmount: '10000000',
        toAmountLimit: '5400000000',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.binance.writeToBuffer(),
          '2a433d3a424e422e5457542d3843323a626e62317573343777646866783038636839377a6475656833783375356d757266727833306a656372783a3534303030303030303052480a220a14e42be736e933cf8b97c26f33789a3ca6f8348cd1120a0a03424e421080ade20412220a140653096f54ae1ae2d73291d15854aef08ebcfa8c120a0a03424e421080ade204');

      final tx = Binance.SigningInput.fromBuffer(out.binance.writeToBuffer());

      // check fields
      expect(tx.memo,
          "=:BNB.TWT-8C2:bnb1us47wdhfx08ch97zdueh3x3u5murfrx30jecrx:5400000000");
      expect(tx.hasSendOrder(), true);
      expect(tx.sendOrder.inputs.length, 1);
      expect(tx.sendOrder.outputs.length, 1);
      expectHex(tx.sendOrder.inputs[0].address,
          'e42be736e933cf8b97c26f33789a3ca6f8348cd1');
      expectHex(tx.sendOrder.outputs[0].address,
          '0653096f54ae1ae2d73291d15854aef08ebcfa8c');
      expectHex(tx.privateKey, '');

      // set private key and few other fields
      final privateKey = parse_hex(
          "bcf8b072560dda05122c99390def2c385ec400e1a93df0657a85cf6b57a715da");
      tx.privateKey = privateKey;
      tx.chainId = 'Binance-Chain-Tigris';
      tx.accountNumber = $fixnum.Int64(1902570);
      tx.sequence = $fixnum.Int64(18);

      // sign and encode resulting input
      final output = Binance.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Binance));
      expectHex(output.encoded,
          '8902f0625dee0a4c2a2c87fa0a220a14e42be736e933cf8b97c26f33789a3ca6f8348cd1120a0a03424e421080ade20412220a140653096f54ae1ae2d73291d15854aef08ebcfa8c120a0a03424e421080ade20412700a26eb5ae9872103ea4b4bc12dc6f36a28d2c9775e01eef44def32cc70fb54f0e4177b659dbc0e191240918963970aedc528e3a9ba34f37fb544ec18e7d2caade2ebf7b8371928c93e6e0eca072313ddfda393c1340766d5fef00e6b0cb7147ef3382b6303f3a6ca01a318ea8f7420121a433d3a424e422e5457542d3843323a626e62317573343777646866783038636839377a6475656833783375356d757266727833306a656372783a35343030303030303030');

      // real transaction:
      // curl -X GET "http://dataseed1.binance.org/broadcast_tx_sync?tx=0x8c02...3030"
      // https://viewblock.io/thorchain/tx/6D1EDC9BD9BFAFEF0F88F95A164191262EA02A0413BF3D9773110AD5676E1523
      // https://explorer.binance.org/tx/6D1EDC9BD9BFAFEF0F88F95A164191262EA02A0413BF3D9773110AD5676E1523
      // https://explorer.binance.org/tx/60C54C9F253B89C36A2788AB66951045E8AC5F5729597CB6C64A13013A7A54CC
    });

    test('SwapBtcEthWithAffFee', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BTC,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.ETH,
          symbol: 'ETH',
        ),
        fromAddress: Address1Btc,
        toAddress: Address1Eth,
        vaultAddress: VaultBtc,
        fromAmount: '1000000',
        toAmountLimit: '140000000000000000',
        affiliateFeeAddress: 'thrnm',
        affiliateFeeRateBp: '10',
      );
      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.bitcoin.writeToBuffer(),
          '080110c0843d1801222a62633171366d397532717375386d68387937763872723279776176746a38673561727a6c796863656a372a2a62633171706a756c7433346b3973706a66796d38687373326a72776a676630786a6634307a65307070386a503d3a4554482e4554483a3078623966353737316332373636346266323238326439386530396437663530636563376362303161373a3134303030303030303030303030303030303a7468726e6d3a3130');

      final tx = Bitcoin.SigningInput.fromBuffer(out.bitcoin.writeToBuffer());

      // check fields
      expect(tx.amount.toInt(), 1000000);
      expect(tx.toAddress, VaultBtc);
      expect(tx.changeAddress, Address1Btc);
      expect(String.fromCharCodes(tx.outputOpReturn),
          '=:ETH.ETH:0xb9f5771c27664bf2282d98e09d7f50cec7cb01a7:140000000000000000:thrnm:10');
      expect(tx.coinType, 0);
      expect(tx.privateKey.length, 0);
      expect(tx.hasPlan(), false);

      // set few fields before signing
      tx.byteFee = $fixnum.Int64(20);
      expect(
        TWSegwitAddress.createWithPublicKey(
                TWHRP.forString('bc'),
                TWPrivateKey.createWithData(TestKey1Btc)
                    .getPublicKeyByType(TWPublicKeyType.SECP256k1))
            .description,
        Address1Btc,
      );
      tx.privateKey.add(TestKey1Btc);
      tx.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
              '1234000000000000000000000000000000000000000000000000000000005678'),
          index: 0,
          sequence: UINT32_MAX,
        ),
        script: TWBitcoinScript.lockScriptForAddress(
                Address1Btc, TWCoinType.Bitcoin)
            .data,
        amount: $fixnum.Int64(50000000),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Bitcoin));
      expect(output.error, Common.SigningError.OK);
      expectHex(
        output.encoded, // printed using prettyPrintTransaction
        "01000000" // version
        "0001" // marker & flag
        "01" // inputs
        "1234000000000000000000000000000000000000000000000000000000005678"
        "00000000"
        "00"
        ""
        "ffffffff"
        "03" // outputs
        "40420f0000000000"
        "16"
        "0014d6cbc5021c3eee72798718d447758b91d14e8c5f"
        "0c9ceb0200000000"
        "16"
        "00140cb9f5c6b62c03249367bc20a90dd2425e6926af"
        "0000000000000000"
        "53"
        "6a4c503d3a4554482e4554483a3078623966353737316332373636346266323238326439386530396437663530636563376362303161373a3134303030303030303030303030303030303a7468726e6d3a3130"
        // witness
        "02"
        "47"
        "3044022056e918d8dea9431057b7b8b7f7c990ff72d653aef296eda9a85e546537e1eaa4022050b64766ea4ce56ecd3325f184d67b20924fd4539cb40bbad916ede1cc26017f01"
        "21"
        "021e582a887bd94d648a9267143eb600449a8d59a0db0653740b1378067a6d0cee"
        "00000000", // nLockTime
      );
    });

    test('SwapEthBnbWithAffFee', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.ETH,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BNB,
          symbol: 'BNB',
        ),
        fromAddress: Address1Eth,
        toAddress: Address1Bnb,
        vaultAddress: VaultEth,
        fromAmount: '50000000000000000',
        toAmountLimit: '600003',
        affiliateFeeAddress: 'tthor1ql2tcqyrqsgnql2tcqyj2n8kfdmt9lh0yzql2tcqy',
        affiliateFeeRateBp: '10',
      );

      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.ethereum.writeToBuffer(),
          '0a010012010018012201002a0100422a307831303931633444653661336346303943644130304162444165443432633763334236394338334543527b0a790a07b1a2bc2ec50000126e3d3a424e422e424e423a626e62317573343777646866783038636839377a6475656833783375356d757266727833306a656372783a3630303030333a7474686f7231716c3274637179727173676e716c32746371796a326e386b66646d74396c6830797a716c32746371793a3130');

      final tx = Ethereum.SigningInput.fromBuffer(out.ethereum.writeToBuffer());

      // check fields
      expect(tx.toAddress, VaultEth);
      expect(tx.transaction.hasContractGeneric(), false);

      expectHex(tx.privateKey, '');

      // set few fields before signing
      tx.chainId = intToBytes(1);
      tx.nonce = intToBytes(3);
      tx.gasPrice = intToBytes(30000000000);
      tx.gasLimit = intToBytes(80000);
      tx.privateKey = TestKey1Eth;

      // sign and encode resulting input
      final output = Ethereum.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Ethereum));
      expectHex(output.encoded,
          '02f8d90103808083013880941091c4de6a3cf09cda00abdaed42c7c3b69c83ec87b1a2bc2ec50000b86e3d3a424e422e424e423a626e62317573343777646866783038636839377a6475656833783375356d757266727833306a656372783a3630303030333a7474686f7231716c3274637179727173676e716c32746371796a326e386b66646d74396c6830797a716c32746371793a3130c001a05c16871b66fd0fa8f658d6f171310bab332d09e0533d6c97329a59ddc93a9a11a05ed2be94e6dbb640e58920c8be4fa597cd5f0a918123245acb899042dd43777f');
    });

    test('SwapBtcNegativeMemoTooLong', () {
      final input = THORChainSwap.SwapInput(
        fromAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.BTC,
        ),
        toAsset: THORChainSwap.Asset(
          chain: THORChainSwap.Chain.ETH,
          symbol: 'ETH',
        ),
        fromAddress: Address1Btc,
        toAddress: Address1Eth,
        vaultAddress: VaultBtc,
        fromAmount: '1000000',
        toAmountLimit: '140000000000000000',
        affiliateFeeAddress: 'affiliate_address',
        affiliateFeeRateBp: '10',
        extraMemo: 'extra_memo_very_loooooooooooooong',
      );
      final out = THORChainSwap.SwapOutput.fromBuffer(
          TWTHORChainSwap.buildSwap(input.writeToBuffer()));
      expect(out.error.code, THORChainSwap.ErrorCode.OK);
      expectHex(out.bitcoin.writeToBuffer(),
          '080110c0843d1801222a62633171366d397532717375386d68387937763872723279776176746a38673561727a6c796863656a372a2a62633171706a756c7433346b3973706a66796d38687373326a72776a676630786a6634307a65307070386a7e3d3a4554482e4554483a3078623966353737316332373636346266323238326439386530396437663530636563376362303161373a3134303030303030303030303030303030303a616666696c696174655f616464726573733a31303a65787472615f6d656d6f5f766572795f6c6f6f6f6f6f6f6f6f6f6f6f6f6f6f6e67');

      final tx = Bitcoin.SigningInput.fromBuffer(out.bitcoin.writeToBuffer());

      // check fields
      expect(tx.amount.toInt(), 1000000);
      expect(tx.toAddress, VaultBtc);
      expect(tx.changeAddress, Address1Btc);
      expect(String.fromCharCodes(tx.outputOpReturn),
          '=:ETH.ETH:0xb9f5771c27664bf2282d98e09d7f50cec7cb01a7:140000000000000000:affiliate_address:10:extra_memo_very_loooooooooooooong');
      expect(tx.outputOpReturn.length, 126);
      expect(tx.coinType, 0);
      expect(tx.privateKey.length, 0);
      expect(tx.hasPlan(), false);

      // set few fields before signing
      tx.byteFee = $fixnum.Int64(20);
      expect(
        TWSegwitAddress.createWithPublicKey(
                TWHRP.forString('bc'),
                TWPrivateKey.createWithData(TestKey1Btc)
                    .getPublicKeyByType(TWPublicKeyType.SECP256k1))
            .description,
        Address1Btc,
      );
      tx.privateKey.add(TestKey1Btc);
      tx.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
              '1234000000000000000000000000000000000000000000000000000000005678'),
          index: 0,
          sequence: UINT32_MAX,
        ),
        script: TWBitcoinScript.lockScriptForAddress(
                Address1Btc, TWCoinType.Bitcoin)
            .data,
        amount: $fixnum.Int64(50000000),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.Bitcoin));
      expect(output.error, Common.SigningError.Error_invalid_memo);
      expectHex(output.encoded, '');
    });

    test('WrongFromAddress', () {
      final fromAsset = THORChainSwap.Asset(
        chain: THORChainSwap.Chain.BNB,
      );
      final toAsset = THORChainSwap.Asset(
        chain: THORChainSwap.Chain.ETH,
        symbol: 'ETH',
      );
      {
        final input = THORChainSwap.SwapInput(
          fromAsset: fromAsset,
          toAsset: toAsset,
          fromAddress: 'DummyAddress',
          toAddress: Address1Eth,
          vaultAddress: VaultEth,
          fromAmount: '1000000',
          toAmountLimit: '100000',
        );
        final out = THORChainSwap.SwapOutput.fromBuffer(
            TWTHORChainSwap.buildSwap(input.writeToBuffer()));
        expect(
            out.error.code, THORChainSwap.ErrorCode.Error_Invalid_from_address);
        expect(out.error.message, 'Invalid from address');
      }
      {
        final input = THORChainSwap.SwapInput(
          fromAsset: fromAsset,
          toAsset: toAsset,
          fromAddress: Address1Btc,
          toAddress: Address1Eth,
          vaultAddress: VaultEth,
          fromAmount: '1000000',
          toAmountLimit: '100000',
        );
        final out = THORChainSwap.SwapOutput.fromBuffer(
            TWTHORChainSwap.buildSwap(input.writeToBuffer()));
        expect(
            out.error.code, THORChainSwap.ErrorCode.Error_Invalid_from_address);
        expect(out.error.message, 'Invalid from address');
      }
    });

    test('WrongToAddress', () {
      final fromAsset = THORChainSwap.Asset(
        chain: THORChainSwap.Chain.BNB,
      );
      final toAsset = THORChainSwap.Asset(
        chain: THORChainSwap.Chain.ETH,
        symbol: 'ETH',
      );
      {
        final input = THORChainSwap.SwapInput(
          fromAsset: fromAsset,
          toAsset: toAsset,
          fromAddress: Address1Bnb,
          toAddress: 'DummyAddress',
          vaultAddress: VaultEth,
          fromAmount: '1000000',
          toAmountLimit: '100000',
        );
        final out = THORChainSwap.SwapOutput.fromBuffer(
            TWTHORChainSwap.buildSwap(input.writeToBuffer()));
        expect(
            out.error.code, THORChainSwap.ErrorCode.Error_Invalid_to_address);
        expect(out.error.message, 'Invalid to address');
      }
      {
        final input = THORChainSwap.SwapInput(
          fromAsset: fromAsset,
          toAsset: toAsset,
          fromAddress: Address1Bnb,
          toAddress: Address1Btc,
          vaultAddress: VaultEth,
          fromAmount: '1000000',
          toAmountLimit: '100000',
        );
        final out = THORChainSwap.SwapOutput.fromBuffer(
            TWTHORChainSwap.buildSwap(input.writeToBuffer()));
        expect(
            out.error.code, THORChainSwap.ErrorCode.Error_Invalid_to_address);
        expect(out.error.message, 'Invalid to address');
      }
    });

    test('EthInvalidVault', () {
      final fromAsset = THORChainSwap.Asset(
        chain: THORChainSwap.Chain.ETH,
      );
      final toAsset = THORChainSwap.Asset(
        chain: THORChainSwap.Chain.BNB,
        symbol: 'BNB',
      );
      {
        fromAsset.tokenId = '0x53595320f158d4546677b4795cc66dff59d154db';
        final input = THORChainSwap.SwapInput(
          fromAsset: fromAsset,
          toAsset: toAsset,
          fromAddress: Address1Eth,
          toAddress: Address1Bnb,
          vaultAddress: '_INVALID_ADDRESS_',
          routerAddress: RouterEth,
          fromAmount: '50000000000000000',
          toAmountLimit: '600003',
        );
        final out = THORChainSwap.SwapOutput.fromBuffer(
            TWTHORChainSwap.buildSwap(input.writeToBuffer()));
        expect(out.error.code,
            THORChainSwap.ErrorCode.Error_Invalid_vault_address);
        expect(out.error.message, 'Invalid vault address: _INVALID_ADDRESS_');
      }
      {
        final input = THORChainSwap.SwapInput(
          fromAsset: fromAsset,
          toAsset: toAsset,
          fromAddress: Address1Eth,
          toAddress: Address1Bnb,
          vaultAddress: VaultEth,
          routerAddress: '_INVALID_ADDRESS_',
          fromAmount: '50000000000000000',
          toAmountLimit: '600003',
        );
        final out = THORChainSwap.SwapOutput.fromBuffer(
            TWTHORChainSwap.buildSwap(input.writeToBuffer()));
        expect(out.error.code,
            THORChainSwap.ErrorCode.Error_Invalid_router_address);
        expect(out.error.message, 'Invalid router address: _INVALID_ADDRESS_');
      }
    });
  });
}
