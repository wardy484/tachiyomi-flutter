// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reader_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReaderStateTearOff {
  const _$ReaderStateTearOff();

  _Reading reading(String progress, bool appbarVisible) {
    return _Reading(
      progress,
      appbarVisible,
    );
  }
}

/// @nodoc
const $ReaderState = _$ReaderStateTearOff();

/// @nodoc
mixin _$ReaderState {
  String get progress => throw _privateConstructorUsedError;
  bool get appbarVisible => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String progress, bool appbarVisible) reading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String progress, bool appbarVisible)? reading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String progress, bool appbarVisible)? reading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reading value) reading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Reading value)? reading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reading value)? reading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReaderStateCopyWith<ReaderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReaderStateCopyWith<$Res> {
  factory $ReaderStateCopyWith(
          ReaderState value, $Res Function(ReaderState) then) =
      _$ReaderStateCopyWithImpl<$Res>;
  $Res call({String progress, bool appbarVisible});
}

/// @nodoc
class _$ReaderStateCopyWithImpl<$Res> implements $ReaderStateCopyWith<$Res> {
  _$ReaderStateCopyWithImpl(this._value, this._then);

  final ReaderState _value;
  // ignore: unused_field
  final $Res Function(ReaderState) _then;

  @override
  $Res call({
    Object? progress = freezed,
    Object? appbarVisible = freezed,
  }) {
    return _then(_value.copyWith(
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String,
      appbarVisible: appbarVisible == freezed
          ? _value.appbarVisible
          : appbarVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ReadingCopyWith<$Res> implements $ReaderStateCopyWith<$Res> {
  factory _$ReadingCopyWith(_Reading value, $Res Function(_Reading) then) =
      __$ReadingCopyWithImpl<$Res>;
  @override
  $Res call({String progress, bool appbarVisible});
}

/// @nodoc
class __$ReadingCopyWithImpl<$Res> extends _$ReaderStateCopyWithImpl<$Res>
    implements _$ReadingCopyWith<$Res> {
  __$ReadingCopyWithImpl(_Reading _value, $Res Function(_Reading) _then)
      : super(_value, (v) => _then(v as _Reading));

  @override
  _Reading get _value => super._value as _Reading;

  @override
  $Res call({
    Object? progress = freezed,
    Object? appbarVisible = freezed,
  }) {
    return _then(_Reading(
      progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String,
      appbarVisible == freezed
          ? _value.appbarVisible
          : appbarVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Reading implements _Reading {
  const _$_Reading(this.progress, this.appbarVisible);

  @override
  final String progress;
  @override
  final bool appbarVisible;

  @override
  String toString() {
    return 'ReaderState.reading(progress: $progress, appbarVisible: $appbarVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reading &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.appbarVisible, appbarVisible) ||
                other.appbarVisible == appbarVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, appbarVisible);

  @JsonKey(ignore: true)
  @override
  _$ReadingCopyWith<_Reading> get copyWith =>
      __$ReadingCopyWithImpl<_Reading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String progress, bool appbarVisible) reading,
  }) {
    return reading(progress, appbarVisible);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String progress, bool appbarVisible)? reading,
  }) {
    return reading?.call(progress, appbarVisible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String progress, bool appbarVisible)? reading,
    required TResult orElse(),
  }) {
    if (reading != null) {
      return reading(progress, appbarVisible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reading value) reading,
  }) {
    return reading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Reading value)? reading,
  }) {
    return reading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reading value)? reading,
    required TResult orElse(),
  }) {
    if (reading != null) {
      return reading(this);
    }
    return orElse();
  }
}

abstract class _Reading implements ReaderState {
  const factory _Reading(String progress, bool appbarVisible) = _$_Reading;

  @override
  String get progress;
  @override
  bool get appbarVisible;
  @override
  @JsonKey(ignore: true)
  _$ReadingCopyWith<_Reading> get copyWith =>
      throw _privateConstructorUsedError;
}
