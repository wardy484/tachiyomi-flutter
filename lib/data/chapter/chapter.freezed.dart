// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return _Chapter.fromJson(json);
}

/// @nodoc
class _$ChapterTearOff {
  const _$ChapterTearOff();

  _Chapter call(
      String id,
      String mangaId,
      @JsonKey(name: 'chapNum') double chapterNo,
      String langCode,
      String? name,
      String? volume,
      String? group,
      String? time,
      {bool read = false,
      int page = 0}) {
    return _Chapter(
      id,
      mangaId,
      chapterNo,
      langCode,
      name,
      volume,
      group,
      time,
      read: read,
      page: page,
    );
  }

  Chapter fromJson(Map<String, Object?> json) {
    return Chapter.fromJson(json);
  }
}

/// @nodoc
const $Chapter = _$ChapterTearOff();

/// @nodoc
mixin _$Chapter {
  String get id => throw _privateConstructorUsedError;
  String get mangaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapNum')
  double get chapterNo => throw _privateConstructorUsedError;
  String get langCode => throw _privateConstructorUsedError; // TODO: use enum
  String? get name => throw _privateConstructorUsedError;
  String? get volume => throw _privateConstructorUsedError;
  String? get group => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterCopyWith<Chapter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) then) =
      _$ChapterCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String mangaId,
      @JsonKey(name: 'chapNum') double chapterNo,
      String langCode,
      String? name,
      String? volume,
      String? group,
      String? time,
      bool read,
      int page});
}

/// @nodoc
class _$ChapterCopyWithImpl<$Res> implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._value, this._then);

  final Chapter _value;
  // ignore: unused_field
  final $Res Function(Chapter) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? mangaId = freezed,
    Object? chapterNo = freezed,
    Object? langCode = freezed,
    Object? name = freezed,
    Object? volume = freezed,
    Object? group = freezed,
    Object? time = freezed,
    Object? read = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mangaId: mangaId == freezed
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNo: chapterNo == freezed
          ? _value.chapterNo
          : chapterNo // ignore: cast_nullable_to_non_nullable
              as double,
      langCode: langCode == freezed
          ? _value.langCode
          : langCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      volume: volume == freezed
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String?,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) then) =
      __$ChapterCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String mangaId,
      @JsonKey(name: 'chapNum') double chapterNo,
      String langCode,
      String? name,
      String? volume,
      String? group,
      String? time,
      bool read,
      int page});
}

/// @nodoc
class __$ChapterCopyWithImpl<$Res> extends _$ChapterCopyWithImpl<$Res>
    implements _$ChapterCopyWith<$Res> {
  __$ChapterCopyWithImpl(_Chapter _value, $Res Function(_Chapter) _then)
      : super(_value, (v) => _then(v as _Chapter));

  @override
  _Chapter get _value => super._value as _Chapter;

  @override
  $Res call({
    Object? id = freezed,
    Object? mangaId = freezed,
    Object? chapterNo = freezed,
    Object? langCode = freezed,
    Object? name = freezed,
    Object? volume = freezed,
    Object? group = freezed,
    Object? time = freezed,
    Object? read = freezed,
    Object? page = freezed,
  }) {
    return _then(_Chapter(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mangaId == freezed
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNo == freezed
          ? _value.chapterNo
          : chapterNo // ignore: cast_nullable_to_non_nullable
              as double,
      langCode == freezed
          ? _value.langCode
          : langCode // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      volume == freezed
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String?,
      group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chapter implements _Chapter {
  _$_Chapter(this.id, this.mangaId, @JsonKey(name: 'chapNum') this.chapterNo,
      this.langCode, this.name, this.volume, this.group, this.time,
      {this.read = false, this.page = 0});

  factory _$_Chapter.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterFromJson(json);

  @override
  final String id;
  @override
  final String mangaId;
  @override
  @JsonKey(name: 'chapNum')
  final double chapterNo;
  @override
  final String langCode;
  @override // TODO: use enum
  final String? name;
  @override
  final String? volume;
  @override
  final String? group;
  @override
  final String? time;
  @JsonKey()
  @override
  final bool read;
  @JsonKey()
  @override
  final int page;

  @override
  String toString() {
    return 'Chapter(id: $id, mangaId: $mangaId, chapterNo: $chapterNo, langCode: $langCode, name: $name, volume: $volume, group: $group, time: $time, read: $read, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Chapter &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.mangaId, mangaId) &&
            const DeepCollectionEquality().equals(other.chapterNo, chapterNo) &&
            const DeepCollectionEquality().equals(other.langCode, langCode) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.volume, volume) &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.read, read) &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(mangaId),
      const DeepCollectionEquality().hash(chapterNo),
      const DeepCollectionEquality().hash(langCode),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(volume),
      const DeepCollectionEquality().hash(group),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(read),
      const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$ChapterCopyWith<_Chapter> get copyWith =>
      __$ChapterCopyWithImpl<_Chapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterToJson(this);
  }
}

abstract class _Chapter implements Chapter {
  factory _Chapter(
      String id,
      String mangaId,
      @JsonKey(name: 'chapNum') double chapterNo,
      String langCode,
      String? name,
      String? volume,
      String? group,
      String? time,
      {bool read,
      int page}) = _$_Chapter;

  factory _Chapter.fromJson(Map<String, dynamic> json) = _$_Chapter.fromJson;

  @override
  String get id;
  @override
  String get mangaId;
  @override
  @JsonKey(name: 'chapNum')
  double get chapterNo;
  @override
  String get langCode;
  @override // TODO: use enum
  String? get name;
  @override
  String? get volume;
  @override
  String? get group;
  @override
  String? get time;
  @override
  bool get read;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$ChapterCopyWith<_Chapter> get copyWith =>
      throw _privateConstructorUsedError;
}
