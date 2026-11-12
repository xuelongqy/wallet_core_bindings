import Cocoa
import FlutterMacOS
import TrustWalletCore

public class WalletCoreBindingsLibsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // Keep Wallet Core loaded before Dart uses DynamicLibrary.process().
    precondition(TWCoinTypeCurve(TWCoinType(rawValue: 60)) == TWCurveSECP256k1)
    let channel = FlutterMethodChannel(name: "wallet_core_bindings_libs", binaryMessenger: registrar.messenger)
    let instance = WalletCoreBindingsLibsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
