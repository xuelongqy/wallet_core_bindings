part of '../wallet_core_bindings.dart';

/// TWBitcoinScript finalizer.
final _twTWBitcoinScriptFinalizer = Finalizer<int>((int token) {
  _bitcoinScriptImpl.delete(token);
});

/// Bitcoin script manipulating functions
class TWBitcoinScript extends TWObjectFinalizable {
  TWBitcoinScript.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(finalizer: _twTWBitcoinScriptFinalizer);

  /// Creates an empty script.
  TWBitcoinScript({
    bool attach = true,
  }) : super(
          _bitcoinScriptImpl.create(),
          attach: attach,
          finalizer: _twTWBitcoinScriptFinalizer,
        );

  /// Creates a script from a raw bytes and size.
  ///
  /// \param [bytes] The buffer
  /// \param [size] The size of the buffer
  TWBitcoinScript.createWithBytes(
    Uint8List bytes, {
    bool attach = true,
  }) : super(
          _bitcoinScriptImpl.createWithBytes(bytes),
          attach: attach,
          finalizer: _twTWBitcoinScriptFinalizer,
        );

  /// Creates a script by copying an existing script.
  ///
  /// \param [script] Non-null pointer to a script
  TWBitcoinScript.createCopy(
    TWBitcoinScript script, {
    bool attach = true,
  }) : super(
          _bitcoinScriptImpl.createCopy(script.pointer),
          attach: attach,
          finalizer: _twTWBitcoinScriptFinalizer,
        );

  /// Builds a standard 'pay to public key' script.
  ///
  /// \param [pubkey] Non-null pointer to a pubkey
  TWBitcoinScript.buildPayToPublicKey(
    Uint8List pubkey, {
    bool attach = true,
  }) : super(
          _bitcoinScriptImpl.buildPayToPublicKey(TWData(pubkey).pointer),
          attach: attach,
          finalizer: _twTWBitcoinScriptFinalizer,
        );

  /// Builds a standard 'pay to public key hash' script.
  ///
  /// \param [hash] Non-null pointer to a PublicKey hash
  TWBitcoinScript.buildPayToPublicKeyHash(
    Uint8List hash, {
    bool attach = true,
  }) : super(
          _bitcoinScriptImpl.buildPayToPublicKeyHash(TWData(hash).pointer),
          attach: attach,
          finalizer: _twTWBitcoinScriptFinalizer,
        );

  /// Builds a standard 'pay to script hash' script.
  ///
  /// \param [scriptHash] Non-null pointer to a script hash
  TWBitcoinScript.buildPayToScriptHash(
    Uint8List scriptHash, {
    bool attach = true,
  }) : super(
          _bitcoinScriptImpl.buildPayToScriptHash(TWData(scriptHash).pointer),
          attach: attach,
          finalizer: _twTWBitcoinScriptFinalizer,
        );

  /// Builds a pay-to-witness-public-key-hash (P2WPKH) script..
  ///
  /// \param [hash] Non-null pointer to a witness public key hash
  TWBitcoinScript.buildPayToWitnessPubkeyHash(
    Uint8List hash, {
    bool attach = true,
  }) : super(
          _bitcoinScriptImpl.buildPayToWitnessPubkeyHash(TWData(hash).pointer),
          attach: attach,
          finalizer: _twTWBitcoinScriptFinalizer,
        );

  /// Builds a pay-to-witness-script-hash (P2WSH) script.
  ///
  /// \param [scriptHash] Non-null pointer to a script hash
  TWBitcoinScript.buildPayToWitnessScriptHash(
    Uint8List scriptHash, {
    bool attach = true,
  }) : super(
          _bitcoinScriptImpl
              .buildPayToWitnessScriptHash(TWData(scriptHash).pointer),
          attach: attach,
          finalizer: _twTWBitcoinScriptFinalizer,
        );

  /// Builds a appropriate lock script for the given address..
  ///
  /// \param [address] Non-null pointer to an address
  /// \param [coin] coin type
  TWBitcoinScript.lockScriptForAddress(
    String address,
    TWCoinType coin, {
    bool attach = true,
  }) : super(
          _bitcoinScriptImpl.lockScriptForAddress(
            TWString(address).pointer,
            coin.coin,
          ),
          attach: attach,
          finalizer: _twTWBitcoinScriptFinalizer,
        );

  /// Builds a appropriate lock script for the given address with replay.
  TWBitcoinScript.lockScriptForAddressReplay({
    required String address,
    required int coin,
    required Uint8List blockHash,
    required int blockHeight,
    bool attach = true,
  }) : super(
          _bitcoinScriptImpl.lockScriptForAddressReplay(
            TWString(address).pointer,
            coin,
            TWData(blockHash).pointer,
            blockHeight,
          ),
          attach: attach,
          finalizer: _twTWBitcoinScriptFinalizer,
        );

  /// Delete/Deallocate a given script.
  @override
  void delete() {
    super.delete();
    _bitcoinScriptImpl.delete(_pointer);
  }

  /// Get size of a script
  int get size => _bitcoinScriptImpl.size(_pointer);

  /// Get data of a script
  Uint8List get data =>
      TWData.fromPointer(_bitcoinScriptImpl.data(_pointer)).bytes()!;

  /// Return script hash of a script
  Uint8List get scriptHash =>
      TWData.fromPointer(_bitcoinScriptImpl.scriptHash(_pointer)).bytes()!;

  /// Determines whether this is a pay-to-witness-script-hash (P2WSH) script.
  bool get isPayToScriptHash => _bitcoinScriptImpl.isPayToScriptHash(_pointer);

  /// Determines whether this is a pay-to-witness-script-hash (P2WSH) script.
  bool get isPayToWitnessScriptHash =>
      _bitcoinScriptImpl.isPayToWitnessScriptHash(_pointer);

  /// Determines whether this is a pay-to-witness-public-key-hash (P2WPKH) script.
  bool get isPayToWitnessPublicKeyHash =>
      _bitcoinScriptImpl.isPayToWitnessPublicKeyHash(_pointer);

  /// Determines whether this is a witness program script.
  bool get isWitnessProgram => _bitcoinScriptImpl.isWitnessProgram(_pointer);

  /// Determines whether 2 scripts have the same content
  ///
  /// \param [another] Non-null pointer to the second script
  bool equal(TWBitcoinScript another) =>
      _bitcoinScriptImpl.equal(_pointer, another.pointer);

  /// Overloaded operator ==, equivalent to [TWBitcoinScript.equal].
  @override
  bool operator ==(Object other) => other is TWBitcoinScript && equal(other);

  /// Matches the script to a pay-to-public-key (P2PK) script.
  Uint8List? matchPayToPubkey() =>
      TWData.fromPointer(_bitcoinScriptImpl.matchPayToPubkey(_pointer)).bytes();

  /// Matches the script to a pay-to-public-key-hash (P2PKH).
  Uint8List? matchPayToPubkeyHash() =>
      TWData.fromPointer(_bitcoinScriptImpl.matchPayToPubkeyHash(_pointer))
          .bytes();

  /// Matches the script to a pay-to-script-hash (P2SH).
  Uint8List? matchPayToScriptHash() =>
      TWData.fromPointer(_bitcoinScriptImpl.matchPayToScriptHash(_pointer))
          .bytes();

  /// Matches the script to a pay-to-witness-public-key-hash (P2WPKH).
  Uint8List? matchPayToWitnessPublicKeyHash() => TWData.fromPointer(
          _bitcoinScriptImpl.matchPayToWitnessPublicKeyHash(_pointer))
      .bytes();

  /// Matches the script to a pay-to-witness-script-hash (P2WSH).
  Uint8List? matchPayToWitnessScriptHash() => TWData.fromPointer(
          _bitcoinScriptImpl.matchPayToWitnessScriptHash(_pointer))
      .bytes();

  /// Encodes the script.
  Uint8List? encode() =>
      TWData.fromPointer(_bitcoinScriptImpl.encode(_pointer)).bytes();

  /// Builds the Ordinals inscripton for BRC20 transfer.
  ///
  /// \param [ticker] ticker of the brc20
  /// \param [amount] uint64 transfer amount
  /// \param [pubkey] Non-null pointer to a pubkey
  static Uint8List buildBRC20InscribeTransfer({
    required String ticker,
    required String amount,
    required Uint8List pubkey,
  }) =>
      TWData.fromPointer(_bitcoinScriptImpl.buildBRC20InscribeTransfer(
        TWString(ticker).pointer,
        TWString(amount).pointer,
        TWData(pubkey).pointer,
      )).bytes()!;

  /// Builds the Ordinals inscripton for NFT construction.
  ///
  /// \param [mimeType] the MIME type of the payload
  /// \param [payload] the payload to inscribe
  /// \param [pubkey] Non-null pointer to a pubkey
  static Uint8List buildOrdinalNftInscription({
    required String mimeType,
    required Uint8List payload,
    required Uint8List pubkey,
  }) =>
      TWData.fromPointer(_bitcoinScriptImpl.buildOrdinalNftInscription(
        TWString(mimeType).pointer,
        TWData(payload).pointer,
        TWData(pubkey).pointer,
      )).bytes()!;

  /// Return the default HashType for the given coin, such as TWBitcoinSigHashTypeAll.
  ///
  /// \param [coinType] coin type
  /// \return default HashType for the given coin
  static int hashTypeForCoin(TWCoinType coinType) =>
      _bitcoinScriptImpl.hashTypeForCoin(coinType.coin);

  @override
  int get hashCode => _pointer.hashCode;
}
