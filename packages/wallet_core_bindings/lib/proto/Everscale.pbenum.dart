// This is a generated file - do not edit.
//
// Generated from Everscale.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Message option
class MessageBehavior extends $pb.ProtobufEnum {
  /// Sends a message with the specified amount. The sender pays a fee from the account balance
  static const MessageBehavior SimpleTransfer =
      MessageBehavior._(0, _omitEnumNames ? '' : 'SimpleTransfer');

  /// Sends the entire account balance along with the message
  static const MessageBehavior SendAllBalance =
      MessageBehavior._(1, _omitEnumNames ? '' : 'SendAllBalance');

  static const $core.List<MessageBehavior> values = <MessageBehavior>[
    SimpleTransfer,
    SendAllBalance,
  ];

  static final $core.List<MessageBehavior?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static MessageBehavior? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MessageBehavior._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
