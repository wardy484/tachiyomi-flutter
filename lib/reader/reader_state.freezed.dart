// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reader_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReaderState {
  PageDetails get currentPage => throw _privateConstructorUsedError;
  String get progress => throw _privateConstructorUsedError;
  bool get appbarVisible => throw _privateConstructorUsedError;
  double get chapterNumber => throw _privateConstructorUsedError;
  bool get reversed => throw _privateConstructorUsedError;
  Chapter? get currentChapter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageDetails currentPage,
            String progress,
            bool appbarVisible,
            double chapterNumber,
            bool reversed,
            Chapter? currentChapter)
        reading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            PageDetails currentPage,
            String progress,
            bool appbarVisible,
            double chapterNumber,
            bool reversed,
            Chapter? currentChapter)?
        reading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageDetails currentPage,
            String progress,
            bool appbarVisible,
            double chapterNumber,
            bool reversed,
            Chapter? currentChapter)?
        reading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reading value) reading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Reading value)? reading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reading value)? reading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReaderStateCopyWith<ReaderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReaderStateCopyWith<$Res> {
  factory $ReaderStateCopyWith(
          ReaderState value, $Res Function(ReaderState) then) =
      _$ReaderStateCopyWithImpl<$Res>;
  $Res call(
      {PageDetails currentPage,
      String progress,
      bool appbarVisible,
      double chapterNumber,
      bool reversed,
      Chapter? currentChapter});

  $ChapterCopyWith<$Res>? get currentChapter;
}

/// @nodoc
class _$ReaderStateCopyWithImpl<$Res> implements $ReaderStateCopyWith<$Res> {
  _$ReaderStateCopyWithImpl(this._value, this._then);

  final ReaderState _value;
  // ignore: unused_field
  final $Res Function(ReaderState) _then;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? progress = freezed,
    Object? appbarVisible = freezed,
    Object? chapterNumber = freezed,
    Object? reversed = freezed,
    Object? currentChapter = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as PageDetails,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String,
      appbarVisible: appbarVisible == freezed
          ? _value.appbarVisible
          : appbarVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      chapterNumber: chapterNumber == freezed
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as double,
      reversed: reversed == freezed
          ? _value.reversed
          : reversed // ignore: cast_nullable_to_non_nullable
              as bool,
      currentChapter: currentChapter == freezed
          ? _value.currentChapter
          : currentChapter // ignore: cast_nullable_to_non_nullable
              as Chapter?,
    ));
  }

  @override
  $ChapterCopyWith<$Res>? get currentChapter {
    if (_value.currentChapter == null) {
      return null;
    }

    return $ChapterCopyWith<$Res>(_value.currentChapter!, (value) {
      return _then(_value.copyWith(currentChapter: value));
    });
  }
}

/// @nodoc
abstract class _$ReadingCopyWith<$Res> implements $ReaderStateCopyWith<$Res> {
  factory _$ReadingCopyWith(_Reading value, $Res Function(_Reading) then) =
      __$ReadingCopyWithImpl<$Res>;
  @override
  $Res call(
      {PageDetails currentPage,
      String progress,
      bool appbarVisible,
      double chapterNumber,
      bool reversed,
      Chapter? currentChapter});

  @override
  $ChapterCopyWith<$Res>? get currentChapter;
}

/// @nodoc
class __$ReadingCopyWithImpl<$Res> extends _$ReaderStateCopyWithImpl<$Res>
    implements _$ReadingCopyWith<$Res> {
  __$ReadingCopyWithImpl(_Reading _value, $Res Function(_Reading) _then)
      : super(_value, (v) => _then(v as _Reading));

  @override
  _Reading get _value => super._value as _Reading;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? progress = freezed,
    Object? appbarVisible = freezed,
    Object? chapterNumber = freezed,
    Object? reversed = freezed,
    Object? currentChapter = freezed,
  }) {
    return _then(_Reading(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as PageDetails,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String,
      appbarVisible: appbarVisible == freezed
          ? _value.appbarVisible
          : appbarVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      chapterNumber: chapterNumber == freezed
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as double,
      reversed: reversed == freezed
          ? _value.reversed
          : reversed // ignore: cast_nullable_to_non_nullable
              as bool,
      currentChapter: currentChapter == freezed
          ? _value.currentChapter
          : currentChapter // ignore: cast_nullable_to_non_nullable
              as Chapter?,
    ));
  }
}

/// @nodoc

class _$_Reading implements _Reading {
  const _$_Reading(
      {required this.currentPage,
      required this.progress,
      required this.appbarVisible,
      required this.chapterNumber,
      required this.reversed,
      this.currentChapter});

  @override
  final PageDetails currentPage;
  @override
  final String progress;
  @override
  final bool appbarVisible;
  @override
  final double chapterNumber;
  @override
  final bool reversed;
  @override
  final Chapter? currentChapter;

  @override
  String toString() {
    return 'ReaderState.reading(currentPage: $currentPage, progress: $progress, appbarVisible: $appbarVisible, chapterNumber: $chapterNumber, reversed: $reversed, currentChapter: $currentChapter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reading &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality().equals(other.progress, progress) &&
            const DeepCollectionEquality()
                .equals(other.appbarVisible, appbarVisible) &&
            const DeepCollectionEquality()
                .equals(other.chapterNumber, chapterNumber) &&
            const DeepCollectionEquality().equals(other.reversed, reversed) &&
            const DeepCollectionEquality()
                .equals(other.currentChapter, currentChapter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(progress),
      const DeepCollectionEquality().hash(appbarVisible),
      const DeepCollectionEquality().hash(chapterNumber),
      const DeepCollectionEquality().hash(reversed),
      const DeepCollectionEquality().hash(currentChapter));

  @JsonKey(ignore: true)
  @override
  _$ReadingCopyWith<_Reading> get copyWith =>
      __$ReadingCopyWithImpl<_Reading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageDetails currentPage,
            String progress,
            bool appbarVisible,
            double chapterNumber,
            bool reversed,
            Chapter? currentChapter)
        reading,
  }) {
    return reading(currentPage, progress, appbarVisible, chapterNumber,
        reversed, currentChapter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            PageDetails currentPage,
            String progress,
            bool appbarVisible,
            double chapterNumber,
            bool reversed,
            Chapter? currentChapter)?
        reading,
  }) {
    return reading?.call(currentPage, progress, appbarVisible, chapterNumber,
        reversed, currentChapter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageDetails currentPage,
            String progress,
            bool appbarVisible,
            double chapterNumber,
            bool reversed,
            Chapter? currentChapter)?
        reading,
    required TResult orElse(),
  }) {
    if (reading != null) {
      return reading(currentPage, progress, appbarVisible, chapterNumber,
          reversed, currentChapter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reading value) reading,
  }) {
    return reading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Reading value)? reading,
  }) {
    return reading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reading value)? reading,
    required TResult orElse(),
  }) {
    if (reading != null) {
      return reading(this);
    }
    return orElse();
  }
}

abstract class _Reading implements ReaderState {
  const factory _Reading(
      {required final PageDetails currentPage,
      required final String progress,
      required final bool appbarVisible,
      required final double chapterNumber,
      required final bool reversed,
      final Chapter? currentChapter}) = _$_Reading;

  @override
  PageDetails get currentPage => throw _privateConstructorUsedError;
  @override
  String get progress => throw _privateConstructorUsedError;
  @override
  bool get appbarVisible => throw _privateConstructorUsedError;
  @override
  double get chapterNumber => throw _privateConstructorUsedError;
  @override
  bool get reversed => throw _privateConstructorUsedError;
  @override
  Chapter? get currentChapter => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReadingCopyWith<_Reading> get copyWith =>
      throw _privateConstructorUsedError;
}
