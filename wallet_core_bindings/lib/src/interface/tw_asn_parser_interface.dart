part of '../../wallet_core_bindings.dart';

/// [TWAsnParser] interface.
abstract class TWAsnParserInterface {
  int ecdsaSignatureFromDer(int encoded);
}
