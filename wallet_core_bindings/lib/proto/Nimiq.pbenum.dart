//
//  Generated code. Do not modify.
//  source: Nimiq.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NetworkId extends $pb.ProtobufEnum {
  static const NetworkId UseDefault =
      NetworkId._(0, _omitEnumNames ? '' : 'UseDefault');
  static const NetworkId Mainnet =
      NetworkId._(42, _omitEnumNames ? '' : 'Mainnet');
  static const NetworkId MainnetAlbatross =
      NetworkId._(24, _omitEnumNames ? '' : 'MainnetAlbatross');

  static const $core.List<NetworkId> values = <NetworkId>[
    UseDefault,
    Mainnet,
    MainnetAlbatross,
  ];

  static final $core.Map<$core.int, NetworkId> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static NetworkId? valueOf($core.int value) => _byValue[value];

  const NetworkId._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
