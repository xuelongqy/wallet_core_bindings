part of '../wallet_core_bindings.dart';

/// Bitcoin SIGHASH type.
typedef TWBitcoinSigHashType = bindings.TWBitcoinSigHashType;

/// Determines if the given sig hash is single
///
/// \param [type] sig hash type
/// \return true if the sigh hash type is single, false otherwise
bool TWBitcoinSigHashTypeIsSingle(int type) =>
    iTWBindings.TWBitcoinSigHashTypeIsSingle(type);

/// Determines if the given sig hash is none
///
/// \param [type] sig hash type
/// \return true if the sigh hash type is none, false otherwise
bool TWBitcoinSigHashTypeIsNone(int type) =>
    iTWBindings.TWBitcoinSigHashTypeIsNone(type);
