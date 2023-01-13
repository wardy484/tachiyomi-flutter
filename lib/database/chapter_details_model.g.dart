// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_details_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetChapterDetailsCacheCollection on Isar {
  IsarCollection<ChapterDetailsCache> get chapterDetailsCaches =>
      this.collection();
}

const ChapterDetailsCacheSchema = CollectionSchema(
  name: r'ChapterDetailsCache',
  id: -2080433473910710227,
  properties: {
    r'chapterId': PropertySchema(
      id: 0,
      name: r'chapterId',
      type: IsarType.string,
    ),
    r'longStrip': PropertySchema(
      id: 1,
      name: r'longStrip',
      type: IsarType.bool,
    ),
    r'mangaId': PropertySchema(
      id: 2,
      name: r'mangaId',
      type: IsarType.string,
    ),
    r'pages': PropertySchema(
      id: 3,
      name: r'pages',
      type: IsarType.stringList,
    ),
    r'sourceId': PropertySchema(
      id: 4,
      name: r'sourceId',
      type: IsarType.string,
    )
  },
  estimateSize: _chapterDetailsCacheEstimateSize,
  serialize: _chapterDetailsCacheSerialize,
  deserialize: _chapterDetailsCacheDeserialize,
  deserializeProp: _chapterDetailsCacheDeserializeProp,
  idName: r'id',
  indexes: {
    r'sourceId_mangaId_chapterId': IndexSchema(
      id: -4915625974344716948,
      name: r'sourceId_mangaId_chapterId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sourceId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'mangaId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'chapterId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _chapterDetailsCacheGetId,
  getLinks: _chapterDetailsCacheGetLinks,
  attach: _chapterDetailsCacheAttach,
  version: '3.0.5',
);

int _chapterDetailsCacheEstimateSize(
  ChapterDetailsCache object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.chapterId.length * 3;
  bytesCount += 3 + object.mangaId.length * 3;
  bytesCount += 3 + object.pages.length * 3;
  {
    for (var i = 0; i < object.pages.length; i++) {
      final value = object.pages[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.sourceId.length * 3;
  return bytesCount;
}

void _chapterDetailsCacheSerialize(
  ChapterDetailsCache object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chapterId);
  writer.writeBool(offsets[1], object.longStrip);
  writer.writeString(offsets[2], object.mangaId);
  writer.writeStringList(offsets[3], object.pages);
  writer.writeString(offsets[4], object.sourceId);
}

ChapterDetailsCache _chapterDetailsCacheDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChapterDetailsCache();
  object.chapterId = reader.readString(offsets[0]);
  object.id = id;
  object.longStrip = reader.readBool(offsets[1]);
  object.mangaId = reader.readString(offsets[2]);
  object.pages = reader.readStringList(offsets[3]) ?? [];
  object.sourceId = reader.readString(offsets[4]);
  return object;
}

P _chapterDetailsCacheDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chapterDetailsCacheGetId(ChapterDetailsCache object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _chapterDetailsCacheGetLinks(
    ChapterDetailsCache object) {
  return [];
}

void _chapterDetailsCacheAttach(
    IsarCollection<dynamic> col, Id id, ChapterDetailsCache object) {
  object.id = id;
}

extension ChapterDetailsCacheQueryWhereSort
    on QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QWhere> {
  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChapterDetailsCacheQueryWhere
    on QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QWhereClause> {
  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      sourceIdEqualToAnyMangaIdChapterId(String sourceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sourceId_mangaId_chapterId',
        value: [sourceId],
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      sourceIdNotEqualToAnyMangaIdChapterId(String sourceId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [],
              upper: [sourceId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [sourceId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [sourceId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [],
              upper: [sourceId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      sourceIdMangaIdEqualToAnyChapterId(String sourceId, String mangaId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sourceId_mangaId_chapterId',
        value: [sourceId, mangaId],
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      sourceIdEqualToMangaIdNotEqualToAnyChapterId(
          String sourceId, String mangaId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [sourceId],
              upper: [sourceId, mangaId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [sourceId, mangaId],
              includeLower: false,
              upper: [sourceId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [sourceId, mangaId],
              includeLower: false,
              upper: [sourceId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [sourceId],
              upper: [sourceId, mangaId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      sourceIdMangaIdChapterIdEqualTo(
          String sourceId, String mangaId, String chapterId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sourceId_mangaId_chapterId',
        value: [sourceId, mangaId, chapterId],
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterWhereClause>
      sourceIdMangaIdEqualToChapterIdNotEqualTo(
          String sourceId, String mangaId, String chapterId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [sourceId, mangaId],
              upper: [sourceId, mangaId, chapterId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [sourceId, mangaId, chapterId],
              includeLower: false,
              upper: [sourceId, mangaId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [sourceId, mangaId, chapterId],
              includeLower: false,
              upper: [sourceId, mangaId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceId_mangaId_chapterId',
              lower: [sourceId, mangaId],
              upper: [sourceId, mangaId, chapterId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ChapterDetailsCacheQueryFilter on QueryBuilder<ChapterDetailsCache,
    ChapterDetailsCache, QFilterCondition> {
  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      chapterIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      chapterIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chapterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      chapterIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chapterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      chapterIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chapterId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      chapterIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chapterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      chapterIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chapterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      chapterIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chapterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      chapterIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chapterId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      chapterIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      chapterIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chapterId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      longStripEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longStrip',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      mangaIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      mangaIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      mangaIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      mangaIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mangaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      mangaIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      mangaIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      mangaIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mangaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      mangaIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mangaId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      mangaIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mangaId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      mangaIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mangaId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pages',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pages',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      pagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      sourceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      sourceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      sourceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      sourceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      sourceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      sourceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      sourceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      sourceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      sourceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterFilterCondition>
      sourceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceId',
        value: '',
      ));
    });
  }
}

extension ChapterDetailsCacheQueryObject on QueryBuilder<ChapterDetailsCache,
    ChapterDetailsCache, QFilterCondition> {}

extension ChapterDetailsCacheQueryLinks on QueryBuilder<ChapterDetailsCache,
    ChapterDetailsCache, QFilterCondition> {}

extension ChapterDetailsCacheQuerySortBy
    on QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QSortBy> {
  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      sortByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      sortByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      sortByLongStrip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longStrip', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      sortByLongStripDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longStrip', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      sortByMangaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaId', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      sortByMangaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaId', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      sortBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      sortBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }
}

extension ChapterDetailsCacheQuerySortThenBy
    on QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QSortThenBy> {
  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      thenByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      thenByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      thenByLongStrip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longStrip', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      thenByLongStripDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longStrip', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      thenByMangaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaId', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      thenByMangaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaId', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      thenBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QAfterSortBy>
      thenBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }
}

extension ChapterDetailsCacheQueryWhereDistinct
    on QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QDistinct> {
  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QDistinct>
      distinctByChapterId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QDistinct>
      distinctByLongStrip() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longStrip');
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QDistinct>
      distinctByMangaId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mangaId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QDistinct>
      distinctByPages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pages');
    });
  }

  QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QDistinct>
      distinctBySourceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceId', caseSensitive: caseSensitive);
    });
  }
}

extension ChapterDetailsCacheQueryProperty
    on QueryBuilder<ChapterDetailsCache, ChapterDetailsCache, QQueryProperty> {
  QueryBuilder<ChapterDetailsCache, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChapterDetailsCache, String, QQueryOperations>
      chapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterId');
    });
  }

  QueryBuilder<ChapterDetailsCache, bool, QQueryOperations>
      longStripProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longStrip');
    });
  }

  QueryBuilder<ChapterDetailsCache, String, QQueryOperations>
      mangaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mangaId');
    });
  }

  QueryBuilder<ChapterDetailsCache, List<String>, QQueryOperations>
      pagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pages');
    });
  }

  QueryBuilder<ChapterDetailsCache, String, QQueryOperations>
      sourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceId');
    });
  }
}
