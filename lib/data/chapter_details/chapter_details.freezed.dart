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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChapterDetails _$ChapterDetailsFromJson(Map<String, dynamic> json) {
  return _ChapterDetails.fromJson(json);
}

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
abstract class _$$_ChapterDetailsCopyWith<$Res>
    implements $ChapterDetailsCopyWith<$Res> {
  factory _$$_ChapterDetailsCopyWith(
          _$_ChapterDetails value, $Res Function(_$_ChapterDetails) then) =
      __$$_ChapterDetailsCopyWithImpl<$Res>;
  @override
  $Res call({String id, String mangaId, List<String> pages, bool longStrip});
}

/// @nodoc
class __$$_ChapterDetailsCopyWithImpl<$Res>
    extends _$ChapterDetailsCopyWithImpl<$Res>
    implements _$$_ChapterDetailsCopyWith<$Res> {
  __$$_ChapterDetailsCopyWithImpl(
      _$_ChapterDetails _value, $Res Function(_$_ChapterDetails) _then)
      : super(_value, (v) => _then(v as _$_ChapterDetails));

  @override
  _$_ChapterDetails get _value => super._value as _$_ChapterDetails;

  @override
  $Res call({
    Object? id = freezed,
    Object? mangaId = freezed,
    Object? pages = freezed,
    Object? longStrip = freezed,
  }) {
    return _then(_$_ChapterDetails(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mangaId == freezed
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      pages == freezed
          ? _value._pages
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
  _$_ChapterDetails(
      this.id, this.mangaId, final List<String> pages, this.longStrip)
      : _pages = pages;

  factory _$_ChapterDetails.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterDetailsFromJson(json);

  @override
  final String id;
  @override
  final String mangaId;
  final List<String> _pages;
  @override
  List<String> get pages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }

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
            other is _$_ChapterDetails &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.mangaId, mangaId) &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            const DeepCollectionEquality().equals(other.longStrip, longStrip));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(mangaId),
      const DeepCollectionEquality().hash(_pages),
      const DeepCollectionEquality().hash(longStrip));

  @JsonKey(ignore: true)
  @override
  _$$_ChapterDetailsCopyWith<_$_ChapterDetails> get copyWith =>
      __$$_ChapterDetailsCopyWithImpl<_$_ChapterDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterDetailsToJson(this);
  }
}

abstract class _ChapterDetails implements ChapterDetails {
  factory _ChapterDetails(final String id, final String mangaId,
      final List<String> pages, final bool longStrip) = _$_ChapterDetails;

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
  _$$_ChapterDetailsCopyWith<_$_ChapterDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
