// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_section.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member

extension GetTagSectionCollection on Isar {
  IsarCollection<TagSection> get tagSections {
    return getCollection('TagSection');
  }
}

final TagSectionSchema = CollectionSchema(
  name: 'TagSection',
  schema:
      '{"name":"TagSection","properties":[{"name":"label","type":"String"},{"name":"tagSectionId","type":"String"}],"indexes":[],"links":[{"name":"tags","target":"Tag"}]}',
  adapter: const _TagSectionAdapter(),
  idName: 'id',
  propertyIds: {'label': 0, 'tagSectionId': 1},
  indexIds: {},
  indexTypes: {},
  linkIds: {'tags': 0},
  backlinkIds: {},
  linkedCollections: ['Tag'],
  getId: (obj) => obj.id,
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [obj.tags],
  version: 1,
);

class _TagSectionAdapter extends IsarTypeAdapter<TagSection> {
  const _TagSectionAdapter();

  @override
  void serialize(IsarCollection<TagSection> collection, IsarRawObject rawObj,
      TagSection object, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.label;
    final _label = BinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += _label.length;
    final value1 = object.tagSectionId;
    final _tagSectionId = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _tagSectionId.length;
    final size = dynamicSize + 18;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = bufAsBytes(rawObj.buffer, size);
    final writer = BinaryWriter(buffer, 18);
    writer.writeBytes(offsets[0], _label);
    writer.writeBytes(offsets[1], _tagSectionId);
    attachLinks(collection.isar, object);
  }

  @override
  TagSection deserialize(IsarCollection<TagSection> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = TagSection();
    object.id = id;
    object.label = reader.readString(offsets[0]);
    object.tagSectionId = reader.readString(offsets[1]);
    attachLinks(collection.isar, object);
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

  void attachLinks(Isar isar, TagSection object) {
    object.tags.attach(
      isar.tagSections,
      isar.getCollection<Tag>("Tag"),
      object,
      "tags",
      false,
    );
  }
}

extension TagSectionQueryWhereSort
    on QueryBuilder<TagSection, TagSection, QWhere> {
  QueryBuilder<TagSection, TagSection, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension TagSectionQueryWhere
    on QueryBuilder<TagSection, TagSection, QWhereClause> {
  QueryBuilder<TagSection, TagSection, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<TagSection, TagSection, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterWhereClause> idBetween(
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

extension TagSectionQueryFilter
    on QueryBuilder<TagSection, TagSection, QFilterCondition> {
  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> labelEqualTo(
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

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> labelGreaterThan(
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

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> labelLessThan(
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

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> labelBetween(
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

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> labelStartsWith(
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

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> labelEndsWith(
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

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'label',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition>
      tagSectionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tagSectionId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition>
      tagSectionIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tagSectionId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition>
      tagSectionIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tagSectionId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition>
      tagSectionIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tagSectionId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition>
      tagSectionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'tagSectionId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition>
      tagSectionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'tagSectionId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition>
      tagSectionIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'tagSectionId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition>
      tagSectionIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'tagSectionId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TagSectionQueryWhereSortBy
    on QueryBuilder<TagSection, TagSection, QSortBy> {
  QueryBuilder<TagSection, TagSection, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TagSection, TagSection, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TagSection, TagSection, QAfterSortBy> sortByLabel() {
    return addSortByInternal('label', Sort.asc);
  }

  QueryBuilder<TagSection, TagSection, QAfterSortBy> sortByLabelDesc() {
    return addSortByInternal('label', Sort.desc);
  }

  QueryBuilder<TagSection, TagSection, QAfterSortBy> sortByTagSectionId() {
    return addSortByInternal('tagSectionId', Sort.asc);
  }

  QueryBuilder<TagSection, TagSection, QAfterSortBy> sortByTagSectionIdDesc() {
    return addSortByInternal('tagSectionId', Sort.desc);
  }
}

extension TagSectionQueryWhereSortThenBy
    on QueryBuilder<TagSection, TagSection, QSortThenBy> {
  QueryBuilder<TagSection, TagSection, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<TagSection, TagSection, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<TagSection, TagSection, QAfterSortBy> thenByLabel() {
    return addSortByInternal('label', Sort.asc);
  }

  QueryBuilder<TagSection, TagSection, QAfterSortBy> thenByLabelDesc() {
    return addSortByInternal('label', Sort.desc);
  }

  QueryBuilder<TagSection, TagSection, QAfterSortBy> thenByTagSectionId() {
    return addSortByInternal('tagSectionId', Sort.asc);
  }

  QueryBuilder<TagSection, TagSection, QAfterSortBy> thenByTagSectionIdDesc() {
    return addSortByInternal('tagSectionId', Sort.desc);
  }
}

extension TagSectionQueryWhereDistinct
    on QueryBuilder<TagSection, TagSection, QDistinct> {
  QueryBuilder<TagSection, TagSection, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<TagSection, TagSection, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('label', caseSensitive: caseSensitive);
  }

  QueryBuilder<TagSection, TagSection, QDistinct> distinctByTagSectionId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('tagSectionId', caseSensitive: caseSensitive);
  }
}

extension TagSectionQueryProperty
    on QueryBuilder<TagSection, TagSection, QQueryProperty> {
  QueryBuilder<TagSection, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<TagSection, String, QQueryOperations> labelProperty() {
    return addPropertyNameInternal('label');
  }

  QueryBuilder<TagSection, String, QQueryOperations> tagSectionIdProperty() {
    return addPropertyNameInternal('tagSectionId');
  }
}
