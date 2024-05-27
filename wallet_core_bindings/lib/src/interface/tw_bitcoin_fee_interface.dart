part of '../../wallet_core_bindings.dart';

/// [TWBitcoinFee] interface.
abstract class TWBitcoinFeeInterface {
  int calculateFee(int data, int satVb);
}