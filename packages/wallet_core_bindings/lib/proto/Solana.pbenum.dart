// This is a generated file - do not edit.
//
// Generated from Solana.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TokenProgramId extends $pb.ProtobufEnum {
  static const TokenProgramId TokenProgram =
      TokenProgramId._(0, _omitEnumNames ? '' : 'TokenProgram');
  static const TokenProgramId Token2022Program =
      TokenProgramId._(1, _omitEnumNames ? '' : 'Token2022Program');

  static const $core.List<TokenProgramId> values = <TokenProgramId>[
    TokenProgram,
    Token2022Program,
  ];

  static final $core.List<TokenProgramId?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static TokenProgramId? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TokenProgramId._(super.value, super.name);
}

class Encoding extends $pb.ProtobufEnum {
  static const Encoding Base58 = Encoding._(0, _omitEnumNames ? '' : 'Base58');
  static const Encoding Base64 = Encoding._(1, _omitEnumNames ? '' : 'Base64');

  static const $core.List<Encoding> values = <Encoding>[
    Base58,
    Base64,
  ];

  static final $core.List<Encoding?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static Encoding? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Encoding._(super.value, super.name);
}

/// How the bytes that actually get signed are produced from the message.
class MessageType extends $pb.ProtobufEnum {
  /// Sign the UTF-8 message bytes as they are, with no domain separator and no envelope.
  /// This is what this coin has always done (the Solana cookbook "sign message" recipe).
  /// Nothing in the bytes tells a wallet or a verifier that they are not some other payload,
  /// which is the reason the off-chain standard below exists.
  static const MessageType MessageType_raw =
      MessageType._(0, _omitEnumNames ? '' : 'MessageType_raw');

  /// Solana Off-Chain Message Signing, header version 0, laid out as the off-chain message
  /// signing *proposal* specifies it: the b"\xffsolana offchain" signing domain (0xff can never
  /// start a transaction), the application domain, the message format, the signer, and the
  /// length-prefixed body — an 85-byte preamble.
  ///
  /// These bytes are NOT compatible with `solana_sdk`'s shipped `offchain_message::v0`, which
  /// implements a reduced form of the same proposal: a 20-byte preamble of signing domain,
  /// version, format and length, with no application domain and no signer list, and a format
  /// byte derived from the body instead of pinned. So a signature produced here does not verify
  /// with `solana verify-offchain-signature`, and `solana sign-offchain-message` (or a Ledger
  /// driven by it) cannot produce one. The fuller preamble is the deliberate choice: the
  /// application domain is what stops a signature over one application's messages from
  /// verifying against another's, and it is the layout the services that consume these
  /// signatures rebuild.
  ///
  /// The header version is part of the name on purpose. Only version 0 is specified; the later
  /// proposal that removes the application domain would be a `MessageType_offchain_v1`, never
  /// an edit to this one, because it would change every signature.
  static const MessageType MessageType_offchain_v0 =
      MessageType._(1, _omitEnumNames ? '' : 'MessageType_offchain_v0');

  static const $core.List<MessageType> values = <MessageType>[
    MessageType_raw,
    MessageType_offchain_v0,
  ];

  static final $core.List<MessageType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static MessageType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MessageType._(super.value, super.name);
}

/// What the body's bytes are, which the off-chain header states and a verifier may enforce.
///
/// The numbers here are this proto's own, not the standard's: the standard writes restricted
/// ASCII as format byte 0 and UTF-8 as 1, and the header byte comes from a mapping rather than
/// from this value. UTF-8 sits at 0 so that an input naming no format keeps signing the bytes it
/// signed before this field existed.
class MessageFormat extends $pb.ProtobufEnum {
  /// UTF-8 (header byte 1). Carries anything a string can hold, including the newline a labeled
  /// body is built from. A hardware wallet cannot render it, so approving one is blind-signing.
  static const MessageFormat MessageFormat_utf8 =
      MessageFormat._(0, _omitEnumNames ? '' : 'MessageFormat_utf8');

  /// Restricted ASCII (header byte 0): every byte printable ASCII, 0x20..=0x7e. That **excludes
  /// the newline and the tab**, so a `StructuredMessage` of more than one line cannot be signed
  /// in this format, and a body that needs one is refused rather than silently mislabeled. What
  /// it buys is the only format a hardware wallet displays, so the person approving reads the
  /// message instead of signing a hash they cannot check.
  static const MessageFormat MessageFormat_restricted_ascii = MessageFormat._(
      1, _omitEnumNames ? '' : 'MessageFormat_restricted_ascii');

  static const $core.List<MessageFormat> values = <MessageFormat>[
    MessageFormat_utf8,
    MessageFormat_restricted_ascii,
  ];

  static final $core.List<MessageFormat?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static MessageFormat? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MessageFormat._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
