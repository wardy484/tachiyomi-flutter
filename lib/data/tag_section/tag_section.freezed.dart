// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagSection _$TagSectionFromJson(Map<String, dynamic> json) {
  return _TagSection.fromJson(json);
}

/// @nodoc
mixin _$TagSection {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagSectionCopyWith<TagSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagSectionCopyWith<$Res> {
  factory $TagSectionCopyWith(
          TagSection value, $Res Function(TagSection) then) =
      _$TagSectionCopyWithImpl<$Res>;
  $Res call({String id, String label, List<Tag> tags});
}

/// @nodoc
class _$TagSectionCopyWithImpl<$Res> implements $TagSectionCopyWith<$Res> {
  _$TagSectionCopyWithImpl(this._value, this._then);

  final TagSection _value;
  // ignore: unused_field
  final $Res Function(TagSection) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
abstract class _$$_TagSectionCopyWith<$Res>
    implements $TagSectionCopyWith<$Res> {
  factory _$$_TagSectionCopyWith(
          _$_TagSection value, $Res Function(_$_TagSection) then) =
      __$$_TagSectionCopyWithImpl<$Res>;
  @override
  $Res call({String id, String label, List<Tag> tags});
}

/// @nodoc
class __$$_TagSectionCopyWithImpl<$Res> extends _$TagSectionCopyWithImpl<$Res>
    implements _$$_TagSectionCopyWith<$Res> {
  __$$_TagSectionCopyWithImpl(
      _$_TagSection _value, $Res Function(_$_TagSection) _then)
      : super(_value, (v) => _then(v as _$_TagSection));

  @override
  _$_TagSection get _value => super._value as _$_TagSection;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_TagSection(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagSection implements _TagSection {
  _$_TagSection(
      {required this.id, required this.label, required final List<Tag> tags})
      : _tags = tags;

  factory _$_TagSection.fromJson(Map<String, dynamic> json) =>
      _$$_TagSectionFromJson(json);

  @override
  final String id;
  @override
  final String label;
  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'TagSection(id: $id, label: $label, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagSection &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_TagSectionCopyWith<_$_TagSection> get copyWith =>
      __$$_TagSectionCopyWithImpl<_$_TagSection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagSectionToJson(this);
  }
}

abstract class _TagSection implements TagSection {
  factory _TagSection(
      {required final String id,
      required final String label,
      required final List<Tag> tags}) = _$_TagSection;

  factory _TagSection.fromJson(Map<String, dynamic> json) =
      _$_TagSection.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  List<Tag> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_TagSectionCopyWith<_$_TagSection> get copyWith =>
      throw _privateConstructorUsedError;
}
