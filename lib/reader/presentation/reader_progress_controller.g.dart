// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_progress_controller.dart';

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

String $ReaderUpcomingChaptersControllerHash() =>
    r'5187c9e6be593c23c18edf88d1d42baa980a1e6c';

/// See also [ReaderUpcomingChaptersController].
class ReaderUpcomingChaptersControllerProvider
    extends AutoDisposeNotifierProviderImpl<ReaderUpcomingChaptersController,
        ReaderUpcomingChapters> {
  ReaderUpcomingChaptersControllerProvider(
    this.source,
    this.mangaId,
    this.chapter,
  ) : super(
          () => ReaderUpcomingChaptersController()
            ..source = source
            ..mangaId = mangaId
            ..chapter = chapter,
          from: readerUpcomingChaptersControllerProvider,
          name: r'readerUpcomingChaptersControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $ReaderUpcomingChaptersControllerHash,
        );

  final Source source;
  final String mangaId;
  final Chapter chapter;

  @override
  bool operator ==(Object other) {
    return other is ReaderUpcomingChaptersControllerProvider &&
        other.source == source &&
        other.mangaId == mangaId &&
        other.chapter == chapter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ReaderUpcomingChapters runNotifierBuild(
    covariant _$ReaderUpcomingChaptersController notifier,
  ) {
    return notifier.build(
      source,
      mangaId,
      chapter,
    );
  }
}

typedef ReaderUpcomingChaptersControllerRef
    = AutoDisposeNotifierProviderRef<ReaderUpcomingChapters>;

/// See also [ReaderUpcomingChaptersController].
final readerUpcomingChaptersControllerProvider =
    ReaderUpcomingChaptersControllerFamily();

class ReaderUpcomingChaptersControllerFamily
    extends Family<ReaderUpcomingChapters> {
  ReaderUpcomingChaptersControllerFamily();

  ReaderUpcomingChaptersControllerProvider call(
    Source source,
    String mangaId,
    Chapter chapter,
  ) {
    return ReaderUpcomingChaptersControllerProvider(
      source,
      mangaId,
      chapter,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<ReaderUpcomingChaptersController,
      ReaderUpcomingChapters> getProviderOverride(
    covariant ReaderUpcomingChaptersControllerProvider provider,
  ) {
    return call(
      provider.source,
      provider.mangaId,
      provider.chapter,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'readerUpcomingChaptersControllerProvider';
}

abstract class _$ReaderUpcomingChaptersController
    extends BuildlessAutoDisposeNotifier<ReaderUpcomingChapters> {
  late final Source source;
  late final String mangaId;
  late final Chapter chapter;

  ReaderUpcomingChapters build(
    Source source,
    String mangaId,
    Chapter chapter,
  );
}
