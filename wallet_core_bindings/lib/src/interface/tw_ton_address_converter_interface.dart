part of '../../wallet_core_bindings.dart';

/// [TWTONAddressConverter] interface.
abstract class TWTONAddressConverterInterface {
  int toBoc(int address);

  int fromBoc(int boc);

  int toUserFriendly(int address, bool bounceable, bool testnet);
}
