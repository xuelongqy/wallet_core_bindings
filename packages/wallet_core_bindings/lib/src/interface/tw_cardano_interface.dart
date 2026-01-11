part of '../../wallet_core_bindings.dart';

/// [TWCardano] interface.
abstract class TWCardanoInterface {
  int minAdaAmount(int tokenBundle);

  int outputMinAdaAmount(int toAddress, int tokenBundle, int coinsPerUtxoByte);

  int getStakingAddress(int baseAddress);

  int getByronAddress(int publicKey);
}
