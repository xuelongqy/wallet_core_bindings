// This is a generated file - do not edit.
//
// Generated from EthereumAbi.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'EthereumAbi.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'EthereumAbi.pbenum.dart';

/// Indicates a boolean type.
class BoolType extends $pb.GeneratedMessage {
  factory BoolType() => create();

  BoolType._();

  factory BoolType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoolType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoolType',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoolType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoolType copyWith(void Function(BoolType) updates) =>
      super.copyWith((message) => updates(message as BoolType)) as BoolType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoolType create() => BoolType._();
  @$core.override
  BoolType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoolType getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoolType>(create);
  static BoolType? _defaultInstance;
}

/// Generic number type for all bit sizes, like UInt24, 40, 48, ... 248.
class NumberNType extends $pb.GeneratedMessage {
  factory NumberNType({
    $core.int? bits,
  }) {
    final result = create();
    if (bits != null) result.bits = bits;
    return result;
  }

  NumberNType._();

  factory NumberNType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NumberNType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NumberNType',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'bits', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NumberNType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NumberNType copyWith(void Function(NumberNType) updates) =>
      super.copyWith((message) => updates(message as NumberNType))
          as NumberNType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NumberNType create() => NumberNType._();
  @$core.override
  NumberNType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NumberNType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NumberNType>(create);
  static NumberNType? _defaultInstance;

  /// The number of bits of an integer.
  @$pb.TagNumber(1)
  $core.int get bits => $_getIZ(0);
  @$pb.TagNumber(1)
  set bits($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBits() => $_has(0);
  @$pb.TagNumber(1)
  void clearBits() => $_clearField(1);
}

/// Indicates a string type.
class StringType extends $pb.GeneratedMessage {
  factory StringType() => create();

  StringType._();

  factory StringType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StringType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StringType',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StringType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StringType copyWith(void Function(StringType) updates) =>
      super.copyWith((message) => updates(message as StringType)) as StringType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StringType create() => StringType._();
  @$core.override
  StringType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StringType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StringType>(create);
  static StringType? _defaultInstance;
}

/// Indicates an address type.
class AddressType extends $pb.GeneratedMessage {
  factory AddressType() => create();

  AddressType._();

  factory AddressType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddressType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddressType',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddressType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddressType copyWith(void Function(AddressType) updates) =>
      super.copyWith((message) => updates(message as AddressType))
          as AddressType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddressType create() => AddressType._();
  @$core.override
  AddressType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddressType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddressType>(create);
  static AddressType? _defaultInstance;
}

/// Indicates an array type with an inner `element_type`.
class ArrayType extends $pb.GeneratedMessage {
  factory ArrayType({
    ParamType? elementType,
  }) {
    final result = create();
    if (elementType != null) result.elementType = elementType;
    return result;
  }

  ArrayType._();

  factory ArrayType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArrayType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArrayType',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..aOM<ParamType>(1, _omitFieldNames ? '' : 'elementType',
        subBuilder: ParamType.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArrayType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArrayType copyWith(void Function(ArrayType) updates) =>
      super.copyWith((message) => updates(message as ArrayType)) as ArrayType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArrayType create() => ArrayType._();
  @$core.override
  ArrayType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArrayType getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArrayType>(create);
  static ArrayType? _defaultInstance;

  /// The type of array elements.
  @$pb.TagNumber(1)
  ParamType get elementType => $_getN(0);
  @$pb.TagNumber(1)
  set elementType(ParamType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasElementType() => $_has(0);
  @$pb.TagNumber(1)
  void clearElementType() => $_clearField(1);
  @$pb.TagNumber(1)
  ParamType ensureElementType() => $_ensure(0);
}

/// Indicates a fixed-size array type with an inner `element_type`.
class FixedArrayType extends $pb.GeneratedMessage {
  factory FixedArrayType({
    $fixnum.Int64? size,
    ParamType? elementType,
  }) {
    final result = create();
    if (size != null) result.size = size;
    if (elementType != null) result.elementType = elementType;
    return result;
  }

  FixedArrayType._();

  factory FixedArrayType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FixedArrayType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FixedArrayType',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'size', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<ParamType>(2, _omitFieldNames ? '' : 'elementType',
        subBuilder: ParamType.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixedArrayType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixedArrayType copyWith(void Function(FixedArrayType) updates) =>
      super.copyWith((message) => updates(message as FixedArrayType))
          as FixedArrayType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FixedArrayType create() => FixedArrayType._();
  @$core.override
  FixedArrayType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FixedArrayType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FixedArrayType>(create);
  static FixedArrayType? _defaultInstance;

  /// The fixed-size of the array.
  @$pb.TagNumber(1)
  $fixnum.Int64 get size => $_getI64(0);
  @$pb.TagNumber(1)
  set size($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearSize() => $_clearField(1);

  /// The type of array elements.
  @$pb.TagNumber(2)
  ParamType get elementType => $_getN(1);
  @$pb.TagNumber(2)
  set elementType(ParamType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasElementType() => $_has(1);
  @$pb.TagNumber(2)
  void clearElementType() => $_clearField(2);
  @$pb.TagNumber(2)
  ParamType ensureElementType() => $_ensure(1);
}

/// Indicates a byte array type.
class ByteArrayType extends $pb.GeneratedMessage {
  factory ByteArrayType() => create();

  ByteArrayType._();

  factory ByteArrayType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ByteArrayType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ByteArrayType',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ByteArrayType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ByteArrayType copyWith(void Function(ByteArrayType) updates) =>
      super.copyWith((message) => updates(message as ByteArrayType))
          as ByteArrayType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ByteArrayType create() => ByteArrayType._();
  @$core.override
  ByteArrayType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ByteArrayType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ByteArrayType>(create);
  static ByteArrayType? _defaultInstance;
}

/// Indicates a fixed-size byte array type.
class ByteArrayFixType extends $pb.GeneratedMessage {
  factory ByteArrayFixType({
    $fixnum.Int64? size,
  }) {
    final result = create();
    if (size != null) result.size = size;
    return result;
  }

  ByteArrayFixType._();

  factory ByteArrayFixType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ByteArrayFixType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ByteArrayFixType',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'size', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ByteArrayFixType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ByteArrayFixType copyWith(void Function(ByteArrayFixType) updates) =>
      super.copyWith((message) => updates(message as ByteArrayFixType))
          as ByteArrayFixType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ByteArrayFixType create() => ByteArrayFixType._();
  @$core.override
  ByteArrayFixType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ByteArrayFixType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ByteArrayFixType>(create);
  static ByteArrayFixType? _defaultInstance;

  /// The fixed-size of the array.
  @$pb.TagNumber(1)
  $fixnum.Int64 get size => $_getI64(0);
  @$pb.TagNumber(1)
  set size($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearSize() => $_clearField(1);
}

/// Indicates a tuple with inner type parameters.
class TupleType extends $pb.GeneratedMessage {
  factory TupleType({
    $core.Iterable<Param>? params,
  }) {
    final result = create();
    if (params != null) result.params.addAll(params);
    return result;
  }

  TupleType._();

  factory TupleType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TupleType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TupleType',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..pPM<Param>(1, _omitFieldNames ? '' : 'params', subBuilder: Param.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TupleType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TupleType copyWith(void Function(TupleType) updates) =>
      super.copyWith((message) => updates(message as TupleType)) as TupleType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TupleType create() => TupleType._();
  @$core.override
  TupleType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TupleType getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TupleType>(create);
  static TupleType? _defaultInstance;

  /// Tuple named parameters.
  @$pb.TagNumber(1)
  $pb.PbList<Param> get params => $_getList(0);
}

/// Named parameter with type.
class Param extends $pb.GeneratedMessage {
  factory Param({
    $core.String? name,
    ParamType? param,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (param != null) result.param = param;
    return result;
  }

  Param._();

  factory Param.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Param.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Param',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<ParamType>(2, _omitFieldNames ? '' : 'param',
        subBuilder: ParamType.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Param clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Param copyWith(void Function(Param) updates) =>
      super.copyWith((message) => updates(message as Param)) as Param;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Param create() => Param._();
  @$core.override
  Param createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Param getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Param>(create);
  static Param? _defaultInstance;

  /// Name of the parameter.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// Type of the parameter.
  @$pb.TagNumber(2)
  ParamType get param => $_getN(1);
  @$pb.TagNumber(2)
  set param(ParamType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasParam() => $_has(1);
  @$pb.TagNumber(2)
  void clearParam() => $_clearField(2);
  @$pb.TagNumber(2)
  ParamType ensureParam() => $_ensure(1);
}

enum ParamType_Param {
  boolean,
  numberInt,
  numberUint,
  stringParam,
  address,
  byteArray,
  byteArrayFix,
  array,
  fixedArray,
  tuple,
  notSet
}

class ParamType extends $pb.GeneratedMessage {
  factory ParamType({
    BoolType? boolean,
    NumberNType? numberInt,
    NumberNType? numberUint,
    StringType? stringParam,
    AddressType? address,
    ByteArrayType? byteArray,
    ByteArrayFixType? byteArrayFix,
    ArrayType? array,
    FixedArrayType? fixedArray,
    TupleType? tuple,
  }) {
    final result = create();
    if (boolean != null) result.boolean = boolean;
    if (numberInt != null) result.numberInt = numberInt;
    if (numberUint != null) result.numberUint = numberUint;
    if (stringParam != null) result.stringParam = stringParam;
    if (address != null) result.address = address;
    if (byteArray != null) result.byteArray = byteArray;
    if (byteArrayFix != null) result.byteArrayFix = byteArrayFix;
    if (array != null) result.array = array;
    if (fixedArray != null) result.fixedArray = fixedArray;
    if (tuple != null) result.tuple = tuple;
    return result;
  }

  ParamType._();

  factory ParamType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParamType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ParamType_Param> _ParamType_ParamByTag = {
    1: ParamType_Param.boolean,
    2: ParamType_Param.numberInt,
    3: ParamType_Param.numberUint,
    7: ParamType_Param.stringParam,
    8: ParamType_Param.address,
    9: ParamType_Param.byteArray,
    10: ParamType_Param.byteArrayFix,
    14: ParamType_Param.array,
    15: ParamType_Param.fixedArray,
    19: ParamType_Param.tuple,
    0: ParamType_Param.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParamType',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 7, 8, 9, 10, 14, 15, 19])
    ..aOM<BoolType>(1, _omitFieldNames ? '' : 'boolean',
        subBuilder: BoolType.create)
    ..aOM<NumberNType>(2, _omitFieldNames ? '' : 'numberInt',
        subBuilder: NumberNType.create)
    ..aOM<NumberNType>(3, _omitFieldNames ? '' : 'numberUint',
        subBuilder: NumberNType.create)
    ..aOM<StringType>(7, _omitFieldNames ? '' : 'stringParam',
        subBuilder: StringType.create)
    ..aOM<AddressType>(8, _omitFieldNames ? '' : 'address',
        subBuilder: AddressType.create)
    ..aOM<ByteArrayType>(9, _omitFieldNames ? '' : 'byteArray',
        subBuilder: ByteArrayType.create)
    ..aOM<ByteArrayFixType>(10, _omitFieldNames ? '' : 'byteArrayFix',
        subBuilder: ByteArrayFixType.create)
    ..aOM<ArrayType>(14, _omitFieldNames ? '' : 'array',
        subBuilder: ArrayType.create)
    ..aOM<FixedArrayType>(15, _omitFieldNames ? '' : 'fixedArray',
        subBuilder: FixedArrayType.create)
    ..aOM<TupleType>(19, _omitFieldNames ? '' : 'tuple',
        subBuilder: TupleType.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParamType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParamType copyWith(void Function(ParamType) updates) =>
      super.copyWith((message) => updates(message as ParamType)) as ParamType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParamType create() => ParamType._();
  @$core.override
  ParamType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParamType getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ParamType>(create);
  static ParamType? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(19)
  ParamType_Param whichParam() => _ParamType_ParamByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(19)
  void clearParam() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  BoolType get boolean => $_getN(0);
  @$pb.TagNumber(1)
  set boolean(BoolType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBoolean() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoolean() => $_clearField(1);
  @$pb.TagNumber(1)
  BoolType ensureBoolean() => $_ensure(0);

  @$pb.TagNumber(2)
  NumberNType get numberInt => $_getN(1);
  @$pb.TagNumber(2)
  set numberInt(NumberNType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNumberInt() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumberInt() => $_clearField(2);
  @$pb.TagNumber(2)
  NumberNType ensureNumberInt() => $_ensure(1);

  @$pb.TagNumber(3)
  NumberNType get numberUint => $_getN(2);
  @$pb.TagNumber(3)
  set numberUint(NumberNType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNumberUint() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumberUint() => $_clearField(3);
  @$pb.TagNumber(3)
  NumberNType ensureNumberUint() => $_ensure(2);

  /// Nested values. Gap in field numbering is intentional.
  @$pb.TagNumber(7)
  StringType get stringParam => $_getN(3);
  @$pb.TagNumber(7)
  set stringParam(StringType value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasStringParam() => $_has(3);
  @$pb.TagNumber(7)
  void clearStringParam() => $_clearField(7);
  @$pb.TagNumber(7)
  StringType ensureStringParam() => $_ensure(3);

  @$pb.TagNumber(8)
  AddressType get address => $_getN(4);
  @$pb.TagNumber(8)
  set address(AddressType value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasAddress() => $_has(4);
  @$pb.TagNumber(8)
  void clearAddress() => $_clearField(8);
  @$pb.TagNumber(8)
  AddressType ensureAddress() => $_ensure(4);

  @$pb.TagNumber(9)
  ByteArrayType get byteArray => $_getN(5);
  @$pb.TagNumber(9)
  set byteArray(ByteArrayType value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasByteArray() => $_has(5);
  @$pb.TagNumber(9)
  void clearByteArray() => $_clearField(9);
  @$pb.TagNumber(9)
  ByteArrayType ensureByteArray() => $_ensure(5);

  @$pb.TagNumber(10)
  ByteArrayFixType get byteArrayFix => $_getN(6);
  @$pb.TagNumber(10)
  set byteArrayFix(ByteArrayFixType value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasByteArrayFix() => $_has(6);
  @$pb.TagNumber(10)
  void clearByteArrayFix() => $_clearField(10);
  @$pb.TagNumber(10)
  ByteArrayFixType ensureByteArrayFix() => $_ensure(6);

  /// Nested values. Gap in field numbering is intentional.
  @$pb.TagNumber(14)
  ArrayType get array => $_getN(7);
  @$pb.TagNumber(14)
  set array(ArrayType value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasArray() => $_has(7);
  @$pb.TagNumber(14)
  void clearArray() => $_clearField(14);
  @$pb.TagNumber(14)
  ArrayType ensureArray() => $_ensure(7);

  @$pb.TagNumber(15)
  FixedArrayType get fixedArray => $_getN(8);
  @$pb.TagNumber(15)
  set fixedArray(FixedArrayType value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasFixedArray() => $_has(8);
  @$pb.TagNumber(15)
  void clearFixedArray() => $_clearField(15);
  @$pb.TagNumber(15)
  FixedArrayType ensureFixedArray() => $_ensure(8);

  /// Nested values. Gap in field numbering is intentional.
  @$pb.TagNumber(19)
  TupleType get tuple => $_getN(9);
  @$pb.TagNumber(19)
  set tuple(TupleType value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasTuple() => $_has(9);
  @$pb.TagNumber(19)
  void clearTuple() => $_clearField(19);
  @$pb.TagNumber(19)
  TupleType ensureTuple() => $_ensure(9);
}

/// Generic number parameter for all other bit sizes, like UInt24, 40, 48, ... 248.
class NumberNParam extends $pb.GeneratedMessage {
  factory NumberNParam({
    $core.int? bits,
    $core.List<$core.int>? value,
  }) {
    final result = create();
    if (bits != null) result.bits = bits;
    if (value != null) result.value = value;
    return result;
  }

  NumberNParam._();

  factory NumberNParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NumberNParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NumberNParam',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'bits', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NumberNParam clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NumberNParam copyWith(void Function(NumberNParam) updates) =>
      super.copyWith((message) => updates(message as NumberNParam))
          as NumberNParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NumberNParam create() => NumberNParam._();
  @$core.override
  NumberNParam createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NumberNParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NumberNParam>(create);
  static NumberNParam? _defaultInstance;

  /// Count of bits of the number.
  /// 0 < bits <= 256, bits % 8 == 0
  @$pb.TagNumber(1)
  $core.int get bits => $_getIZ(0);
  @$pb.TagNumber(1)
  set bits($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBits() => $_has(0);
  @$pb.TagNumber(1)
  void clearBits() => $_clearField(1);

  /// Serialized big endian.
  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);
}

/// A byte array of arbitrary size.
class ArrayParam extends $pb.GeneratedMessage {
  factory ArrayParam({
    ParamType? elementType,
    $core.Iterable<Token>? elements,
  }) {
    final result = create();
    if (elementType != null) result.elementType = elementType;
    if (elements != null) result.elements.addAll(elements);
    return result;
  }

  ArrayParam._();

  factory ArrayParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArrayParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArrayParam',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..aOM<ParamType>(1, _omitFieldNames ? '' : 'elementType',
        subBuilder: ParamType.create)
    ..pPM<Token>(2, _omitFieldNames ? '' : 'elements', subBuilder: Token.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArrayParam clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArrayParam copyWith(void Function(ArrayParam) updates) =>
      super.copyWith((message) => updates(message as ArrayParam)) as ArrayParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArrayParam create() => ArrayParam._();
  @$core.override
  ArrayParam createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArrayParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArrayParam>(create);
  static ArrayParam? _defaultInstance;

  /// The type of array elements.
  @$pb.TagNumber(1)
  ParamType get elementType => $_getN(0);
  @$pb.TagNumber(1)
  set elementType(ParamType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasElementType() => $_has(0);
  @$pb.TagNumber(1)
  void clearElementType() => $_clearField(1);
  @$pb.TagNumber(1)
  ParamType ensureElementType() => $_ensure(0);

  /// Array elements.
  @$pb.TagNumber(2)
  $pb.PbList<Token> get elements => $_getList(1);
}

/// A tuple with various parameters similar to a structure.
class TupleParam extends $pb.GeneratedMessage {
  factory TupleParam({
    $core.Iterable<Token>? params,
  }) {
    final result = create();
    if (params != null) result.params.addAll(params);
    return result;
  }

  TupleParam._();

  factory TupleParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TupleParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TupleParam',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..pPM<Token>(1, _omitFieldNames ? '' : 'params', subBuilder: Token.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TupleParam clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TupleParam copyWith(void Function(TupleParam) updates) =>
      super.copyWith((message) => updates(message as TupleParam)) as TupleParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TupleParam create() => TupleParam._();
  @$core.override
  TupleParam createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TupleParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TupleParam>(create);
  static TupleParam? _defaultInstance;

  /// Tokens (values) of the tuple parameters.
  @$pb.TagNumber(1)
  $pb.PbList<Token> get params => $_getList(0);
}

enum Token_Token {
  boolean,
  numberInt,
  numberUint,
  stringValue,
  address,
  byteArray,
  byteArrayFix,
  array,
  fixedArray,
  tuple,
  notSet
}

/// A value of an ABI parameter.
class Token extends $pb.GeneratedMessage {
  factory Token({
    $core.String? name,
    $core.bool? boolean,
    NumberNParam? numberInt,
    NumberNParam? numberUint,
    $core.String? stringValue,
    $core.String? address,
    $core.List<$core.int>? byteArray,
    $core.List<$core.int>? byteArrayFix,
    ArrayParam? array,
    ArrayParam? fixedArray,
    TupleParam? tuple,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (boolean != null) result.boolean = boolean;
    if (numberInt != null) result.numberInt = numberInt;
    if (numberUint != null) result.numberUint = numberUint;
    if (stringValue != null) result.stringValue = stringValue;
    if (address != null) result.address = address;
    if (byteArray != null) result.byteArray = byteArray;
    if (byteArrayFix != null) result.byteArrayFix = byteArrayFix;
    if (array != null) result.array = array;
    if (fixedArray != null) result.fixedArray = fixedArray;
    if (tuple != null) result.tuple = tuple;
    return result;
  }

  Token._();

  factory Token.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Token.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Token_Token> _Token_TokenByTag = {
    2: Token_Token.boolean,
    3: Token_Token.numberInt,
    4: Token_Token.numberUint,
    7: Token_Token.stringValue,
    8: Token_Token.address,
    9: Token_Token.byteArray,
    10: Token_Token.byteArrayFix,
    14: Token_Token.array,
    15: Token_Token.fixedArray,
    19: Token_Token.tuple,
    0: Token_Token.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Token',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 7, 8, 9, 10, 14, 15, 19])
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOB(2, _omitFieldNames ? '' : 'boolean')
    ..aOM<NumberNParam>(3, _omitFieldNames ? '' : 'numberInt',
        subBuilder: NumberNParam.create)
    ..aOM<NumberNParam>(4, _omitFieldNames ? '' : 'numberUint',
        subBuilder: NumberNParam.create)
    ..aOS(7, _omitFieldNames ? '' : 'stringValue')
    ..aOS(8, _omitFieldNames ? '' : 'address')
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'byteArray', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        10, _omitFieldNames ? '' : 'byteArrayFix', $pb.PbFieldType.OY)
    ..aOM<ArrayParam>(14, _omitFieldNames ? '' : 'array',
        subBuilder: ArrayParam.create)
    ..aOM<ArrayParam>(15, _omitFieldNames ? '' : 'fixedArray',
        subBuilder: ArrayParam.create)
    ..aOM<TupleParam>(19, _omitFieldNames ? '' : 'tuple',
        subBuilder: TupleParam.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Token clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Token copyWith(void Function(Token) updates) =>
      super.copyWith((message) => updates(message as Token)) as Token;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Token create() => Token._();
  @$core.override
  Token createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Token getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Token>(create);
  static Token? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(19)
  Token_Token whichToken() => _Token_TokenByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(19)
  void clearToken() => $_clearField($_whichOneof(0));

  /// Optional. Name of a corresponding parameter.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// Integer values.
  @$pb.TagNumber(2)
  $core.bool get boolean => $_getBF(1);
  @$pb.TagNumber(2)
  set boolean($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBoolean() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoolean() => $_clearField(2);

  @$pb.TagNumber(3)
  NumberNParam get numberInt => $_getN(2);
  @$pb.TagNumber(3)
  set numberInt(NumberNParam value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNumberInt() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumberInt() => $_clearField(3);
  @$pb.TagNumber(3)
  NumberNParam ensureNumberInt() => $_ensure(2);

  @$pb.TagNumber(4)
  NumberNParam get numberUint => $_getN(3);
  @$pb.TagNumber(4)
  set numberUint(NumberNParam value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasNumberUint() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumberUint() => $_clearField(4);
  @$pb.TagNumber(4)
  NumberNParam ensureNumberUint() => $_ensure(3);

  /// Simple values. Gap in field numbering is intentional.
  @$pb.TagNumber(7)
  $core.String get stringValue => $_getSZ(4);
  @$pb.TagNumber(7)
  set stringValue($core.String value) => $_setString(4, value);
  @$pb.TagNumber(7)
  $core.bool hasStringValue() => $_has(4);
  @$pb.TagNumber(7)
  void clearStringValue() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get address => $_getSZ(5);
  @$pb.TagNumber(8)
  set address($core.String value) => $_setString(5, value);
  @$pb.TagNumber(8)
  $core.bool hasAddress() => $_has(5);
  @$pb.TagNumber(8)
  void clearAddress() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get byteArray => $_getN(6);
  @$pb.TagNumber(9)
  set byteArray($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(9)
  $core.bool hasByteArray() => $_has(6);
  @$pb.TagNumber(9)
  void clearByteArray() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.int> get byteArrayFix => $_getN(7);
  @$pb.TagNumber(10)
  set byteArrayFix($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(10)
  $core.bool hasByteArrayFix() => $_has(7);
  @$pb.TagNumber(10)
  void clearByteArrayFix() => $_clearField(10);

  /// Nested values. Gap in field numbering is intentional.
  @$pb.TagNumber(14)
  ArrayParam get array => $_getN(8);
  @$pb.TagNumber(14)
  set array(ArrayParam value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasArray() => $_has(8);
  @$pb.TagNumber(14)
  void clearArray() => $_clearField(14);
  @$pb.TagNumber(14)
  ArrayParam ensureArray() => $_ensure(8);

  @$pb.TagNumber(15)
  ArrayParam get fixedArray => $_getN(9);
  @$pb.TagNumber(15)
  set fixedArray(ArrayParam value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasFixedArray() => $_has(9);
  @$pb.TagNumber(15)
  void clearFixedArray() => $_clearField(15);
  @$pb.TagNumber(15)
  ArrayParam ensureFixedArray() => $_ensure(9);

  /// Nested values. Gap in field numbering is intentional.
  @$pb.TagNumber(19)
  TupleParam get tuple => $_getN(10);
  @$pb.TagNumber(19)
  set tuple(TupleParam value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasTuple() => $_has(10);
  @$pb.TagNumber(19)
  void clearTuple() => $_clearField(19);
  @$pb.TagNumber(19)
  TupleParam ensureTuple() => $_ensure(10);
}

/// Decode a contract call (function input) according to the given ABI json.
class ContractCallDecodingInput extends $pb.GeneratedMessage {
  factory ContractCallDecodingInput({
    $core.List<$core.int>? encoded,
    $core.String? smartContractAbiJson,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
    if (smartContractAbiJson != null)
      result.smartContractAbiJson = smartContractAbiJson;
    return result;
  }

  ContractCallDecodingInput._();

  factory ContractCallDecodingInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ContractCallDecodingInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ContractCallDecodingInput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'smartContractAbiJson')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ContractCallDecodingInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ContractCallDecodingInput copyWith(
          void Function(ContractCallDecodingInput) updates) =>
      super.copyWith((message) => updates(message as ContractCallDecodingInput))
          as ContractCallDecodingInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContractCallDecodingInput create() => ContractCallDecodingInput._();
  @$core.override
  ContractCallDecodingInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ContractCallDecodingInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ContractCallDecodingInput>(create);
  static ContractCallDecodingInput? _defaultInstance;

  /// An encoded smart contract call with a prefixed function signature (4 bytes).
  @$pb.TagNumber(1)
  $core.List<$core.int> get encoded => $_getN(0);
  @$pb.TagNumber(1)
  set encoded($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);

  /// A smart contract ABI in JSON.
  /// Each ABI function must be mapped to a short signature.
  /// Expected to be a set of functions mapped to corresponding short signatures.
  /// Example:
  /// ```
  /// {
  ///     "1896f70a": {
  ///         "name": "setResolver",
  ///         "inputs": [...],
  ///         ...
  ///     },
  ///     "ac9650d8": {
  ///         "name": "multicall",
  ///         "inputs": [...],
  ///         ...
  ///     }
  /// }
  /// ```
  @$pb.TagNumber(2)
  $core.String get smartContractAbiJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set smartContractAbiJson($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSmartContractAbiJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearSmartContractAbiJson() => $_clearField(2);
}

class ContractCallDecodingOutput extends $pb.GeneratedMessage {
  factory ContractCallDecodingOutput({
    $core.String? decodedJson,
    $core.Iterable<Token>? tokens,
    AbiError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (decodedJson != null) result.decodedJson = decodedJson;
    if (tokens != null) result.tokens.addAll(tokens);
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  ContractCallDecodingOutput._();

  factory ContractCallDecodingOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ContractCallDecodingOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ContractCallDecodingOutput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'decodedJson')
    ..pPM<Token>(2, _omitFieldNames ? '' : 'tokens', subBuilder: Token.create)
    ..aE<AbiError>(3, _omitFieldNames ? '' : 'error',
        enumValues: AbiError.values)
    ..aOS(4, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ContractCallDecodingOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ContractCallDecodingOutput copyWith(
          void Function(ContractCallDecodingOutput) updates) =>
      super.copyWith(
              (message) => updates(message as ContractCallDecodingOutput))
          as ContractCallDecodingOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContractCallDecodingOutput create() => ContractCallDecodingOutput._();
  @$core.override
  ContractCallDecodingOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ContractCallDecodingOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ContractCallDecodingOutput>(create);
  static ContractCallDecodingOutput? _defaultInstance;

  /// Human readable json format, according to the input `ContractCallDecodingInput::smart_contract_abi_json`.
  @$pb.TagNumber(1)
  $core.String get decodedJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set decodedJson($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDecodedJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearDecodedJson() => $_clearField(1);

  /// Decoded parameters.
  @$pb.TagNumber(2)
  $pb.PbList<Token> get tokens => $_getList(1);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(3)
  AbiError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(AbiError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);

  /// error code description
  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => $_clearField(4);
}

/// A set of ABI type parameters.
class AbiParams extends $pb.GeneratedMessage {
  factory AbiParams({
    $core.Iterable<Param>? params,
  }) {
    final result = create();
    if (params != null) result.params.addAll(params);
    return result;
  }

  AbiParams._();

  factory AbiParams.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AbiParams.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AbiParams',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..pPM<Param>(1, _omitFieldNames ? '' : 'params', subBuilder: Param.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AbiParams clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AbiParams copyWith(void Function(AbiParams) updates) =>
      super.copyWith((message) => updates(message as AbiParams)) as AbiParams;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AbiParams create() => AbiParams._();
  @$core.override
  AbiParams createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AbiParams getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AbiParams>(create);
  static AbiParams? _defaultInstance;

  /// ABI type parameters.
  @$pb.TagNumber(1)
  $pb.PbList<Param> get params => $_getList(0);
}

enum ParamsDecodingInput_Abi { abiJson, abiParams, notSet }

/// Decode a function input or output data according to the given ABI json.
class ParamsDecodingInput extends $pb.GeneratedMessage {
  factory ParamsDecodingInput({
    $core.List<$core.int>? encoded,
    $core.String? abiJson,
    AbiParams? abiParams,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
    if (abiJson != null) result.abiJson = abiJson;
    if (abiParams != null) result.abiParams = abiParams;
    return result;
  }

  ParamsDecodingInput._();

  factory ParamsDecodingInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParamsDecodingInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ParamsDecodingInput_Abi>
      _ParamsDecodingInput_AbiByTag = {
    2: ParamsDecodingInput_Abi.abiJson,
    3: ParamsDecodingInput_Abi.abiParams,
    0: ParamsDecodingInput_Abi.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParamsDecodingInput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'abiJson')
    ..aOM<AbiParams>(3, _omitFieldNames ? '' : 'abiParams',
        subBuilder: AbiParams.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParamsDecodingInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParamsDecodingInput copyWith(void Function(ParamsDecodingInput) updates) =>
      super.copyWith((message) => updates(message as ParamsDecodingInput))
          as ParamsDecodingInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParamsDecodingInput create() => ParamsDecodingInput._();
  @$core.override
  ParamsDecodingInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParamsDecodingInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParamsDecodingInput>(create);
  static ParamsDecodingInput? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  ParamsDecodingInput_Abi whichAbi() =>
      _ParamsDecodingInput_AbiByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearAbi() => $_clearField($_whichOneof(0));

  /// An encoded ABI.
  @$pb.TagNumber(1)
  $core.List<$core.int> get encoded => $_getN(0);
  @$pb.TagNumber(1)
  set encoded($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);

  /// A set of ABI parameters in JSON.
  /// Expected to be a JSON array at the entry level.
  /// Example:
  /// ```
  /// [
  ///     {
  ///         "name": "_to',
  ///         "type": "address"
  ///     },
  ///     {
  ///         "name": "_value",
  ///         "type": "uint256"
  ///     }
  /// ]
  /// ```
  @$pb.TagNumber(2)
  $core.String get abiJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set abiJson($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAbiJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearAbiJson() => $_clearField(2);

  /// A set of ABI type parameters.
  @$pb.TagNumber(3)
  AbiParams get abiParams => $_getN(2);
  @$pb.TagNumber(3)
  set abiParams(AbiParams value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAbiParams() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbiParams() => $_clearField(3);
  @$pb.TagNumber(3)
  AbiParams ensureAbiParams() => $_ensure(2);
}

class ParamsDecodingOutput extends $pb.GeneratedMessage {
  factory ParamsDecodingOutput({
    $core.Iterable<Token>? tokens,
    AbiError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (tokens != null) result.tokens.addAll(tokens);
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  ParamsDecodingOutput._();

  factory ParamsDecodingOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParamsDecodingOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParamsDecodingOutput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..pPM<Token>(1, _omitFieldNames ? '' : 'tokens', subBuilder: Token.create)
    ..aE<AbiError>(2, _omitFieldNames ? '' : 'error',
        enumValues: AbiError.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParamsDecodingOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParamsDecodingOutput copyWith(void Function(ParamsDecodingOutput) updates) =>
      super.copyWith((message) => updates(message as ParamsDecodingOutput))
          as ParamsDecodingOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParamsDecodingOutput create() => ParamsDecodingOutput._();
  @$core.override
  ParamsDecodingOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParamsDecodingOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParamsDecodingOutput>(create);
  static ParamsDecodingOutput? _defaultInstance;

  /// Decoded parameters.
  @$pb.TagNumber(1)
  $pb.PbList<Token> get tokens => $_getList(0);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(2)
  AbiError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(AbiError value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);

  /// error code description
  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);
}

/// Decode an Eth ABI value.
class ValueDecodingInput extends $pb.GeneratedMessage {
  factory ValueDecodingInput({
    $core.List<$core.int>? encoded,
    $core.String? paramType,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
    if (paramType != null) result.paramType = paramType;
    return result;
  }

  ValueDecodingInput._();

  factory ValueDecodingInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValueDecodingInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValueDecodingInput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'paramType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValueDecodingInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValueDecodingInput copyWith(void Function(ValueDecodingInput) updates) =>
      super.copyWith((message) => updates(message as ValueDecodingInput))
          as ValueDecodingInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValueDecodingInput create() => ValueDecodingInput._();
  @$core.override
  ValueDecodingInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ValueDecodingInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValueDecodingInput>(create);
  static ValueDecodingInput? _defaultInstance;

  /// An encoded value to be decoded.
  @$pb.TagNumber(1)
  $core.List<$core.int> get encoded => $_getN(0);
  @$pb.TagNumber(1)
  set encoded($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);

  /// A type of the parameter.
  /// Example: "bytes[32]".
  /// Please note `tuple` is not supported.
  @$pb.TagNumber(2)
  $core.String get paramType => $_getSZ(1);
  @$pb.TagNumber(2)
  set paramType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasParamType() => $_has(1);
  @$pb.TagNumber(2)
  void clearParamType() => $_clearField(2);
}

class ValueDecodingOutput extends $pb.GeneratedMessage {
  factory ValueDecodingOutput({
    Token? token,
    $core.String? paramStr,
    AbiError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (paramStr != null) result.paramStr = paramStr;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  ValueDecodingOutput._();

  factory ValueDecodingOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValueDecodingOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValueDecodingOutput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..aOM<Token>(1, _omitFieldNames ? '' : 'token', subBuilder: Token.create)
    ..aOS(2, _omitFieldNames ? '' : 'paramStr')
    ..aE<AbiError>(3, _omitFieldNames ? '' : 'error',
        enumValues: AbiError.values)
    ..aOS(4, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValueDecodingOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValueDecodingOutput copyWith(void Function(ValueDecodingOutput) updates) =>
      super.copyWith((message) => updates(message as ValueDecodingOutput))
          as ValueDecodingOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValueDecodingOutput create() => ValueDecodingOutput._();
  @$core.override
  ValueDecodingOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ValueDecodingOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValueDecodingOutput>(create);
  static ValueDecodingOutput? _defaultInstance;

  /// Decoded parameter.
  @$pb.TagNumber(1)
  Token get token => $_getN(0);
  @$pb.TagNumber(1)
  set token(Token value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);
  @$pb.TagNumber(1)
  Token ensureToken() => $_ensure(0);

  /// Decoded parameter as a string.
  @$pb.TagNumber(2)
  $core.String get paramStr => $_getSZ(1);
  @$pb.TagNumber(2)
  set paramStr($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasParamStr() => $_has(1);
  @$pb.TagNumber(2)
  void clearParamStr() => $_clearField(2);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(3)
  AbiError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(AbiError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);

  /// error code description
  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => $_clearField(4);
}

/// Encode a function call to Eth ABI binary.
class FunctionEncodingInput extends $pb.GeneratedMessage {
  factory FunctionEncodingInput({
    $core.String? functionName,
    $core.Iterable<Token>? tokens,
  }) {
    final result = create();
    if (functionName != null) result.functionName = functionName;
    if (tokens != null) result.tokens.addAll(tokens);
    return result;
  }

  FunctionEncodingInput._();

  factory FunctionEncodingInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FunctionEncodingInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FunctionEncodingInput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'functionName')
    ..pPM<Token>(2, _omitFieldNames ? '' : 'tokens', subBuilder: Token.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionEncodingInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionEncodingInput copyWith(
          void Function(FunctionEncodingInput) updates) =>
      super.copyWith((message) => updates(message as FunctionEncodingInput))
          as FunctionEncodingInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FunctionEncodingInput create() => FunctionEncodingInput._();
  @$core.override
  FunctionEncodingInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FunctionEncodingInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FunctionEncodingInput>(create);
  static FunctionEncodingInput? _defaultInstance;

  /// Function name.
  @$pb.TagNumber(1)
  $core.String get functionName => $_getSZ(0);
  @$pb.TagNumber(1)
  set functionName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFunctionName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFunctionName() => $_clearField(1);

  /// Parameters to be encoded.
  @$pb.TagNumber(2)
  $pb.PbList<Token> get tokens => $_getList(1);
}

class FunctionEncodingOutput extends $pb.GeneratedMessage {
  factory FunctionEncodingOutput({
    $core.String? functionType,
    $core.List<$core.int>? encoded,
    AbiError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (functionType != null) result.functionType = functionType;
    if (encoded != null) result.encoded = encoded;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  FunctionEncodingOutput._();

  factory FunctionEncodingOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FunctionEncodingOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FunctionEncodingOutput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'functionType')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aE<AbiError>(3, _omitFieldNames ? '' : 'error',
        enumValues: AbiError.values)
    ..aOS(4, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionEncodingOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionEncodingOutput copyWith(
          void Function(FunctionEncodingOutput) updates) =>
      super.copyWith((message) => updates(message as FunctionEncodingOutput))
          as FunctionEncodingOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FunctionEncodingOutput create() => FunctionEncodingOutput._();
  @$core.override
  FunctionEncodingOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FunctionEncodingOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FunctionEncodingOutput>(create);
  static FunctionEncodingOutput? _defaultInstance;

  /// The function type signature.
  /// Example: "baz(int32,uint256)"
  @$pb.TagNumber(1)
  $core.String get functionType => $_getSZ(0);
  @$pb.TagNumber(1)
  set functionType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFunctionType() => $_has(0);
  @$pb.TagNumber(1)
  void clearFunctionType() => $_clearField(1);

  /// An encoded smart contract call with a prefixed function signature (4 bytes).
  @$pb.TagNumber(2)
  $core.List<$core.int> get encoded => $_getN(1);
  @$pb.TagNumber(2)
  set encoded($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEncoded() => $_has(1);
  @$pb.TagNumber(2)
  void clearEncoded() => $_clearField(2);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(3)
  AbiError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(AbiError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);

  /// error code description
  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => $_clearField(4);
}

/// Return the function type signature, of the form "baz(int32,uint256)".
class FunctionGetTypeInput extends $pb.GeneratedMessage {
  factory FunctionGetTypeInput({
    $core.String? functionName,
    $core.Iterable<Param>? inputs,
  }) {
    final result = create();
    if (functionName != null) result.functionName = functionName;
    if (inputs != null) result.inputs.addAll(inputs);
    return result;
  }

  FunctionGetTypeInput._();

  factory FunctionGetTypeInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FunctionGetTypeInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FunctionGetTypeInput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.EthereumAbi.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'functionName')
    ..pPM<Param>(2, _omitFieldNames ? '' : 'inputs', subBuilder: Param.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionGetTypeInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionGetTypeInput copyWith(void Function(FunctionGetTypeInput) updates) =>
      super.copyWith((message) => updates(message as FunctionGetTypeInput))
          as FunctionGetTypeInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FunctionGetTypeInput create() => FunctionGetTypeInput._();
  @$core.override
  FunctionGetTypeInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FunctionGetTypeInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FunctionGetTypeInput>(create);
  static FunctionGetTypeInput? _defaultInstance;

  /// Function signature. Includes function inputs if they are.
  /// Examples:
  /// - `functionName()`
  /// - `functionName()`
  /// - `functionName(bool)`
  /// - `functionName(uint256,bytes32)`
  @$pb.TagNumber(1)
  $core.String get functionName => $_getSZ(0);
  @$pb.TagNumber(1)
  set functionName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFunctionName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFunctionName() => $_clearField(1);

  /// A set of ABI type parameters.
  @$pb.TagNumber(2)
  $pb.PbList<Param> get inputs => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
