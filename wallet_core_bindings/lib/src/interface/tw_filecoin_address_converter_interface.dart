part of '../../wallet_core_bindings.dart';

/// [TWFilecoinAddressConverter] interface.
abstract class TWFilecoinAddressConverterInterface {
  int convertToEthereum(int filecoinAddress);

  int convertFromEthereum(int filecoinAddress);
}
