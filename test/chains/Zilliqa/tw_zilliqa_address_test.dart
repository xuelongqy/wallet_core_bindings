import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TWZilliqaCoinType', () {
    const coin = TWCoinType.TWCoinTypeZilliqa;

    test('TWCoinType', () {
      final string = 'zil1mk6pqphhkmaguhalq6n3cq0h38ltcehg0rfmv6';
      expect(TWAnyAddress.isValid(string, coin), true);

      expect(
        TWAnyAddress.isValid(
            '0x7FCcaCf066a5F26Ee3AFfc2ED1FA9810Deaa632C', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t4', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t4', coin),
        false,
      );

      final address = TWAnyAddress(string, coin);
      final des = address.description;

      final expectedKeyHash = "Ddb41006F7B6FA8e5FBF06A71c01F789FeBC66e8";
      final keyHash = address.data;
      final keyHashString = String.fromCharCodes(keyHash);

      expect(des, 'zil1mk6pqphhkmaguhalq6n3cq0h38ltcehg0rfmv6');
      expect(keyHashString, expectedKeyHash);
    });
  });
}
