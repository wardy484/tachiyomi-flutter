// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_queue_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateQueueState {
  List<QueuedItem> get queue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<QueuedItem> queue) updating,
    required TResult Function(List<QueuedItem> queue) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<QueuedItem> queue)? updating,
    TResult Function(List<QueuedItem> queue)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<QueuedItem> queue)? updating,
    TResult Function(List<QueuedItem> queue)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updating value) updating,
    required TResult Function(_updated value) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_updating value)? updating,
    TResult Function(_updated value)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updating value)? updating,
    TResult Function(_updated value)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateQueueStateCopyWith<UpdateQueueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateQueueStateCopyWith<$Res> {
  factory $UpdateQueueStateCopyWith(
          UpdateQueueState value, $Res Function(UpdateQueueState) then) =
      _$UpdateQueueStateCopyWithImpl<$Res>;
  $Res call({List<QueuedItem> queue});
}

/// @nodoc
class _$UpdateQueueStateCopyWithImpl<$Res>
    implements $UpdateQueueStateCopyWith<$Res> {
  _$UpdateQueueStateCopyWithImpl(this._value, this._then);

  final UpdateQueueState _value;
  // ignore: unused_field
  final $Res Function(UpdateQueueState) _then;

  @override
  $Res call({
    Object? queue = freezed,
  }) {
    return _then(_value.copyWith(
      queue: queue == freezed
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<QueuedItem>,
    ));
  }
}

/// @nodoc
abstract class _$updatingCopyWith<$Res>
    implements $UpdateQueueStateCopyWith<$Res> {
  factory _$updatingCopyWith(_updating value, $Res Function(_updating) then) =
      __$updatingCopyWithImpl<$Res>;
  @override
  $Res call({List<QueuedItem> queue});
}

/// @nodoc
class __$updatingCopyWithImpl<$Res> extends _$UpdateQueueStateCopyWithImpl<$Res>
    implements _$updatingCopyWith<$Res> {
  __$updatingCopyWithImpl(_updating _value, $Res Function(_updating) _then)
      : super(_value, (v) => _then(v as _updating));

  @override
  _updating get _value => super._value as _updating;

  @override
  $Res call({
    Object? queue = freezed,
  }) {
    return _then(_updating(
      queue == freezed
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<QueuedItem>,
    ));
  }
}

/// @nodoc

class _$_updating implements _updating {
  const _$_updating(final List<QueuedItem> queue) : _queue = queue;

  final List<QueuedItem> _queue;
  @override
  List<QueuedItem> get queue {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queue);
  }

  @override
  String toString() {
    return 'UpdateQueueState.updating(queue: $queue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _updating &&
            const DeepCollectionEquality().equals(other.queue, queue));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(queue));

  @JsonKey(ignore: true)
  @override
  _$updatingCopyWith<_updating> get copyWith =>
      __$updatingCopyWithImpl<_updating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<QueuedItem> queue) updating,
    required TResult Function(List<QueuedItem> queue) updated,
  }) {
    return updating(queue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<QueuedItem> queue)? updating,
    TResult Function(List<QueuedItem> queue)? updated,
  }) {
    return updating?.call(queue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<QueuedItem> queue)? updating,
    TResult Function(List<QueuedItem> queue)? updated,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(queue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updating value) updating,
    required TResult Function(_updated value) updated,
  }) {
    return updating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_updating value)? updating,
    TResult Function(_updated value)? updated,
  }) {
    return updating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updating value)? updating,
    TResult Function(_updated value)? updated,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(this);
    }
    return orElse();
  }
}

abstract class _updating implements UpdateQueueState {
  const factory _updating(final List<QueuedItem> queue) = _$_updating;

  @override
  List<QueuedItem> get queue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$updatingCopyWith<_updating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$updatedCopyWith<$Res>
    implements $UpdateQueueStateCopyWith<$Res> {
  factory _$updatedCopyWith(_updated value, $Res Function(_updated) then) =
      __$updatedCopyWithImpl<$Res>;
  @override
  $Res call({List<QueuedItem> queue});
}

/// @nodoc
class __$updatedCopyWithImpl<$Res> extends _$UpdateQueueStateCopyWithImpl<$Res>
    implements _$updatedCopyWith<$Res> {
  __$updatedCopyWithImpl(_updated _value, $Res Function(_updated) _then)
      : super(_value, (v) => _then(v as _updated));

  @override
  _updated get _value => super._value as _updated;

  @override
  $Res call({
    Object? queue = freezed,
  }) {
    return _then(_updated(
      queue == freezed
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<QueuedItem>,
    ));
  }
}

/// @nodoc

class _$_updated implements _updated {
  const _$_updated(final List<QueuedItem> queue) : _queue = queue;

  final List<QueuedItem> _queue;
  @override
  List<QueuedItem> get queue {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queue);
  }

  @override
  String toString() {
    return 'UpdateQueueState.updated(queue: $queue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _updated &&
            const DeepCollectionEquality().equals(other.queue, queue));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(queue));

  @JsonKey(ignore: true)
  @override
  _$updatedCopyWith<_updated> get copyWith =>
      __$updatedCopyWithImpl<_updated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<QueuedItem> queue) updating,
    required TResult Function(List<QueuedItem> queue) updated,
  }) {
    return updated(queue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<QueuedItem> queue)? updating,
    TResult Function(List<QueuedItem> queue)? updated,
  }) {
    return updated?.call(queue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<QueuedItem> queue)? updating,
    TResult Function(List<QueuedItem> queue)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(queue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updating value) updating,
    required TResult Function(_updated value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_updating value)? updating,
    TResult Function(_updated value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updating value)? updating,
    TResult Function(_updated value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class _updated implements UpdateQueueState {
  const factory _updated(final List<QueuedItem> queue) = _$_updated;

  @override
  List<QueuedItem> get queue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$updatedCopyWith<_updated> get copyWith =>
      throw _privateConstructorUsedError;
}
