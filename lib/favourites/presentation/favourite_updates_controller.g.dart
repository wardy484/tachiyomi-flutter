// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_updates_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $FavouriteUpdatesControllerHash() =>
    r'55e68244490901a7213cf83a0b849a8c8c164fd8';

/// See also [FavouriteUpdatesController].
class FavouriteUpdatesControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FavouriteUpdatesController,
        void> {
  FavouriteUpdatesControllerProvider(
    this.favourite,
  ) : super(
          () => FavouriteUpdatesController()..favourite = favourite,
          from: favouriteUpdatesControllerProvider,
          name: r'favouriteUpdatesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $FavouriteUpdatesControllerHash,
        );

  final Favourite favourite;

  @override
  bool operator ==(Object other) {
    return other is FavouriteUpdatesControllerProvider &&
        other.favourite == favourite;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, favourite.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<void> runNotifierBuild(
    covariant _$FavouriteUpdatesController notifier,
  ) {
    return notifier.build(
      favourite,
    );
  }
}

typedef FavouriteUpdatesControllerRef
    = AutoDisposeAsyncNotifierProviderRef<void>;

/// See also [FavouriteUpdatesController].
final favouriteUpdatesControllerProvider = FavouriteUpdatesControllerFamily();

class FavouriteUpdatesControllerFamily extends Family<AsyncValue<void>> {
  FavouriteUpdatesControllerFamily();

  FavouriteUpdatesControllerProvider call(
    Favourite favourite,
  ) {
    return FavouriteUpdatesControllerProvider(
      favourite,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<FavouriteUpdatesController, void>
      getProviderOverride(
    covariant FavouriteUpdatesControllerProvider provider,
  ) {
    return call(
      provider.favourite,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'favouriteUpdatesControllerProvider';
}

abstract class _$FavouriteUpdatesController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final Favourite favourite;

  FutureOr<void> build(
    Favourite favourite,
  );
}

String $FavouriteUpdateQueueControllerHash() =>
    r'0ab0b6f9afaeb0d314a4bd84e97b6cec2504ea0f';

/// See also [FavouriteUpdateQueueController].
final favouriteUpdateQueueControllerProvider =
    AutoDisposeNotifierProvider<FavouriteUpdateQueueController, Queue>(
  FavouriteUpdateQueueController.new,
  name: r'favouriteUpdateQueueControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $FavouriteUpdateQueueControllerHash,
);
typedef FavouriteUpdateQueueControllerRef
    = AutoDisposeNotifierProviderRef<Queue>;

abstract class _$FavouriteUpdateQueueController
    extends AutoDisposeNotifier<Queue> {
  @override
  Queue build();
}
