// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reader_progress_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReaderUpcomingChapters {
  Chapter? get nextChapter => throw _privateConstructorUsedError;
  Chapter? get previousChapter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReaderUpcomingChaptersCopyWith<ReaderUpcomingChapters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReaderUpcomingChaptersCopyWith<$Res> {
  factory $ReaderUpcomingChaptersCopyWith(ReaderUpcomingChapters value,
          $Res Function(ReaderUpcomingChapters) then) =
      _$ReaderUpcomingChaptersCopyWithImpl<$Res>;
  $Res call({Chapter? nextChapter, Chapter? previousChapter});

  $ChapterCopyWith<$Res>? get nextChapter;
  $ChapterCopyWith<$Res>? get previousChapter;
}

/// @nodoc
class _$ReaderUpcomingChaptersCopyWithImpl<$Res>
    implements $ReaderUpcomingChaptersCopyWith<$Res> {
  _$ReaderUpcomingChaptersCopyWithImpl(this._value, this._then);

  final ReaderUpcomingChapters _value;
  // ignore: unused_field
  final $Res Function(ReaderUpcomingChapters) _then;

  @override
  $Res call({
    Object? nextChapter = freezed,
    Object? previousChapter = freezed,
  }) {
    return _then(_value.copyWith(
      nextChapter: nextChapter == freezed
          ? _value.nextChapter
          : nextChapter // ignore: cast_nullable_to_non_nullable
              as Chapter?,
      previousChapter: previousChapter == freezed
          ? _value.previousChapter
          : previousChapter // ignore: cast_nullable_to_non_nullable
              as Chapter?,
    ));
  }

  @override
  $ChapterCopyWith<$Res>? get nextChapter {
    if (_value.nextChapter == null) {
      return null;
    }

    return $ChapterCopyWith<$Res>(_value.nextChapter!, (value) {
      return _then(_value.copyWith(nextChapter: value));
    });
  }

  @override
  $ChapterCopyWith<$Res>? get previousChapter {
    if (_value.previousChapter == null) {
      return null;
    }

    return $ChapterCopyWith<$Res>(_value.previousChapter!, (value) {
      return _then(_value.copyWith(previousChapter: value));
    });
  }
}

/// @nodoc
abstract class _$$_ReaderProgressCopyWith<$Res>
    implements $ReaderUpcomingChaptersCopyWith<$Res> {
  factory _$$_ReaderProgressCopyWith(
          _$_ReaderProgress value, $Res Function(_$_ReaderProgress) then) =
      __$$_ReaderProgressCopyWithImpl<$Res>;
  @override
  $Res call({Chapter? nextChapter, Chapter? previousChapter});

  @override
  $ChapterCopyWith<$Res>? get nextChapter;
  @override
  $ChapterCopyWith<$Res>? get previousChapter;
}

/// @nodoc
class __$$_ReaderProgressCopyWithImpl<$Res>
    extends _$ReaderUpcomingChaptersCopyWithImpl<$Res>
    implements _$$_ReaderProgressCopyWith<$Res> {
  __$$_ReaderProgressCopyWithImpl(
      _$_ReaderProgress _value, $Res Function(_$_ReaderProgress) _then)
      : super(_value, (v) => _then(v as _$_ReaderProgress));

  @override
  _$_ReaderProgress get _value => super._value as _$_ReaderProgress;

  @override
  $Res call({
    Object? nextChapter = freezed,
    Object? previousChapter = freezed,
  }) {
    return _then(_$_ReaderProgress(
      nextChapter: nextChapter == freezed
          ? _value.nextChapter
          : nextChapter // ignore: cast_nullable_to_non_nullable
              as Chapter?,
      previousChapter: previousChapter == freezed
          ? _value.previousChapter
          : previousChapter // ignore: cast_nullable_to_non_nullable
              as Chapter?,
    ));
  }
}

/// @nodoc

class _$_ReaderProgress extends _ReaderProgress {
  _$_ReaderProgress({this.nextChapter, this.previousChapter}) : super._();

  @override
  final Chapter? nextChapter;
  @override
  final Chapter? previousChapter;

  @override
  String toString() {
    return 'ReaderUpcomingChapters(nextChapter: $nextChapter, previousChapter: $previousChapter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReaderProgress &&
            const DeepCollectionEquality()
                .equals(other.nextChapter, nextChapter) &&
            const DeepCollectionEquality()
                .equals(other.previousChapter, previousChapter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nextChapter),
      const DeepCollectionEquality().hash(previousChapter));

  @JsonKey(ignore: true)
  @override
  _$$_ReaderProgressCopyWith<_$_ReaderProgress> get copyWith =>
      __$$_ReaderProgressCopyWithImpl<_$_ReaderProgress>(this, _$identity);
}

abstract class _ReaderProgress extends ReaderUpcomingChapters {
  factory _ReaderProgress(
      {final Chapter? nextChapter,
      final Chapter? previousChapter}) = _$_ReaderProgress;
  _ReaderProgress._() : super._();

  @override
  Chapter? get nextChapter;
  @override
  Chapter? get previousChapter;
  @override
  @JsonKey(ignore: true)
  _$$_ReaderProgressCopyWith<_$_ReaderProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
