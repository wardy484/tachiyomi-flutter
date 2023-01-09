import 'package:fluttiyomi/javascript/schema/source_info_schema.dart';
import 'package:fluttiyomi/source/scraper/schemas/page_schema.dart';
import 'package:yaml/yaml.dart';

class SourceSchema {
  final SourceInfoSchema info;
  final PageSchema chapters;
  final PageSchema chapterDetails;
  final PageSchema mangaDetails;
  final PageSchema home;
  final PageSchema search;

  SourceSchema(
    this.info,
    this.chapters,
    this.chapterDetails,
    this.mangaDetails,
    this.home,
    this.search,
  );

  factory SourceSchema.fromYaml(YamlMap yaml) {
    return SourceSchema(
      SourceInfoSchema.fromYaml(yaml['source_info']),
      PageSchema.fromYaml(yaml['chapters_schema']),
      PageSchema.fromYaml(yaml['chapter_details_schema']),
      PageSchema.fromYaml(yaml['manga_details_schema']),
      PageSchema.fromYaml(yaml['home_schema']),
      PageSchema.fromYaml(yaml['search_schema']),
    );
  }

  factory SourceSchema.fromJson(Map<String, dynamic> json) {
    return SourceSchema(
      SourceInfoSchema.fromJson(json['source_info']),
      PageSchema.fromJson(json['chapters_schema']),
      PageSchema.fromJson(json['chapter_details_schema']),
      PageSchema.fromJson(json['manga_details_schema']),
      PageSchema.fromJson(json['home_schema']),
      PageSchema.fromJson(json['search_schema']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source_info': info.toJson(),
      'chapters_schema': chapters.toJson(),
      'chapter_details_schema': chapterDetails.toJson(),
      'manga_details_schema': mangaDetails.toJson(),
      'home_schema': home.toJson(),
      'search_schema': search.toJson(),
    };
  }
}
