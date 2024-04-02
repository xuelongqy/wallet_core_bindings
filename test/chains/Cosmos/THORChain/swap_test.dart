import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
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
  final address = TWAnyAddress(asString, TWCoinType.TWCoinTypeEthereum);
  return address.data;
}

void main() {
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
                hrpForString('bc'),
                TWPrivateKey.createWithData(TestKey1Btc).getPublicKeyByType(
                    TWPublicKeyType.TWPublicKeyTypeSECP256k1))
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
                Address1Btc, TWCoinType.TWCoinTypeBitcoin)
            .data,
        amount: $fixnum.Int64(50000000),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));
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
      final vaultDoge = "DExct9oTfqr7pfnbP2hkCHP1Z2eUDgqXya";
      final fromAddressDoge = "DKftkYCtCyYxQy2TRAuAzQXoyKDdYsEBnw";
      final toAddressBnb = "bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2";
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
      expect(tx.coinType, TWCoinType.TWCoinTypeDogecoin);
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
                fromAddressDoge, TWCoinType.TWCoinTypeDogecoin)
            .data,
        amount: $fixnum.Int64(16845776096),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.TWCoinTypeDogecoin));
      expect(output.error, Common.SigningError.OK);
      expectHex(output.encoded,
          '0100000001e82f0a6defb23a364a1b0f6c1831608168b32554872692675a75d1fd6ac38999010000006b4830450221008660de3d3123a9e6831517265fb84c4fb2bfc4b98366dbfb4b63bc78a5812cce02201a0673af15edab604d9cd89f0e2842ccdd973e107ff9cd08dcf45d8c0b27c5dd0121039535d01e184b4a6d624e7ab007612e2558697fbed29274e6474f17e70d31ce5afcffffff0300e40b54020000001976a9146bb602e5e8eca75c7f6f25f766254658581db71688ac40490698010000001976a9149f64d0c07876a1dbce40cdce328bc7ecd8182b2288ac0000000000000000496a473d3a424e422e425553442d4244313a626e623173346b616c6c786e67707973707a6d366e72657a6b6d6c3972677977366b78707734666872323a3738393632373436383a743a3000000000');

      // similar real transaction:
      // https://viewblock.io/thorchain/tx/E7588A6A4C6B9DBA8B9AD8B0834655F9D9E5861744B5493E711623E320B981A5
      // https://dogechain.info/tx/e7588a6a4c6b9dba8b9ad8b0834655f9d9e5861744b5493e711623e320b981a5
      // https://binance.mintscan.io/txs/A5943D315BFD501DD5FC212F5A505772A20DDB154A8B5760A9897ABB8114CBDB
    });

    test('SwapLtcBusd', () {
      final vaultLTC = "ltc1qmca5runvg3hygarulu34evdulcdfda7z7zquhn";
      final fromAddressLTC = "ltc1qyu9qvkukx99r6yadxlk3t2x78a7dxe73s3r4x3";
      final toAddressBnb = "bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2";

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
      expect(tx.coinType, TWCoinType.TWCoinTypeLitecoin);
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
                fromAddressLTC, TWCoinType.TWCoinTypeLitecoin)
            .data,
        amount: $fixnum.Int64(34183600),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.TWCoinTypeLitecoin));
      expect(output.error, Common.SigningError.OK);
      expectHex(output.encoded,
          '0100000000010149c73c04dbbf9ac6327168e6aa9d6f32167c3ddb62c392cf4c589818dae6716e0000000000fcffffff03c0e1e40000000000160014de3b41f26c446e44747cff235cb1bcfe1a96f7c2fc3d240100000000160014270a065b96314a3d13ad37ed15a8de3f7cd367d10000000000000000496a473d3a424e422e425553442d4244313a626e623173346b616c6c786e67707973707a6d366e72657a6b6d6c3972677977366b78707734666872323a3937373234303531343a743a3002483045022100fb9df5ef12c26648a50af298c5319ec52ea0287aa1405e07d817c606bb17a23502206520b087a9155a7d8c04b54b8ee3405fad9c3d22cf2c7cac06197ce555d56077012103acefb7d95b8c1da28f17400740d7e1124dbee3cfbe55646deb28198d570ea26b00000000');

      // https://viewblock.io/thorchain/tx/FBB450335ED839C5FE3DCB9CBC0999DA6E6E52B787D1B165D3FA47E6273CCF5F
      // https://blockchair.com/litecoin/transaction/fbb450335ed839c5fe3dcb9cbc0999da6e6e52b787d1b165d3fa47e6273ccf5f
      // https://binance.mintscan.io/txs/7071DF040641D9C62EAA5D7AE5CDAC0C408FE64406261EC32417BD919684707C
    });

    test('SwapBchBusd', () {
      final vaultBCH = "qpsfh5xvk7mgf9e6kl4e045nm6awl5hmks9x7h5ad6";
      final fromAddressBCH = "qr50u7hy3xcr3j0w9j5nfx2gevjqgfm42ykc2hqgy4";
      final toAddressBnb = "bnb1s4kallxngpyspzm6nrezkml9rgyw6kxpw4fhr2";

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
      expect(tx.coinType, TWCoinType.TWCoinTypeBitcoinCash);
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
                fromAddressBCH, TWCoinType.TWCoinTypeBitcoinCash)
            .data,
        amount: $fixnum.Int64(14118938),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.TWCoinTypeLitecoin));
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
                hrpForString('bc'),
                TWPrivateKey.createWithData(TestKey1Btc).getPublicKeyByType(
                    TWPublicKeyType.TWPublicKeyTypeSECP256k1))
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
                Address1Btc, TWCoinType.TWCoinTypeBitcoin)
            .data,
        amount: $fixnum.Int64(450000),
      ));
      tx.useMaxAmount = false;

      // sign and encode resulting input
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));
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
      final myAddress = "0x0d6aA74992eDDaaf430eadca63B87f4C99Aef8dE";
      final vaultAddress = "0x1f3b3c6ac151bf32409fe139a5d55f3d9444729c";
      final routerAddress = "0xD37BbE5744D730a1d98d8DC97c42F0Ca46aD7146";
      final usdtTokenId = "0xdAC17F958D2ee523a2206206994597C13D831ec7";
      final amount = 70000000;
      final expirationTime = 1775669796;

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
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.TWCoinTypeCosmos));
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

      final vaultAddress = "0xa56f6Cb1D66cd80150b1ea79643b4C5900D6E36E";

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
          TWAnySigner.sign(tx.writeToBuffer(), TWCoinType.TWCoinTypeEthereum));
      expectHex(output.encoded,
          '02f9019482a86a0684773594008505d21dba008301a90a948f66c4ae756bebc49ec8b81966dd8bba9f12754980b9012444bc937b000000000000000000000000a56f6cb1d66cd80150b1ea79643b4c5900d6e36e000000000000000000000000b97ef9ef8734c71904d8002f8b6bc66dd9c48a6e00000000000000000000000000000000000000000000000000000000000f424000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000069d6922400000000000000000000000000000000000000000000000000000000000000443d3a54484f522e52554e453a74686f72316164366861707970756d753773753561643971727932643734797439643536667373613737343a35313633383835373a743a3000000000000000000000000000000000000000000000000000000000c080a04a3a01941906579f1c6888771fe0621d66ee78998bfbb87219c0b5970235fc5ca03aefe4bb0c074f90798e078270c380930f4ae75366217f85535dd9be196a4244');
      // https://viewblock.io/thorchain/tx/B5E88D61157E7073995CA8729B75DAB2C1684A7B145DB711327CA4B8FF7DBDE7
      // https://snowtrace.io/tx/0xb5e88d61157e7073995ca8729b75dab2c1684a7b145db711327ca4b8ff7dbde7
      // https://thorchain.net/tx/B5E88D61157E7073995CA8729B75DAB2C1684A7B145DB711327CA4B8FF7DBDE7
    });
  });
}
