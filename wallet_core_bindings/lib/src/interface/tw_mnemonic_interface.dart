part of '../../wallet_core_bindings.dart';

/// [TWMnemonic] interface.
abstract class TWMnemonicInterface {
  bool isValid(int mnemonic);

  bool isValidWord(int word);

  int suggest(int word);
}
