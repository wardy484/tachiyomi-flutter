// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'download.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Download _$DownloadFromJson(Map<String, dynamic> json) {
  return _Download.fromJson(json);
}

/// @nodoc
mixin _$Download {
  Manga get manga => throw _privateConstructorUsedError;
  Chapter get chapter => throw _privateConstructorUsedError;
  DownloadStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DownloadCopyWith<Download> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadCopyWith<$Res> {
  factory $DownloadCopyWith(Download value, $Res Function(Download) then) =
      _$DownloadCopyWithImpl<$Res>;
  $Res call({Manga manga, Chapter chapter, DownloadStatus status});

  $MangaCopyWith<$Res> get manga;
  $ChapterCopyWith<$Res> get chapter;
}

/// @nodoc
class _$DownloadCopyWithImpl<$Res> implements $DownloadCopyWith<$Res> {
  _$DownloadCopyWithImpl(this._value, this._then);

  final Download _value;
  // ignore: unused_field
  final $Res Function(Download) _then;

  @override
  $Res call({
    Object? manga = freezed,
    Object? chapter = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      manga: manga == freezed
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga,
      chapter: chapter == freezed
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
    ));
  }

  @override
  $MangaCopyWith<$Res> get manga {
    return $MangaCopyWith<$Res>(_value.manga, (value) {
      return _then(_value.copyWith(manga: value));
    });
  }

  @override
  $ChapterCopyWith<$Res> get chapter {
    return $ChapterCopyWith<$Res>(_value.chapter, (value) {
      return _then(_value.copyWith(chapter: value));
    });
  }
}

/// @nodoc
abstract class _$DownloadCopyWith<$Res> implements $DownloadCopyWith<$Res> {
  factory _$DownloadCopyWith(_Download value, $Res Function(_Download) then) =
      __$DownloadCopyWithImpl<$Res>;
  @override
  $Res call({Manga manga, Chapter chapter, DownloadStatus status});

  @override
  $MangaCopyWith<$Res> get manga;
  @override
  $ChapterCopyWith<$Res> get chapter;
}

/// @nodoc
class __$DownloadCopyWithImpl<$Res> extends _$DownloadCopyWithImpl<$Res>
    implements _$DownloadCopyWith<$Res> {
  __$DownloadCopyWithImpl(_Download _value, $Res Function(_Download) _then)
      : super(_value, (v) => _then(v as _Download));

  @override
  _Download get _value => super._value as _Download;

  @override
  $Res call({
    Object? manga = freezed,
    Object? chapter = freezed,
    Object? status = freezed,
  }) {
    return _then(_Download(
      manga: manga == freezed
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga,
      chapter: chapter == freezed
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Download implements _Download {
  _$_Download(
      {required this.manga, required this.chapter, required this.status});

  factory _$_Download.fromJson(Map<String, dynamic> json) =>
      _$$_DownloadFromJson(json);

  @override
  final Manga manga;
  @override
  final Chapter chapter;
  @override
  final DownloadStatus status;

  @override
  String toString() {
    return 'Download(manga: $manga, chapter: $chapter, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Download &&
            const DeepCollectionEquality().equals(other.manga, manga) &&
            const DeepCollectionEquality().equals(other.chapter, chapter) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(manga),
      const DeepCollectionEquality().hash(chapter),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$DownloadCopyWith<_Download> get copyWith =>
      __$DownloadCopyWithImpl<_Download>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DownloadToJson(this);
  }
}

abstract class _Download implements Download {
  factory _Download(
      {required final Manga manga,
      required final Chapter chapter,
      required final DownloadStatus status}) = _$_Download;

  factory _Download.fromJson(Map<String, dynamic> json) = _$_Download.fromJson;

  @override
  Manga get manga => throw _privateConstructorUsedError;
  @override
  Chapter get chapter => throw _privateConstructorUsedError;
  @override
  DownloadStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DownloadCopyWith<_Download> get copyWith =>
      throw _privateConstructorUsedError;
}
