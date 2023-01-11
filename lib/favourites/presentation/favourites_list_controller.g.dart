// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_list_controller.dart';

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

String $favouriteBySourceHash() => r'21ac0597342f41f7d2c4275522f1d56d971f1539';

/// See also [favouriteBySource].
class FavouriteBySourceProvider extends AutoDisposeFutureProvider<Favourite?> {
  FavouriteBySourceProvider(
    this.source,
    this.mangaId,
  ) : super(
          (ref) => favouriteBySource(
            ref,
            source,
            mangaId,
          ),
          from: favouriteBySourceProvider,
          name: r'favouriteBySourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $favouriteBySourceHash,
        );

  final Source source;
  final String mangaId;

  @override
  bool operator ==(Object other) {
    return other is FavouriteBySourceProvider &&
        other.source == source &&
        other.mangaId == mangaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FavouriteBySourceRef = AutoDisposeFutureProviderRef<Favourite?>;

/// See also [favouriteBySource].
final favouriteBySourceProvider = FavouriteBySourceFamily();

class FavouriteBySourceFamily extends Family<AsyncValue<Favourite?>> {
  FavouriteBySourceFamily();

  FavouriteBySourceProvider call(
    Source source,
    String mangaId,
  ) {
    return FavouriteBySourceProvider(
      source,
      mangaId,
    );
  }

  @override
  AutoDisposeFutureProvider<Favourite?> getProviderOverride(
    covariant FavouriteBySourceProvider provider,
  ) {
    return call(
      provider.source,
      provider.mangaId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'favouriteBySourceProvider';
}
