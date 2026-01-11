part of '../wallet_core_bindings.dart';

/// Registered HD version bytes
///
/// \see https://github.com/satoshilabs/slips/blob/master/slip-0132.md
enum TWHDVersion {
  None(0),
  XPUB(76067358),
  XPRV(76066276),
  YPUB(77429938),
  YPRV(77428856),
  ZPUB(78792518),
  ZPRV(78791436),
  VPUB(73342198),
  VPRV(73341116),
  TPUB(70617039),
  TPRV(70615956),
  LTUB(27108450),
  LTPV(27106558),
  MTUB(28471030),
  MTPV(28469138),
  TTUB(70711009),
  TTPV(70709117),
  DPUB(50178342),
  DPRV(50177256),
  DGUB(49990397),
  DGPV(49988504);

  final int value;

  const TWHDVersion(this.value);

  /// Find a HD version enum by its value.
  static TWHDVersion find(int value) {
    return values.firstWhere((element) => element.value == value);
  }

  /// Determine if the HD Version is public
  ///
  /// \return true if the version is public, false otherwise
  bool get isPublic => _hdVersionImpl.isPublic(value);

  /// Determine if the HD Version is private
  ///
  /// \return true if the version is private, false otherwise
  bool get isPrivate => _hdVersionImpl.isPrivate(value);
}
