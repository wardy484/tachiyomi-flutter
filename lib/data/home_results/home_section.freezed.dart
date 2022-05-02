// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeSection _$HomeSectionFromJson(Map<String, dynamic> json) {
  return _HomeSection.fromJson(json);
}

/// @nodoc
mixin _$HomeSection {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  List<MangaTile>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_more')
  bool? get viewMore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeSectionCopyWith<HomeSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSectionCopyWith<$Res> {
  factory $HomeSectionCopyWith(
          HomeSection value, $Res Function(HomeSection) then) =
      _$HomeSectionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String? type,
      List<MangaTile>? items,
      @JsonKey(name: 'view_more') bool? viewMore});
}

/// @nodoc
class _$HomeSectionCopyWithImpl<$Res> implements $HomeSectionCopyWith<$Res> {
  _$HomeSectionCopyWithImpl(this._value, this._then);

  final HomeSection _value;
  // ignore: unused_field
  final $Res Function(HomeSection) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? items = freezed,
    Object? viewMore = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MangaTile>?,
      viewMore: viewMore == freezed
          ? _value.viewMore
          : viewMore // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$HomeSectionCopyWith<$Res>
    implements $HomeSectionCopyWith<$Res> {
  factory _$HomeSectionCopyWith(
          _HomeSection value, $Res Function(_HomeSection) then) =
      __$HomeSectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String? type,
      List<MangaTile>? items,
      @JsonKey(name: 'view_more') bool? viewMore});
}

/// @nodoc
class __$HomeSectionCopyWithImpl<$Res> extends _$HomeSectionCopyWithImpl<$Res>
    implements _$HomeSectionCopyWith<$Res> {
  __$HomeSectionCopyWithImpl(
      _HomeSection _value, $Res Function(_HomeSection) _then)
      : super(_value, (v) => _then(v as _HomeSection));

  @override
  _HomeSection get _value => super._value as _HomeSection;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? items = freezed,
    Object? viewMore = freezed,
  }) {
    return _then(_HomeSection(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MangaTile>?,
      viewMore: viewMore == freezed
          ? _value.viewMore
          : viewMore // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeSection implements _HomeSection {
  _$_HomeSection(
      {required this.id,
      required this.title,
      this.type,
      final List<MangaTile>? items,
      @JsonKey(name: 'view_more') this.viewMore})
      : _items = items;

  factory _$_HomeSection.fromJson(Map<String, dynamic> json) =>
      _$$_HomeSectionFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? type;
  final List<MangaTile>? _items;
  @override
  List<MangaTile>? get items {
    final value = _items;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'view_more')
  final bool? viewMore;

  @override
  String toString() {
    return 'HomeSection(id: $id, title: $title, type: $type, items: $items, viewMore: $viewMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeSection &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.viewMore, viewMore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(viewMore));

  @JsonKey(ignore: true)
  @override
  _$HomeSectionCopyWith<_HomeSection> get copyWith =>
      __$HomeSectionCopyWithImpl<_HomeSection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeSectionToJson(this);
  }
}

abstract class _HomeSection implements HomeSection {
  factory _HomeSection(
      {required final String id,
      required final String title,
      final String? type,
      final List<MangaTile>? items,
      @JsonKey(name: 'view_more') final bool? viewMore}) = _$_HomeSection;

  factory _HomeSection.fromJson(Map<String, dynamic> json) =
      _$_HomeSection.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  List<MangaTile>? get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'view_more')
  bool? get viewMore => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeSectionCopyWith<_HomeSection> get copyWith =>
      throw _privateConstructorUsedError;
}
