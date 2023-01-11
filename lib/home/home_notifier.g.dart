// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_notifier.dart';

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

String $HomeSectionsControllerHash() =>
    r'739de2f42101ede78722eca107279afbbe1823c3';

/// See also [HomeSectionsController].
class HomeSectionsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<HomeSectionsController,
        List<HomeSection>> {
  HomeSectionsControllerProvider(
    this.source,
  ) : super(
          () => HomeSectionsController()..source = source,
          from: homeSectionsControllerProvider,
          name: r'homeSectionsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $HomeSectionsControllerHash,
        );

  final Source source;

  @override
  bool operator ==(Object other) {
    return other is HomeSectionsControllerProvider && other.source == source;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<HomeSection>> runNotifierBuild(
    covariant _$HomeSectionsController notifier,
  ) {
    return notifier.build(
      source,
    );
  }
}

typedef HomeSectionsControllerRef
    = AutoDisposeAsyncNotifierProviderRef<List<HomeSection>>;

/// See also [HomeSectionsController].
final homeSectionsControllerProvider = HomeSectionsControllerFamily();

class HomeSectionsControllerFamily
    extends Family<AsyncValue<List<HomeSection>>> {
  HomeSectionsControllerFamily();

  HomeSectionsControllerProvider call(
    Source source,
  ) {
    return HomeSectionsControllerProvider(
      source,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<HomeSectionsController,
      List<HomeSection>> getProviderOverride(
    covariant HomeSectionsControllerProvider provider,
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
  String? get name => r'homeSectionsControllerProvider';
}

abstract class _$HomeSectionsController
    extends BuildlessAutoDisposeAsyncNotifier<List<HomeSection>> {
  late final Source source;

  FutureOr<List<HomeSection>> build(
    Source source,
  );
}
