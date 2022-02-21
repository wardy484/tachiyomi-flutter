// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chapter_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChapterDetailsStateTearOff {
  const _$ChapterDetailsStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loaded loaded(String mangaId, ChapterDetails chapterDetails,
      ChapterList chapters, int currentIndex, bool startFromEnd) {
    return _Loaded(
      mangaId,
      chapterDetails,
      chapters,
      currentIndex,
      startFromEnd,
    );
  }

  _precached precached(String mangaId, ChapterDetails chapterDetails,
      ChapterList chapters, int currentIndex, bool startFromEnd) {
    return _precached(
      mangaId,
      chapterDetails,
      chapters,
      currentIndex,
      startFromEnd,
    );
  }
}

/// @nodoc
const $ChapterDetailsState = _$ChapterDetailsStateTearOff();

/// @nodoc
mixin _$ChapterDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)
        loaded,
    required TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)
        precached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        loaded,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        precached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        loaded,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        precached,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_precached value) precached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_precached value)? precached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_precached value)? precached,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterDetailsStateCopyWith<$Res> {
  factory $ChapterDetailsStateCopyWith(
          ChapterDetailsState value, $Res Function(ChapterDetailsState) then) =
      _$ChapterDetailsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChapterDetailsStateCopyWithImpl<$Res>
    implements $ChapterDetailsStateCopyWith<$Res> {
  _$ChapterDetailsStateCopyWithImpl(this._value, this._then);

  final ChapterDetailsState _value;
  // ignore: unused_field
  final $Res Function(ChapterDetailsState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$ChapterDetailsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ChapterDetailsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)
        loaded,
    required TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)
        precached,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        loaded,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        precached,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        loaded,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        precached,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_precached value) precached,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_precached value)? precached,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_precached value)? precached,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChapterDetailsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call(
      {String mangaId,
      ChapterDetails chapterDetails,
      ChapterList chapters,
      int currentIndex,
      bool startFromEnd});

  $ChapterDetailsCopyWith<$Res> get chapterDetails;
  $ChapterListCopyWith<$Res> get chapters;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    extends _$ChapterDetailsStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? mangaId = freezed,
    Object? chapterDetails = freezed,
    Object? chapters = freezed,
    Object? currentIndex = freezed,
    Object? startFromEnd = freezed,
  }) {
    return _then(_Loaded(
      mangaId == freezed
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterDetails == freezed
          ? _value.chapterDetails
          : chapterDetails // ignore: cast_nullable_to_non_nullable
              as ChapterDetails,
      chapters == freezed
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as ChapterList,
      currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      startFromEnd == freezed
          ? _value.startFromEnd
          : startFromEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $ChapterDetailsCopyWith<$Res> get chapterDetails {
    return $ChapterDetailsCopyWith<$Res>(_value.chapterDetails, (value) {
      return _then(_value.copyWith(chapterDetails: value));
    });
  }

  @override
  $ChapterListCopyWith<$Res> get chapters {
    return $ChapterListCopyWith<$Res>(_value.chapters, (value) {
      return _then(_value.copyWith(chapters: value));
    });
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.mangaId, this.chapterDetails, this.chapters,
      this.currentIndex, this.startFromEnd);

  @override
  final String mangaId;
  @override
  final ChapterDetails chapterDetails;
  @override
  final ChapterList chapters;
  @override
  final int currentIndex;
  @override
  final bool startFromEnd;

  @override
  String toString() {
    return 'ChapterDetailsState.loaded(mangaId: $mangaId, chapterDetails: $chapterDetails, chapters: $chapters, currentIndex: $currentIndex, startFromEnd: $startFromEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other.mangaId, mangaId) &&
            const DeepCollectionEquality()
                .equals(other.chapterDetails, chapterDetails) &&
            const DeepCollectionEquality().equals(other.chapters, chapters) &&
            const DeepCollectionEquality()
                .equals(other.currentIndex, currentIndex) &&
            const DeepCollectionEquality()
                .equals(other.startFromEnd, startFromEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mangaId),
      const DeepCollectionEquality().hash(chapterDetails),
      const DeepCollectionEquality().hash(chapters),
      const DeepCollectionEquality().hash(currentIndex),
      const DeepCollectionEquality().hash(startFromEnd));

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)
        loaded,
    required TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)
        precached,
  }) {
    return loaded(
        mangaId, chapterDetails, chapters, currentIndex, startFromEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        loaded,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        precached,
  }) {
    return loaded?.call(
        mangaId, chapterDetails, chapters, currentIndex, startFromEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        loaded,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        precached,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          mangaId, chapterDetails, chapters, currentIndex, startFromEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_precached value) precached,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_precached value)? precached,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_precached value)? precached,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ChapterDetailsState {
  const factory _Loaded(String mangaId, ChapterDetails chapterDetails,
      ChapterList chapters, int currentIndex, bool startFromEnd) = _$_Loaded;

  String get mangaId;
  ChapterDetails get chapterDetails;
  ChapterList get chapters;
  int get currentIndex;
  bool get startFromEnd;
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$precachedCopyWith<$Res> {
  factory _$precachedCopyWith(
          _precached value, $Res Function(_precached) then) =
      __$precachedCopyWithImpl<$Res>;
  $Res call(
      {String mangaId,
      ChapterDetails chapterDetails,
      ChapterList chapters,
      int currentIndex,
      bool startFromEnd});

  $ChapterDetailsCopyWith<$Res> get chapterDetails;
  $ChapterListCopyWith<$Res> get chapters;
}

/// @nodoc
class __$precachedCopyWithImpl<$Res>
    extends _$ChapterDetailsStateCopyWithImpl<$Res>
    implements _$precachedCopyWith<$Res> {
  __$precachedCopyWithImpl(_precached _value, $Res Function(_precached) _then)
      : super(_value, (v) => _then(v as _precached));

  @override
  _precached get _value => super._value as _precached;

  @override
  $Res call({
    Object? mangaId = freezed,
    Object? chapterDetails = freezed,
    Object? chapters = freezed,
    Object? currentIndex = freezed,
    Object? startFromEnd = freezed,
  }) {
    return _then(_precached(
      mangaId == freezed
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterDetails == freezed
          ? _value.chapterDetails
          : chapterDetails // ignore: cast_nullable_to_non_nullable
              as ChapterDetails,
      chapters == freezed
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as ChapterList,
      currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      startFromEnd == freezed
          ? _value.startFromEnd
          : startFromEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $ChapterDetailsCopyWith<$Res> get chapterDetails {
    return $ChapterDetailsCopyWith<$Res>(_value.chapterDetails, (value) {
      return _then(_value.copyWith(chapterDetails: value));
    });
  }

  @override
  $ChapterListCopyWith<$Res> get chapters {
    return $ChapterListCopyWith<$Res>(_value.chapters, (value) {
      return _then(_value.copyWith(chapters: value));
    });
  }
}

/// @nodoc

class _$_precached implements _precached {
  const _$_precached(this.mangaId, this.chapterDetails, this.chapters,
      this.currentIndex, this.startFromEnd);

  @override
  final String mangaId;
  @override
  final ChapterDetails chapterDetails;
  @override
  final ChapterList chapters;
  @override
  final int currentIndex;
  @override
  final bool startFromEnd;

  @override
  String toString() {
    return 'ChapterDetailsState.precached(mangaId: $mangaId, chapterDetails: $chapterDetails, chapters: $chapters, currentIndex: $currentIndex, startFromEnd: $startFromEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _precached &&
            const DeepCollectionEquality().equals(other.mangaId, mangaId) &&
            const DeepCollectionEquality()
                .equals(other.chapterDetails, chapterDetails) &&
            const DeepCollectionEquality().equals(other.chapters, chapters) &&
            const DeepCollectionEquality()
                .equals(other.currentIndex, currentIndex) &&
            const DeepCollectionEquality()
                .equals(other.startFromEnd, startFromEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mangaId),
      const DeepCollectionEquality().hash(chapterDetails),
      const DeepCollectionEquality().hash(chapters),
      const DeepCollectionEquality().hash(currentIndex),
      const DeepCollectionEquality().hash(startFromEnd));

  @JsonKey(ignore: true)
  @override
  _$precachedCopyWith<_precached> get copyWith =>
      __$precachedCopyWithImpl<_precached>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)
        loaded,
    required TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)
        precached,
  }) {
    return precached(
        mangaId, chapterDetails, chapters, currentIndex, startFromEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        loaded,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        precached,
  }) {
    return precached?.call(
        mangaId, chapterDetails, chapters, currentIndex, startFromEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        loaded,
    TResult Function(String mangaId, ChapterDetails chapterDetails,
            ChapterList chapters, int currentIndex, bool startFromEnd)?
        precached,
    required TResult orElse(),
  }) {
    if (precached != null) {
      return precached(
          mangaId, chapterDetails, chapters, currentIndex, startFromEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_precached value) precached,
  }) {
    return precached(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_precached value)? precached,
  }) {
    return precached?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_precached value)? precached,
    required TResult orElse(),
  }) {
    if (precached != null) {
      return precached(this);
    }
    return orElse();
  }
}

abstract class _precached implements ChapterDetailsState {
  const factory _precached(String mangaId, ChapterDetails chapterDetails,
      ChapterList chapters, int currentIndex, bool startFromEnd) = _$_precached;

  String get mangaId;
  ChapterDetails get chapterDetails;
  ChapterList get chapters;
  int get currentIndex;
  bool get startFromEnd;
  @JsonKey(ignore: true)
  _$precachedCopyWith<_precached> get copyWith =>
      throw _privateConstructorUsedError;
}
