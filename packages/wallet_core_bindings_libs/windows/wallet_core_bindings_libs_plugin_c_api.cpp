#include "include/wallet_core_bindings_libs/wallet_core_bindings_libs_plugin_c_api.h"

#include <windows.h>
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

void WalletCoreBindingsLibsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  auto* plugin_registrar =
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar);
  flutter::MethodChannel<flutter::EncodableValue> channel(
      plugin_registrar->messenger(), "wallet_core_bindings_libs",
      &flutter::StandardMethodCodec::GetInstance());
  channel.SetMethodCallHandler([](const auto& call, auto result) {
    if (call.method_name() == "getPlatformVersion") {
      result->Success(flutter::EncodableValue(
          IsWindows10OrGreater() ? "Windows 10+" : "Windows"));
    } else {
      result->NotImplemented();
    }
  });
}
