// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chapter_update_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChapterUpdateList _$ChapterUpdateListFromJson(Map<String, dynamic> json) {
  return _ChapterUpdateList.fromJson(json);
}

/// @nodoc
mixin _$ChapterUpdateList {
  List<ChapterUpdate> get chapterUpdates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterUpdateListCopyWith<ChapterUpdateList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterUpdateListCopyWith<$Res> {
  factory $ChapterUpdateListCopyWith(
          ChapterUpdateList value, $Res Function(ChapterUpdateList) then) =
      _$ChapterUpdateListCopyWithImpl<$Res>;
  $Res call({List<ChapterUpdate> chapterUpdates});
}

/// @nodoc
class _$ChapterUpdateListCopyWithImpl<$Res>
    implements $ChapterUpdateListCopyWith<$Res> {
  _$ChapterUpdateListCopyWithImpl(this._value, this._then);

  final ChapterUpdateList _value;
  // ignore: unused_field
  final $Res Function(ChapterUpdateList) _then;

  @override
  $Res call({
    Object? chapterUpdates = freezed,
  }) {
    return _then(_value.copyWith(
      chapterUpdates: chapterUpdates == freezed
          ? _value.chapterUpdates
          : chapterUpdates // ignore: cast_nullable_to_non_nullable
              as List<ChapterUpdate>,
    ));
  }
}

/// @nodoc
abstract class _$$_ChapterUpdateListCopyWith<$Res>
    implements $ChapterUpdateListCopyWith<$Res> {
  factory _$$_ChapterUpdateListCopyWith(_$_ChapterUpdateList value,
          $Res Function(_$_ChapterUpdateList) then) =
      __$$_ChapterUpdateListCopyWithImpl<$Res>;
  @override
  $Res call({List<ChapterUpdate> chapterUpdates});
}

/// @nodoc
class __$$_ChapterUpdateListCopyWithImpl<$Res>
    extends _$ChapterUpdateListCopyWithImpl<$Res>
    implements _$$_ChapterUpdateListCopyWith<$Res> {
  __$$_ChapterUpdateListCopyWithImpl(
      _$_ChapterUpdateList _value, $Res Function(_$_ChapterUpdateList) _then)
      : super(_value, (v) => _then(v as _$_ChapterUpdateList));

  @override
  _$_ChapterUpdateList get _value => super._value as _$_ChapterUpdateList;

  @override
  $Res call({
    Object? chapterUpdates = freezed,
  }) {
    return _then(_$_ChapterUpdateList(
      chapterUpdates: chapterUpdates == freezed
          ? _value._chapterUpdates
          : chapterUpdates // ignore: cast_nullable_to_non_nullable
              as List<ChapterUpdate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChapterUpdateList extends _ChapterUpdateList {
  const _$_ChapterUpdateList(
      {required final List<ChapterUpdate> chapterUpdates})
      : _chapterUpdates = chapterUpdates,
        super._();

  factory _$_ChapterUpdateList.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterUpdateListFromJson(json);

  final List<ChapterUpdate> _chapterUpdates;
  @override
  List<ChapterUpdate> get chapterUpdates {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapterUpdates);
  }

  @override
  String toString() {
    return 'ChapterUpdateList(chapterUpdates: $chapterUpdates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChapterUpdateList &&
            const DeepCollectionEquality()
                .equals(other._chapterUpdates, _chapterUpdates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chapterUpdates));

  @JsonKey(ignore: true)
  @override
  _$$_ChapterUpdateListCopyWith<_$_ChapterUpdateList> get copyWith =>
      __$$_ChapterUpdateListCopyWithImpl<_$_ChapterUpdateList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterUpdateListToJson(this);
  }
}

abstract class _ChapterUpdateList extends ChapterUpdateList {
  const factory _ChapterUpdateList(
          {required final List<ChapterUpdate> chapterUpdates}) =
      _$_ChapterUpdateList;
  const _ChapterUpdateList._() : super._();

  factory _ChapterUpdateList.fromJson(Map<String, dynamic> json) =
      _$_ChapterUpdateList.fromJson;

  @override
  List<ChapterUpdate> get chapterUpdates;
  @override
  @JsonKey(ignore: true)
  _$$_ChapterUpdateListCopyWith<_$_ChapterUpdateList> get copyWith =>
      throw _privateConstructorUsedError;
}
