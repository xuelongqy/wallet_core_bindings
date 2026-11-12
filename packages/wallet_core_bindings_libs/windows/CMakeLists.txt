cmake_minimum_required(VERSION 3.14)
set(PROJECT_NAME "wallet_core_bindings_libs")
project(${PROJECT_NAME} LANGUAGES CXX)

if(NOT FLUTTER_TARGET_PLATFORM STREQUAL "windows-x64")
  message(FATAL_ERROR "Wallet Core supports Windows x64 only")
endif()

set(LibraryVersion "4.9.3")
set(ArchiveSha256 "4dc7e38fb449235d46b299851bbd5ba9cdd914f313af96707252b75d3d3d26ea")
string(LENGTH "${ArchiveSha256}" ArchiveHashLength)
if(NOT ArchiveHashLength EQUAL 64 OR NOT ArchiveSha256 MATCHES "^[0-9a-f]+$")
  message(FATAL_ERROR "Wallet Core ${LibraryVersion} Windows archive SHA256 has not been pinned")
endif()
set(LibRoot "${CMAKE_CURRENT_BINARY_DIR}/${LibraryVersion}")
set(ArchivePath "${CMAKE_CURRENT_BINARY_DIR}/Windows-${LibraryVersion}.tar.gz")
set(BinaryPath "windows-x64/libTrustWalletCore.dll")

if(NOT EXISTS "${ArchivePath}")
  file(DOWNLOAD
    "https://github.com/xuelongqy/wallet-core/releases/download/${LibraryVersion}/Windows.tar.gz"
    "${ArchivePath}"
    EXPECTED_HASH "SHA256=${ArchiveSha256}"
    TLS_VERIFY ON
    STATUS DownloadStatus
  )
  list(GET DownloadStatus 0 DownloadCode)
  if(NOT DownloadCode EQUAL 0)
    file(REMOVE "${ArchivePath}")
    message(FATAL_ERROR "Wallet Core Windows download failed: ${DownloadStatus}")
  endif()
endif()
file(SHA256 "${ArchivePath}" ActualArchiveSha256)
if(NOT ActualArchiveSha256 STREQUAL ArchiveSha256)
  message(FATAL_ERROR "Wallet Core Windows archive SHA256 mismatch; remove ${ArchivePath} and retry")
endif()

# Always extract the verified archive so an old extracted DLL cannot bypass the checksum.
file(REMOVE_RECURSE "${LibRoot}")
file(MAKE_DIRECTORY "${LibRoot}")
execute_process(
  COMMAND "${CMAKE_COMMAND}" -E tar xzf "${ArchivePath}"
  WORKING_DIRECTORY "${LibRoot}"
  RESULT_VARIABLE ExtractStatus
)
if(NOT ExtractStatus EQUAL 0)
  message(FATAL_ERROR "Wallet Core Windows archive extraction failed: ${ExtractStatus}")
endif()
foreach(RequiredFile IN ITEMS
    "${BinaryPath}" "windows-x64/README.md"
    "windows-x64/licenses/WalletCore.txt"
    "windows-x64/licenses/WalletCore-3rd-party.txt"
    "windows-x64/licenses/Protobuf.txt"
    "windows-x64/licenses/TrezorCrypto.txt"
    "windows-x64/licenses/Boost.txt")
  if(NOT EXISTS "${LibRoot}/${RequiredFile}")
    message(FATAL_ERROR "Wallet Core Windows archive is missing ${RequiredFile}")
  endif()
endforeach()

set(PLUGIN_NAME "wallet_core_bindings_libs_plugin")
add_library(${PLUGIN_NAME} SHARED "wallet_core_bindings_libs_plugin_c_api.cpp")
apply_standard_settings(${PLUGIN_NAME})
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter flutter_wrapper_plugin)
set(wallet_core_bindings_libs_bundled_libraries "${LibRoot}/${BinaryPath}" PARENT_SCOPE)
install(DIRECTORY "${LibRoot}/windows-x64/licenses"
  DESTINATION "$<TARGET_FILE_DIR:${BINARY_NAME}>/data/wallet_core_bindings_libs" COMPONENT Runtime)
install(FILES "${LibRoot}/windows-x64/README.md"
  DESTINATION "$<TARGET_FILE_DIR:${BINARY_NAME}>/data/wallet_core_bindings_libs" COMPONENT Runtime)
