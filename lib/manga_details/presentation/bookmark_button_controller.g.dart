// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_button_controller.dart';

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

String $BookmarkButtonControllerHash() =>
    r'8f34362c8207b39202aa31e8f5cb5df27f534b19';

/// See also [BookmarkButtonController].
class BookmarkButtonControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BookmarkButtonController,
        Favourite?> {
  BookmarkButtonControllerProvider(
    this.source,
    this.mangaId,
  ) : super(
          () => BookmarkButtonController()
            ..source = source
            ..mangaId = mangaId,
          from: bookmarkButtonControllerProvider,
          name: r'bookmarkButtonControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $BookmarkButtonControllerHash,
        );

  final Source source;
  final String mangaId;

  @override
  bool operator ==(Object other) {
    return other is BookmarkButtonControllerProvider &&
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
  FutureOr<Favourite?> runNotifierBuild(
    covariant _$BookmarkButtonController notifier,
  ) {
    return notifier.build(
      source,
      mangaId,
    );
  }
}

typedef BookmarkButtonControllerRef
    = AutoDisposeAsyncNotifierProviderRef<Favourite?>;

/// See also [BookmarkButtonController].
final bookmarkButtonControllerProvider = BookmarkButtonControllerFamily();

class BookmarkButtonControllerFamily extends Family<AsyncValue<Favourite?>> {
  BookmarkButtonControllerFamily();

  BookmarkButtonControllerProvider call(
    Source source,
    String mangaId,
  ) {
    return BookmarkButtonControllerProvider(
      source,
      mangaId,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<BookmarkButtonController, Favourite?>
      getProviderOverride(
    covariant BookmarkButtonControllerProvider provider,
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
  String? get name => r'bookmarkButtonControllerProvider';
}

abstract class _$BookmarkButtonController
    extends BuildlessAutoDisposeAsyncNotifier<Favourite?> {
  late final Source source;
  late final String mangaId;

  FutureOr<Favourite?> build(
    Source source,
    String mangaId,
  );
}
