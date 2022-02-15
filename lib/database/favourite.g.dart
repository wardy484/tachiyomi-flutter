// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member

extension GetFavouriteCollection on Isar {
  IsarCollection<Favourite> get favourites {
    return getCollection('Favourite');
  }
}

final FavouriteSchema = CollectionSchema(
  name: 'Favourite',
  schema:
      '{"name":"Favourite","properties":[{"name":"hasNewChapters","type":"Byte"},{"name":"image","type":"String"},{"name":"mangaId","type":"String"},{"name":"name","type":"String"},{"name":"sourceId","type":"String"}],"indexes":[{"name":"mangaId_sourceId","unique":false,"properties":[{"name":"mangaId","type":"Hash","caseSensitive":true},{"name":"sourceId","type":"Hash","caseSensitive":true}]}],"links":[]}',
  adapter: const _FavouriteAdapter(),
  idName: 'id',
  propertyIds: {
    'hasNewChapters': 0,
    'image': 1,
    'mangaId': 2,
    'name': 3,
    'sourceId': 4
  },
  indexIds: {'mangaId_sourceId': 0},
  indexTypes: {
    'mangaId_sourceId': [
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

class _FavouriteAdapter extends IsarTypeAdapter<Favourite> {
  const _FavouriteAdapter();

  @override
  void serialize(IsarCollection<Favourite> collection, IsarRawObject rawObj,
      Favourite object, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.hasNewChapters;
    final _hasNewChapters = value0;
    final value1 = object.image;
    final _image = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _image.length;
    final value2 = object.mangaId;
    final _mangaId = BinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += _mangaId.length;
    final value3 = object.name;
    final _name = BinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += _name.length;
    final value4 = object.sourceId;
    final _sourceId = BinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += _sourceId.length;
    final size = dynamicSize + 35;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = bufAsBytes(rawObj.buffer, size);
    final writer = BinaryWriter(buffer, 35);
    writer.writeBool(offsets[0], _hasNewChapters);
    writer.writeBytes(offsets[1], _image);
    writer.writeBytes(offsets[2], _mangaId);
    writer.writeBytes(offsets[3], _name);
    writer.writeBytes(offsets[4], _sourceId);
  }

  @override
  Favourite deserialize(IsarCollection<Favourite> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = Favourite();
    object.hasNewChapters = reader.readBool(offsets[0]);
    object.id = id;
    object.image = reader.readString(offsets[1]);
    object.mangaId = reader.readString(offsets[2]);
    object.name = reader.readString(offsets[3]);
    object.sourceId = reader.readString(offsets[4]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, BinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readBool(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension FavouriteQueryWhereSort
    on QueryBuilder<Favourite, Favourite, QWhere> {
  QueryBuilder<Favourite, Favourite, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<Favourite, Favourite, QAfterWhere> anyMangaIdSourceId() {
    return addWhereClauseInternal(
        const WhereClause(indexName: 'mangaId_sourceId'));
  }
}

extension FavouriteQueryWhere
    on QueryBuilder<Favourite, Favourite, QWhereClause> {
  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idNotEqualTo(int? id) {
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

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idBetween(
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

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> mangaIdEqualTo(
      String mangaId) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'mangaId_sourceId',
      lower: [mangaId],
      includeLower: true,
      upper: [mangaId],
      includeUpper: true,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> mangaIdNotEqualTo(
      String mangaId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId',
        upper: [mangaId],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId',
        lower: [mangaId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId',
        lower: [mangaId],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId',
        upper: [mangaId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> mangaIdSourceIdEqualTo(
      String mangaId, String sourceId) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'mangaId_sourceId',
      lower: [mangaId, sourceId],
      includeLower: true,
      upper: [mangaId, sourceId],
      includeUpper: true,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause>
      mangaIdSourceIdNotEqualTo(String mangaId, String sourceId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId',
        upper: [mangaId, sourceId],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId',
        lower: [mangaId, sourceId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId',
        lower: [mangaId, sourceId],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'mangaId_sourceId',
        upper: [mangaId, sourceId],
        includeUpper: false,
      ));
    }
  }
}

extension FavouriteQueryFilter
    on QueryBuilder<Favourite, Favourite, QFilterCondition> {
  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      hasNewChaptersEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hasNewChapters',
      value: value,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> imageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> imageGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> imageLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> imageBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'image',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> imageContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'image',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaIdEqualTo(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaIdGreaterThan(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaIdLessThan(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaIdBetween(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaIdStartsWith(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaIdEndsWith(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'mangaId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'mangaId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> sourceIdEqualTo(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> sourceIdGreaterThan(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> sourceIdLessThan(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> sourceIdBetween(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> sourceIdStartsWith(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> sourceIdEndsWith(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> sourceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sourceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> sourceIdMatches(
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

extension FavouriteQueryWhereSortBy
    on QueryBuilder<Favourite, Favourite, QSortBy> {
  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByHasNewChapters() {
    return addSortByInternal('hasNewChapters', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByHasNewChaptersDesc() {
    return addSortByInternal('hasNewChapters', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByImage() {
    return addSortByInternal('image', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByImageDesc() {
    return addSortByInternal('image', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByMangaId() {
    return addSortByInternal('mangaId', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByMangaIdDesc() {
    return addSortByInternal('mangaId', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortBySourceId() {
    return addSortByInternal('sourceId', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortBySourceIdDesc() {
    return addSortByInternal('sourceId', Sort.desc);
  }
}

extension FavouriteQueryWhereSortThenBy
    on QueryBuilder<Favourite, Favourite, QSortThenBy> {
  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByHasNewChapters() {
    return addSortByInternal('hasNewChapters', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByHasNewChaptersDesc() {
    return addSortByInternal('hasNewChapters', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByImage() {
    return addSortByInternal('image', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByImageDesc() {
    return addSortByInternal('image', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByMangaId() {
    return addSortByInternal('mangaId', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByMangaIdDesc() {
    return addSortByInternal('mangaId', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenBySourceId() {
    return addSortByInternal('sourceId', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenBySourceIdDesc() {
    return addSortByInternal('sourceId', Sort.desc);
  }
}

extension FavouriteQueryWhereDistinct
    on QueryBuilder<Favourite, Favourite, QDistinct> {
  QueryBuilder<Favourite, Favourite, QDistinct> distinctByHasNewChapters() {
    return addDistinctByInternal('hasNewChapters');
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('image', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByMangaId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mangaId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctBySourceId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sourceId', caseSensitive: caseSensitive);
  }
}

extension FavouriteQueryProperty
    on QueryBuilder<Favourite, Favourite, QQueryProperty> {
  QueryBuilder<Favourite, bool, QQueryOperations> hasNewChaptersProperty() {
    return addPropertyNameInternal('hasNewChapters');
  }

  QueryBuilder<Favourite, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Favourite, String, QQueryOperations> imageProperty() {
    return addPropertyNameInternal('image');
  }

  QueryBuilder<Favourite, String, QQueryOperations> mangaIdProperty() {
    return addPropertyNameInternal('mangaId');
  }

  QueryBuilder<Favourite, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Favourite, String, QQueryOperations> sourceIdProperty() {
    return addPropertyNameInternal('sourceId');
  }
}
