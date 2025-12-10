import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Tezos.pb.dart' as Tezos;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerTezos', () {
    const coin = TWCoinType.Tezos;

    test('SignFA12', () {
      // https://ghostnet.tzkt.io/ooTBu7DLbeC7DmVfXEsp896A6WTwimedbsM9QRqUVtqA8Vxt6D3/2993172
      final key = parse_hex(
          "363265a0b3f06661001cab8b4f3ca8fd97ae70608184979cf7300836f57ec2d6");

      final input = Tezos.SigningInput(
        privateKey: key,
        operationList: Tezos.OperationList(
          branch: 'BL8euoCWqNCny9AR3AKjnpi38haYMxjei1ZqNHuXMn19JSQnoWp',
          operations: [
            Tezos.Operation(
              transactionOperationData: Tezos.TransactionOperationData(
                amount: $fixnum.Int64(0),
                destination: 'KT1EwXFWoG9bYebmF4pYw72aGjwEnBWefgW5',
                parameters: Tezos.OperationParameters(
                  fa12Parameters: Tezos.FA12Parameters(
                    entrypoint: 'transfer',
                    from: 'tz1ioz62kDw6Gm5HApeQtc1PGmN2wPBtJKUP',
                    to: 'tz1ioz62kDw6Gm5HApeQtc1PGmN2wPBtJKUP',
                    value: '123',
                  ),
                ),
              ),
              source: 'tz1ioz62kDw6Gm5HApeQtc1PGmN2wPBtJKUP',
              fee: $fixnum.Int64(100000),
              counter: $fixnum.Int64(2993172),
              gasLimit: $fixnum.Int64(100000),
              storageLimit: $fixnum.Int64(0),
              kind: Tezos.Operation_OperationKind.TRANSACTION,
            ),
          ],
        ),
      );

      final output = Tezos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(hex(output.encoded),
          '3756ef37b1be849e3114643f0aa5847cabf9a896d3bfe4dd51448de68e91da016c00fe2ce0cccc0214af521ad60c140c5589b4039247a08d0694d8b601a08d0600000145bd8a65cc48159d8ea60a55df735b7c5ad45f0e00ffff087472616e736665720000005907070100000024747a31696f7a36326b447736476d35484170655174633150476d4e32775042744a4b555007070100000024747a31696f7a36326b447736476d35484170655174633150476d4e32775042744a4b555000bb012914d768155fba2df319a81136e8e3e573b9cadb1676834490c90212615d271da029b6b0531e290e9063bcdb40bea43627af048b18e036f02be2b6b22fc8b307');
    });

    test('SignFA2', () {
      // https://ghostnet.tzkt.io/onxLBoPaf23M3A8kHTwncSFG2GVXPfnGXUhkC8BhKj8QDdCEbng
      final key = parse_hex(
          "363265a0b3f06661001cab8b4f3ca8fd97ae70608184979cf7300836f57ec2d6");

      final input = Tezos.SigningInput(
        privateKey: key,
        operationList: Tezos.OperationList(
          branch: 'BKvEAX9HXfJZWYfTQbR1C7B3ADoKY6a1aKVRF7qQqvc9hS8Rr3m',
          operations: [
            Tezos.Operation(
              transactionOperationData: Tezos.TransactionOperationData(
                amount: $fixnum.Int64(0),
                destination: 'KT1DYk1XDzHredJq1EyNkDindiWDqZyekXGj',
                parameters: Tezos.OperationParameters(
                  fa2Parameters: Tezos.FA2Parameters(
                    entrypoint: 'transfer',
                    txsObject: [
                      Tezos.TxObject(
                        from: 'tz1ioz62kDw6Gm5HApeQtc1PGmN2wPBtJKUP',
                        txs: [
                          Tezos.Txs(
                            amount: '10',
                            tokenId: '0',
                            to: 'tz1ioz62kDw6Gm5HApeQtc1PGmN2wPBtJKUP',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              source: 'tz1ioz62kDw6Gm5HApeQtc1PGmN2wPBtJKUP',
              fee: $fixnum.Int64(100000),
              counter: $fixnum.Int64(2993173),
              gasLimit: $fixnum.Int64(100000),
              storageLimit: $fixnum.Int64(0),
              kind: Tezos.Operation_OperationKind.TRANSACTION,
            ),
          ],
        ),
      );

      final output = Tezos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(hex(output.encoded),
          '1b1f9345dc9f77bd24b09034d1d2f9a28f02ac837f49db54b8d68341f53dc4b76c00fe2ce0cccc0214af521ad60c140c5589b4039247a08d0695d8b601a08d0600000136767f88850bae28bfb9f46b73c5e87ede4de12700ffff087472616e7366657200000066020000006107070100000024747a31696f7a36326b447736476d35484170655174633150476d4e32775042744a4b5550020000003107070100000024747a31696f7a36326b447736476d35484170655174633150476d4e32775042744a4b555007070000000a552d24710d6c59383286700c6c2917b25a6c1fa8b587e593c289dd47704278796792f1e522c1623845ec991e292b0935445e6994850bd03f035a006c5ed93806');
    });

    test('BlindSign', () {
      // Successfully broadcasted: https://ghostnet.tzkt.io/oobGgTkDNz9eqGVXiU4wShPZydkroCrmbKjoDcfSqhnM7GmcdEu/15229334
      final key = parse_hex(
          "3caf5afaed067890cd850efd1555df351aa482badb4a541c29261f1acf261bf5");
      final bytes = parse_hex(
          "64aa7792af40de41371a72b3342daa7bf3d2b5a84511e9074341fdd52148dd9d6c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542850f96c3a1079d780080ade2040155959998da7e79231e2be8ed8ff373ac1b1574b000ffff04737761700000009e070703060707020000000807070508030b000007070100000018323032332d30322d32345431333a34303a32322e3332385a07070100000024747a31625443473754415535523736356f4458694c4d63385a4537546a7376617868484807070100000024747a315377326d4641557a626b6d37646b47434472626542734a54547456374a4438457907070080dac409070700bdf892a1a291e196aa0503066c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542cd0497c3a107f10f180001543aa1803f0bbe2099809ab067dfa8a4cbc1c26a00ffff07617070726f76650000002d070701000000244b5431516f64676b5974754e79664a726a72673854515a586d64544643616d373268533900006c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542cd0498c3a107f70f090001543aa1803f0bbe2099809ab067dfa8a4cbc1c26a00ffff07617070726f766500000036070701000000244b5431516f64676b5974754e79664a726a72673854515a586d64544643616d373268533900bdf892a1a291e196aa056c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542e71599c3a107fabb01400001b1f0d7affc39861f7f5c75f917f683d2e9f55e3100ffff04737761700000009a070700000707000007070001070700bdf892a1a291e196aa05070700a3f683c2a6d80a07070100000018323032332d30322d32345431333a34303a32322e3332385a070705090100000024747a31625443473754415535523736356f4458694c4d63385a4537546a7376617868484805090100000024747a315377326d4641557a626b6d37646b47434472626542734a54547456374a443845796c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542cd049ac3a107f50f1b000193d22b59c496c94504729be1c671ec1d1d7a9cf000ffff107570646174655f6f70657261746f72730000005f020000005a050507070100000024747a31625443473754415535523736356f4458694c4d63385a4537546a73766178684848070701000000244b543147504a44546638475a73704363616e6147324b684d764775334e4a52717572617400006c00ad756cb46ba6f59efa8bd10ff544ba9d20d0954285109bc3a107a0820100000155959998da7e79231e2be8ed8ff373ac1b1574b000ffff0473776170000000a1070703060707020000000807070508030b000807070100000018323032332d30322d32345431333a34303a32322e3332385a07070100000024747a31625443473754415535523736356f4458694c4d63385a4537546a7376617868484807070100000024747a315377326d4641557a626b6d37646b47434472626542734a54547456374a44384579070700a3f683c2a6d80a070700a4f096bfbe9df6f0e00603066c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542cd049cc3a107ed0f00000193d22b59c496c94504729be1c671ec1d1d7a9cf000ffff107570646174655f6f70657261746f72730000005f020000005a050807070100000024747a31625443473754415535523736356f4458694c4d63385a4537546a73766178684848070701000000244b543147504a44546638475a73704363616e6147324b684d764775334e4a5271757261740000");

      final input = Tezos.SigningInput(
        privateKey: key,
        encodedOperations: bytes,
      );

      final output = Tezos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(hex(output.encoded),
          '64aa7792af40de41371a72b3342daa7bf3d2b5a84511e9074341fdd52148dd9d6c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542850f96c3a1079d780080ade2040155959998da7e79231e2be8ed8ff373ac1b1574b000ffff04737761700000009e070703060707020000000807070508030b000007070100000018323032332d30322d32345431333a34303a32322e3332385a07070100000024747a31625443473754415535523736356f4458694c4d63385a4537546a7376617868484807070100000024747a315377326d4641557a626b6d37646b47434472626542734a54547456374a4438457907070080dac409070700bdf892a1a291e196aa0503066c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542cd0497c3a107f10f180001543aa1803f0bbe2099809ab067dfa8a4cbc1c26a00ffff07617070726f76650000002d070701000000244b5431516f64676b5974754e79664a726a72673854515a586d64544643616d373268533900006c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542cd0498c3a107f70f090001543aa1803f0bbe2099809ab067dfa8a4cbc1c26a00ffff07617070726f766500000036070701000000244b5431516f64676b5974754e79664a726a72673854515a586d64544643616d373268533900bdf892a1a291e196aa056c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542e71599c3a107fabb01400001b1f0d7affc39861f7f5c75f917f683d2e9f55e3100ffff04737761700000009a070700000707000007070001070700bdf892a1a291e196aa05070700a3f683c2a6d80a07070100000018323032332d30322d32345431333a34303a32322e3332385a070705090100000024747a31625443473754415535523736356f4458694c4d63385a4537546a7376617868484805090100000024747a315377326d4641557a626b6d37646b47434472626542734a54547456374a443845796c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542cd049ac3a107f50f1b000193d22b59c496c94504729be1c671ec1d1d7a9cf000ffff107570646174655f6f70657261746f72730000005f020000005a050507070100000024747a31625443473754415535523736356f4458694c4d63385a4537546a73766178684848070701000000244b543147504a44546638475a73704363616e6147324b684d764775334e4a52717572617400006c00ad756cb46ba6f59efa8bd10ff544ba9d20d0954285109bc3a107a0820100000155959998da7e79231e2be8ed8ff373ac1b1574b000ffff0473776170000000a1070703060707020000000807070508030b000807070100000018323032332d30322d32345431333a34303a32322e3332385a07070100000024747a31625443473754415535523736356f4458694c4d63385a4537546a7376617868484807070100000024747a315377326d4641557a626b6d37646b47434472626542734a54547456374a44384579070700a3f683c2a6d80a070700a4f096bfbe9df6f0e00603066c00ad756cb46ba6f59efa8bd10ff544ba9d20d09542cd049cc3a107ed0f00000193d22b59c496c94504729be1c671ec1d1d7a9cf000ffff107570646174655f6f70657261746f72730000005f020000005a050807070100000024747a31625443473754415535523736356f4458694c4d63385a4537546a73766178684848070701000000244b543147504a44546638475a73704363616e6147324b684d764775334e4a5271757261740000e10077fc3068aaaf1c7779e1dc2c396b3b40d73ddda04648bf4b16ac2e747c89b461771488e80da3aa30fc18c90de99fd358bfb76683f3c3ec250b1ee09b6d07');
    });

    test('Sign', () {
      final key = parse_hex(
          "2e8905819b8723fe2c1d161860e5ee1830318dbf49a83bd451cfb8440c28bd6f");
      final revealKey = parse_hex(
          "311f002e899cdd9a52d96cb8be18ea2bbab867c505da2b44ce10906f511cff95");

      final input = Tezos.SigningInput(
        privateKey: key,
        operationList: Tezos.OperationList(
          branch: 'BL8euoCWqNCny9AR3AKjnpi38haYMxjei1ZqNHuXMn19JSQnoWp',
          operations: [
            Tezos.Operation(
              revealOperationData: Tezos.RevealOperationData(
                publicKey: revealKey,
              ),
              source: 'tz1XVJ8bZUXs7r5NV8dHvuiBhzECvLRLR3jW',
              fee: $fixnum.Int64(1272),
              counter: $fixnum.Int64(30738),
              gasLimit: $fixnum.Int64(10100),
              storageLimit: $fixnum.Int64(257),
              kind: Tezos.Operation_OperationKind.REVEAL,
            ),
            Tezos.Operation(
              transactionOperationData: Tezos.TransactionOperationData(
                amount: $fixnum.Int64(1),
                destination: 'tz1XVJ8bZUXs7r5NV8dHvuiBhzECvLRLR3jW',
              ),
              source: 'tz1XVJ8bZUXs7r5NV8dHvuiBhzECvLRLR3jW',
              fee: $fixnum.Int64(1272),
              counter: $fixnum.Int64(30739),
              gasLimit: $fixnum.Int64(10100),
              storageLimit: $fixnum.Int64(257),
              kind: Tezos.Operation_OperationKind.TRANSACTION,
            ),
          ],
        ),
      );

      final output = Tezos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(hex(output.encoded),
          '3756ef37b1be849e3114643f0aa5847cabf9a896d3bfe4dd51448de68e91da016b0081faa75f741ef614b0e35fcc8c90dfa3b0b95721f80992f001f44e810200311f002e899cdd9a52d96cb8be18ea2bbab867c505da2b44ce10906f511cff95006c0081faa75f741ef614b0e35fcc8c90dfa3b0b95721f80993f001f44e810201000081faa75f741ef614b0e35fcc8c90dfa3b0b9572100ca20897ea1fd0251b3bb4f9acfe948f579f9fd4767a28e9a437f30a1193d8cc66d7b8084da70d480fd08873a47e39e4e6155879fe679f7dd2e4643be68c74205');
    });

    test('SignMainnet', () {
      final wallet = TWHDWallet.createWithMnemonic(
          'hen betray system volcano excess wash viable joke elder boil goat cricket');
      final privateKey = wallet.getKeyForCoin(coin);
      final publicKey = privateKey.getPublicKeyEd25519();
      final address = coin.deriveAddressFromPublicKey(publicKey);
      print(address);

      final input = Tezos.SigningInput(
        privateKey: privateKey.data,
        operationList: Tezos.OperationList(
          branch: 'BMWRrvZwJHmUhQEmGET9pshBJ2tTkqoQ8TF1vu78iaDTH98HL3H',
          operations: [
            Tezos.Operation(
              revealOperationData: Tezos.RevealOperationData(
                publicKey: publicKey.data,
              ),
              source: address,
              fee: $fixnum.Int64(1272),
              counter: $fixnum.Int64(187815742),
              gasLimit: $fixnum.Int64(10100),
              storageLimit: $fixnum.Int64(257),
              kind: Tezos.Operation_OperationKind.REVEAL,
            ),
            Tezos.Operation(
              transactionOperationData: Tezos.TransactionOperationData(
                amount: $fixnum.Int64(1),
                destination: 'tz1XVJ8bZUXs7r5NV8dHvuiBhzECvLRLR3jW',
              ),
              source: address,
              fee: $fixnum.Int64(1272),
              counter: $fixnum.Int64(187815743),
              gasLimit: $fixnum.Int64(10100),
              storageLimit: $fixnum.Int64(257),
              kind: Tezos.Operation_OperationKind.TRANSACTION,
            ),
          ],
        ),
      );

      final output = Tezos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://tzkt.io/oownY91ffLuq3ehdTmDy7rpvmFh2BYvmchKqzHcchoiEvcq4A25/187815742
      expect(
        hex(output.encoded),
        'ec7a7f24aa912d8a52c6823a759e04957049ad70ae14d2b90f9bf92d1f3b8a326b00e1adcf685eeadda7d2552cd7d83e9ca07bf2793bf809beaec759f44e81020044ec60cb2d32d9b3f9087a46f18a2ff1bb9b9a798d7738b62ede87d1e721a624006c00e1adcf685eeadda7d2552cd7d83e9ca07bf2793bf809bfaec759f44e810201000081faa75f741ef614b0e35fcc8c90dfa3b0b95721000fc4263d2ba5ad2b4e770c86f50323726eefce1df5fc7b84cbe59cbb0cc9f583c37b3ee3e765a41b3e06101d75951864a22aea4c9c95ed23aed89eab2073bf03',
      );
    });

    test('SignJSON', () {
      const json =
          '{"operationList": {"branch": "BL8euoCWqNCny9AR3AKjnpi38haYMxjei1ZqNHuXMn19JSQnoWp","operations": [{"source": "tz1XVJ8bZUXs7r5NV8dHvuiBhzECvLRLR3jW","fee": 1272,"counter": 30738,"gasLimit": 10100,"storageLimit": 257,"kind": 107,"revealOperationData": {"publicKey": "QpqYbIBypAofOj4qtaWBm7Gy+2mZPFAEg3gVudxVkj4="}},{"source": "tz1XVJ8bZUXs7r5NV8dHvuiBhzECvLRLR3jW","fee": 1272,"counter": 30739,"gasLimit": 10100,"storageLimit": 257,"kind": 108,"transactionOperationData": {"destination": "tz1XVJ8bZUXs7r5NV8dHvuiBhzECvLRLR3jW","amount": 1}}]}}';
      final key = parse_hex(
          '2e8905819b8723fe2c1d161860e5ee1830318dbf49a83bd451cfb8440c28bd6f');
      final result = TWAnySigner.signJSON(json: json, key: key, coin: coin);

      expect(TWAnySigner.supportsJSON(coin), true);
      expect(result,
          '3756ef37b1be849e3114643f0aa5847cabf9a896d3bfe4dd51448de68e91da016b0081faa75f741ef614b0e35fcc8c90dfa3b0b95721f80992f001f44e810200429a986c8072a40a1f3a3e2ab5a5819bb1b2fb69993c5004837815b9dc55923e006c0081faa75f741ef614b0e35fcc8c90dfa3b0b95721f80993f001f44e810201000081faa75f741ef614b0e35fcc8c90dfa3b0b957210097e828f0ec91b827995ef3ee81aac244f39f9961f2b1479626e228a14b80e860ae1dd3818648222c4b6aebcd3c57de8acebd1640f35c498e900e61876b7ecf0a');
    });
  });
}
