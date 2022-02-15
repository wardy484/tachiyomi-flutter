// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member

extension GetSettingCollection on Isar {
  IsarCollection<Setting> get settings {
    return getCollection('Setting');
  }
}

final SettingSchema = CollectionSchema(
  name: 'Setting',
  schema:
      '{"name":"Setting","properties":[{"name":"lastUpdateCheck","type":"Long"},{"name":"padding","type":"Long"}],"indexes":[],"links":[]}',
  adapter: const _SettingAdapter(),
  idName: 'id',
  propertyIds: {'lastUpdateCheck': 0, 'padding': 1},
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

class _SettingAdapter extends IsarTypeAdapter<Setting> {
  const _SettingAdapter();

  @override
  void serialize(IsarCollection<Setting> collection, IsarRawObject rawObj,
      Setting object, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.lastUpdateCheck;
    final _lastUpdateCheck = value0;
    final value1 = object.padding;
    final _padding = value1;
    final size = dynamicSize + 18;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = bufAsBytes(rawObj.buffer, size);
    final writer = BinaryWriter(buffer, 18);
    writer.writeDateTime(offsets[0], _lastUpdateCheck);
    writer.writeLong(offsets[1], _padding);
  }

  @override
  Setting deserialize(IsarCollection<Setting> collection, int id,
      BinaryReader reader, List<int> offsets) {
    final object = Setting();
    object.id = id;
    object.lastUpdateCheck = reader.readDateTime(offsets[0]);
    object.padding = reader.readLong(offsets[1]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, BinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readDateTime(offset)) as P;
      case 1:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension SettingQueryWhereSort on QueryBuilder<Setting, Setting, QWhere> {
  QueryBuilder<Setting, Setting, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension SettingQueryWhere on QueryBuilder<Setting, Setting, QWhereClause> {
  QueryBuilder<Setting, Setting, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idNotEqualTo(int? id) {
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

  QueryBuilder<Setting, Setting, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idBetween(
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

extension SettingQueryFilter
    on QueryBuilder<Setting, Setting, QFilterCondition> {
  QueryBuilder<Setting, Setting, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> lastUpdateCheckEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lastUpdateCheck',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition>
      lastUpdateCheckGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lastUpdateCheck',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> lastUpdateCheckLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lastUpdateCheck',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> lastUpdateCheckBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lastUpdateCheck',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> paddingEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'padding',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> paddingGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'padding',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> paddingLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'padding',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> paddingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'padding',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension SettingQueryWhereSortBy on QueryBuilder<Setting, Setting, QSortBy> {
  QueryBuilder<Setting, Setting, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByLastUpdateCheck() {
    return addSortByInternal('lastUpdateCheck', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByLastUpdateCheckDesc() {
    return addSortByInternal('lastUpdateCheck', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByPadding() {
    return addSortByInternal('padding', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByPaddingDesc() {
    return addSortByInternal('padding', Sort.desc);
  }
}

extension SettingQueryWhereSortThenBy
    on QueryBuilder<Setting, Setting, QSortThenBy> {
  QueryBuilder<Setting, Setting, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByLastUpdateCheck() {
    return addSortByInternal('lastUpdateCheck', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByLastUpdateCheckDesc() {
    return addSortByInternal('lastUpdateCheck', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByPadding() {
    return addSortByInternal('padding', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByPaddingDesc() {
    return addSortByInternal('padding', Sort.desc);
  }
}

extension SettingQueryWhereDistinct
    on QueryBuilder<Setting, Setting, QDistinct> {
  QueryBuilder<Setting, Setting, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByLastUpdateCheck() {
    return addDistinctByInternal('lastUpdateCheck');
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByPadding() {
    return addDistinctByInternal('padding');
  }
}

extension SettingQueryProperty
    on QueryBuilder<Setting, Setting, QQueryProperty> {
  QueryBuilder<Setting, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Setting, DateTime, QQueryOperations> lastUpdateCheckProperty() {
    return addPropertyNameInternal('lastUpdateCheck');
  }

  QueryBuilder<Setting, int, QQueryOperations> paddingProperty() {
    return addPropertyNameInternal('padding');
  }
}
