// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_section.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTagSectionCollection on Isar {
  IsarCollection<TagSection> get tagSections => getCollection();
}

const TagSectionSchema = CollectionSchema(
  name: 'TagSection',
  schema:
      '{"name":"TagSection","idName":"id","properties":[{"name":"label","type":"String"},{"name":"tagSectionId","type":"String"}],"indexes":[],"links":[{"name":"tags","target":"Tag"}]}',
  idName: 'id',
  propertyIds: {'label': 0, 'tagSectionId': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'tags': 0},
  backlinkLinkNames: {},
  getId: _tagSectionGetId,
  setId: _tagSectionSetId,
  getLinks: _tagSectionGetLinks,
  attachLinks: _tagSectionAttachLinks,
  serializeNative: _tagSectionSerializeNative,
  deserializeNative: _tagSectionDeserializeNative,
  deserializePropNative: _tagSectionDeserializePropNative,
  serializeWeb: _tagSectionSerializeWeb,
  deserializeWeb: _tagSectionDeserializeWeb,
  deserializePropWeb: _tagSectionDeserializePropWeb,
  version: 3,
);

int? _tagSectionGetId(TagSection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _tagSectionSetId(TagSection object, int id) {
  object.id = id;
}

List<IsarLinkBase> _tagSectionGetLinks(TagSection object) {
  return [object.tags];
}

void _tagSectionSerializeNative(
    IsarCollection<TagSection> collection,
    IsarRawObject rawObj,
    TagSection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.label;
  final _label = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_label.length) as int;
  final value1 = object.tagSectionId;
  final _tagSectionId = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_tagSectionId.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _label);
  writer.writeBytes(offsets[1], _tagSectionId);
}

TagSection _tagSectionDeserializeNative(IsarCollection<TagSection> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = TagSection();
  object.id = id;
  object.label = reader.readString(offsets[0]);
  object.tagSectionId = reader.readString(offsets[1]);
  _tagSectionAttachLinks(collection, id, object);
  return object;
}

P _tagSectionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
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

dynamic _tagSectionSerializeWeb(
    IsarCollection<TagSection> collection, TagSection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'label', object.label);
  IsarNative.jsObjectSet(jsObj, 'tagSectionId', object.tagSectionId);
  return jsObj;
}

TagSection _tagSectionDeserializeWeb(
    IsarCollection<TagSection> collection, dynamic jsObj) {
  final object = TagSection();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.label = IsarNative.jsObjectGet(jsObj, 'label') ?? '';
  object.tagSectionId = IsarNative.jsObjectGet(jsObj, 'tagSectionId') ?? '';
  _tagSectionAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _tagSectionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'label':
      return (IsarNative.jsObjectGet(jsObj, 'label') ?? '') as P;
    case 'tagSectionId':
      return (IsarNative.jsObjectGet(jsObj, 'tagSectionId') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _tagSectionAttachLinks(IsarCollection col, int id, TagSection object) {
  object.tags.attach(col, col.isar.tags, 'tags', id);
}

extension TagSectionQueryWhereSort
    on QueryBuilder<TagSection, TagSection, QWhere> {
  QueryBuilder<TagSection, TagSection, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TagSectionQueryWhere
    on QueryBuilder<TagSection, TagSection, QWhereClause> {
  QueryBuilder<TagSection, TagSection, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<TagSection, TagSection, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<TagSection, TagSection, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<TagSection, TagSection, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
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
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> idGreaterThan(
    int value, {
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
    int value, {
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
    int lower,
    int upper, {
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

extension TagSectionQueryLinks
    on QueryBuilder<TagSection, TagSection, QFilterCondition> {
  QueryBuilder<TagSection, TagSection, QAfterFilterCondition> tags(
      FilterQuery<Tag> q) {
    return linkInternal(
      isar.tags,
      q,
      'tags',
    );
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
