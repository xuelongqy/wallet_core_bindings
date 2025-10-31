
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint wallet_core_bindings_libs.podspec` to validate before publishing.

# wallet_core_version = '4.3.21'

# # We cannot distribute the XCFramework alongside the library directly,
# # so we have to fetch the correct version here.
# wallet_core_framework_name = 'WalletCore.xcframework'
# swift_protobuf_framework_name = 'SwiftProtobuf.xcframework'
# wallet_core_url = "https://github.com/trustwallet/wallet-core/releases/download/#{wallet_core_version}/#{wallet_core_framework_name}.zip"
# swift_protobuf_url = "https://github.com/trustwallet/wallet-core/releases/download/#{wallet_core_version}/#{swift_protobuf_framework_name}.zip"
# wallet_core_local_zip_name = "#{wallet_core_framework_name}_#{wallet_core_version}.zip"
# swift_protobuf_local_zip_name = "#{swift_protobuf_framework_name}_#{wallet_core_version}.zip"
# `
# if [ ! -d Frameworks ]
# then
#   mkdir -p Frameworks
# fi

# cd Frameworks

# if [ ! -f #{wallet_core_local_zip_name} ]
# then
#   rm -rf #{wallet_core_framework_name}
#   rm -rf #{wallet_core_framework_name}_*.zip
#   curl -L #{wallet_core_url} -o #{wallet_core_local_zip_name}
#   unzip #{wallet_core_local_zip_name}
#   truncate -s 0 #{wallet_core_local_zip_name}
# fi

# if [ ! -f #{swift_protobuf_local_zip_name} ]
# then
#   rm -rf #{swift_protobuf_framework_name}
#   rm -rf #{swift_protobuf_framework_name}_*.zip
#   curl -L #{swift_protobuf_url} -o #{swift_protobuf_local_zip_name}
#   unzip #{swift_protobuf_local_zip_name}
#   truncate -s 0 #{swift_protobuf_local_zip_name}
# fi

# cd -
# `

Pod::Spec.new do |s|
  s.name             = 'wallet_core_bindings_libs'
  s.version          = '4.3.21'
  s.summary          = 'Trust Wallet core iOS libs for wallet_core_bindings'
  s.description      = <<-DESC
Trust Wallet core iOS libs for wallet_core_bindings.
                       DESC
  s.homepage         = 'https://github.com/xuelongqy/wallet_core_bindings'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'xuelongqy@qq.com' }
  s.source           = { :path => '.' }
  s.source_files = 'wallet_core_bindings_libs/Sources/wallet_core_bindings_libs/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  #s.vendored_frameworks = 'Frameworks/*.xcframework'
  s.dependency 'TrustWalletCore' ,'4.3.21'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'wallet_core_bindings_libs_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
