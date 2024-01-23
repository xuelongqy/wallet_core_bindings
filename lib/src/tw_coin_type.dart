part of '../wallet_core_bindings.dart';

/// Coin type for Level 2 of BIP44.
///
/// \see https://github.com/satoshilabs/slips/blob/master/slip-0044.md
typedef TWCoinType = bindings.TWCoinType;

/// Returns the blockchain for a coin type.
///
/// \param [coin] A coin type
/// \return blockchain associated to the given coin type
int TWCoinTypeBlockchain(int coin) => iTWBindings.TWCoinTypeBlockchain(coin);

/// Returns the purpose for a coin type.
///
/// \param [coin] A coin type
/// \return purpose associated to the given coin type
int TWCoinTypePurpose(int coin) => iTWBindings.TWCoinTypeBlockchain(coin);

/// Returns the curve that should be used for a coin type.
///
/// \param [coin] A coin type
/// \return curve that should be used for the given coin type
int TWCoinTypeCurve(int coin) => iTWBindings.TWCoinTypeBlockchain(coin);

/// Returns the xpub HD version that should be used for a coin type.
///
/// \param [coin] A coin type
/// \return xpub HD version that should be used for the given coin type
int TWCoinTypeXpubVersion(int coin) => iTWBindings.TWCoinTypeXpubVersion(coin);

/// Returns the xprv HD version that should be used for a coin type.
///
/// \param [coin] A coin type
/// \return the xprv HD version that should be used for the given coin type.
int TWCoinTypeXprvVersion(int coin) => iTWBindings.TWCoinTypeXprvVersion(coin);

/// Validates an address string.
///
/// \param [coin] A coin type
/// \param [address] A public address
/// \return true if the address is a valid public address of the given coin, false otherwise.
bool TWCoinTypeValidate(int coin, String address) =>
    iTWBindings.TWCoinTypeValidate(coin, TWString(address).pointer);

/// Returns the default derivation path for a particular coin.
///
/// \param [coin] A coin type
/// \return the default derivation path for the given coin type.
String TWCoinTypeDerivationPath(int coin, int derivation) =>
    TWString.fromPointer(iTWBindings.TWCoinTypeDerivationPath(coin)).toString();

/// Returns the derivation path for a particular coin with the explicit given derivation.
///
/// \param [coin] A coin type
/// \param [derivation] A derivation type
/// \return the derivation path for the given coin with the explicit given derivation
String TWCoinTypeDerivationPathWithDerivation(int coin, int derivation) =>
    TWString.fromPointer(iTWBindings.TWCoinTypeDerivationPathWithDerivation(
            coin, derivation))
        .toString();

/// Derives the address for a particular coin from the private key.
///
/// \param [coin] A coin type
/// \param [privateKey] A valid private key
/// \return Derived address for the given coin from the private key.
String TWCoinTypeDeriveAddress(int coin, TWPrivateKey privateKey) =>
    TWString.fromPointer(
            iTWBindings.TWCoinTypeDeriveAddress(coin, privateKey.pointer))
        .toString();

/// Derives the address for a particular coin from the public key.
///
/// \param [coin] A coin type
/// \param [publicKey] A valid public key
/// \return Derived address for the given coin from the public key.
String TWCoinTypeDeriveAddressFromPublicKey(int coin, TWPublicKey publicKey) =>
    TWString.fromPointer(iTWBindings.TWCoinTypeDeriveAddressFromPublicKey(
            coin, publicKey.pointer))
        .toString();

/// Derives the address for a particular coin from the public key with the derivation.
String TWCoinTypeDeriveAddressFromPublicKeyAndDerivation(
        int coin, TWPublicKey publicKey, int derivation) =>
    TWString.fromPointer(
        iTWBindings.TWCoinTypeDeriveAddressFromPublicKeyAndDerivation(
      coin,
      publicKey.pointer,
      derivation,
    )).toString();

/// HRP for this coin type
///
/// \param [coin] A coin type
/// \return HRP of the given coin type.
int TWCoinTypeHRP(int coin) => iTWBindings.TWCoinTypeHRP(coin);

/// P2PKH prefix for this coin type
///
/// \param [coin] A coin type
/// \return P2PKH prefix for the given coin type
int TWCoinTypeP2pkhPrefix(int coin) => iTWBindings.TWCoinTypeP2pkhPrefix(coin);

/// P2SH prefix for this coin type
///
/// \param [coin] A coin type
/// \return P2SH prefix for the given coin type
int TWCoinTypeP2shPrefix(int coin) => iTWBindings.TWCoinTypeP2shPrefix(coin);

/// Static prefix for this coin type
///
/// \param [coin] A coin type
/// \return Static prefix for the given coin type
int TWCoinTypeStaticPrefix(int coin) =>
    iTWBindings.TWCoinTypeStaticPrefix(coin);

/// ChainID for this coin type.
///
/// \param [coin] A coin type
/// \return ChainID for the given coin type.
/// \note Caller must free returned object.
String TWCoinTypeChainId(int coin) =>
    TWString.fromPointer(iTWBindings.TWCoinTypeChainId(coin)).toString();

/// SLIP-0044 id for this coin type
///
/// \param [coin] A coin type
/// \return SLIP-0044 id for the given coin type
int TWCoinTypeSlip44Id(int coin) => iTWBindings.TWCoinTypeSlip44Id(coin);

/// SS58Prefix for this coin type
///
/// \param [coin] A coin type
/// \return SS58Prefix for the given coin type
int TWCoinTypeSS58Prefix(int coin) => iTWBindings.TWCoinTypeSS58Prefix(coin);

/// public key type for this coin type
///
/// \param [coin] A coin type
/// \return public key type for the given coin type
int TWCoinTypePublicKeyType(int coin) =>
    iTWBindings.TWCoinTypePublicKeyType(coin);
