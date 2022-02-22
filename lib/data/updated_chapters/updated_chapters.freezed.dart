// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'updated_chapters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdatedChapters _$UpdatedChaptersFromJson(Map<String, dynamic> json) {
  return _UpdatedChapters.fromJson(json);
}

/// @nodoc
class _$UpdatedChaptersTearOff {
  const _$UpdatedChaptersTearOff();

  _UpdatedChapters call({required List<String> ids}) {
    return _UpdatedChapters(
      ids: ids,
    );
  }

  UpdatedChapters fromJson(Map<String, Object?> json) {
    return UpdatedChapters.fromJson(json);
  }
}

/// @nodoc
const $UpdatedChapters = _$UpdatedChaptersTearOff();

/// @nodoc
mixin _$UpdatedChapters {
  List<String> get ids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatedChaptersCopyWith<UpdatedChapters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatedChaptersCopyWith<$Res> {
  factory $UpdatedChaptersCopyWith(
          UpdatedChapters value, $Res Function(UpdatedChapters) then) =
      _$UpdatedChaptersCopyWithImpl<$Res>;
  $Res call({List<String> ids});
}

/// @nodoc
class _$UpdatedChaptersCopyWithImpl<$Res>
    implements $UpdatedChaptersCopyWith<$Res> {
  _$UpdatedChaptersCopyWithImpl(this._value, this._then);

  final UpdatedChapters _value;
  // ignore: unused_field
  final $Res Function(UpdatedChapters) _then;

  @override
  $Res call({
    Object? ids = freezed,
  }) {
    return _then(_value.copyWith(
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$UpdatedChaptersCopyWith<$Res>
    implements $UpdatedChaptersCopyWith<$Res> {
  factory _$UpdatedChaptersCopyWith(
          _UpdatedChapters value, $Res Function(_UpdatedChapters) then) =
      __$UpdatedChaptersCopyWithImpl<$Res>;
  @override
  $Res call({List<String> ids});
}

/// @nodoc
class __$UpdatedChaptersCopyWithImpl<$Res>
    extends _$UpdatedChaptersCopyWithImpl<$Res>
    implements _$UpdatedChaptersCopyWith<$Res> {
  __$UpdatedChaptersCopyWithImpl(
      _UpdatedChapters _value, $Res Function(_UpdatedChapters) _then)
      : super(_value, (v) => _then(v as _UpdatedChapters));

  @override
  _UpdatedChapters get _value => super._value as _UpdatedChapters;

  @override
  $Res call({
    Object? ids = freezed,
  }) {
    return _then(_UpdatedChapters(
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdatedChapters implements _UpdatedChapters {
  _$_UpdatedChapters({required this.ids});

  factory _$_UpdatedChapters.fromJson(Map<String, dynamic> json) =>
      _$$_UpdatedChaptersFromJson(json);

  @override
  final List<String> ids;

  @override
  String toString() {
    return 'UpdatedChapters(ids: $ids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatedChapters &&
            const DeepCollectionEquality().equals(other.ids, ids));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(ids));

  @JsonKey(ignore: true)
  @override
  _$UpdatedChaptersCopyWith<_UpdatedChapters> get copyWith =>
      __$UpdatedChaptersCopyWithImpl<_UpdatedChapters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdatedChaptersToJson(this);
  }
}

abstract class _UpdatedChapters implements UpdatedChapters {
  factory _UpdatedChapters({required List<String> ids}) = _$_UpdatedChapters;

  factory _UpdatedChapters.fromJson(Map<String, dynamic> json) =
      _$_UpdatedChapters.fromJson;

  @override
  List<String> get ids;
  @override
  @JsonKey(ignore: true)
  _$UpdatedChaptersCopyWith<_UpdatedChapters> get copyWith =>
      throw _privateConstructorUsedError;
}
