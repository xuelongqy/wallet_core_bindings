import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('EOSAddress', () {
    const coin = TWCoinType.TWCoinTypeEOS;

    test('Invalid', () {
      expect(TWAnyAddress.isValid('abc', coin), false);
      expect(
        TWAnyAddress.isValid(
            '65QzSGJ579GPNKtZoZkChTzsxR4B48RCfiS82m2ymJR6VZCjTF', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'EOS65QzSGJ579GPNKtZoZkChTzsxR4B48RCfiS82m2ymJR6VZCjT', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'PUB_5hieQEFWh68h6bjaYAY25Ptd2bmqLCaFsunaneh9gZsmSgUBUe', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'PUB_K1_5hieQEFWh68h6bjaYAY25Ptd2bmqLCaFsunaneh9gZsmSgUBUe', coin),
        false,
      );

      expect(
        TWAnyAddress(
                'PUB_K1_65QzSGJ579GPNKtZoZkChTzsxR4B48RCfiS82m2ymJR6VZCjTF',
                coin)
            .pointer,
        nullptr,
      );
    });

    test('Base58', () {
      expect(
        TWAnyAddress(
                'EOS65QzSGJ579GPNKtZoZkChTzsxR4B48RCfiS82m2ymJR6VZCjTF', coin)
            .description,
        'EOS65QzSGJ579GPNKtZoZkChTzsxR4B48RCfiS82m2ymJR6VZCjTF',
      );
      expect(
        TWAnyAddress(
                'EOS55hdeEZHoArE8LLTv6drj2yR1K1AH8wAPT4kjTVSnkmQc3nzwQ', coin)
            .description,
        'EOS55hdeEZHoArE8LLTv6drj2yR1K1AH8wAPT4kjTVSnkmQc3nzwQ',
      );
      expect(
        TWAnyAddress(
                'PUB_R1_5hieQEFWh68h6bjaYAY25Ptd2bmqLCaFsunaneh9gZsmSgUBUe',
                coin)
            .description,
        'PUB_R1_5hieQEFWh68h6bjaYAY25Ptd2bmqLCaFsunaneh9gZsmSgUBUe',
      );
      expect(
        TWAnyAddress(
                'PUB_R1_7M9ckjr6p5CmS3N3yLPg9vcTB5NHmLcMHwZ3iGccEVfbjJRHv3',
                coin)
            .description,
        'PUB_R1_7M9ckjr6p5CmS3N3yLPg9vcTB5NHmLcMHwZ3iGccEVfbjJRHv3',
      );
    });

    test('IsValid', () {
      expect(
        TWAnyAddress.isValid(
            'EOS6Vm7RWMS1KKAM9kDXgggpu4sJkFMEpARhmsWA84tk4P22m29AV', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'PUB_R1_6pQRUVU5vdneRnmjSiZPsvu3zBqcptvg6iK2Vz4vKo4ugnzow3', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'EOS5mGcPvsqFDe8YRrA3yMMjQgjrCa6yiCho79KViDhvxh4ajQjgS', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'PUB_R1_82dMu3zSSfyHYc4cvWJ6SPsHZWB5mBNAyhL53xiM5xpqmfqetN', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'PUB_K1_6enPVMggisfqVVRZ1tj47d9UeHK46CBssoCmAz6sLDMBdtZk78', coin),
        true,
      );
    });
  });
}
