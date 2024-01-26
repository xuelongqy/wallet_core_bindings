part of '../wallet_core_bindings.dart';

/// TWFIOAccount finalizer.
final _twGroestlcoinAddressFinalizer = Finalizer<Pointer<bindings.TWGroestlcoinAddress>>(
    (Pointer<bindings.TWGroestlcoinAddress> token) {
  iTWBindings.TWGroestlcoinAddressDelete(token);
});

class TWGroestlcoinAddress {
  
}