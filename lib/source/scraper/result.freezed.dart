// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Result {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Document html) html,
    required TResult Function(Map<String, dynamic> json) json,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Document html)? html,
    TResult? Function(Map<String, dynamic> json)? json,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Document html)? html,
    TResult Function(Map<String, dynamic> json)? json,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Html value) html,
    required TResult Function(_Json value) json,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Html value)? html,
    TResult? Function(_Json value)? json,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Html value)? html,
    TResult Function(_Json value)? json,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_HtmlCopyWith<$Res> {
  factory _$$_HtmlCopyWith(_$_Html value, $Res Function(_$_Html) then) =
      __$$_HtmlCopyWithImpl<$Res>;
  @useResult
  $Res call({Document html});
}

/// @nodoc
class __$$_HtmlCopyWithImpl<$Res> extends _$ResultCopyWithImpl<$Res, _$_Html>
    implements _$$_HtmlCopyWith<$Res> {
  __$$_HtmlCopyWithImpl(_$_Html _value, $Res Function(_$_Html) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? html = null,
  }) {
    return _then(_$_Html(
      null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as Document,
    ));
  }
}

/// @nodoc

class _$_Html implements _Html {
  const _$_Html(this.html);

  @override
  final Document html;

  @override
  String toString() {
    return 'Result.html(html: $html)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Html &&
            (identical(other.html, html) || other.html == html));
  }

  @override
  int get hashCode => Object.hash(runtimeType, html);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HtmlCopyWith<_$_Html> get copyWith =>
      __$$_HtmlCopyWithImpl<_$_Html>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Document html) html,
    required TResult Function(Map<String, dynamic> json) json,
  }) {
    return html(this.html);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Document html)? html,
    TResult? Function(Map<String, dynamic> json)? json,
  }) {
    return html?.call(this.html);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Document html)? html,
    TResult Function(Map<String, dynamic> json)? json,
    required TResult orElse(),
  }) {
    if (html != null) {
      return html(this.html);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Html value) html,
    required TResult Function(_Json value) json,
  }) {
    return html(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Html value)? html,
    TResult? Function(_Json value)? json,
  }) {
    return html?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Html value)? html,
    TResult Function(_Json value)? json,
    required TResult orElse(),
  }) {
    if (html != null) {
      return html(this);
    }
    return orElse();
  }
}

abstract class _Html implements Result {
  const factory _Html(final Document html) = _$_Html;

  Document get html;
  @JsonKey(ignore: true)
  _$$_HtmlCopyWith<_$_Html> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_JsonCopyWith<$Res> {
  factory _$$_JsonCopyWith(_$_Json value, $Res Function(_$_Json) then) =
      __$$_JsonCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> json});
}

/// @nodoc
class __$$_JsonCopyWithImpl<$Res> extends _$ResultCopyWithImpl<$Res, _$_Json>
    implements _$$_JsonCopyWith<$Res> {
  __$$_JsonCopyWithImpl(_$_Json _value, $Res Function(_$_Json) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? json = null,
  }) {
    return _then(_$_Json(
      null == json
          ? _value._json
          : json // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_Json implements _Json {
  const _$_Json(final Map<String, dynamic> json) : _json = json;

  final Map<String, dynamic> _json;
  @override
  Map<String, dynamic> get json {
    if (_json is EqualUnmodifiableMapView) return _json;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_json);
  }

  @override
  String toString() {
    return 'Result.json(json: $json)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Json &&
            const DeepCollectionEquality().equals(other._json, _json));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_json));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JsonCopyWith<_$_Json> get copyWith =>
      __$$_JsonCopyWithImpl<_$_Json>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Document html) html,
    required TResult Function(Map<String, dynamic> json) json,
  }) {
    return json(this.json);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Document html)? html,
    TResult? Function(Map<String, dynamic> json)? json,
  }) {
    return json?.call(this.json);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Document html)? html,
    TResult Function(Map<String, dynamic> json)? json,
    required TResult orElse(),
  }) {
    if (json != null) {
      return json(this.json);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Html value) html,
    required TResult Function(_Json value) json,
  }) {
    return json(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Html value)? html,
    TResult? Function(_Json value)? json,
  }) {
    return json?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Html value)? html,
    TResult Function(_Json value)? json,
    required TResult orElse(),
  }) {
    if (json != null) {
      return json(this);
    }
    return orElse();
  }
}

abstract class _Json implements Result {
  const factory _Json(final Map<String, dynamic> json) = _$_Json;

  Map<String, dynamic> get json;
  @JsonKey(ignore: true)
  _$$_JsonCopyWith<_$_Json> get copyWith => throw _privateConstructorUsedError;
}
