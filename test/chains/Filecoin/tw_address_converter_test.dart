import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

class AddressTest {
  final String filecoin;
  final String eth;

  AddressTest(this.filecoin, this.eth);
}

void main() {
  group('TWFilecoinAddressConverter', () {
    test('ConvertToEth', () {
      final tests = [
        AddressTest("f09876", "0xff00000000000000000000000000000000002694"),
        AddressTest("f410frw6wy7w6sbsguyn3yzeygg34fgf72n5ao5sxyky",
            "0x8dbD6c7Ede90646a61Bbc649831b7c298BFd37A0"),
        // The following addresses can't be converted to ETH. Expect an empty result.
        AddressTest("f15ihq5ibzwki2b4ep2f46avlkrqzhpqgtga7pdrq", ""),
        AddressTest("f24vg6ut43yw2h2jqydgbg2xq7x6f4kub3bg6as6i", ""),
        AddressTest(
            "f3vvmn62lofvhjd2ugzca6sof2j2ubwok6cj4xxbfzz4yuxfkgobpihhd2thlanmsh3w2ptld2gqkn2jvlss4a",
            ""),
        // Should fail since `actorID != 10`. Expect an empty result.
        AddressTest("f432f77777777x32lpna", ""),
        AddressTest("f418446744073709551615ftnkyfaq", ""),
        // The following addresses are invalid. Expect an empty result.
        AddressTest("f432f77777777x32lpn", ""),
        AddressTest("f018446744073709551616", ""),
      ];

      for (final item in tests) {
        final filecoinAddress = item.filecoin;
        final result =
            TWFilecoinAddressConverter.convertToEthereum(filecoinAddress);
        expect(result, item.eth);
      }
    });

    test('ConvertFromEth', () {
      final tests = [
        AddressTest("f410f74aaaaaaaaaaaaaaaaaaaaaaaaaaajuu3nnltyi",
            "0xff00000000000000000000000000000000002694"),
        AddressTest("f410frw6wy7w6sbsguyn3yzeygg34fgf72n5ao5sxyky",
            "0x8dbD6c7Ede90646a61Bbc649831b7c298BFd37A0"),
        AddressTest("f410f2oekwcmo2pueydmaq53eic2i62crtbeyuzx2gmy",
            "0xd388ab098ed3e84c0d808776440b48f685198498"),
        // The following addresses are invalid. Expect an empty result.
        AddressTest("", "0xd388ab098ed3e84c0d808776440b48f68519849"),
        AddressTest("", "0x"),
      ];

      for (final item in tests) {
        final ethAddress = item.eth;
        final result =
            TWFilecoinAddressConverter.convertFromEthereum(ethAddress);
        expect(result, item.filecoin);
      }
    });
  });
}
