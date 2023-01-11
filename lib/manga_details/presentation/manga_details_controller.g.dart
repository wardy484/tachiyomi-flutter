// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_details_controller.dart';

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

String $MangaDetailsControllerHash() =>
    r'ac29405d4fa19df77310790dd671b5a526645882';

/// See also [MangaDetailsController].
class MangaDetailsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MangaDetailsController,
        MangaDetailsState> {
  MangaDetailsControllerProvider(
    this.source,
    this.mangaId,
  ) : super(
          () => MangaDetailsController()
            ..source = source
            ..mangaId = mangaId,
          from: mangaDetailsControllerProvider,
          name: r'mangaDetailsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $MangaDetailsControllerHash,
        );

  final Source source;
  final String mangaId;

  @override
  bool operator ==(Object other) {
    return other is MangaDetailsControllerProvider &&
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

  @override
  FutureOr<MangaDetailsState> runNotifierBuild(
    covariant _$MangaDetailsController notifier,
  ) {
    return notifier.build(
      source,
      mangaId,
    );
  }
}

typedef MangaDetailsControllerRef
    = AutoDisposeAsyncNotifierProviderRef<MangaDetailsState>;

/// See also [MangaDetailsController].
final mangaDetailsControllerProvider = MangaDetailsControllerFamily();

class MangaDetailsControllerFamily
    extends Family<AsyncValue<MangaDetailsState>> {
  MangaDetailsControllerFamily();

  MangaDetailsControllerProvider call(
    Source source,
    String mangaId,
  ) {
    return MangaDetailsControllerProvider(
      source,
      mangaId,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<MangaDetailsController,
      MangaDetailsState> getProviderOverride(
    covariant MangaDetailsControllerProvider provider,
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
  String? get name => r'mangaDetailsControllerProvider';
}

abstract class _$MangaDetailsController
    extends BuildlessAutoDisposeAsyncNotifier<MangaDetailsState> {
  late final Source source;
  late final String mangaId;

  FutureOr<MangaDetailsState> build(
    Source source,
    String mangaId,
  );
}
