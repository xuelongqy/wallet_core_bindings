// This is a generated file - do not edit.
//
// Generated from Ethereum.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Transaction type
class TransactionMode extends $pb.ProtobufEnum {
  /// Legacy transaction, pre-EIP2718/EIP1559; for fee gasPrice/gasLimit is used
  static const TransactionMode Legacy =
      TransactionMode._(0, _omitEnumNames ? '' : 'Legacy');

  /// Enveloped transaction EIP2718 (with type 0x2), fee is according to EIP1559 (base fee, inclusion fee, ...)
  static const TransactionMode Enveloped =
      TransactionMode._(1, _omitEnumNames ? '' : 'Enveloped');

  /// EIP4337-compatible UserOperation
  static const TransactionMode UserOp =
      TransactionMode._(2, _omitEnumNames ? '' : 'UserOp');

  /// EIP-7702 transaction (with type 0x4); allows to set the code of a contract for an EOA.
  /// Note that `SetCode` transaction extends `Enveloped` transaction.
  /// https://eips.ethereum.org/EIPS/eip-7702
  static const TransactionMode SetCode =
      TransactionMode._(4, _omitEnumNames ? '' : 'SetCode');

  static const $core.List<TransactionMode> values = <TransactionMode>[
    Legacy,
    Enveloped,
    UserOp,
    SetCode,
  ];

  static final $core.List<TransactionMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static TransactionMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TransactionMode._(super.value, super.name);
}

/// Smart Contract Wallet type.
class SCWalletType extends $pb.ProtobufEnum {
  /// ERC-4337 compatible smart contract wallet.
  /// https://github.com/eth-infinitism/account-abstraction/blob/develop/contracts/accounts/SimpleAccount.sol
  static const SCWalletType SimpleAccount =
      SCWalletType._(0, _omitEnumNames ? '' : 'SimpleAccount');

  /// Biz smart contract (Trust Wallet specific) through ERC-4337 EntryPoint.
  static const SCWalletType Biz4337 =
      SCWalletType._(1, _omitEnumNames ? '' : 'Biz4337');

  /// Biz smart contract (Trust Wallet specific) directly through ERC-7702.
  static const SCWalletType Biz =
      SCWalletType._(2, _omitEnumNames ? '' : 'Biz');

  static const $core.List<SCWalletType> values = <SCWalletType>[
    SimpleAccount,
    Biz4337,
    Biz,
  ];

  static final $core.List<SCWalletType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SCWalletType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SCWalletType._(super.value, super.name);
}

class MessageType extends $pb.ProtobufEnum {
  /// Sign a message following EIP-191.
  static const MessageType MessageType_legacy =
      MessageType._(0, _omitEnumNames ? '' : 'MessageType_legacy');

  /// Sign a message following EIP-191 with EIP-155 replay attack protection.
  static const MessageType MessageType_eip155 =
      MessageType._(1, _omitEnumNames ? '' : 'MessageType_eip155');

  /// Sign a typed message EIP-712 V4.
  static const MessageType MessageType_typed =
      MessageType._(2, _omitEnumNames ? '' : 'MessageType_typed');

  /// Sign a typed message EIP-712 V4 with EIP-155 replay attack protection.
  static const MessageType MessageType_typed_eip155 =
      MessageType._(3, _omitEnumNames ? '' : 'MessageType_typed_eip155');

  /// Sign a message with Immutable X msg type.
  static const MessageType MessageType_immutable_x =
      MessageType._(4, _omitEnumNames ? '' : 'MessageType_immutable_x');

  /// Sign a EIP-7702 authorization tuple.
  static const MessageType MessageType_eip7702_authorization = MessageType._(
      5, _omitEnumNames ? '' : 'MessageType_eip7702_authorization');

  static const $core.List<MessageType> values = <MessageType>[
    MessageType_legacy,
    MessageType_eip155,
    MessageType_typed,
    MessageType_typed_eip155,
    MessageType_immutable_x,
    MessageType_eip7702_authorization,
  ];

  static final $core.List<MessageType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static MessageType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MessageType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
