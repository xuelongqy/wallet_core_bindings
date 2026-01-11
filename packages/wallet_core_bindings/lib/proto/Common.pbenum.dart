// This is a generated file - do not edit.
//
// Generated from Common.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Error codes, used in multiple blockchains.
class SigningError extends $pb.ProtobufEnum {
  /// This is the OK case, with value=0
  static const SigningError OK = SigningError._(0, _omitEnumNames ? '' : 'OK');

  /// Chain-generic codes:
  /// Generic error (used if there is no suitable specific error is adequate)
  static const SigningError Error_general =
      SigningError._(1, _omitEnumNames ? '' : 'Error_general');

  /// Internal error, indicates some very unusual, unexpected case
  static const SigningError Error_internal =
      SigningError._(2, _omitEnumNames ? '' : 'Error_internal');

  /// Chain-generic codes, input related:
  /// Low balance: the sender balance is not enough to cover the send and other auxiliary amount such as fee, deposit, or minimal balance.
  static const SigningError Error_low_balance =
      SigningError._(3, _omitEnumNames ? '' : 'Error_low_balance');

  /// Requested amount is zero, send of 0 makes no sense
  static const SigningError Error_zero_amount_requested =
      SigningError._(4, _omitEnumNames ? '' : 'Error_zero_amount_requested');

  /// One required key is missing (too few or wrong keys are provided)
  static const SigningError Error_missing_private_key =
      SigningError._(5, _omitEnumNames ? '' : 'Error_missing_private_key');

  /// A private key provided is invalid (e.g. wrong size, usually should be 32 bytes)
  static const SigningError Error_invalid_private_key =
      SigningError._(15, _omitEnumNames ? '' : 'Error_invalid_private_key');

  /// A provided address (e.g. destination address) is invalid
  static const SigningError Error_invalid_address =
      SigningError._(16, _omitEnumNames ? '' : 'Error_invalid_address');

  /// A provided input UTXO is invalid
  static const SigningError Error_invalid_utxo =
      SigningError._(17, _omitEnumNames ? '' : 'Error_invalid_utxo');

  /// The amount of an input UTXO is invalid
  static const SigningError Error_invalid_utxo_amount =
      SigningError._(18, _omitEnumNames ? '' : 'Error_invalid_utxo_amount');

  /// Chain-generic, fee related:
  /// Wrong fee is given, probably it is too low to cover minimal fee for the transaction
  static const SigningError Error_wrong_fee =
      SigningError._(6, _omitEnumNames ? '' : 'Error_wrong_fee');

  /// Chain-generic, signing related:
  /// General signing error
  static const SigningError Error_signing =
      SigningError._(7, _omitEnumNames ? '' : 'Error_signing');

  /// Resulting transaction is too large
  /// [NEO] Transaction too big, fee in GAS needed or try send by parts
  static const SigningError Error_tx_too_big =
      SigningError._(8, _omitEnumNames ? '' : 'Error_tx_too_big');

  /// UTXO-chain specific, input related:
  /// No input UTXOs provided [BTC]
  static const SigningError Error_missing_input_utxos =
      SigningError._(9, _omitEnumNames ? '' : 'Error_missing_input_utxos');

  /// Not enough non-dust input UTXOs to cover requested amount (dust UTXOs are filtered out) [BTC]
  static const SigningError Error_not_enough_utxos =
      SigningError._(10, _omitEnumNames ? '' : 'Error_not_enough_utxos');

  /// UTXO-chain specific, script related:
  /// [BTC] Missing required redeem script
  static const SigningError Error_script_redeem =
      SigningError._(11, _omitEnumNames ? '' : 'Error_script_redeem');

  /// [BTC] Invalid required output script
  static const SigningError Error_script_output =
      SigningError._(12, _omitEnumNames ? '' : 'Error_script_output');

  /// [BTC] Unrecognized witness program
  static const SigningError Error_script_witness_program =
      SigningError._(13, _omitEnumNames ? '' : 'Error_script_witness_program');

  /// Invalid memo, e.g. [XRP] Invalid tag
  static const SigningError Error_invalid_memo =
      SigningError._(14, _omitEnumNames ? '' : 'Error_invalid_memo');

  /// Some input field cannot be parsed
  static const SigningError Error_input_parse =
      SigningError._(19, _omitEnumNames ? '' : 'Error_input_parse');

  /// Multi-input and multi-output transaction not supported
  static const SigningError Error_no_support_n2n =
      SigningError._(20, _omitEnumNames ? '' : 'Error_no_support_n2n');

  /// Incorrect count of signatures passed to compile
  static const SigningError Error_signatures_count =
      SigningError._(21, _omitEnumNames ? '' : 'Error_signatures_count');

  /// Incorrect input parameter
  static const SigningError Error_invalid_params =
      SigningError._(22, _omitEnumNames ? '' : 'Error_invalid_params');

  /// Invalid input token amount
  static const SigningError Error_invalid_requested_token_amount =
      SigningError._(
          23, _omitEnumNames ? '' : 'Error_invalid_requested_token_amount');

  /// Operation not supported for the chain.
  static const SigningError Error_not_supported =
      SigningError._(24, _omitEnumNames ? '' : 'Error_not_supported');

  /// Requested amount is too low (less dust).
  static const SigningError Error_dust_amount_requested =
      SigningError._(25, _omitEnumNames ? '' : 'Error_dust_amount_requested');

  static const $core.List<SigningError> values = <SigningError>[
    OK,
    Error_general,
    Error_internal,
    Error_low_balance,
    Error_zero_amount_requested,
    Error_missing_private_key,
    Error_invalid_private_key,
    Error_invalid_address,
    Error_invalid_utxo,
    Error_invalid_utxo_amount,
    Error_wrong_fee,
    Error_signing,
    Error_tx_too_big,
    Error_missing_input_utxos,
    Error_not_enough_utxos,
    Error_script_redeem,
    Error_script_output,
    Error_script_witness_program,
    Error_invalid_memo,
    Error_input_parse,
    Error_no_support_n2n,
    Error_signatures_count,
    Error_invalid_params,
    Error_invalid_requested_token_amount,
    Error_not_supported,
    Error_dust_amount_requested,
  ];

  static final $core.List<SigningError?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 25);
  static SigningError? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SigningError._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
