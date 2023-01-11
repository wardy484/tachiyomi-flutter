import 'package:yaml/yaml.dart';

class SourceInfoSchema {
  final String name;
  final String id;
  final String description;
  final String iconUrl;
  final String version;
  final String repositoryUrl;
  final String websiteUrl;

  SourceInfoSchema({
    required this.name,
    required this.id,
    required this.description,
    required this.iconUrl,
    required this.version,
    required this.repositoryUrl,
    required this.websiteUrl,
  });

  factory SourceInfoSchema.fromYaml(YamlMap yaml) {
    return SourceInfoSchema(
      name: yaml['name'],
      id: yaml['id'],
      description: yaml['description'],
      iconUrl: yaml['icon_url'],
      version: yaml['version'],
      repositoryUrl: yaml['repository_url'],
      websiteUrl: yaml['website_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'description': description,
      'icon_url': iconUrl,
      'version': version,
      'repository_url': repositoryUrl,
      'website_url': websiteUrl,
    };
  }

  factory SourceInfoSchema.fromJson(Map<String, dynamic> json) {
    return SourceInfoSchema(
      name: json['name'],
      id: json['id'],
      description: json['description'],
      iconUrl: json['icon_url'],
      version: json['version'],
      repositoryUrl: json['repository_url'],
      websiteUrl: json['website_url'],
    );
  }
}
