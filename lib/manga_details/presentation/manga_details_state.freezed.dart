// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'manga_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MangaDetailsState {
  Manga get details => throw _privateConstructorUsedError;
  ChapterList get chapters => throw _privateConstructorUsedError;
  Favourite? get favourite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MangaDetailsStateCopyWith<MangaDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaDetailsStateCopyWith<$Res> {
  factory $MangaDetailsStateCopyWith(
          MangaDetailsState value, $Res Function(MangaDetailsState) then) =
      _$MangaDetailsStateCopyWithImpl<$Res>;
  $Res call({Manga details, ChapterList chapters, Favourite? favourite});

  $MangaCopyWith<$Res> get details;
  $ChapterListCopyWith<$Res> get chapters;
  $FavouriteCopyWith<$Res>? get favourite;
}

/// @nodoc
class _$MangaDetailsStateCopyWithImpl<$Res>
    implements $MangaDetailsStateCopyWith<$Res> {
  _$MangaDetailsStateCopyWithImpl(this._value, this._then);

  final MangaDetailsState _value;
  // ignore: unused_field
  final $Res Function(MangaDetailsState) _then;

  @override
  $Res call({
    Object? details = freezed,
    Object? chapters = freezed,
    Object? favourite = freezed,
  }) {
    return _then(_value.copyWith(
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Manga,
      chapters: chapters == freezed
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as ChapterList,
      favourite: favourite == freezed
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as Favourite?,
    ));
  }

  @override
  $MangaCopyWith<$Res> get details {
    return $MangaCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value));
    });
  }

  @override
  $ChapterListCopyWith<$Res> get chapters {
    return $ChapterListCopyWith<$Res>(_value.chapters, (value) {
      return _then(_value.copyWith(chapters: value));
    });
  }

  @override
  $FavouriteCopyWith<$Res>? get favourite {
    if (_value.favourite == null) {
      return null;
    }

    return $FavouriteCopyWith<$Res>(_value.favourite!, (value) {
      return _then(_value.copyWith(favourite: value));
    });
  }
}

/// @nodoc
abstract class _$$_MangaDetailsStateCopyWith<$Res>
    implements $MangaDetailsStateCopyWith<$Res> {
  factory _$$_MangaDetailsStateCopyWith(_$_MangaDetailsState value,
          $Res Function(_$_MangaDetailsState) then) =
      __$$_MangaDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call({Manga details, ChapterList chapters, Favourite? favourite});

  @override
  $MangaCopyWith<$Res> get details;
  @override
  $ChapterListCopyWith<$Res> get chapters;
  @override
  $FavouriteCopyWith<$Res>? get favourite;
}

/// @nodoc
class __$$_MangaDetailsStateCopyWithImpl<$Res>
    extends _$MangaDetailsStateCopyWithImpl<$Res>
    implements _$$_MangaDetailsStateCopyWith<$Res> {
  __$$_MangaDetailsStateCopyWithImpl(
      _$_MangaDetailsState _value, $Res Function(_$_MangaDetailsState) _then)
      : super(_value, (v) => _then(v as _$_MangaDetailsState));

  @override
  _$_MangaDetailsState get _value => super._value as _$_MangaDetailsState;

  @override
  $Res call({
    Object? details = freezed,
    Object? chapters = freezed,
    Object? favourite = freezed,
  }) {
    return _then(_$_MangaDetailsState(
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Manga,
      chapters: chapters == freezed
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as ChapterList,
      favourite: favourite == freezed
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as Favourite?,
    ));
  }
}

/// @nodoc

class _$_MangaDetailsState implements _MangaDetailsState {
  _$_MangaDetailsState(
      {required this.details, required this.chapters, required this.favourite});

  @override
  final Manga details;
  @override
  final ChapterList chapters;
  @override
  final Favourite? favourite;

  @override
  String toString() {
    return 'MangaDetailsState(details: $details, chapters: $chapters, favourite: $favourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MangaDetailsState &&
            const DeepCollectionEquality().equals(other.details, details) &&
            const DeepCollectionEquality().equals(other.chapters, chapters) &&
            const DeepCollectionEquality().equals(other.favourite, favourite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(details),
      const DeepCollectionEquality().hash(chapters),
      const DeepCollectionEquality().hash(favourite));

  @JsonKey(ignore: true)
  @override
  _$$_MangaDetailsStateCopyWith<_$_MangaDetailsState> get copyWith =>
      __$$_MangaDetailsStateCopyWithImpl<_$_MangaDetailsState>(
          this, _$identity);
}

abstract class _MangaDetailsState implements MangaDetailsState {
  factory _MangaDetailsState(
      {required final Manga details,
      required final ChapterList chapters,
      required final Favourite? favourite}) = _$_MangaDetailsState;

  @override
  Manga get details;
  @override
  ChapterList get chapters;
  @override
  Favourite? get favourite;
  @override
  @JsonKey(ignore: true)
  _$$_MangaDetailsStateCopyWith<_$_MangaDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
