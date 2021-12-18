// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'manga.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Manga _$MangaFromJson(Map<String, dynamic> json) {
  return _Manga.fromJson(json);
}

/// @nodoc
class _$MangaTearOff {
  const _$MangaTearOff();

  _Manga call(
      String id,
      List<String> titles,
      String image,
      double? rating,
      String? mangaStatus,
      String? langFlag,
      String? author,
      String? artist,
      List<String>? covers,
      String? desc,
      double? follows,
      DateTime? lastUpdate,
      {bool favourite = false}) {
    return _Manga(
      id,
      titles,
      image,
      rating,
      mangaStatus,
      langFlag,
      author,
      artist,
      covers,
      desc,
      follows,
      lastUpdate,
      favourite: favourite,
    );
  }

  Manga fromJson(Map<String, Object?> json) {
    return Manga.fromJson(json);
  }
}

/// @nodoc
const $Manga = _$MangaTearOff();

/// @nodoc
mixin _$Manga {
  String get id => throw _privateConstructorUsedError;
  List<String> get titles => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String? get mangaStatus => throw _privateConstructorUsedError;
  String? get langFlag => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get artist => throw _privateConstructorUsedError;
  List<String>? get covers => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  double? get follows => throw _privateConstructorUsedError;
  DateTime? get lastUpdate => throw _privateConstructorUsedError;
  bool get favourite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MangaCopyWith<Manga> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaCopyWith<$Res> {
  factory $MangaCopyWith(Manga value, $Res Function(Manga) then) =
      _$MangaCopyWithImpl<$Res>;
  $Res call(
      {String id,
      List<String> titles,
      String image,
      double? rating,
      String? mangaStatus,
      String? langFlag,
      String? author,
      String? artist,
      List<String>? covers,
      String? desc,
      double? follows,
      DateTime? lastUpdate,
      bool favourite});
}

/// @nodoc
class _$MangaCopyWithImpl<$Res> implements $MangaCopyWith<$Res> {
  _$MangaCopyWithImpl(this._value, this._then);

  final Manga _value;
  // ignore: unused_field
  final $Res Function(Manga) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? titles = freezed,
    Object? image = freezed,
    Object? rating = freezed,
    Object? mangaStatus = freezed,
    Object? langFlag = freezed,
    Object? author = freezed,
    Object? artist = freezed,
    Object? covers = freezed,
    Object? desc = freezed,
    Object? follows = freezed,
    Object? lastUpdate = freezed,
    Object? favourite = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titles: titles == freezed
          ? _value.titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      mangaStatus: mangaStatus == freezed
          ? _value.mangaStatus
          : mangaStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      langFlag: langFlag == freezed
          ? _value.langFlag
          : langFlag // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: artist == freezed
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      covers: covers == freezed
          ? _value.covers
          : covers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      follows: follows == freezed
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as double?,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      favourite: favourite == freezed
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MangaCopyWith<$Res> implements $MangaCopyWith<$Res> {
  factory _$MangaCopyWith(_Manga value, $Res Function(_Manga) then) =
      __$MangaCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<String> titles,
      String image,
      double? rating,
      String? mangaStatus,
      String? langFlag,
      String? author,
      String? artist,
      List<String>? covers,
      String? desc,
      double? follows,
      DateTime? lastUpdate,
      bool favourite});
}

/// @nodoc
class __$MangaCopyWithImpl<$Res> extends _$MangaCopyWithImpl<$Res>
    implements _$MangaCopyWith<$Res> {
  __$MangaCopyWithImpl(_Manga _value, $Res Function(_Manga) _then)
      : super(_value, (v) => _then(v as _Manga));

  @override
  _Manga get _value => super._value as _Manga;

  @override
  $Res call({
    Object? id = freezed,
    Object? titles = freezed,
    Object? image = freezed,
    Object? rating = freezed,
    Object? mangaStatus = freezed,
    Object? langFlag = freezed,
    Object? author = freezed,
    Object? artist = freezed,
    Object? covers = freezed,
    Object? desc = freezed,
    Object? follows = freezed,
    Object? lastUpdate = freezed,
    Object? favourite = freezed,
  }) {
    return _then(_Manga(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titles == freezed
          ? _value.titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      mangaStatus == freezed
          ? _value.mangaStatus
          : mangaStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      langFlag == freezed
          ? _value.langFlag
          : langFlag // ignore: cast_nullable_to_non_nullable
              as String?,
      author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      artist == freezed
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      covers == freezed
          ? _value.covers
          : covers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      follows == freezed
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as double?,
      lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      favourite: favourite == freezed
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Manga implements _Manga {
  _$_Manga(
      this.id,
      this.titles,
      this.image,
      this.rating,
      this.mangaStatus,
      this.langFlag,
      this.author,
      this.artist,
      this.covers,
      this.desc,
      this.follows,
      this.lastUpdate,
      {this.favourite = false});

  factory _$_Manga.fromJson(Map<String, dynamic> json) =>
      _$$_MangaFromJson(json);

  @override
  final String id;
  @override
  final List<String> titles;
  @override
  final String image;
  @override
  final double? rating;
  @override
  final String? mangaStatus;
  @override
  final String? langFlag;
  @override
  final String? author;
  @override
  final String? artist;
  @override
  final List<String>? covers;
  @override
  final String? desc;
  @override
  final double? follows;
  @override
  final DateTime? lastUpdate;
  @JsonKey(defaultValue: false)
  @override
  final bool favourite;

  @override
  String toString() {
    return 'Manga(id: $id, titles: $titles, image: $image, rating: $rating, mangaStatus: $mangaStatus, langFlag: $langFlag, author: $author, artist: $artist, covers: $covers, desc: $desc, follows: $follows, lastUpdate: $lastUpdate, favourite: $favourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Manga &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.titles, titles) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.mangaStatus, mangaStatus) ||
                other.mangaStatus == mangaStatus) &&
            (identical(other.langFlag, langFlag) ||
                other.langFlag == langFlag) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            const DeepCollectionEquality().equals(other.covers, covers) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.follows, follows) || other.follows == follows) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.favourite, favourite) ||
                other.favourite == favourite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(titles),
      image,
      rating,
      mangaStatus,
      langFlag,
      author,
      artist,
      const DeepCollectionEquality().hash(covers),
      desc,
      follows,
      lastUpdate,
      favourite);

  @JsonKey(ignore: true)
  @override
  _$MangaCopyWith<_Manga> get copyWith =>
      __$MangaCopyWithImpl<_Manga>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MangaToJson(this);
  }
}

abstract class _Manga implements Manga {
  factory _Manga(
      String id,
      List<String> titles,
      String image,
      double? rating,
      String? mangaStatus,
      String? langFlag,
      String? author,
      String? artist,
      List<String>? covers,
      String? desc,
      double? follows,
      DateTime? lastUpdate,
      {bool favourite}) = _$_Manga;

  factory _Manga.fromJson(Map<String, dynamic> json) = _$_Manga.fromJson;

  @override
  String get id;
  @override
  List<String> get titles;
  @override
  String get image;
  @override
  double? get rating;
  @override
  String? get mangaStatus;
  @override
  String? get langFlag;
  @override
  String? get author;
  @override
  String? get artist;
  @override
  List<String>? get covers;
  @override
  String? get desc;
  @override
  double? get follows;
  @override
  DateTime? get lastUpdate;
  @override
  bool get favourite;
  @override
  @JsonKey(ignore: true)
  _$MangaCopyWith<_Manga> get copyWith => throw _privateConstructorUsedError;
}
