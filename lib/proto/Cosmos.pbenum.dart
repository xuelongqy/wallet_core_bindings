//
//  Generated code. Do not modify.
//  source: Cosmos.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Transaction broadcast mode
class BroadcastMode extends $pb.ProtobufEnum {
  static const BroadcastMode BLOCK = BroadcastMode._(0, _omitEnumNames ? '' : 'BLOCK');
  static const BroadcastMode SYNC = BroadcastMode._(1, _omitEnumNames ? '' : 'SYNC');
  static const BroadcastMode ASYNC = BroadcastMode._(2, _omitEnumNames ? '' : 'ASYNC');

  static const $core.List<BroadcastMode> values = <BroadcastMode> [
    BLOCK,
    SYNC,
    ASYNC,
  ];

  static final $core.Map<$core.int, BroadcastMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BroadcastMode? valueOf($core.int value) => _byValue[value];

  const BroadcastMode._($core.int v, $core.String n) : super(v, n);
}

/// Options for transaction encoding: JSON (Amino, older) or Protobuf.
class SigningMode extends $pb.ProtobufEnum {
  static const SigningMode JSON = SigningMode._(0, _omitEnumNames ? '' : 'JSON');
  static const SigningMode Protobuf = SigningMode._(1, _omitEnumNames ? '' : 'Protobuf');

  static const $core.List<SigningMode> values = <SigningMode> [
    JSON,
    Protobuf,
  ];

  static final $core.Map<$core.int, SigningMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SigningMode? valueOf($core.int value) => _byValue[value];

  const SigningMode._($core.int v, $core.String n) : super(v, n);
}

///  AuthorizationType defines the type of staking module authorization type
///
///  Since: cosmos-sdk 0.43
class Message_AuthorizationType extends $pb.ProtobufEnum {
  static const Message_AuthorizationType UNSPECIFIED = Message_AuthorizationType._(0, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const Message_AuthorizationType DELEGATE = Message_AuthorizationType._(1, _omitEnumNames ? '' : 'DELEGATE');
  static const Message_AuthorizationType UNDELEGATE = Message_AuthorizationType._(2, _omitEnumNames ? '' : 'UNDELEGATE');
  static const Message_AuthorizationType REDELEGATE = Message_AuthorizationType._(3, _omitEnumNames ? '' : 'REDELEGATE');

  static const $core.List<Message_AuthorizationType> values = <Message_AuthorizationType> [
    UNSPECIFIED,
    DELEGATE,
    UNDELEGATE,
    REDELEGATE,
  ];

  static final $core.Map<$core.int, Message_AuthorizationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_AuthorizationType? valueOf($core.int value) => _byValue[value];

  const Message_AuthorizationType._($core.int v, $core.String n) : super(v, n);
}

/// VoteOption enumerates the valid vote options for a given governance proposal.
class Message_VoteOption extends $pb.ProtobufEnum {
  static const Message_VoteOption UNSPECIFIED_ = Message_VoteOption._(0, _omitEnumNames ? '' : '_UNSPECIFIED');
  static const Message_VoteOption YES = Message_VoteOption._(1, _omitEnumNames ? '' : 'YES');
  static const Message_VoteOption ABSTAIN = Message_VoteOption._(2, _omitEnumNames ? '' : 'ABSTAIN');
  static const Message_VoteOption NO = Message_VoteOption._(3, _omitEnumNames ? '' : 'NO');
  static const Message_VoteOption NO_WITH_VETO = Message_VoteOption._(4, _omitEnumNames ? '' : 'NO_WITH_VETO');

  static const $core.List<Message_VoteOption> values = <Message_VoteOption> [
    UNSPECIFIED_,
    YES,
    ABSTAIN,
    NO,
    NO_WITH_VETO,
  ];

  static final $core.Map<$core.int, Message_VoteOption> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_VoteOption? valueOf($core.int value) => _byValue[value];

  const Message_VoteOption._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
