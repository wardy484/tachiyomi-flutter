// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetSettingCollection on Isar {
  IsarCollection<Setting> get settings => getCollection();
}

const SettingSchema = CollectionSchema(
  name: 'Setting',
  schema:
      '{"name":"Setting","idName":"id","properties":[{"name":"lastUpdateCheck","type":"Long"},{"name":"padding","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'lastUpdateCheck': 0, 'padding': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _settingGetId,
  setId: _settingSetId,
  getLinks: _settingGetLinks,
  attachLinks: _settingAttachLinks,
  serializeNative: _settingSerializeNative,
  deserializeNative: _settingDeserializeNative,
  deserializePropNative: _settingDeserializePropNative,
  serializeWeb: _settingSerializeWeb,
  deserializeWeb: _settingDeserializeWeb,
  deserializePropWeb: _settingDeserializePropWeb,
  version: 3,
);

int? _settingGetId(Setting object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _settingSetId(Setting object, int id) {
  object.id = id;
}

List<IsarLinkBase> _settingGetLinks(Setting object) {
  return [];
}

void _settingSerializeNative(
    IsarCollection<Setting> collection,
    IsarRawObject rawObj,
    Setting object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.lastUpdateCheck;
  final _lastUpdateCheck = value0;
  final value1 = object.padding;
  final _padding = value1;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _lastUpdateCheck);
  writer.writeLong(offsets[1], _padding);
}

Setting _settingDeserializeNative(IsarCollection<Setting> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Setting();
  object.id = id;
  object.lastUpdateCheck = reader.readDateTime(offsets[0]);
  object.padding = reader.readLong(offsets[1]);
  return object;
}

P _settingDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
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

dynamic _settingSerializeWeb(
    IsarCollection<Setting> collection, Setting object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'lastUpdateCheck',
      object.lastUpdateCheck.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'padding', object.padding);
  return jsObj;
}

Setting _settingDeserializeWeb(
    IsarCollection<Setting> collection, dynamic jsObj) {
  final object = Setting();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.lastUpdateCheck =
      IsarNative.jsObjectGet(jsObj, 'lastUpdateCheck') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'lastUpdateCheck'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0);
  object.padding =
      IsarNative.jsObjectGet(jsObj, 'padding') ?? double.negativeInfinity;
  return object;
}

P _settingDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'lastUpdateCheck':
      return (IsarNative.jsObjectGet(jsObj, 'lastUpdateCheck') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'lastUpdateCheck'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'padding':
      return (IsarNative.jsObjectGet(jsObj, 'padding') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _settingAttachLinks(IsarCollection col, int id, Setting object) {}

extension SettingQueryWhereSort on QueryBuilder<Setting, Setting, QWhere> {
  QueryBuilder<Setting, Setting, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension SettingQueryWhere on QueryBuilder<Setting, Setting, QWhereClause> {
  QueryBuilder<Setting, Setting, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Setting, Setting, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idBetween(
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

extension SettingQueryFilter
    on QueryBuilder<Setting, Setting, QFilterCondition> {
  QueryBuilder<Setting, Setting, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idBetween(
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

extension SettingQueryLinks
    on QueryBuilder<Setting, Setting, QFilterCondition> {}

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
