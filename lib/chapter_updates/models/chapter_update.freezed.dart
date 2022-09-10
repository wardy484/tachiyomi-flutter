// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chapter_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChapterUpdate _$ChapterUpdateFromJson(Map<String, dynamic> json) {
  return _ChapterUpdate.fromJson(json);
}

/// @nodoc
mixin _$ChapterUpdate {
  String get sourceId => throw _privateConstructorUsedError;
  String get mangaId => throw _privateConstructorUsedError;
  double get chapterNumber => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get addedAt => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterUpdateCopyWith<ChapterUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterUpdateCopyWith<$Res> {
  factory $ChapterUpdateCopyWith(
          ChapterUpdate value, $Res Function(ChapterUpdate) then) =
      _$ChapterUpdateCopyWithImpl<$Res>;
  $Res call(
      {String sourceId,
      String mangaId,
      double chapterNumber,
      String imagePath,
      String name,
      DateTime addedAt,
      bool read});
}

/// @nodoc
class _$ChapterUpdateCopyWithImpl<$Res>
    implements $ChapterUpdateCopyWith<$Res> {
  _$ChapterUpdateCopyWithImpl(this._value, this._then);

  final ChapterUpdate _value;
  // ignore: unused_field
  final $Res Function(ChapterUpdate) _then;

  @override
  $Res call({
    Object? sourceId = freezed,
    Object? mangaId = freezed,
    Object? chapterNumber = freezed,
    Object? imagePath = freezed,
    Object? name = freezed,
    Object? addedAt = freezed,
    Object? read = freezed,
  }) {
    return _then(_value.copyWith(
      sourceId: sourceId == freezed
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      mangaId: mangaId == freezed
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNumber: chapterNumber == freezed
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as double,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: addedAt == freezed
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ChapterUpdateCopyWith<$Res>
    implements $ChapterUpdateCopyWith<$Res> {
  factory _$ChapterUpdateCopyWith(
          _ChapterUpdate value, $Res Function(_ChapterUpdate) then) =
      __$ChapterUpdateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String sourceId,
      String mangaId,
      double chapterNumber,
      String imagePath,
      String name,
      DateTime addedAt,
      bool read});
}

/// @nodoc
class __$ChapterUpdateCopyWithImpl<$Res>
    extends _$ChapterUpdateCopyWithImpl<$Res>
    implements _$ChapterUpdateCopyWith<$Res> {
  __$ChapterUpdateCopyWithImpl(
      _ChapterUpdate _value, $Res Function(_ChapterUpdate) _then)
      : super(_value, (v) => _then(v as _ChapterUpdate));

  @override
  _ChapterUpdate get _value => super._value as _ChapterUpdate;

  @override
  $Res call({
    Object? sourceId = freezed,
    Object? mangaId = freezed,
    Object? chapterNumber = freezed,
    Object? imagePath = freezed,
    Object? name = freezed,
    Object? addedAt = freezed,
    Object? read = freezed,
  }) {
    return _then(_ChapterUpdate(
      sourceId: sourceId == freezed
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      mangaId: mangaId == freezed
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNumber: chapterNumber == freezed
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as double,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: addedAt == freezed
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChapterUpdate implements _ChapterUpdate {
  const _$_ChapterUpdate(
      {required this.sourceId,
      required this.mangaId,
      required this.chapterNumber,
      required this.imagePath,
      required this.name,
      required this.addedAt,
      required this.read});

  factory _$_ChapterUpdate.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterUpdateFromJson(json);

  @override
  final String sourceId;
  @override
  final String mangaId;
  @override
  final double chapterNumber;
  @override
  final String imagePath;
  @override
  final String name;
  @override
  final DateTime addedAt;
  @override
  final bool read;

  @override
  String toString() {
    return 'ChapterUpdate(sourceId: $sourceId, mangaId: $mangaId, chapterNumber: $chapterNumber, imagePath: $imagePath, name: $name, addedAt: $addedAt, read: $read)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChapterUpdate &&
            const DeepCollectionEquality().equals(other.sourceId, sourceId) &&
            const DeepCollectionEquality().equals(other.mangaId, mangaId) &&
            const DeepCollectionEquality()
                .equals(other.chapterNumber, chapterNumber) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.addedAt, addedAt) &&
            const DeepCollectionEquality().equals(other.read, read));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sourceId),
      const DeepCollectionEquality().hash(mangaId),
      const DeepCollectionEquality().hash(chapterNumber),
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(addedAt),
      const DeepCollectionEquality().hash(read));

  @JsonKey(ignore: true)
  @override
  _$ChapterUpdateCopyWith<_ChapterUpdate> get copyWith =>
      __$ChapterUpdateCopyWithImpl<_ChapterUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterUpdateToJson(this);
  }
}

abstract class _ChapterUpdate implements ChapterUpdate {
  const factory _ChapterUpdate(
      {required final String sourceId,
      required final String mangaId,
      required final double chapterNumber,
      required final String imagePath,
      required final String name,
      required final DateTime addedAt,
      required final bool read}) = _$_ChapterUpdate;

  factory _ChapterUpdate.fromJson(Map<String, dynamic> json) =
      _$_ChapterUpdate.fromJson;

  @override
  String get sourceId => throw _privateConstructorUsedError;
  @override
  String get mangaId => throw _privateConstructorUsedError;
  @override
  double get chapterNumber => throw _privateConstructorUsedError;
  @override
  String get imagePath => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  DateTime get addedAt => throw _privateConstructorUsedError;
  @override
  bool get read => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChapterUpdateCopyWith<_ChapterUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}
