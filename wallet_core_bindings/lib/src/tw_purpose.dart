part of '../wallet_core_bindings.dart';

/// HD wallet purpose
///
/// \see https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki
/// \see https://github.com/bitcoin/bips/blob/master/bip-0049.mediawiki
/// \see https://github.com/bitcoin/bips/blob/master/bip-0084.mediawiki
enum TWPurpose {
  BIP44(44),
  BIP49(49),
  BIP84(84),
  BIP86(86),
  BIP1852(1852);

  final int purpose;

  const TWPurpose(this.purpose);

  /// Find a purpose enum by its value.
  static TWPurpose find(int purpose) {
    return values.firstWhere((element) => element.purpose == purpose);
  }
}
