// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_chapter.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member

extension GetReadChapterCollection on Isar {
  IsarCollection<ReadChapter> get readChapters {
    return getCollection('ReadChapter');
  }
}

final ReadChapterSchema = CollectionSchema(
  name: 'ReadChapter',
  schema:
      '{"name":"ReadChapter","properties":[{"name":"chapterId","type":"String"},{"name":"mangaId","type":"String"},{"name":"sourceId","type":"String"}],"indexes":[{"name":"mangaId_sourceId_chapterId","unique":false,"properties":[{"name":"mangaId","type":"Hash","caseSensitive":true},{"name":"sourceId","type":"Hash","caseSensitive":true},{"name":"chapterId","type":"Hash","caseSensitive":true}]}],"links":[]}',
  adapter: const _ReadChapterAdapter(),
  idName: 'id',
  propertyIds: {'chapterId': 0, 'mangaId': 1, 'sourceId': 2},
  indexIds: {'mangaId_sourceId_chapterId': 0},
  indexTypes: {
    'mangaId_sourceId_chapterId': [
      NativeIndexType.stringHash,
      NativeIndexType.stringHash,
      NativeIndexType.stringHash,
    ]
  },
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) => obj.id,
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 1,
);

class _ReadChapterAdapter extends IsarTypeAdapter<ReadChapter> {
  const _ReadChapterAdapter();

  @override
  void serialize(IsarCollection<ReadChapter> collection, IsarRawObject rawObj,
      ReadChapter object, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.chapterId;
    final _chapterId = BinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += _chapterId.length;
    final value1 = object.mangaId;
    final _mangaId = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _mangaId.length;
    final value2 = object.sourceId;
    final _sourceId = BinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += _sourceId.length;
    final size = dynamicSize + 26;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = bufAsBytes(rawObj.buffer, size);
    final writer = BinaryWriter(buffer, 26);
    writer.writeBytes(offsets[0], _chapterId);
    writer.writeBytes(offsets[1], _mangaId);
    writer.writeBytes(offsets[2], _sourceId);
  }

  @override
  ReadChapter deserialize(IsarCollection<ReadChapter> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = ReadChapter();
    object.chapterId = reader.readString(offsets[0]);
    object.id = id;
    object.mangaId = reader.readString(offsets[1]);
    object.sourceId = reader.readString(offsets[2]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, BinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension ReadChapterQueryWhereSort
    on QueryBuilder<ReadChapter, ReadChapter, QWhere> {
  QueryBuilder<ReadChapter, ReadChapter, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhere>
      anyMangaIdSourceIdChapterId() {
    return addWhereClauseInternal(
        const WhereClause(indexName: 'mangaId_sourceId_chapterId'));
  }
}

extension ReadChapterQueryWhere
    on QueryBuilder<ReadChapter, ReadChapter, QWhereClause> {
  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause> idNotEqualTo(
      int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause> mangaIdEqualTo(
      String mangaId) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'mangaId_sourceId_chapterId',
      lower: [mangaId],
      includeLower: true,
      upper: [mangaId],
      includeUpper: true,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause> mangaIdNotEqualTo(
      String mangaId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        upper: [mangaId],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        lower: [mangaId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        lower: [mangaId],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        upper: [mangaId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause>
      mangaIdSourceIdEqualTo(String mangaId, String sourceId) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'mangaId_sourceId_chapterId',
      lower: [mangaId, sourceId],
      includeLower: true,
      upper: [mangaId, sourceId],
      includeUpper: true,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause>
      mangaIdSourceIdNotEqualTo(String mangaId, String sourceId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        upper: [mangaId, sourceId],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        lower: [mangaId, sourceId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        lower: [mangaId, sourceId],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        upper: [mangaId, sourceId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause>
      mangaIdSourceIdChapterIdEqualTo(
          String mangaId, String sourceId, String chapterId) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'mangaId_sourceId_chapterId',
      lower: [mangaId, sourceId, chapterId],
      includeLower: true,
      upper: [mangaId, sourceId, chapterId],
      includeUpper: true,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterWhereClause>
      mangaIdSourceIdChapterIdNotEqualTo(
          String mangaId, String sourceId, String chapterId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        upper: [mangaId, sourceId, chapterId],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        lower: [mangaId, sourceId, chapterId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        lower: [mangaId, sourceId, chapterId],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId_chapterId',
        upper: [mangaId, sourceId, chapterId],
        includeUpper: false,
      ));
    }
  }
}

extension ReadChapterQueryFilter
    on QueryBuilder<ReadChapter, ReadChapter, QFilterCondition> {
  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      chapterIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'chapterId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      chapterIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'chapterId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      chapterIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'chapterId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      chapterIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'chapterId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      chapterIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'chapterId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      chapterIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'chapterId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      chapterIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'chapterId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      chapterIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'chapterId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> mangaIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'mangaId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      mangaIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'mangaId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> mangaIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'mangaId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> mangaIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'mangaId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      mangaIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'mangaId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> mangaIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'mangaId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> mangaIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'mangaId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> mangaIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'mangaId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> sourceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sourceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      sourceIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sourceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      sourceIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sourceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> sourceIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sourceId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      sourceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sourceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      sourceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sourceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition>
      sourceIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sourceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterFilterCondition> sourceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sourceId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ReadChapterQueryWhereSortBy
    on QueryBuilder<ReadChapter, ReadChapter, QSortBy> {
  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> sortByChapterId() {
    return addSortByInternal('chapterId', Sort.asc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> sortByChapterIdDesc() {
    return addSortByInternal('chapterId', Sort.desc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> sortByMangaId() {
    return addSortByInternal('mangaId', Sort.asc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> sortByMangaIdDesc() {
    return addSortByInternal('mangaId', Sort.desc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> sortBySourceId() {
    return addSortByInternal('sourceId', Sort.asc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> sortBySourceIdDesc() {
    return addSortByInternal('sourceId', Sort.desc);
  }
}

extension ReadChapterQueryWhereSortThenBy
    on QueryBuilder<ReadChapter, ReadChapter, QSortThenBy> {
  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> thenByChapterId() {
    return addSortByInternal('chapterId', Sort.asc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> thenByChapterIdDesc() {
    return addSortByInternal('chapterId', Sort.desc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> thenByMangaId() {
    return addSortByInternal('mangaId', Sort.asc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> thenByMangaIdDesc() {
    return addSortByInternal('mangaId', Sort.desc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> thenBySourceId() {
    return addSortByInternal('sourceId', Sort.asc);
  }

  QueryBuilder<ReadChapter, ReadChapter, QAfterSortBy> thenBySourceIdDesc() {
    return addSortByInternal('sourceId', Sort.desc);
  }
}

extension ReadChapterQueryWhereDistinct
    on QueryBuilder<ReadChapter, ReadChapter, QDistinct> {
  QueryBuilder<ReadChapter, ReadChapter, QDistinct> distinctByChapterId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('chapterId', caseSensitive: caseSensitive);
  }

  QueryBuilder<ReadChapter, ReadChapter, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ReadChapter, ReadChapter, QDistinct> distinctByMangaId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mangaId', caseSensitive: caseSensitive);
  }

  QueryBuilder<ReadChapter, ReadChapter, QDistinct> distinctBySourceId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sourceId', caseSensitive: caseSensitive);
  }
}

extension ReadChapterQueryProperty
    on QueryBuilder<ReadChapter, ReadChapter, QQueryProperty> {
  QueryBuilder<ReadChapter, String, QQueryOperations> chapterIdProperty() {
    return addPropertyNameInternal('chapterId');
  }

  QueryBuilder<ReadChapter, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ReadChapter, String, QQueryOperations> mangaIdProperty() {
    return addPropertyNameInternal('mangaId');
  }

  QueryBuilder<ReadChapter, String, QQueryOperations> sourceIdProperty() {
    return addPropertyNameInternal('sourceId');
  }
}
