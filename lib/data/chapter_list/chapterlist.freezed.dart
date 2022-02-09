// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chapterlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChapterList _$ChapterListFromJson(Map<String, dynamic> json) {
  return _ChapterList.fromJson(json);
}

/// @nodoc
class _$ChapterListTearOff {
  const _$ChapterListTearOff();

  _ChapterList call(List<Chapter> chapters) {
    return _ChapterList(
      chapters,
    );
  }

  ChapterList fromJson(Map<String, Object?> json) {
    return ChapterList.fromJson(json);
  }
}

/// @nodoc
const $ChapterList = _$ChapterListTearOff();

/// @nodoc
mixin _$ChapterList {
  List<Chapter> get chapters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterListCopyWith<ChapterList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterListCopyWith<$Res> {
  factory $ChapterListCopyWith(
          ChapterList value, $Res Function(ChapterList) then) =
      _$ChapterListCopyWithImpl<$Res>;
  $Res call({List<Chapter> chapters});
}

/// @nodoc
class _$ChapterListCopyWithImpl<$Res> implements $ChapterListCopyWith<$Res> {
  _$ChapterListCopyWithImpl(this._value, this._then);

  final ChapterList _value;
  // ignore: unused_field
  final $Res Function(ChapterList) _then;

  @override
  $Res call({
    Object? chapters = freezed,
  }) {
    return _then(_value.copyWith(
      chapters: chapters == freezed
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
    ));
  }
}

/// @nodoc
abstract class _$ChapterListCopyWith<$Res>
    implements $ChapterListCopyWith<$Res> {
  factory _$ChapterListCopyWith(
          _ChapterList value, $Res Function(_ChapterList) then) =
      __$ChapterListCopyWithImpl<$Res>;
  @override
  $Res call({List<Chapter> chapters});
}

/// @nodoc
class __$ChapterListCopyWithImpl<$Res> extends _$ChapterListCopyWithImpl<$Res>
    implements _$ChapterListCopyWith<$Res> {
  __$ChapterListCopyWithImpl(
      _ChapterList _value, $Res Function(_ChapterList) _then)
      : super(_value, (v) => _then(v as _ChapterList));

  @override
  _ChapterList get _value => super._value as _ChapterList;

  @override
  $Res call({
    Object? chapters = freezed,
  }) {
    return _then(_ChapterList(
      chapters == freezed
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChapterList extends _ChapterList {
  _$_ChapterList(this.chapters) : super._();

  factory _$_ChapterList.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterListFromJson(json);

  @override
  final List<Chapter> chapters;

  @override
  String toString() {
    return 'ChapterList(chapters: $chapters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChapterList &&
            const DeepCollectionEquality().equals(other.chapters, chapters));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(chapters));

  @JsonKey(ignore: true)
  @override
  _$ChapterListCopyWith<_ChapterList> get copyWith =>
      __$ChapterListCopyWithImpl<_ChapterList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterListToJson(this);
  }
}

abstract class _ChapterList extends ChapterList {
  factory _ChapterList(List<Chapter> chapters) = _$_ChapterList;
  _ChapterList._() : super._();

  factory _ChapterList.fromJson(Map<String, dynamic> json) =
      _$_ChapterList.fromJson;

  @override
  List<Chapter> get chapters;
  @override
  @JsonKey(ignore: true)
  _$ChapterListCopyWith<_ChapterList> get copyWith =>
      throw _privateConstructorUsedError;
}
