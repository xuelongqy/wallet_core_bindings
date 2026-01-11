#ifndef FLUTTER_PLUGIN_WALLET_CORE_BINDINGS_LIBS_PLUGIN_H_
#define FLUTTER_PLUGIN_WALLET_CORE_BINDINGS_LIBS_PLUGIN_H_

#include <flutter_linux/flutter_linux.h>

G_BEGIN_DECLS

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define FLUTTER_PLUGIN_EXPORT
#endif

typedef struct _WalletCoreBindingsLibsPlugin WalletCoreBindingsLibsPlugin;
typedef struct {
  GObjectClass parent_class;
} WalletCoreBindingsLibsPluginClass;

FLUTTER_PLUGIN_EXPORT GType wallet_core_bindings_libs_plugin_get_type();

FLUTTER_PLUGIN_EXPORT void wallet_core_bindings_libs_plugin_register_with_registrar(
    FlPluginRegistrar* registrar);

G_END_DECLS

#endif  // FLUTTER_PLUGIN_WALLET_CORE_BINDINGS_LIBS_PLUGIN_H_
