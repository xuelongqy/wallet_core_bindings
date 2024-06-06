import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

void main() {
  initTest();

  group(TWHRP, () {
    test('StringForHRP', () {
      expect(TWHRP.Unknown.string, null);
      expect(TWHRP.Bitcoin.string, "bc");
      expect(TWHRP.Litecoin.string, "ltc");
      expect(TWHRP.BitcoinCash.string, "bitcoincash");
      expect(TWHRP.Binance.string, "bnb");
      expect(TWHRP.Cosmos.string, "cosmos");
      expect(TWHRP.DigiByte.string, "dgb");
      expect(TWHRP.Groestlcoin.string, "grs");
      expect(TWHRP.IoTeX.string, "io");
      expect(TWHRP.Qtum.string, "qc");
      expect(TWHRP.Zilliqa.string, "zil");
      expect(TWHRP.Viacoin.string, "via");
      expect(TWHRP.Terra.string, "terra");
      expect(TWHRP.Monacoin.string, "mona");
      expect(TWHRP.Kava.string, "kava");
      expect(TWHRP.BandChain.string, "band");
      expect(TWHRP.Bluzelle.string, "bluzelle");
      expect(TWHRP.Cardano.string, "addr");
      expect(TWHRP.MultiversX.string, "erd");
      expect(TWHRP.Oasis.string, "oasis");
      expect(TWHRP.THORChain.string, "thor");
      expect(TWHRP.CryptoOrg.string, "cro");
      expect(TWHRP.Osmosis.string, "osmo");
      expect(TWHRP.Secret.string, "secret");
    });

    test('HRPForString', () {
      expect(TWHRP.forString(""), TWHRP.Unknown);
      expect(TWHRP.forString("bc"), TWHRP.Bitcoin);
      expect(TWHRP.forString("ltc"), TWHRP.Litecoin);
      expect(TWHRP.forString("bitcoincash"), TWHRP.BitcoinCash);
      expect(TWHRP.forString("bnb"), TWHRP.Binance);
      expect(TWHRP.forString("cosmos"), TWHRP.Cosmos);
      expect(TWHRP.forString("dgb"), TWHRP.DigiByte);
      expect(TWHRP.forString("grs"), TWHRP.Groestlcoin);
      expect(TWHRP.forString("io"), TWHRP.IoTeX);
      expect(TWHRP.forString("qc"), TWHRP.Qtum);
      expect(TWHRP.forString("zil"), TWHRP.Zilliqa);
      expect(TWHRP.forString("via"), TWHRP.Viacoin);
      expect(TWHRP.forString("terra"), TWHRP.Terra);
      expect(TWHRP.forString("mona"), TWHRP.Monacoin);
      expect(TWHRP.forString("kava"), TWHRP.Kava);
      expect(TWHRP.forString("band"), TWHRP.BandChain);
      expect(TWHRP.forString("addr"), TWHRP.Cardano);
      expect(TWHRP.forString("erd"), TWHRP.MultiversX);
      expect(TWHRP.forString("oasis"), TWHRP.Oasis);
      expect(TWHRP.forString("thor"), TWHRP.THORChain);
      expect(TWHRP.forString("bluzelle"), TWHRP.Bluzelle);
      expect(TWHRP.forString("cro"), TWHRP.CryptoOrg);
      expect(TWHRP.forString("osmo"), TWHRP.Osmosis);
      expect(TWHRP.forString("ecash"), TWHRP.ECash);
      expect(TWHRP.forString("secret"), TWHRP.Secret);
    });

    test('HPRByCoinType', () {
      expect(TWHRP.Bitcoin, TWCoinType.Bitcoin.hrp);
      expect(TWHRP.BitcoinCash, TWCoinType.BitcoinCash.hrp);
      expect(TWHRP.Binance, TWCoinType.Binance.hrp);
      expect(TWHRP.Cosmos, TWCoinType.Cosmos.hrp);
      expect(TWHRP.DigiByte, TWCoinType.DigiByte.hrp);
      expect(TWHRP.Litecoin, TWCoinType.Litecoin.hrp);
      expect(TWHRP.Groestlcoin, TWCoinType.Groestlcoin.hrp);
      expect(TWHRP.IoTeX, TWCoinType.IoTeX.hrp);
      expect(TWHRP.Viacoin, TWCoinType.Viacoin.hrp);
      expect(TWHRP.Qtum, TWCoinType.Qtum.hrp);
      expect(TWHRP.Zilliqa, TWCoinType.Zilliqa.hrp);
      expect(TWHRP.Terra, TWCoinType.Terra.hrp);
      expect(TWHRP.Monacoin, TWCoinType.Monacoin.hrp);
      expect(TWHRP.Kava, TWCoinType.Kava.hrp);
      expect(TWHRP.BandChain, TWCoinType.BandChain.hrp);
      expect(TWHRP.Bluzelle, TWCoinType.Bluzelle.hrp);
      expect(TWHRP.Cardano, TWCoinType.Cardano.hrp);
      expect(TWHRP.MultiversX, TWCoinType.MultiversX.hrp);
      expect(TWHRP.Oasis, TWCoinType.Oasis.hrp);
      expect(TWHRP.THORChain, TWCoinType.THORChain.hrp);
      expect(TWHRP.CryptoOrg, TWCoinType.CryptoOrg.hrp);
      expect(TWHRP.Osmosis, TWCoinType.Osmosis.hrp);
      expect(TWHRP.ECash, TWCoinType.ECash.hrp);
      expect(TWHRP.Secret, TWCoinType.Secret.hrp);

      expect(TWHRP.Unknown, TWCoinType.Aion.hrp);
      expect(TWHRP.Unknown, TWCoinType.Callisto.hrp);
      expect(TWHRP.Unknown, TWCoinType.Dash.hrp);
      expect(TWHRP.Unknown, TWCoinType.Decred.hrp);
      expect(TWHRP.Unknown, TWCoinType.Dogecoin.hrp);
      expect(TWHRP.Unknown, TWCoinType.EOS.hrp);
      expect(TWHRP.Unknown, TWCoinType.Ethereum.hrp);
      expect(TWHRP.Unknown, TWCoinType.EthereumClassic.hrp);
      expect(TWHRP.Unknown, TWCoinType.GoChain.hrp);
      expect(TWHRP.Unknown, TWCoinType.ICON.hrp);
      expect(TWHRP.Unknown, TWCoinType.Kin.hrp);
      expect(TWHRP.Unknown, TWCoinType.NULS.hrp);
      expect(TWHRP.Unknown, TWCoinType.Nano.hrp);
      expect(TWHRP.Unknown, TWCoinType.Nimiq.hrp);
      expect(TWHRP.Unknown, TWCoinType.Ontology.hrp);
      expect(TWHRP.Unknown, TWCoinType.POANetwork.hrp);
      expect(TWHRP.Unknown, TWCoinType.XRP.hrp);
      expect(TWHRP.Unknown, TWCoinType.Stellar.hrp);
      expect(TWHRP.Unknown, TWCoinType.Tezos.hrp);
      expect(TWHRP.Unknown, TWCoinType.Theta.hrp);
      expect(TWHRP.Unknown, TWCoinType.ThunderCore.hrp);
      expect(TWHRP.Unknown, TWCoinType.Viction.hrp);
      expect(TWHRP.Unknown, TWCoinType.Tron.hrp);
      expect(TWHRP.Unknown, TWCoinType.VeChain.hrp);
      expect(TWHRP.Unknown, TWCoinType.Wanchain.hrp);
      expect(TWHRP.Unknown, TWCoinType.Zcash.hrp);
      expect(TWHRP.Unknown, TWCoinType.Firo.hrp);
      expect(TWHRP.Unknown, TWCoinType.Zelcash.hrp);
      expect(TWHRP.Unknown, TWCoinType.Ravencoin.hrp);
      expect(TWHRP.Unknown, TWCoinType.Waves.hrp);
      expect(TWHRP.Unknown, TWCoinType.NEO.hrp);
      expect(TWHRP.Unknown, TWCoinType.Nebl.hrp);
    });
  });
}
