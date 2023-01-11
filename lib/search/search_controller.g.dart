// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

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

String $SearchControllerHash() => r'50fd9938964a1331f810b354f6e0d966fec679e5';

/// See also [SearchController].
class SearchControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchController, PagedResults> {
  SearchControllerProvider(
    this.source,
  ) : super(
          () => SearchController()..source = source,
          from: searchControllerProvider,
          name: r'searchControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $SearchControllerHash,
        );

  final Source source;

  @override
  bool operator ==(Object other) {
    return other is SearchControllerProvider && other.source == source;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<PagedResults> runNotifierBuild(
    covariant _$SearchController notifier,
  ) {
    return notifier.build(
      source,
    );
  }
}

typedef SearchControllerRef = AutoDisposeAsyncNotifierProviderRef<PagedResults>;

/// See also [SearchController].
final searchControllerProvider = SearchControllerFamily();

class SearchControllerFamily extends Family<AsyncValue<PagedResults>> {
  SearchControllerFamily();

  SearchControllerProvider call(
    Source source,
  ) {
    return SearchControllerProvider(
      source,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<SearchController, PagedResults>
      getProviderOverride(
    covariant SearchControllerProvider provider,
  ) {
    return call(
      provider.source,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'searchControllerProvider';
}

abstract class _$SearchController
    extends BuildlessAutoDisposeAsyncNotifier<PagedResults> {
  late final Source source;

  FutureOr<PagedResults> build(
    Source source,
  );
}
