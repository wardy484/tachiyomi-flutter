// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chapter_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChapterDetails _$ChapterDetailsFromJson(Map<String, dynamic> json) {
  return _ChapterDetails.fromJson(json);
}

/// @nodoc
class _$ChapterDetailsTearOff {
  const _$ChapterDetailsTearOff();

  _ChapterDetails call(
      String id, String mangaId, List<String> pages, bool longStrip) {
    return _ChapterDetails(
      id,
      mangaId,
      pages,
      longStrip,
    );
  }

  ChapterDetails fromJson(Map<String, Object?> json) {
    return ChapterDetails.fromJson(json);
  }
}

/// @nodoc
const $ChapterDetails = _$ChapterDetailsTearOff();

/// @nodoc
mixin _$ChapterDetails {
  String get id => throw _privateConstructorUsedError;
  String get mangaId => throw _privateConstructorUsedError;
  List<String> get pages => throw _privateConstructorUsedError;
  bool get longStrip => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterDetailsCopyWith<ChapterDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterDetailsCopyWith<$Res> {
  factory $ChapterDetailsCopyWith(
          ChapterDetails value, $Res Function(ChapterDetails) then) =
      _$ChapterDetailsCopyWithImpl<$Res>;
  $Res call({String id, String mangaId, List<String> pages, bool longStrip});
}

/// @nodoc
class _$ChapterDetailsCopyWithImpl<$Res>
    implements $ChapterDetailsCopyWith<$Res> {
  _$ChapterDetailsCopyWithImpl(this._value, this._then);

  final ChapterDetails _value;
  // ignore: unused_field
  final $Res Function(ChapterDetails) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? mangaId = freezed,
    Object? pages = freezed,
    Object? longStrip = freezed,
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
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      longStrip: longStrip == freezed
          ? _value.longStrip
          : longStrip // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ChapterDetailsCopyWith<$Res>
    implements $ChapterDetailsCopyWith<$Res> {
  factory _$ChapterDetailsCopyWith(
          _ChapterDetails value, $Res Function(_ChapterDetails) then) =
      __$ChapterDetailsCopyWithImpl<$Res>;
  @override
  $Res call({String id, String mangaId, List<String> pages, bool longStrip});
}

/// @nodoc
class __$ChapterDetailsCopyWithImpl<$Res>
    extends _$ChapterDetailsCopyWithImpl<$Res>
    implements _$ChapterDetailsCopyWith<$Res> {
  __$ChapterDetailsCopyWithImpl(
      _ChapterDetails _value, $Res Function(_ChapterDetails) _then)
      : super(_value, (v) => _then(v as _ChapterDetails));

  @override
  _ChapterDetails get _value => super._value as _ChapterDetails;

  @override
  $Res call({
    Object? id = freezed,
    Object? mangaId = freezed,
    Object? pages = freezed,
    Object? longStrip = freezed,
  }) {
    return _then(_ChapterDetails(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mangaId == freezed
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      longStrip == freezed
          ? _value.longStrip
          : longStrip // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChapterDetails implements _ChapterDetails {
  _$_ChapterDetails(this.id, this.mangaId, this.pages, this.longStrip);

  factory _$_ChapterDetails.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterDetailsFromJson(json);

  @override
  final String id;
  @override
  final String mangaId;
  @override
  final List<String> pages;
  @override
  final bool longStrip;

  @override
  String toString() {
    return 'ChapterDetails(id: $id, mangaId: $mangaId, pages: $pages, longStrip: $longStrip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChapterDetails &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.mangaId, mangaId) &&
            const DeepCollectionEquality().equals(other.pages, pages) &&
            const DeepCollectionEquality().equals(other.longStrip, longStrip));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(mangaId),
      const DeepCollectionEquality().hash(pages),
      const DeepCollectionEquality().hash(longStrip));

  @JsonKey(ignore: true)
  @override
  _$ChapterDetailsCopyWith<_ChapterDetails> get copyWith =>
      __$ChapterDetailsCopyWithImpl<_ChapterDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterDetailsToJson(this);
  }
}

abstract class _ChapterDetails implements ChapterDetails {
  factory _ChapterDetails(
          String id, String mangaId, List<String> pages, bool longStrip) =
      _$_ChapterDetails;

  factory _ChapterDetails.fromJson(Map<String, dynamic> json) =
      _$_ChapterDetails.fromJson;

  @override
  String get id;
  @override
  String get mangaId;
  @override
  List<String> get pages;
  @override
  bool get longStrip;
  @override
  @JsonKey(ignore: true)
  _$ChapterDetailsCopyWith<_ChapterDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
