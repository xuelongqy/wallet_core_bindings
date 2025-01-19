#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint wallet_core_bindings_libs.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'wallet_core_bindings_libs'
  s.version          = '4.2.2'
  s.summary          = 'Trust Wallet core iOS libs for wallet_core_bindings'
  s.description      = <<-DESC
Trust Wallet core iOS libs for wallet_core_bindings.
                       DESC
  s.homepage         = 'https://github.com/xuelongqy/wallet_core_bindings'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'xuelongqy@qq.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.dependency 'TrustWalletCore' ,'4.2.2'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'wallet_core_bindings_libs_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
