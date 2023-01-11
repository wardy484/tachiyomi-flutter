import 'package:fluttiyomi/favourites/data/favourite.dart';
import 'package:fluttiyomi/settings/data/installed_source_repository.dart';
import 'package:fluttiyomi/source/source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sourceServiceProvider = Provider((ref) => SourceService(
      installedSourceRepository: ref.watch(installedSourceRepositoryProvider),
      ref: ref,
    ));

final sourceContainerProvider = Provider((ref) => SourceContainer());

class SourceContainer {
  final Map<String, Source> _sources = {};

  void addSource(Source source) {
    _sources[source.id] = source;
  }

  Source get(String sourceId) {
    final source = _sources[sourceId];

    if (source == null) {
      throw SourceNotInstalledException(sourceId);
    }

    return source;
  }
}

class SourceService {
  final InstalledSourceRepository installedSourceRepository;
  final ProviderRef ref;

  SourceService({
    required this.installedSourceRepository,
    required this.ref,
  });

  Future<void> initialiseSources() async {
    final installedSources =
        await installedSourceRepository.getInstalledSources();

    for (final installedSource in installedSources) {
      final source = installedSource.source;

      ref.read(sourceContainerProvider).addSource(source);
    }
  }

  Future<List<Source>> getSources() async {
    final installedSources =
        await installedSourceRepository.getInstalledSources();

    return installedSources.map((e) => e.source).toList();
  }

  Future<Source> getSource(String sourceId) async {
    final installedSource = await installedSourceRepository.getInstalledSource(
      sourceId,
    );

    if (installedSource == null) {
      throw SourceNotInstalledException(sourceId);
    }

    return installedSource.source;
  }

  Future<Source> getSourceForFavorite(Favourite favourite) async {
    final installedSource =
        await installedSourceRepository.getForFavourite(favourite);

    if (installedSource == null) {
      throw SourceNotInstalledException(favourite.sourceId);
    }

    return installedSource.source;
  }
}

class SourceNotInstalledException implements Exception {
  final String sourceId;

  SourceNotInstalledException(this.sourceId);

  @override
  String toString() {
    return "Source $sourceId is not installed.";
  }
}
