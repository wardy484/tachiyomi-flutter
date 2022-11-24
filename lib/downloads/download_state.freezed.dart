// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'download_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadState {
  List<Download> get downloads => throw _privateConstructorUsedError;
  FlutterIsolate? get isolate => throw _privateConstructorUsedError;
  SendPort? get sendPort => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Download> downloads, FlutterIsolate? isolate,
            SendPort? sendPort)
        download,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Download> downloads, FlutterIsolate? isolate,
            SendPort? sendPort)?
        download,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Download> downloads, FlutterIsolate? isolate,
            SendPort? sendPort)?
        download,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Downloading value) download,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Downloading value)? download,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Downloading value)? download,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadStateCopyWith<DownloadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadStateCopyWith<$Res> {
  factory $DownloadStateCopyWith(
          DownloadState value, $Res Function(DownloadState) then) =
      _$DownloadStateCopyWithImpl<$Res>;
  $Res call(
      {List<Download> downloads, FlutterIsolate? isolate, SendPort? sendPort});
}

/// @nodoc
class _$DownloadStateCopyWithImpl<$Res>
    implements $DownloadStateCopyWith<$Res> {
  _$DownloadStateCopyWithImpl(this._value, this._then);

  final DownloadState _value;
  // ignore: unused_field
  final $Res Function(DownloadState) _then;

  @override
  $Res call({
    Object? downloads = freezed,
    Object? isolate = freezed,
    Object? sendPort = freezed,
  }) {
    return _then(_value.copyWith(
      downloads: downloads == freezed
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Download>,
      isolate: isolate == freezed
          ? _value.isolate
          : isolate // ignore: cast_nullable_to_non_nullable
              as FlutterIsolate?,
      sendPort: sendPort == freezed
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort?,
    ));
  }
}

/// @nodoc
abstract class _$$_DownloadingCopyWith<$Res>
    implements $DownloadStateCopyWith<$Res> {
  factory _$$_DownloadingCopyWith(
          _$_Downloading value, $Res Function(_$_Downloading) then) =
      __$$_DownloadingCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Download> downloads, FlutterIsolate? isolate, SendPort? sendPort});
}

/// @nodoc
class __$$_DownloadingCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res>
    implements _$$_DownloadingCopyWith<$Res> {
  __$$_DownloadingCopyWithImpl(
      _$_Downloading _value, $Res Function(_$_Downloading) _then)
      : super(_value, (v) => _then(v as _$_Downloading));

  @override
  _$_Downloading get _value => super._value as _$_Downloading;

  @override
  $Res call({
    Object? downloads = freezed,
    Object? isolate = freezed,
    Object? sendPort = freezed,
  }) {
    return _then(_$_Downloading(
      downloads: downloads == freezed
          ? _value._downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Download>,
      isolate: isolate == freezed
          ? _value.isolate
          : isolate // ignore: cast_nullable_to_non_nullable
              as FlutterIsolate?,
      sendPort: sendPort == freezed
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort?,
    ));
  }
}

/// @nodoc

class _$_Downloading implements _Downloading {
  const _$_Downloading(
      {required final List<Download> downloads, this.isolate, this.sendPort})
      : _downloads = downloads;

  final List<Download> _downloads;
  @override
  List<Download> get downloads {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloads);
  }

  @override
  final FlutterIsolate? isolate;
  @override
  final SendPort? sendPort;

  @override
  String toString() {
    return 'DownloadState.download(downloads: $downloads, isolate: $isolate, sendPort: $sendPort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Downloading &&
            const DeepCollectionEquality()
                .equals(other._downloads, _downloads) &&
            const DeepCollectionEquality().equals(other.isolate, isolate) &&
            const DeepCollectionEquality().equals(other.sendPort, sendPort));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_downloads),
      const DeepCollectionEquality().hash(isolate),
      const DeepCollectionEquality().hash(sendPort));

  @JsonKey(ignore: true)
  @override
  _$$_DownloadingCopyWith<_$_Downloading> get copyWith =>
      __$$_DownloadingCopyWithImpl<_$_Downloading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Download> downloads, FlutterIsolate? isolate,
            SendPort? sendPort)
        download,
  }) {
    return download(downloads, isolate, sendPort);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Download> downloads, FlutterIsolate? isolate,
            SendPort? sendPort)?
        download,
  }) {
    return download?.call(downloads, isolate, sendPort);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Download> downloads, FlutterIsolate? isolate,
            SendPort? sendPort)?
        download,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(downloads, isolate, sendPort);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Downloading value) download,
  }) {
    return download(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Downloading value)? download,
  }) {
    return download?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Downloading value)? download,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(this);
    }
    return orElse();
  }
}

abstract class _Downloading implements DownloadState {
  const factory _Downloading(
      {required final List<Download> downloads,
      final FlutterIsolate? isolate,
      final SendPort? sendPort}) = _$_Downloading;

  @override
  List<Download> get downloads;
  @override
  FlutterIsolate? get isolate;
  @override
  SendPort? get sendPort;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadingCopyWith<_$_Downloading> get copyWith =>
      throw _privateConstructorUsedError;
}
