// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mangalistitem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MangaListItem _$MangaListItemFromJson(Map<String, dynamic> json) {
  return _MangaListItem.fromJson(json);
}

/// @nodoc
class _$MangaListItemTearOff {
  const _$MangaListItemTearOff();

  _MangaListItem call(String id, String title, String image, String iconText) {
    return _MangaListItem(
      id,
      title,
      image,
      iconText,
    );
  }

  MangaListItem fromJson(Map<String, Object?> json) {
    return MangaListItem.fromJson(json);
  }
}

/// @nodoc
const $MangaListItem = _$MangaListItemTearOff();

/// @nodoc
mixin _$MangaListItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get iconText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MangaListItemCopyWith<MangaListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaListItemCopyWith<$Res> {
  factory $MangaListItemCopyWith(
          MangaListItem value, $Res Function(MangaListItem) then) =
      _$MangaListItemCopyWithImpl<$Res>;
  $Res call({String id, String title, String image, String iconText});
}

/// @nodoc
class _$MangaListItemCopyWithImpl<$Res>
    implements $MangaListItemCopyWith<$Res> {
  _$MangaListItemCopyWithImpl(this._value, this._then);

  final MangaListItem _value;
  // ignore: unused_field
  final $Res Function(MangaListItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? iconText = freezed,
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
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      iconText: iconText == freezed
          ? _value.iconText
          : iconText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MangaListItemCopyWith<$Res>
    implements $MangaListItemCopyWith<$Res> {
  factory _$MangaListItemCopyWith(
          _MangaListItem value, $Res Function(_MangaListItem) then) =
      __$MangaListItemCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, String image, String iconText});
}

/// @nodoc
class __$MangaListItemCopyWithImpl<$Res>
    extends _$MangaListItemCopyWithImpl<$Res>
    implements _$MangaListItemCopyWith<$Res> {
  __$MangaListItemCopyWithImpl(
      _MangaListItem _value, $Res Function(_MangaListItem) _then)
      : super(_value, (v) => _then(v as _MangaListItem));

  @override
  _MangaListItem get _value => super._value as _MangaListItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? iconText = freezed,
  }) {
    return _then(_MangaListItem(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      iconText == freezed
          ? _value.iconText
          : iconText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MangaListItem implements _MangaListItem {
  _$_MangaListItem(this.id, this.title, this.image, this.iconText);

  factory _$_MangaListItem.fromJson(Map<String, dynamic> json) =>
      _$$_MangaListItemFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String image;
  @override
  final String iconText;

  @override
  String toString() {
    return 'MangaListItem(id: $id, title: $title, image: $image, iconText: $iconText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MangaListItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.iconText, iconText) ||
                other.iconText == iconText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, image, iconText);

  @JsonKey(ignore: true)
  @override
  _$MangaListItemCopyWith<_MangaListItem> get copyWith =>
      __$MangaListItemCopyWithImpl<_MangaListItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MangaListItemToJson(this);
  }
}

abstract class _MangaListItem implements MangaListItem {
  factory _MangaListItem(
          String id, String title, String image, String iconText) =
      _$_MangaListItem;

  factory _MangaListItem.fromJson(Map<String, dynamic> json) =
      _$_MangaListItem.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get image;
  @override
  String get iconText;
  @override
  @JsonKey(ignore: true)
  _$MangaListItemCopyWith<_MangaListItem> get copyWith =>
      throw _privateConstructorUsedError;
}
