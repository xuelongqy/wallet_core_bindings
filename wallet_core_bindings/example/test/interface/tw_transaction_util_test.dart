import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

void main() {
  initTest();
  group(TWTransactionUtil, () {
    test('CalcTxHashBitcoin', () {
      const coin = TWCoinType.Bitcoin;
      const encodedTx =
          '02000000000101089098890d2653567b9e8df2d1fbe5c3c8bf1910ca7184e301db0ad3b495c88e0100000000ffffffff02581b000000000000225120e8b706a97732e705e22ae7710703e7f589ed13c636324461afa443016134cc051040000000000000160014e311b8d6ddff856ce8e9a4e03bc6d4fe5050a83d02483045022100a44aa28446a9a886b378a4a65e32ad9a3108870bd725dc6105160bed4f317097022069e9de36422e4ce2e42b39884aa5f626f8f94194d1013007d5a1ea9220a06dce0121030f209b6ada5edb42c77fd2bc64ad650ae38314c8f451f3e36d80bc8e26f132cb00000000';
      final txHashResult = TWTransactionUtil.calcTxHash(coin, encodedTx);

      expect(txHashResult,
          '797d17d47ae66e598341f9dfdea020b04d4017dcf9cc33f0e51f7a6082171fb1');
    });

    test('CalcTxHashEthereum', () {
      const coin = TWCoinType.Ethereum;
      const encodedTx =
          'f8aa808509c7652400830130b9946b175474e89094c44da98b954eedeac495271d0f80b844a9059cbb0000000000000000000000005322b34c88ed0691971bf52a7047448f0f4efc840000000000000000000000000000000000000000000000001bc16d674ec8000025a0724c62ad4fbf47346b02de06e603e013f26f26b56fdc0be7ba3d6273401d98cea0032131cae15da7ddcda66963e8bef51ca0d9962bfef0547d3f02597a4a58c931';
      final txHashResult = TWTransactionUtil.calcTxHash(coin, encodedTx);

      expect(txHashResult,
          '0x199a7829fc5149e49b452c2cab76d8fa5a9682fee6e4891b8acb697ac142513e');
    });

    test('CalcTxHashSolana', () {
      const coin = TWCoinType.Solana;
      const encodedTx =
          'AnQTYwZpkm3fs4SdLxnV6gQj3hSLsyacpxDdLMALYWObm722f79IfYFTbZeFK9xHtMumiDOWAM2hHQP4r/GtbARpncaXgOVFv7OgbRLMbuCEJHO1qwcdCbtH72VzyzU8yw9sqqHIAaCUE8xaQTgT6Z5IyZfeyMe2QGJIfOjz65UPAgACBssq8Im1alV3N7wXGODL8jLPWwLhTuCqfGZ1Iz9fb5tXlMOJD6jUvASrKmdtLK/qXNyJns2Vqcvlk+nfJYdZaFpIWiT/tAcEYbttfxyLdYxrLckAKdVRtf1OrNgtZeMCII4SAn6SYaaidrX/AN3s/aVn/zrlEKW0cEUIatHVDKtXO0Qss5EhV/E6kz0BNCgtAytf/s0Botvxt3kGCN8ALqcG3fbh12Whk9nL4UbO63msHLSF7V9bN5E6jPWFfv8Aqe6sdLXiXSDILEtzckCjkjchiSf6zVGpMYiAE5BE2IqHAQUEAgQDAQoMoA8AAAAAAAAG';
      final txHashResult = TWTransactionUtil.calcTxHash(coin, encodedTx);

      expect(txHashResult,
          '3KbvREZUat76wgWMtnJfWbJL74Vzh4U2eabVJa3Z3bb2fPtW8AREP5pbmRwUrxZCESbTomWpL41PeKDcPGbojsej');
    });

    test('CalcTxHashCosmos', () {
      const coin = TWCoinType.Cosmos;
      const encodedTx =
          'CpIBCo8BChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEm8KLWNvc21vczFta3k2OWNuOGVrdHd5MDg0NXZlYzl1cHNkcGhrdHh0MDNna3dseBItY29zbW9zMThzMGhkbnNsbGdjY2x3ZXU5YXltdzRuZ2t0cjJrMHJreWdkemRwGg8KBXVhdG9tEgY0MDAwMDASZQpOCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohAuzvXOQ3owLGf5VGjeSzHzbpEfRn1+alK0HB4T4dVjZJEgQKAggBEhMKDQoFdWF0b20SBDEwMDAQwJoMGkCvvVE6d29P30cO9/lnXyGunWMPxNY12NuqDcCnFkNM0H4CUQdl1Gc9+ogIJbro5nyzZzlv9rl2/GsZox/JXoCX';
      final txHashResult = TWTransactionUtil.calcTxHash(coin, encodedTx);

      expect(txHashResult,
          '85392373F54577562067030BF0D61596C91188AA5E6CA8FFE731BD0349296411');
    });

    test('CalcTxHashTon', () {
      const coin = TWCoinType.TON;
      const encodedTx =
          'te6cckECGwEAA2sAAkWIACm9HPyVOpjCNOG6nbf+EwCONRHHpeMQsIlCoWNKhUaaHgECAgE0AwQBoXNpZ25///8R/////wAAAACACOfqY7L3l3aKc58eNxuJTaeH/fgBw2aG0coM+hjDpjWhJKbYKmsAD8v054HYSuO6vN3bQnV5U19BhsGfe1MDoAUBFP8A9KQT9LzyyAsGAFGAAAAAP///iKrcG+d35KaMMtuxik4jqNofFL51Mu1f8Qf19onqsDlyIAIKDsPIbQMWBwIBIAgJAWJiAC90HaFSSy94Zxb85WYu97uTKIxAlLvolycpcYkWc+8giFAAAAAAAAAAAAAAAAABFgIBSAoLAQLyDALc0CDXScEgkVuPYyDXCx8gghBleHRuvSGCEHNpbnS9sJJfA+CCEGV4dG66jrSAINchAdB01yH6QDD6RPgo+kQwWL2RW+DtRNCBAUHXIfQFgwf0Dm+hMZEw4YBA1yFwf9s84DEg10mBAoC5kTDgcOIXDQIBIA4PAR4g1wsfghBzaWduuvLgin8NAeaO8O2i7fshgwjXIgKDCNcjIIAg1yHTH9Mf0x/tRNDSANMfINMf0//XCgAK+QFAzPkQmiiUXwrbMeHywIffArNQB7Dy0IRRJbry4IVQNrry4Ib4I7vy0IgikvgA3gGkf8jKAMsfAc8Wye1UIJL4D95w2zzYFwIBIBARABm+Xw9qJoQICg65D6AsAgFuEhMCAUgUFQAZrc52omhAIOuQ64X/wAAZrx32omhAEOuQ64WPwAAXsyX7UTQcdch1wsfgABGyYvtRNDXCgCAAAAP27aLt+wL0BCFukmwhjkwCIdc5MHCUIccAs44tAdcoIHYeQ2wg10nACPLgkyDXSsAC8uCTINcdBscSwgBSMLDy0InXTNc5MAGk6GwShAe78uCT10rAAPLgk+1V4tIAAcAAkVvg69csCBQgkXCWAdcsCBwS4lIQseMPINdKGBkaAJYB+kAB+kT4KPpEMFi68uCR7UTQgQFB1xj0BQSdf8jKAEAEgwf0U/Lgi44UA4MH9Fvy4Iwi1woAIW4Bs7Dy0JDiyFADzxYS9ADJ7VQAcjDXLAgkji0h8uCS0gDtRNDSAFETuvLQj1RQMJExnAGBAUDXIdcKAPLgjuLIygBYzxbJ7VST8sCN4gAQk1vbMeHXTNB8Ui06';
      final txHashResult = TWTransactionUtil.calcTxHash(coin, encodedTx);

      expect(txHashResult,
          '437dae441a95a6bccdcdcea2560c313de24f13dd85c76d5d7ecaab1e70a1e52b');
    });

    test('CalcTxHashAptos', () {
      const coin = TWCoinType.Aptos;
      const encodedTx =
          '07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3063000000000000000200000000000000000000000000000000000000000000000000000000000000010d6170746f735f6163636f756e74087472616e7366657200022007968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3008e803000000000000fe4d3200000000006400000000000000c2276ada00000000210020ea526ba1710343d953461ff68641f1b7df5f23b9042ffa2d2a798d3adb3f3d6c405707246db31e2335edc4316a7a656a11691d1d1647f6e864d1ab12f43428aaaf806cf02120d0b608cdd89c5c904af7b137432aacdd60cc53f9fad7bd33578e01';
      final txHashResult = TWTransactionUtil.calcTxHash(coin, encodedTx);

      expect(txHashResult,
          '0xb4d62afd3862116e060dd6ad9848ccb50c2bc177799819f1d29c059ae2042467');
    });

    test('CalcTxHashSui', () {
      const coin = TWCoinType.Sui;
      const encodedTx =
          'AAACAAgQJwAAAAAAAAAgJZ/4B0q0Jcu0ifI24Y4I8D8aeFa998eih3vWT3OLUBUCAgABAQAAAQEDAAAAAAEBANV1rX8Y6UhGKlz2mPVk7zlKdSpx/sYkk6+KBVwBLA1QAQbywsjB2JZN8QGdZhbpcFcZvrq9kx2idVy5SM635olk7AIAAAAAAAAgYEVuxmf1zRBGdoDr+VDtMpIFF12s2Ua7I2ru1XyGF8/Vda1/GOlIRipc9pj1ZO85SnUqcf7GJJOvigVcASwNUAEAAAAAAAAA0AcAAAAAAAAA';
      final txHashResult = TWTransactionUtil.calcTxHash(coin, encodedTx);

      expect(txHashResult, 'HkPo6rYPyDY53x1MBszvSZVZyixVN7CHvCJGX381czAh');
    });
  });
}