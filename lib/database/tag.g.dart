// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member

extension GetTagCollection on Isar {
  IsarCollection<Tag> get tags {
    return getCollection('Tag');
  }
}

final TagSchema = CollectionSchema(
  name: 'Tag',
  schema:
      '{"name":"Tag","properties":[{"name":"label","type":"String"},{"name":"tagId","type":"String"}],"indexes":[],"links":[]}',
  adapter: const _TagAdapter(),
  idName: 'id',
  propertyIds: {'label': 0, 'tagId': 1},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) => obj.id,
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 1,
);

class _TagAdapter extends IsarTypeAdapter<Tag> {
  const _TagAdapter();

  @override
  void serialize(IsarCollection<Tag> collection, IsarRawObject rawObj,
      Tag object, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.label;
    final _label = BinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += _label.length;
    final value1 = object.tagId;
    final _tagId = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _tagId.length;
    final size = dynamicSize + 18;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = bufAsBytes(rawObj.buffer, size);
    final writer = BinaryWriter(buffer, 18);
    writer.writeBytes(offsets[0], _label);
    writer.writeBytes(offsets[1], _tagId);
  }

  @override
  Tag deserialize(IsarCollection<Tag> collection, int id, BinaryReader reader,
      List<int> offsets) {
    final object = Tag();
    object.id = id;
    object.label = reader.readString(offsets[0]);
    object.tagId = reader.readString(offsets[1]);
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
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension TagQueryWhereSort on QueryBuilder<Tag, Tag, QWhere> {
  QueryBuilder<Tag, Tag, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension TagQueryWhere on QueryBuilder<Tag, Tag, QWhereClause> {
  QueryBuilder<Tag, Tag, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idNotEqualTo(int? id) {
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

  QueryBuilder<Tag, Tag, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idBetween(
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
}

extension TagQueryFilter on QueryBuilder<Tag, Tag, QFilterCondition> {
  QueryBuilder<Tag, Tag, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Tag, Tag, QAfterFilterCondition> labelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> labelGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> labelLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> labelBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'label',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> labelContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> labelMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'label',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tagId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tagId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tagId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tagId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'tagId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'tagId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagIdContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'tagId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'tagId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TagQueryWhereSortBy on QueryBuilder<Tag, Tag, QSortBy> {
  QueryBuilder<Tag, Tag, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByLabel() {
    return addSortByInternal('label', Sort.asc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByLabelDesc() {
    return addSortByInternal('label', Sort.desc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByTagId() {
    return addSortByInternal('tagId', Sort.asc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByTagIdDesc() {
    return addSortByInternal('tagId', Sort.desc);
  }
}

extension TagQueryWhereSortThenBy on QueryBuilder<Tag, Tag, QSortThenBy> {
  QueryBuilder<Tag, Tag, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByLabel() {
    return addSortByInternal('label', Sort.asc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByLabelDesc() {
    return addSortByInternal('label', Sort.desc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByTagId() {
    return addSortByInternal('tagId', Sort.asc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByTagIdDesc() {
    return addSortByInternal('tagId', Sort.desc);
  }
}

extension TagQueryWhereDistinct on QueryBuilder<Tag, Tag, QDistinct> {
  QueryBuilder<Tag, Tag, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Tag, Tag, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('label', caseSensitive: caseSensitive);
  }

  QueryBuilder<Tag, Tag, QDistinct> distinctByTagId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('tagId', caseSensitive: caseSensitive);
  }
}

extension TagQueryProperty on QueryBuilder<Tag, Tag, QQueryProperty> {
  QueryBuilder<Tag, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Tag, String, QQueryOperations> labelProperty() {
    return addPropertyNameInternal('label');
  }

  QueryBuilder<Tag, String, QQueryOperations> tagIdProperty() {
    return addPropertyNameInternal('tagId');
  }
}
