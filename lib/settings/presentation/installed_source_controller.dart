import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttiyomi/database/installed_source_model.dart';
import 'package:fluttiyomi/settings/application/source_service.dart';
import 'package:fluttiyomi/settings/data/installed_source_repository.dart';

import 'package:fluttiyomi/source/schema/source_schema.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaml/yaml.dart';

part 'installed_source_controller.g.dart';

final installedSourceStreamProvider =
    StreamProvider<List<InstalledSource>>((ref) {
  return ref.watch(installedSourceRepositoryProvider).queryInstalledSources();
});

@riverpod
class InstalledSourceController extends _$InstalledSourceController {
  @override
  FutureOr<List<InstalledSource>> build() async {
    return await ref
        .watch(installedSourceRepositoryProvider)
        .getInstalledSources();
  }

  Future<void> addSource(String sourceUrl) async {
    log("Adding source: $sourceUrl");

    Response response;
    SourceSchema schema;

    try {
      response = await Dio().get(sourceUrl);
    } catch (e) {
      throw FailedToFetchSourceException(sourceUrl);
    }

    try {
      final YamlMap yaml = loadYaml(response.data);
      schema = SourceSchema.fromYaml(yaml);
    } catch (e) {
      throw FailedToParseSourceException(sourceUrl);
    }

    final existingSource = await ref
        .read(installedSourceRepositoryProvider)
        .getInstalledSource(schema.info.id);

    if (existingSource != null) {
      throw ExistingSourceException(schema.info.name);
    }
    final installedSource = await ref
        .read(installedSourceRepositoryProvider)
        .addInstalledSource(schema);

    DefaultCacheManager().downloadFile(schema.info.iconUrl);

    ref.read(sourceContainerProvider).addSource(installedSource.source);
  }

  void removeSource(InstalledSource source) async {
    await ref.read(installedSourceRepositoryProvider).delete(source);
  }
}

class ExistingSourceException implements Exception {
  final String sourceName;

  ExistingSourceException(this.sourceName);

  @override
  String toString() {
    return "Source already exists: $sourceName";
  }
}

class FailedToParseSourceException implements Exception {
  final String sourceUrl;

  FailedToParseSourceException(this.sourceUrl);

  @override
  String toString() {
    return "Failed to parse source: $sourceUrl";
  }
}

class FailedToFetchSourceException implements Exception {
  final String sourceUrl;

  FailedToFetchSourceException(this.sourceUrl);

  @override
  String toString() {
    return "Failed to fetch source: $sourceUrl, please ensure the URL is correct and try again.";
  }
}
