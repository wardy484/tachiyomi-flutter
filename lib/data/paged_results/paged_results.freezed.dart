// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paged_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PagedResults _$PagedResultsFromJson(Map<String, dynamic> json) {
  return _PagedResults.fromJson(json);
}

/// @nodoc
mixin _$PagedResults {
  List<MangaTile> get results => throw _privateConstructorUsedError;
  Map<dynamic, dynamic>? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagedResultsCopyWith<PagedResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedResultsCopyWith<$Res> {
  factory $PagedResultsCopyWith(
          PagedResults value, $Res Function(PagedResults) then) =
      _$PagedResultsCopyWithImpl<$Res>;
  $Res call({List<MangaTile> results, Map<dynamic, dynamic>? meta});
}

/// @nodoc
class _$PagedResultsCopyWithImpl<$Res> implements $PagedResultsCopyWith<$Res> {
  _$PagedResultsCopyWithImpl(this._value, this._then);

  final PagedResults _value;
  // ignore: unused_field
  final $Res Function(PagedResults) _then;

  @override
  $Res call({
    Object? results = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MangaTile>,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$PagedResultsCopyWith<$Res>
    implements $PagedResultsCopyWith<$Res> {
  factory _$PagedResultsCopyWith(
          _PagedResults value, $Res Function(_PagedResults) then) =
      __$PagedResultsCopyWithImpl<$Res>;
  @override
  $Res call({List<MangaTile> results, Map<dynamic, dynamic>? meta});
}

/// @nodoc
class __$PagedResultsCopyWithImpl<$Res> extends _$PagedResultsCopyWithImpl<$Res>
    implements _$PagedResultsCopyWith<$Res> {
  __$PagedResultsCopyWithImpl(
      _PagedResults _value, $Res Function(_PagedResults) _then)
      : super(_value, (v) => _then(v as _PagedResults));

  @override
  _PagedResults get _value => super._value as _PagedResults;

  @override
  $Res call({
    Object? results = freezed,
    Object? meta = freezed,
  }) {
    return _then(_PagedResults(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MangaTile>,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PagedResults implements _PagedResults {
  _$_PagedResults(
      {required final List<MangaTile> results,
      final Map<dynamic, dynamic>? meta})
      : _results = results,
        _meta = meta;

  factory _$_PagedResults.fromJson(Map<String, dynamic> json) =>
      _$$_PagedResultsFromJson(json);

  final List<MangaTile> _results;
  @override
  List<MangaTile> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  final Map<dynamic, dynamic>? _meta;
  @override
  Map<dynamic, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PagedResults(results: $results, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PagedResults &&
            const DeepCollectionEquality().equals(other.results, results) &&
            const DeepCollectionEquality().equals(other.meta, meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(results),
      const DeepCollectionEquality().hash(meta));

  @JsonKey(ignore: true)
  @override
  _$PagedResultsCopyWith<_PagedResults> get copyWith =>
      __$PagedResultsCopyWithImpl<_PagedResults>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PagedResultsToJson(this);
  }
}

abstract class _PagedResults implements PagedResults {
  factory _PagedResults(
      {required final List<MangaTile> results,
      final Map<dynamic, dynamic>? meta}) = _$_PagedResults;

  factory _PagedResults.fromJson(Map<String, dynamic> json) =
      _$_PagedResults.fromJson;

  @override
  List<MangaTile> get results => throw _privateConstructorUsedError;
  @override
  Map<dynamic, dynamic>? get meta => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PagedResultsCopyWith<_PagedResults> get copyWith =>
      throw _privateConstructorUsedError;
}
