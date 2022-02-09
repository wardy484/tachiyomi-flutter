// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CompletedChapter extends DataClass
    implements Insertable<CompletedChapter> {
  final int id;
  final String source;
  final String mangaId;
  final String chapterId;
  CompletedChapter(
      {required this.id,
      required this.source,
      required this.mangaId,
      required this.chapterId});
  factory CompletedChapter.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CompletedChapter(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      source: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}source'])!,
      mangaId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}manga_id'])!,
      chapterId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source'] = Variable<String>(source);
    map['manga_id'] = Variable<String>(mangaId);
    map['chapter_id'] = Variable<String>(chapterId);
    return map;
  }

  CompletedChaptersCompanion toCompanion(bool nullToAbsent) {
    return CompletedChaptersCompanion(
      id: Value(id),
      source: Value(source),
      mangaId: Value(mangaId),
      chapterId: Value(chapterId),
    );
  }

  factory CompletedChapter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompletedChapter(
      id: serializer.fromJson<int>(json['id']),
      source: serializer.fromJson<String>(json['source']),
      mangaId: serializer.fromJson<String>(json['mangaId']),
      chapterId: serializer.fromJson<String>(json['chapterId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'source': serializer.toJson<String>(source),
      'mangaId': serializer.toJson<String>(mangaId),
      'chapterId': serializer.toJson<String>(chapterId),
    };
  }

  CompletedChapter copyWith(
          {int? id, String? source, String? mangaId, String? chapterId}) =>
      CompletedChapter(
        id: id ?? this.id,
        source: source ?? this.source,
        mangaId: mangaId ?? this.mangaId,
        chapterId: chapterId ?? this.chapterId,
      );
  @override
  String toString() {
    return (StringBuffer('CompletedChapter(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('mangaId: $mangaId, ')
          ..write('chapterId: $chapterId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, source, mangaId, chapterId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompletedChapter &&
          other.id == this.id &&
          other.source == this.source &&
          other.mangaId == this.mangaId &&
          other.chapterId == this.chapterId);
}

class CompletedChaptersCompanion extends UpdateCompanion<CompletedChapter> {
  final Value<int> id;
  final Value<String> source;
  final Value<String> mangaId;
  final Value<String> chapterId;
  const CompletedChaptersCompanion({
    this.id = const Value.absent(),
    this.source = const Value.absent(),
    this.mangaId = const Value.absent(),
    this.chapterId = const Value.absent(),
  });
  CompletedChaptersCompanion.insert({
    this.id = const Value.absent(),
    required String source,
    required String mangaId,
    required String chapterId,
  })  : source = Value(source),
        mangaId = Value(mangaId),
        chapterId = Value(chapterId);
  static Insertable<CompletedChapter> custom({
    Expression<int>? id,
    Expression<String>? source,
    Expression<String>? mangaId,
    Expression<String>? chapterId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (source != null) 'source': source,
      if (mangaId != null) 'manga_id': mangaId,
      if (chapterId != null) 'chapter_id': chapterId,
    });
  }

  CompletedChaptersCompanion copyWith(
      {Value<int>? id,
      Value<String>? source,
      Value<String>? mangaId,
      Value<String>? chapterId}) {
    return CompletedChaptersCompanion(
      id: id ?? this.id,
      source: source ?? this.source,
      mangaId: mangaId ?? this.mangaId,
      chapterId: chapterId ?? this.chapterId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (mangaId.present) {
      map['manga_id'] = Variable<String>(mangaId.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompletedChaptersCompanion(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('mangaId: $mangaId, ')
          ..write('chapterId: $chapterId')
          ..write(')'))
        .toString();
  }
}

class $CompletedChaptersTable extends CompletedChapters
    with TableInfo<$CompletedChaptersTable, CompletedChapter> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CompletedChaptersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String?> source = GeneratedColumn<String?>(
      'source', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _mangaIdMeta = const VerificationMeta('mangaId');
  @override
  late final GeneratedColumn<String?> mangaId = GeneratedColumn<String?>(
      'manga_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _chapterIdMeta = const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<String?> chapterId = GeneratedColumn<String?>(
      'chapter_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, source, mangaId, chapterId];
  @override
  String get aliasedName => _alias ?? 'completed_chapters';
  @override
  String get actualTableName => 'completed_chapters';
  @override
  VerificationContext validateIntegrity(Insertable<CompletedChapter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('manga_id')) {
      context.handle(_mangaIdMeta,
          mangaId.isAcceptableOrUnknown(data['manga_id']!, _mangaIdMeta));
    } else if (isInserting) {
      context.missing(_mangaIdMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompletedChapter map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CompletedChapter.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CompletedChaptersTable createAlias(String alias) {
    return $CompletedChaptersTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CompletedChaptersTable completedChapters =
      $CompletedChaptersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [completedChapters];
}
