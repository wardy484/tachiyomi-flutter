// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reader_progress_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReaderProgressStateTearOff {
  const _$ReaderProgressStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Progressed progressed(String progress) {
    return _Progressed(
      progress,
    );
  }
}

/// @nodoc
const $ReaderProgressState = _$ReaderProgressStateTearOff();

/// @nodoc
mixin _$ReaderProgressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String progress) progressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String progress)? progressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String progress)? progressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Progressed value) progressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Progressed value)? progressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Progressed value)? progressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReaderProgressStateCopyWith<$Res> {
  factory $ReaderProgressStateCopyWith(
          ReaderProgressState value, $Res Function(ReaderProgressState) then) =
      _$ReaderProgressStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReaderProgressStateCopyWithImpl<$Res>
    implements $ReaderProgressStateCopyWith<$Res> {
  _$ReaderProgressStateCopyWithImpl(this._value, this._then);

  final ReaderProgressState _value;
  // ignore: unused_field
  final $Res Function(ReaderProgressState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$ReaderProgressStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ReaderProgressState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String progress) progressed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String progress)? progressed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String progress)? progressed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Progressed value) progressed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Progressed value)? progressed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Progressed value)? progressed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReaderProgressState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ProgressedCopyWith<$Res> {
  factory _$ProgressedCopyWith(
          _Progressed value, $Res Function(_Progressed) then) =
      __$ProgressedCopyWithImpl<$Res>;
  $Res call({String progress});
}

/// @nodoc
class __$ProgressedCopyWithImpl<$Res>
    extends _$ReaderProgressStateCopyWithImpl<$Res>
    implements _$ProgressedCopyWith<$Res> {
  __$ProgressedCopyWithImpl(
      _Progressed _value, $Res Function(_Progressed) _then)
      : super(_value, (v) => _then(v as _Progressed));

  @override
  _Progressed get _value => super._value as _Progressed;

  @override
  $Res call({
    Object? progress = freezed,
  }) {
    return _then(_Progressed(
      progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Progressed implements _Progressed {
  const _$_Progressed(this.progress);

  @override
  final String progress;

  @override
  String toString() {
    return 'ReaderProgressState.progressed(progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Progressed &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  @JsonKey(ignore: true)
  @override
  _$ProgressedCopyWith<_Progressed> get copyWith =>
      __$ProgressedCopyWithImpl<_Progressed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String progress) progressed,
  }) {
    return progressed(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String progress)? progressed,
  }) {
    return progressed?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String progress)? progressed,
    required TResult orElse(),
  }) {
    if (progressed != null) {
      return progressed(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Progressed value) progressed,
  }) {
    return progressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Progressed value)? progressed,
  }) {
    return progressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Progressed value)? progressed,
    required TResult orElse(),
  }) {
    if (progressed != null) {
      return progressed(this);
    }
    return orElse();
  }
}

abstract class _Progressed implements ReaderProgressState {
  const factory _Progressed(String progress) = _$_Progressed;

  String get progress;
  @JsonKey(ignore: true)
  _$ProgressedCopyWith<_Progressed> get copyWith =>
      throw _privateConstructorUsedError;
}
