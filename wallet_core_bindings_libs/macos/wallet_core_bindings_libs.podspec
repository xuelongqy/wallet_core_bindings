#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint wallet_core_bindings_libs.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
#   system("make")

  s.name             = 'wallet_core_bindings_libs'
  s.version          = '4.2.14'
  s.summary          = 'Trust Wallet core macOS libs for wallet_core_bindings.'
  s.description      = <<-DESC
Trust Wallet core macOS libs for wallet_core_bindings.
                       DESC
  s.homepage         = 'https://github.com/xuelongqy/wallet_core_bindings'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'xuelongqy@qq.com' }

  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
  s.dependency 'TrustWalletCore' ,'4.2.14'
end
