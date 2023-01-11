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

String $favouriteHash() => r'0481c61e00f65437e8761a7163101995f155d20a';

/// See also [favourite].
class FavouriteProvider extends AutoDisposeFutureProvider<Favourite?> {
  FavouriteProvider(
    this.source,
    this.mangaId,
  ) : super(
          (ref) => favourite(
            ref,
            source,
            mangaId,
          ),
          from: favouriteProvider,
          name: r'favouriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $favouriteHash,
        );

  final Source source;
  final String mangaId;

  @override
  bool operator ==(Object other) {
    return other is FavouriteProvider &&
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

typedef FavouriteRef = AutoDisposeFutureProviderRef<Favourite?>;

/// See also [favourite].
final favouriteProvider = FavouriteFamily();

class FavouriteFamily extends Family<AsyncValue<Favourite?>> {
  FavouriteFamily();

  FavouriteProvider call(
    Source source,
    String mangaId,
  ) {
    return FavouriteProvider(
      source,
      mangaId,
    );
  }

  @override
  AutoDisposeFutureProvider<Favourite?> getProviderOverride(
    covariant FavouriteProvider provider,
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
  String? get name => r'favouriteProvider';
}
