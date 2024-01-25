part of '../wallet_core_bindings.dart';

/// Registered HD version bytes
///
/// \see https://github.com/satoshilabs/slips/blob/master/slip-0132.md
typedef TWHDVersion = bindings.TWHDVersion;

/// Determine if the HD Version is public
///
/// \param [version] HD version
/// \return true if the version is public, false otherwise
bool TWHDVersionIsPublic(int version) =>
    iTWBindings.TWHDVersionIsPublic(version);

/// Determine if the HD Version is private
///
/// \param [version] HD version
/// \return true if the version is private, false otherwise
bool TWHDVersionIsPrivate(int version) =>
    iTWBindings.TWHDVersionIsPrivate(version);
