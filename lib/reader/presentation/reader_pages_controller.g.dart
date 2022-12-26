// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_pages_controller.dart';

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

String $ReaderLoadingControllerHash() =>
    r'98b89305ba62b4509e701cbee0bdaff98f3c0587';

/// See also [ReaderLoadingController].
final readerLoadingControllerProvider =
    AutoDisposeNotifierProvider<ReaderLoadingController, ReaderLoadState>(
  ReaderLoadingController.new,
  name: r'readerLoadingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $ReaderLoadingControllerHash,
);
typedef ReaderLoadingControllerRef
    = AutoDisposeNotifierProviderRef<ReaderLoadState>;

abstract class _$ReaderLoadingController
    extends AutoDisposeNotifier<ReaderLoadState> {
  @override
  ReaderLoadState build();
}

String $ReaderPagesControllerHash() =>
    r'26763d22bfd65aaac403a5268a48b6a08e15d8c5';

/// See also [ReaderPagesController].
class ReaderPagesControllerProvider extends AutoDisposeNotifierProviderImpl<
    ReaderPagesController, List<ReaderPage>> {
  ReaderPagesControllerProvider(
    this.mangaId,
  ) : super(
          () => ReaderPagesController()..mangaId = mangaId,
          from: readerPagesControllerProvider,
          name: r'readerPagesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $ReaderPagesControllerHash,
        );

  final String mangaId;

  @override
  bool operator ==(Object other) {
    return other is ReaderPagesControllerProvider && other.mangaId == mangaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<ReaderPage> runNotifierBuild(
    covariant _$ReaderPagesController notifier,
  ) {
    return notifier.build(
      mangaId,
    );
  }
}

typedef ReaderPagesControllerRef
    = AutoDisposeNotifierProviderRef<List<ReaderPage>>;

/// See also [ReaderPagesController].
final readerPagesControllerProvider = ReaderPagesControllerFamily();

class ReaderPagesControllerFamily extends Family<List<ReaderPage>> {
  ReaderPagesControllerFamily();

  ReaderPagesControllerProvider call(
    String mangaId,
  ) {
    return ReaderPagesControllerProvider(
      mangaId,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<ReaderPagesController, List<ReaderPage>>
      getProviderOverride(
    covariant ReaderPagesControllerProvider provider,
  ) {
    return call(
      provider.mangaId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'readerPagesControllerProvider';
}

abstract class _$ReaderPagesController
    extends BuildlessAutoDisposeNotifier<List<ReaderPage>> {
  late final String mangaId;

  List<ReaderPage> build(
    String mangaId,
  );
}
