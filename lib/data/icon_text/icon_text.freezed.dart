// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'icon_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IconText _$IconTextFromJson(Map<String, dynamic> json) {
  return _IconText.fromJson(json);
}

/// @nodoc
class _$IconTextTearOff {
  const _$IconTextTearOff();

  _IconText call({required String text, String? icon}) {
    return _IconText(
      text: text,
      icon: icon,
    );
  }

  IconText fromJson(Map<String, Object?> json) {
    return IconText.fromJson(json);
  }
}

/// @nodoc
const $IconText = _$IconTextTearOff();

/// @nodoc
mixin _$IconText {
  String get text => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IconTextCopyWith<IconText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconTextCopyWith<$Res> {
  factory $IconTextCopyWith(IconText value, $Res Function(IconText) then) =
      _$IconTextCopyWithImpl<$Res>;
  $Res call({String text, String? icon});
}

/// @nodoc
class _$IconTextCopyWithImpl<$Res> implements $IconTextCopyWith<$Res> {
  _$IconTextCopyWithImpl(this._value, this._then);

  final IconText _value;
  // ignore: unused_field
  final $Res Function(IconText) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$IconTextCopyWith<$Res> implements $IconTextCopyWith<$Res> {
  factory _$IconTextCopyWith(_IconText value, $Res Function(_IconText) then) =
      __$IconTextCopyWithImpl<$Res>;
  @override
  $Res call({String text, String? icon});
}

/// @nodoc
class __$IconTextCopyWithImpl<$Res> extends _$IconTextCopyWithImpl<$Res>
    implements _$IconTextCopyWith<$Res> {
  __$IconTextCopyWithImpl(_IconText _value, $Res Function(_IconText) _then)
      : super(_value, (v) => _then(v as _IconText));

  @override
  _IconText get _value => super._value as _IconText;

  @override
  $Res call({
    Object? text = freezed,
    Object? icon = freezed,
  }) {
    return _then(_IconText(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IconText implements _IconText {
  _$_IconText({required this.text, this.icon});

  factory _$_IconText.fromJson(Map<String, dynamic> json) =>
      _$$_IconTextFromJson(json);

  @override
  final String text;
  @override
  final String? icon;

  @override
  String toString() {
    return 'IconText(text: $text, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IconText &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.icon, icon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(icon));

  @JsonKey(ignore: true)
  @override
  _$IconTextCopyWith<_IconText> get copyWith =>
      __$IconTextCopyWithImpl<_IconText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IconTextToJson(this);
  }
}

abstract class _IconText implements IconText {
  factory _IconText({required String text, String? icon}) = _$_IconText;

  factory _IconText.fromJson(Map<String, dynamic> json) = _$_IconText.fromJson;

  @override
  String get text;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$IconTextCopyWith<_IconText> get copyWith =>
      throw _privateConstructorUsedError;
}
