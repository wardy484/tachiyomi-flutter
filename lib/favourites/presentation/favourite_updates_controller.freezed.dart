// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favourite_updates_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Queue {
  int get maxItems => throw _privateConstructorUsedError;
  List<QueuedItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueueCopyWith<Queue> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueCopyWith<$Res> {
  factory $QueueCopyWith(Queue value, $Res Function(Queue) then) =
      _$QueueCopyWithImpl<$Res>;
  $Res call({int maxItems, List<QueuedItem> items});
}

/// @nodoc
class _$QueueCopyWithImpl<$Res> implements $QueueCopyWith<$Res> {
  _$QueueCopyWithImpl(this._value, this._then);

  final Queue _value;
  // ignore: unused_field
  final $Res Function(Queue) _then;

  @override
  $Res call({
    Object? maxItems = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      maxItems: maxItems == freezed
          ? _value.maxItems
          : maxItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<QueuedItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_QueueCopyWith<$Res> implements $QueueCopyWith<$Res> {
  factory _$$_QueueCopyWith(_$_Queue value, $Res Function(_$_Queue) then) =
      __$$_QueueCopyWithImpl<$Res>;
  @override
  $Res call({int maxItems, List<QueuedItem> items});
}

/// @nodoc
class __$$_QueueCopyWithImpl<$Res> extends _$QueueCopyWithImpl<$Res>
    implements _$$_QueueCopyWith<$Res> {
  __$$_QueueCopyWithImpl(_$_Queue _value, $Res Function(_$_Queue) _then)
      : super(_value, (v) => _then(v as _$_Queue));

  @override
  _$_Queue get _value => super._value as _$_Queue;

  @override
  $Res call({
    Object? maxItems = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_Queue(
      maxItems: maxItems == freezed
          ? _value.maxItems
          : maxItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<QueuedItem>,
    ));
  }
}

/// @nodoc

class _$_Queue implements _Queue {
  _$_Queue({required this.maxItems, required final List<QueuedItem> items})
      : _items = items;

  @override
  final int maxItems;
  final List<QueuedItem> _items;
  @override
  List<QueuedItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Queue(maxItems: $maxItems, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Queue &&
            const DeepCollectionEquality().equals(other.maxItems, maxItems) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(maxItems),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_QueueCopyWith<_$_Queue> get copyWith =>
      __$$_QueueCopyWithImpl<_$_Queue>(this, _$identity);
}

abstract class _Queue implements Queue {
  factory _Queue(
      {required final int maxItems,
      required final List<QueuedItem> items}) = _$_Queue;

  @override
  int get maxItems;
  @override
  List<QueuedItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_QueueCopyWith<_$_Queue> get copyWith =>
      throw _privateConstructorUsedError;
}
