//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <wallet_core_bindings_libs/wallet_core_bindings_libs_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) wallet_core_bindings_libs_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WalletCoreBindingsLibsPlugin");
  wallet_core_bindings_libs_plugin_register_with_registrar(wallet_core_bindings_libs_registrar);
}
