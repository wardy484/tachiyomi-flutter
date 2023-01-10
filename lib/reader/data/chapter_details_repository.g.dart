// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_details_repository.dart';

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

String $chapterDetailsHash() => r'3fa7679dc286cae062e5b90bfe9482b4cd7f4de6';

/// See also [chapterDetails].
class ChapterDetailsProvider extends AutoDisposeFutureProvider<ChapterDetails> {
  ChapterDetailsProvider(
    this.mangaId,
    this.chapterId,
  ) : super(
          (ref) => chapterDetails(
            ref,
            mangaId,
            chapterId,
          ),
          from: chapterDetailsProvider,
          name: r'chapterDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $chapterDetailsHash,
        );

  final String mangaId;
  final String chapterId;

  @override
  bool operator ==(Object other) {
    return other is ChapterDetailsProvider &&
        other.mangaId == mangaId &&
        other.chapterId == chapterId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);
    hash = _SystemHash.combine(hash, chapterId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ChapterDetailsRef = AutoDisposeFutureProviderRef<ChapterDetails>;

/// See also [chapterDetails].
final chapterDetailsProvider = ChapterDetailsFamily();

class ChapterDetailsFamily extends Family<AsyncValue<ChapterDetails>> {
  ChapterDetailsFamily();

  ChapterDetailsProvider call(
    String mangaId,
    String chapterId,
  ) {
    return ChapterDetailsProvider(
      mangaId,
      chapterId,
    );
  }

  @override
  AutoDisposeFutureProvider<ChapterDetails> getProviderOverride(
    covariant ChapterDetailsProvider provider,
  ) {
    return call(
      provider.mangaId,
      provider.chapterId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'chapterDetailsProvider';
}
