import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Tron.pb.dart' as Tron;

import '../../utils.dart';

void main() {
  group('TronSigner', () {
    const coin = TWCoinType.TWCoinTypeTron;

    test('SignDirectTransferAsset', () {
      final input = Tron.SigningInput(
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
        txId:
            '546a3d07164c624809cf4e564a083a7a7974bb3c4eff6bb3e278b0ca21083fcb',
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '546a3d07164c624809cf4e564a083a7a7974bb3c4eff6bb3e278b0ca21083fcb');

      expect(hex(output.signature),
          '77f5eabde31e739d34a66914540f1756981dc7d782c9656f5e14e53b59a15371603a183aa12124adeee7991bf55acc8e488a6ca04fb393b1a8ac16610eeafdfc00');
    });

    test('SignTransferAsset', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          transferAsset: Tron.TransferAssetContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
            toAddress: 'THTR75o8xXAgCTQqpiot2AFRAjvW1tSbVV',
            amount: $fixnum.Int64(4),
            assetName: '1000959',
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1541890116000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1541890116000),
            txTrieRoot: parse_hex(
                "845ab51bf63c2c21ee71a4dc0ac3781619f07a7cd05e1e0bd8ba828979332ffa"),
            parentHash: parse_hex(
                "00000000003cb800a7e69e9144e3d16f0cf33f33a95c7ce274097822c67243c1"),
            number: $fixnum.Int64(3979265),
            witnessAddress:
                parse_hex("41b487cdc02de90f15ac89a68c82f44cbfe3d915ea"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '546a3d07164c624809cf4e564a083a7a7974bb3c4eff6bb3e278b0ca21083fcb');
      expect(hex(output.signature),
          '77f5eabde31e739d34a66914540f1756981dc7d782c9656f5e14e53b59a15371603a183aa12124adeee7991bf55acc8e488a6ca04fb393b1a8ac16610eeafdfc00');
    });

    test('SignTransfer', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          transfer: Tron.TransferContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
            toAddress: 'THTR75o8xXAgCTQqpiot2AFRAjvW1tSbVV',
            amount: $fixnum.Int64(2000000),
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1539295479000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1539295479000),
            txTrieRoot: parse_hex(
                "64288c2db0641316762a99dbb02ef7c90f968b60f9f2e410835980614332f86d"),
            parentHash: parse_hex(
                "00000000002f7b3af4f5f8b9e23a30c530f719f165b742e7358536b280eead2d"),
            number: $fixnum.Int64(3111739),
            witnessAddress:
                parse_hex("415863f6091b8e71766da808b1dd3159790f61de7d"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          'dc6f6d9325ee44ab3c00528472be16e1572ab076aa161ccd12515029869d0451');
      expect(hex(output.signature),
          'ede769f6df28aefe6a846be169958c155e23e7e5c9621d2e8dce1719b4d952b63e8a8bf9f00e41204ac1bf69b1a663dacdf764367e48e4a5afcd6b055a747fb200');
    });

    test('SignFreezeBalanceV2', () {
      // Successfully broadcasted https://nile.tronscan.org/#/transaction/3a46321487ce1fd115da38b3431006ea529f65ef2507f19233f5a23c05abd01d
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          freezeBalanceV2: Tron.FreezeBalanceV2Contract(
            ownerAddress: 'TWWb9EjUWai17YEVB7FR8hreupYJKG9sMR',
            frozenBalance: $fixnum.Int64(10000000),
            resource: 'ENERGY',
          ),
          timestamp: $fixnum.Int64(1676983541337),
          expiration: $fixnum.Int64(1676983599000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1676983485000),
            txTrieRoot: parse_hex(
                "9b54db7f84bd19bbad9ff1fccef894c1aade6879450e9e9e2accec751eaa1f52"),
            parentHash: parse_hex(
                "00000000020cd4c13a67497a3a433a3105bc5a73a041ee3da98407d5a2a2bf1b"),
            number: $fixnum.Int64(34395330),
            witnessAddress:
                parse_hex("4150d3765e4e670727ebac9d5b598f74b75a3d54a7"),
            version: 26,
          ),
        ),
        privateKey: parse_hex(
            "75065f100e38d3f3b4c5c4235834ba8216de62272a4f03532c44b31a5734360a"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '3a46321487ce1fd115da38b3431006ea529f65ef2507f19233f5a23c05abd01d');
      expect(hex(output.signature),
          'd4b539a389f6721b4e9d0eb9f39b62a539069060e1af2a118f06b81737ad9cdb49d5b4fda85f10603012f8de3996da2a1234c21d74ac6ea5e60217d3c10b630900');
    });

    test('WithdrawExpireUnfreezeContract', () {
      // Successfully broadcasted https://nile.tronscan.org/#/transaction/65ff34192eebda9ba7013771ff2da1010615e348b70c046647f41afe865f00eb
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          withdrawExpireUnfreeze: Tron.WithdrawExpireUnfreezeContract(
            ownerAddress: 'TWWb9EjUWai17YEVB7FR8hreupYJKG9sMR',
          ),
          timestamp: $fixnum.Int64(1677574466457),
          expiration: $fixnum.Int64(1677574524000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1677574410000),
            txTrieRoot: parse_hex(
                "0000000000000000000000000000000000000000000000000000000000000000"),
            parentHash: parse_hex(
                "00000000020fce45738ef00be07c350c03d027851308bc19d61c32312c673d3d"),
            number: $fixnum.Int64(34590278),
            witnessAddress:
                parse_hex("41e7860196ad5b5718c1d6326babab039b70b8c1cd"),
            version: 27,
          ),
        ),
        privateKey: parse_hex(
            "75065f100e38d3f3b4c5c4235834ba8216de62272a4f03532c44b31a5734360a"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '65ff34192eebda9ba7013771ff2da1010615e348b70c046647f41afe865f00eb');
      expect(hex(output.signature),
          'ef0361248c118b8afae9c4c8e6dfad1e63eec4fb6c182ae369fa3bbecc2ac29a292838949ad74300b2b7322a110ffd4458224e283181cf6d64df0324b068bb0001');
    });

    test('SignUnFreezeBalanceV2', () {
      // Successfully broadcasted https://nile.tronscan.org/#/transaction/3070adc1743e6fdd20e04a749cc2af691ca26d2ce70e40cc0886be03595f9eeb
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          unfreezeBalanceV2: Tron.UnfreezeBalanceV2Contract(
            ownerAddress: 'TWWb9EjUWai17YEVB7FR8hreupYJKG9sMR',
            unfreezeBalance: $fixnum.Int64(510000000),
            resource: 'ENERGY',
          ),
          timestamp: $fixnum.Int64(1676992267490),
          expiration: $fixnum.Int64(1676992326000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1676992212000),
            txTrieRoot: parse_hex(
                "4b1edc58d14a5c60c083365d8b77771ba626394b445c7a7b8b5d67330bb6c92d"),
            parentHash: parse_hex(
                "00000000020ce000354fbb346d676de268b3f83124381f8496835afe88da4a01"),
            number: $fixnum.Int64(34398209),
            witnessAddress:
                parse_hex("4194a21bec5d0e1dde2151475f72ed158a87eb4817"),
            version: 26,
          ),
        ),
        privateKey: parse_hex(
            "75065f100e38d3f3b4c5c4235834ba8216de62272a4f03532c44b31a5734360a"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '3070adc1743e6fdd20e04a749cc2af691ca26d2ce70e40cc0886be03595f9eeb');
      expect(hex(output.signature),
          '10bc05c47102f1db1a3a4c0b4a6aba028d5a35dda4e505563c3f0ccf95a562cf18b53f7f7053c485299cfc599a432d1f0ee5554a56cd5981ccfff31d79b9868b00');
    });

    test('DelegateResourceContract', () {
      // Successfully broadcasted https://nile.tronscan.org/#/transaction/ceabcd0f105854c13aae12ba35c0766945713c29cee540be1239bb0f1f0cde2c
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          delegateResource: Tron.DelegateResourceContract(
            ownerAddress: 'TWWb9EjUWai17YEVB7FR8hreupYJKG9sMR',
            receiverAddress: 'TPFfHr1CWfTcS9eugQXQmvqHNGufnjxjXP',
            balance: $fixnum.Int64(68000000),
            resource: 'ENERGY',
          ),
          timestamp: $fixnum.Int64(1676991607274),
          expiration: $fixnum.Int64(1676991660000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1676991546000),
            txTrieRoot: parse_hex(
                "0000000000000000000000000000000000000000000000000000000000000000"),
            parentHash: parse_hex(
                "00000000020cdf260ff2357d814141106c375c101913c933c2b5c31a390db7fc"),
            number: $fixnum.Int64(34397991),
            witnessAddress:
                parse_hex("417d3601dbd9d033b034c154868acc2904d9c45565"),
            version: 26,
          ),
        ),
        privateKey: parse_hex(
            "75065f100e38d3f3b4c5c4235834ba8216de62272a4f03532c44b31a5734360a"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          'ceabcd0f105854c13aae12ba35c0766945713c29cee540be1239bb0f1f0cde2c');
      expect(hex(output.signature),
          '664500a76466497a442cecc0e9282a9234483f047c12a997b6206d7f6a9030c70b700c879d7948c4cbdfe339c2c81a29dea18e00e9916504196c1b20cf045ca300');
    });

    test('UnDelegateResourceContract', () {
      // Successfully broadcasted https://nile.tronscan.org/#/transaction/3609519cc700cf2446b5e048864abc4b45e2ba6b7f9f8890d471ba2876599d3b
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          undelegateResource: Tron.UnDelegateResourceContract(
            ownerAddress: 'TWWb9EjUWai17YEVB7FR8hreupYJKG9sMR',
            receiverAddress: 'TPFfHr1CWfTcS9eugQXQmvqHNGufnjxjXP',
            balance: $fixnum.Int64(68000000),
            resource: 'ENERGY',
          ),
          timestamp: $fixnum.Int64(1676992063012),
          expiration: $fixnum.Int64(1676992122000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1676992008000),
            txTrieRoot: parse_hex(
                "85a47017a4380e92d09bac0f8991031e8de13b8b65767a6f5372d3f0992eabcd"),
            parentHash: parse_hex(
                "00000000020cdfbe4d7f36fcbb3d96dd634987b897eaf885001dd62fd92eb263"),
            number: $fixnum.Int64(34398143),
            witnessAddress:
                parse_hex("4196409f85790883057edf03286d08e4aa608c0d0a"),
            version: 26,
          ),
        ),
        privateKey: parse_hex(
            "75065f100e38d3f3b4c5c4235834ba8216de62272a4f03532c44b31a5734360a"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '3609519cc700cf2446b5e048864abc4b45e2ba6b7f9f8890d471ba2876599d3b');
      expect(hex(output.signature),
          'b08e32a704d5a366df499d283d407c428dd50e60665f54ecf967226b75bec37157e6bc23312af07fad9dd3551cd668ce027cc280932fd4772af89d6f0fecf11900');
    });

    test('SignFreezeBalance', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          freezeBalance: Tron.FreezeBalanceContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
            receiverAddress: 'THTR75o8xXAgCTQqpiot2AFRAjvW1tSbVV',
            frozenDuration: $fixnum.Int64(100),
            resource: 'ENERGY',
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1539295479000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1539295479000),
            txTrieRoot: parse_hex(
                "64288c2db0641316762a99dbb02ef7c90f968b60f9f2e410835980614332f86d"),
            parentHash: parse_hex(
                "00000000002f7b3af4f5f8b9e23a30c530f719f165b742e7358536b280eead2d"),
            number: $fixnum.Int64(3111739),
            witnessAddress:
                parse_hex("415863f6091b8e71766da808b1dd3159790f61de7d"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          'd314967bc1d153d649d9f54a1cc78033f0d696a58ff6922f490ddaec82558c83');
      expect(hex(output.signature),
          'aa7cf79fb1692ff432a1a3e520be3355c3e8168c5fa22f6e3b96c2a9f2e2827b49d67d5e6eea5c7e7cf872047d422ce5d4d149c4df752b176d13f8f48920271201');
    });

    test('SignUnFreezeBalance', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          unfreezeBalance: Tron.UnfreezeBalanceContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
            receiverAddress: 'THTR75o8xXAgCTQqpiot2AFRAjvW1tSbVV',
            resource: 'ENERGY',
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1539295479000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1539295479000),
            txTrieRoot: parse_hex(
                "64288c2db0641316762a99dbb02ef7c90f968b60f9f2e410835980614332f86d"),
            parentHash: parse_hex(
                "00000000002f7b3af4f5f8b9e23a30c530f719f165b742e7358536b280eead2d"),
            number: $fixnum.Int64(3111739),
            witnessAddress:
                parse_hex("415863f6091b8e71766da808b1dd3159790f61de7d"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          'c5bd624bb53fed8ce4a7361475263b3a91ae71ef389630e0b3b8693c8c56d7a1');
      expect(hex(output.signature),
          '4b4b12b5fd091d5343335f14ac90bf23ea9a8167d648dd9d10d00c9c9b24731c484937bf133e5010f0338fb70a679a9a2eca8b945574005bc4015b419a68897300');
    });

    test('SignUnFreezeAsset', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          unfreezeAsset: Tron.UnfreezeAssetContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1539295479000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1539295479000),
            txTrieRoot: parse_hex(
                "64288c2db0641316762a99dbb02ef7c90f968b60f9f2e410835980614332f86d"),
            parentHash: parse_hex(
                "00000000002f7b3af4f5f8b9e23a30c530f719f165b742e7358536b280eead2d"),
            number: $fixnum.Int64(3111739),
            witnessAddress:
                parse_hex("415863f6091b8e71766da808b1dd3159790f61de7d"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '432bd5cf77ff134787712724709a672fc6e51763de00292438db02d23931e13d');
      expect(hex(output.signature),
          'f493d8f275538a50bb8a832d759df9cad535bb2c5cc73296b04983f551d8398b6d7a30fc0fdfd73e8a9cac77a1a6a9435dc6309bb98fbb219035e88809a0b65901');
    });

    test('SignWithdrawBalance', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          withdrawBalance: Tron.WithdrawBalanceContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1539295479000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1539295479000),
            txTrieRoot: parse_hex(
                "64288c2db0641316762a99dbb02ef7c90f968b60f9f2e410835980614332f86d"),
            parentHash: parse_hex(
                "00000000002f7b3af4f5f8b9e23a30c530f719f165b742e7358536b280eead2d"),
            number: $fixnum.Int64(3111739),
            witnessAddress:
                parse_hex("415863f6091b8e71766da808b1dd3159790f61de7d"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '69aaa954dcd61f28a6a73e979addece6e36541522e5b3374b18b4ef9bc3de4cb');
      expect(hex(output.signature),
          'cb7d23a5eb23284a25ba6deaa231de0f18d8d103592e3312bff101a4219a3e02167eca24b3f4ce78b34f0c1842b6f7fb8d813f530c4c54342cdedef9f8e1f85100');
    });

    test('SignVoteAsset', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          voteAsset: Tron.VoteAssetContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
            voteAddress: [
              'THTR75o8xXAgCTQqpiot2AFRAjvW1tSbVV',
            ],
            support: true,
            count: 1,
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1539295479000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1539295479000),
            txTrieRoot: parse_hex(
                "64288c2db0641316762a99dbb02ef7c90f968b60f9f2e410835980614332f86d"),
            parentHash: parse_hex(
                "00000000002f7b3af4f5f8b9e23a30c530f719f165b742e7358536b280eead2d"),
            number: $fixnum.Int64(3111739),
            witnessAddress:
                parse_hex("415863f6091b8e71766da808b1dd3159790f61de7d"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '59b5736fb9756124f9470e4fadbcdafdc8c970da7157fa0ad34a41559418bf0a');
      expect(hex(output.signature),
          '501e04b08f359116a26d9ec784abc50830f92a9dc05d2c1aceefe0eba79466d2730b63b6739edf0f1f1972181618b201ce0b4167d14a66abf40eba4097c39ec400');
    });

    test('SignVoteWitness', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          voteWitness: Tron.VoteWitnessContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
            support: true,
            votes: [
              Tron.VoteWitnessContract_Vote(
                voteAddress: 'THTR75o8xXAgCTQqpiot2AFRAjvW1tSbVV',
                voteCount: $fixnum.Int64(3),
              ),
            ],
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1539295479000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1539295479000),
            txTrieRoot: parse_hex(
                "64288c2db0641316762a99dbb02ef7c90f968b60f9f2e410835980614332f86d"),
            parentHash: parse_hex(
                "00000000002f7b3af4f5f8b9e23a30c530f719f165b742e7358536b280eead2d"),
            number: $fixnum.Int64(3111739),
            witnessAddress:
                parse_hex("415863f6091b8e71766da808b1dd3159790f61de7d"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '3f923e9dd9571a66624fafeda27baa3e00aba1709d3fdc5c97c77b81fda18c1f');
      expect(hex(output.signature),
          '79ec1073ae1319ef9303a2f5a515876cfd67f8f0e155bdbde1115d391c05358a3c32f148bfafacf07e1619aaed728d9ffbc2c7e4a5046003c7b74feb86fc68e400');
    });

    test('SignTriggerSmartContract', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          triggerSmartContract: Tron.TriggerSmartContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
            contractAddress: 'THTR75o8xXAgCTQqpiot2AFRAjvW1tSbVV',
            callValue: $fixnum.Int64(0),
            callTokenValue: $fixnum.Int64(10000),
            tokenId: $fixnum.Int64(1),
            data: parse_hex("736f6d652064617461"),
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1539295479000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1539295479000),
            txTrieRoot: parse_hex(
                "64288c2db0641316762a99dbb02ef7c90f968b60f9f2e410835980614332f86d"),
            parentHash: parse_hex(
                "00000000002f7b3af4f5f8b9e23a30c530f719f165b742e7358536b280eead2d"),
            number: $fixnum.Int64(3111739),
            witnessAddress:
                parse_hex("415863f6091b8e71766da808b1dd3159790f61de7d"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '9927d3daae10ad001b25ef3c1bb03073c928cc0e0823f6f3ce404c2b03ce3570');
      expect(hex(output.signature),
          '21a99aafeabdddfdfae86538df048d120a83eb36bbcf5656595919ba6afddacd0a07d0ba051ae80337613174b109f36cb583b6e46ee5aecf6ffe3392fdbb8a2a01');
    });

    test('SignTransferTrc20Contract', () {
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          transferTrc20Contract: Tron.TransferTRC20Contract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
            contractAddress: 'THTR75o8xXAgCTQqpiot2AFRAjvW1tSbVV',
            toAddress: 'TW1dU4L3eNm7Lw8WvieLKEHpXWAussRG9Z',
            amount: intToBytes(1000),
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1539295479000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1539295479000),
            txTrieRoot: parse_hex(
                "64288c2db0641316762a99dbb02ef7c90f968b60f9f2e410835980614332f86d"),
            parentHash: parse_hex(
                "00000000002f7b3af4f5f8b9e23a30c530f719f165b742e7358536b280eead2d"),
            number: $fixnum.Int64(3111739),
            witnessAddress:
                parse_hex("415863f6091b8e71766da808b1dd3159790f61de7d"),
            version: 3,
          ),
        ),
        privateKey: parse_hex(
            "2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54"),
      );

      final output = Tron.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(output.id),
          '0d644290e3cf554f6219c7747f5287589b6e7e30e1b02793b48ba362da6a5058');
      expect(hex(output.signature),
          'bec790877b3a008640781e3948b070740b1f6023c29ecb3f7b5835433c13fc5835e5cad3bd44360ff2ddad5ed7dc9d7dee6878f90e86a40355b7697f5954b88c01');
    });
  });
}
