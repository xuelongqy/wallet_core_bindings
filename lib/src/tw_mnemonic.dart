part of '../wallet_core_bindings.dart';

/// Mnemonic validate / lookup functions
class TWMnemonic {
  /// Determines whether a BIP39 English mnemonic phrase is valid.
  ///
  /// \param [mnemonic] Non-null BIP39 english mnemonic
  /// \return true if the mnemonic is valid, false otherwise
  static bool isValid(String mnemonic) =>
      iTWBindings.TWMnemonicIsValid(TWString(mnemonic).pointer);

  /// Determines whether word is a valid BIP39 English mnemonic word.
  ///
  /// \param [word] Non-null BIP39 English mnemonic word
  /// \return true if the word is a valid BIP39 English mnemonic word, false otherwise
  static bool isValidWord(String word) =>
      iTWBindings.TWMnemonicIsValidWord(TWString(word).pointer);

  /// Return BIP39 English words that match the given prefix. A single string is returned, with space-separated list of words.
  ///
  /// \param [prefix] Non-null string prefix
  /// \return Single non-null string, space-separated list of words containing BIP39 words that match the given prefix.
  static String suggest(String word) => TWString.fromPointer(
          iTWBindings.TWMnemonicSuggest(TWString(word).pointer))
      .value!;
}
