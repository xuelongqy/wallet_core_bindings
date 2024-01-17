//
//  Generated code. Do not modify.
//  source: BitcoinV2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Error extends $pb.ProtobufEnum {
  static const Error OK = Error._(0, _omitEnumNames ? '' : 'OK');
  static const Error Error_utxo_invalid_leaf_hash = Error._(2, _omitEnumNames ? '' : 'Error_utxo_invalid_leaf_hash');
  static const Error Error_utxo_invalid_sighash_type = Error._(3, _omitEnumNames ? '' : 'Error_utxo_invalid_sighash_type');
  static const Error Error_utxo_invalid_lock_time = Error._(4, _omitEnumNames ? '' : 'Error_utxo_invalid_lock_time');
  static const Error Error_utxo_invalid_txid = Error._(5, _omitEnumNames ? '' : 'Error_utxo_invalid_txid');
  static const Error Error_utxo_sighash_failed = Error._(6, _omitEnumNames ? '' : 'Error_utxo_sighash_failed');
  static const Error Error_utxo_missing_sighash_method = Error._(7, _omitEnumNames ? '' : 'Error_utxo_missing_sighash_method');
  static const Error Error_utxo_failed_encoding = Error._(8, _omitEnumNames ? '' : 'Error_utxo_failed_encoding');
  static const Error Error_utxo_insufficient_inputs = Error._(9, _omitEnumNames ? '' : 'Error_utxo_insufficient_inputs');
  static const Error Error_utxo_missing_change_script_pubkey = Error._(10, _omitEnumNames ? '' : 'Error_utxo_missing_change_script_pubkey');
  static const Error Error_zero_sequence_not_enabled = Error._(11, _omitEnumNames ? '' : 'Error_zero_sequence_not_enabled');
  static const Error Error_unmatched_input_signature_count = Error._(12, _omitEnumNames ? '' : 'Error_unmatched_input_signature_count');
  static const Error Error_missing_input_builder = Error._(13, _omitEnumNames ? '' : 'Error_missing_input_builder');
  static const Error Error_missing_output_builder = Error._(14, _omitEnumNames ? '' : 'Error_missing_output_builder');
  static const Error Error_missing_recipient = Error._(15, _omitEnumNames ? '' : 'Error_missing_recipient');
  static const Error Error_missing_inscription = Error._(41, _omitEnumNames ? '' : 'Error_missing_inscription');
  static const Error Error_missing_tagged_output = Error._(42, _omitEnumNames ? '' : 'Error_missing_tagged_output');
  static const Error Error_legacy_p2tr_invalid_variant = Error._(16, _omitEnumNames ? '' : 'Error_legacy_p2tr_invalid_variant');
  static const Error Error_legacy_no_spending_script_provided = Error._(17, _omitEnumNames ? '' : 'Error_legacy_no_spending_script_provided');
  static const Error Error_legacy_expected_redeem_script = Error._(18, _omitEnumNames ? '' : 'Error_legacy_expected_redeem_script');
  static const Error Error_legacy_outpoint_not_set = Error._(19, _omitEnumNames ? '' : 'Error_legacy_outpoint_not_set');
  static const Error Error_legacy_no_private_key = Error._(36, _omitEnumNames ? '' : 'Error_legacy_no_private_key');
  static const Error Error_legacy_no_plan_provided = Error._(37, _omitEnumNames ? '' : 'Error_legacy_no_plan_provided');
  static const Error Error_invalid_private_key = Error._(20, _omitEnumNames ? '' : 'Error_invalid_private_key');
  static const Error Error_invalid_public_key = Error._(21, _omitEnumNames ? '' : 'Error_invalid_public_key');
  static const Error Error_invalid_sighash = Error._(22, _omitEnumNames ? '' : 'Error_invalid_sighash');
  static const Error Error_invalid_witness_pubkey_hash = Error._(23, _omitEnumNames ? '' : 'Error_invalid_witness_pubkey_hash');
  static const Error Error_invalid_brc20_ticker = Error._(24, _omitEnumNames ? '' : 'Error_invalid_brc20_ticker');
  static const Error Error_invalid_ecdsa_signature = Error._(25, _omitEnumNames ? '' : 'Error_invalid_ecdsa_signature');
  static const Error Error_invalid_schnorr_signature = Error._(26, _omitEnumNames ? '' : 'Error_invalid_schnorr_signature');
  static const Error Error_invalid_control_block = Error._(27, _omitEnumNames ? '' : 'Error_invalid_control_block');
  static const Error Error_invalid_pubkey_hash = Error._(28, _omitEnumNames ? '' : 'Error_invalid_pubkey_hash');
  static const Error Error_invalid_taproot_root = Error._(29, _omitEnumNames ? '' : 'Error_invalid_taproot_root');
  static const Error Error_invalid_redeem_script = Error._(30, _omitEnumNames ? '' : 'Error_invalid_redeem_script');
  static const Error Error_invalid_wpkh_script_code = Error._(1, _omitEnumNames ? '' : 'Error_invalid_wpkh_script_code');
  static const Error Error_invalid_witness_redeem_script_hash = Error._(31, _omitEnumNames ? '' : 'Error_invalid_witness_redeem_script_hash');
  static const Error Error_invalid_witness_encoding = Error._(39, _omitEnumNames ? '' : 'Error_invalid_witness_encoding');
  static const Error Error_invalid_taproot_tweaked_pubkey = Error._(32, _omitEnumNames ? '' : 'Error_invalid_taproot_tweaked_pubkey');
  static const Error Error_invalid_change_output = Error._(33, _omitEnumNames ? '' : 'Error_invalid_change_output');
  static const Error Error_unsupported_address_recipient = Error._(34, _omitEnumNames ? '' : 'Error_unsupported_address_recipient');
  static const Error Error_bad_address_recipient = Error._(35, _omitEnumNames ? '' : 'Error_bad_address_recipient');
  static const Error Error_ordinal_mime_type_too_large = Error._(38, _omitEnumNames ? '' : 'Error_ordinal_mime_type_too_large');
  static const Error Error_ordinal_payload_too_large = Error._(40, _omitEnumNames ? '' : 'Error_ordinal_payload_too_large');

  static const $core.List<Error> values = <Error> [
    OK,
    Error_utxo_invalid_leaf_hash,
    Error_utxo_invalid_sighash_type,
    Error_utxo_invalid_lock_time,
    Error_utxo_invalid_txid,
    Error_utxo_sighash_failed,
    Error_utxo_missing_sighash_method,
    Error_utxo_failed_encoding,
    Error_utxo_insufficient_inputs,
    Error_utxo_missing_change_script_pubkey,
    Error_zero_sequence_not_enabled,
    Error_unmatched_input_signature_count,
    Error_missing_input_builder,
    Error_missing_output_builder,
    Error_missing_recipient,
    Error_missing_inscription,
    Error_missing_tagged_output,
    Error_legacy_p2tr_invalid_variant,
    Error_legacy_no_spending_script_provided,
    Error_legacy_expected_redeem_script,
    Error_legacy_outpoint_not_set,
    Error_legacy_no_private_key,
    Error_legacy_no_plan_provided,
    Error_invalid_private_key,
    Error_invalid_public_key,
    Error_invalid_sighash,
    Error_invalid_witness_pubkey_hash,
    Error_invalid_brc20_ticker,
    Error_invalid_ecdsa_signature,
    Error_invalid_schnorr_signature,
    Error_invalid_control_block,
    Error_invalid_pubkey_hash,
    Error_invalid_taproot_root,
    Error_invalid_redeem_script,
    Error_invalid_wpkh_script_code,
    Error_invalid_witness_redeem_script_hash,
    Error_invalid_witness_encoding,
    Error_invalid_taproot_tweaked_pubkey,
    Error_invalid_change_output,
    Error_unsupported_address_recipient,
    Error_bad_address_recipient,
    Error_ordinal_mime_type_too_large,
    Error_ordinal_payload_too_large,
  ];

  static final $core.Map<$core.int, Error> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Error? valueOf($core.int value) => _byValue[value];

  const Error._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
