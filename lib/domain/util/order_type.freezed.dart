// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ascending,
    required TResult Function() descending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ascending,
    TResult? Function()? descending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ascending,
    TResult Function()? descending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderTypeAscending value) ascending,
    required TResult Function(OrderTypeDescending value) descending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderTypeAscending value)? ascending,
    TResult? Function(OrderTypeDescending value)? descending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderTypeAscending value)? ascending,
    TResult Function(OrderTypeDescending value)? descending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTypeCopyWith<$Res> {
  factory $OrderTypeCopyWith(OrderType value, $Res Function(OrderType) then) =
      _$OrderTypeCopyWithImpl<$Res, OrderType>;
}

/// @nodoc
class _$OrderTypeCopyWithImpl<$Res, $Val extends OrderType>
    implements $OrderTypeCopyWith<$Res> {
  _$OrderTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OrderTypeAscendingCopyWith<$Res> {
  factory _$$OrderTypeAscendingCopyWith(_$OrderTypeAscending value,
          $Res Function(_$OrderTypeAscending) then) =
      __$$OrderTypeAscendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderTypeAscendingCopyWithImpl<$Res>
    extends _$OrderTypeCopyWithImpl<$Res, _$OrderTypeAscending>
    implements _$$OrderTypeAscendingCopyWith<$Res> {
  __$$OrderTypeAscendingCopyWithImpl(
      _$OrderTypeAscending _value, $Res Function(_$OrderTypeAscending) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderTypeAscending implements OrderTypeAscending {
  const _$OrderTypeAscending();

  @override
  String toString() {
    return 'OrderType.ascending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderTypeAscending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ascending,
    required TResult Function() descending,
  }) {
    return ascending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ascending,
    TResult? Function()? descending,
  }) {
    return ascending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ascending,
    TResult Function()? descending,
    required TResult orElse(),
  }) {
    if (ascending != null) {
      return ascending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderTypeAscending value) ascending,
    required TResult Function(OrderTypeDescending value) descending,
  }) {
    return ascending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderTypeAscending value)? ascending,
    TResult? Function(OrderTypeDescending value)? descending,
  }) {
    return ascending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderTypeAscending value)? ascending,
    TResult Function(OrderTypeDescending value)? descending,
    required TResult orElse(),
  }) {
    if (ascending != null) {
      return ascending(this);
    }
    return orElse();
  }
}

abstract class OrderTypeAscending implements OrderType {
  const factory OrderTypeAscending() = _$OrderTypeAscending;
}

/// @nodoc
abstract class _$$OrderTypeDescendingCopyWith<$Res> {
  factory _$$OrderTypeDescendingCopyWith(_$OrderTypeDescending value,
          $Res Function(_$OrderTypeDescending) then) =
      __$$OrderTypeDescendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderTypeDescendingCopyWithImpl<$Res>
    extends _$OrderTypeCopyWithImpl<$Res, _$OrderTypeDescending>
    implements _$$OrderTypeDescendingCopyWith<$Res> {
  __$$OrderTypeDescendingCopyWithImpl(
      _$OrderTypeDescending _value, $Res Function(_$OrderTypeDescending) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderTypeDescending implements OrderTypeDescending {
  const _$OrderTypeDescending();

  @override
  String toString() {
    return 'OrderType.descending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderTypeDescending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ascending,
    required TResult Function() descending,
  }) {
    return descending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ascending,
    TResult? Function()? descending,
  }) {
    return descending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ascending,
    TResult Function()? descending,
    required TResult orElse(),
  }) {
    if (descending != null) {
      return descending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderTypeAscending value) ascending,
    required TResult Function(OrderTypeDescending value) descending,
  }) {
    return descending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderTypeAscending value)? ascending,
    TResult? Function(OrderTypeDescending value)? descending,
  }) {
    return descending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderTypeAscending value)? ascending,
    TResult Function(OrderTypeDescending value)? descending,
    required TResult orElse(),
  }) {
    if (descending != null) {
      return descending(this);
    }
    return orElse();
  }
}

abstract class OrderTypeDescending implements OrderType {
  const factory OrderTypeDescending() = _$OrderTypeDescending;
}
