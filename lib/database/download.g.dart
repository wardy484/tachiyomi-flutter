// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDownloadCollection on Isar {
  IsarCollection<Download> get downloads => getCollection();
}

const DownloadSchema = CollectionSchema(
  name: 'Download',
  schema:
      '{"name":"Download","idName":"id","properties":[{"name":"chapterId","type":"String"},{"name":"mangaImageUrl","type":"String"},{"name":"mangaName","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'chapterId': 0, 'mangaImageUrl': 1, 'mangaName': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _downloadGetId,
  setId: _downloadSetId,
  getLinks: _downloadGetLinks,
  attachLinks: _downloadAttachLinks,
  serializeNative: _downloadSerializeNative,
  deserializeNative: _downloadDeserializeNative,
  deserializePropNative: _downloadDeserializePropNative,
  serializeWeb: _downloadSerializeWeb,
  deserializeWeb: _downloadDeserializeWeb,
  deserializePropWeb: _downloadDeserializePropWeb,
  version: 3,
);

int? _downloadGetId(Download object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _downloadSetId(Download object, int id) {
  object.id = id;
}

List<IsarLinkBase> _downloadGetLinks(Download object) {
  return [];
}

void _downloadSerializeNative(
    IsarCollection<Download> collection,
    IsarRawObject rawObj,
    Download object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.chapterId;
  final _chapterId = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_chapterId.length) as int;
  final value1 = object.mangaImageUrl;
  final _mangaImageUrl = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_mangaImageUrl.length) as int;
  final value2 = object.mangaName;
  final _mangaName = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_mangaName.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _chapterId);
  writer.writeBytes(offsets[1], _mangaImageUrl);
  writer.writeBytes(offsets[2], _mangaName);
}

Download _downloadDeserializeNative(IsarCollection<Download> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Download();
  object.chapterId = reader.readString(offsets[0]);
  object.id = id;
  object.mangaImageUrl = reader.readString(offsets[1]);
  object.mangaName = reader.readString(offsets[2]);
  return object;
}

P _downloadDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
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

dynamic _downloadSerializeWeb(
    IsarCollection<Download> collection, Download object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'chapterId', object.chapterId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'mangaImageUrl', object.mangaImageUrl);
  IsarNative.jsObjectSet(jsObj, 'mangaName', object.mangaName);
  return jsObj;
}

Download _downloadDeserializeWeb(
    IsarCollection<Download> collection, dynamic jsObj) {
  final object = Download();
  object.chapterId = IsarNative.jsObjectGet(jsObj, 'chapterId') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.mangaImageUrl = IsarNative.jsObjectGet(jsObj, 'mangaImageUrl') ?? '';
  object.mangaName = IsarNative.jsObjectGet(jsObj, 'mangaName') ?? '';
  return object;
}

P _downloadDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'chapterId':
      return (IsarNative.jsObjectGet(jsObj, 'chapterId') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'mangaImageUrl':
      return (IsarNative.jsObjectGet(jsObj, 'mangaImageUrl') ?? '') as P;
    case 'mangaName':
      return (IsarNative.jsObjectGet(jsObj, 'mangaName') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _downloadAttachLinks(IsarCollection col, int id, Download object) {}

extension DownloadQueryWhereSort on QueryBuilder<Download, Download, QWhere> {
  QueryBuilder<Download, Download, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DownloadQueryWhere on QueryBuilder<Download, Download, QWhereClause> {
  QueryBuilder<Download, Download, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Download, Download, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Download, Download, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Download, Download, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Download, Download, QAfterWhereClause> idBetween(
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

extension DownloadQueryFilter
    on QueryBuilder<Download, Download, QFilterCondition> {
  QueryBuilder<Download, Download, QAfterFilterCondition> chapterIdEqualTo(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterIdGreaterThan(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterIdLessThan(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterIdBetween(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterIdStartsWith(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterIdEndsWith(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'chapterId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'chapterId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaImageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'mangaImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition>
      mangaImageUrlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'mangaImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaImageUrlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'mangaImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaImageUrlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'mangaImageUrl',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition>
      mangaImageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'mangaImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaImageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'mangaImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaImageUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'mangaImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaImageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'mangaImageUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'mangaName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'mangaName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'mangaName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'mangaName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'mangaName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'mangaName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'mangaName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'mangaName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DownloadQueryLinks
    on QueryBuilder<Download, Download, QFilterCondition> {}

extension DownloadQueryWhereSortBy
    on QueryBuilder<Download, Download, QSortBy> {
  QueryBuilder<Download, Download, QAfterSortBy> sortByChapterId() {
    return addSortByInternal('chapterId', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByChapterIdDesc() {
    return addSortByInternal('chapterId', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByMangaImageUrl() {
    return addSortByInternal('mangaImageUrl', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByMangaImageUrlDesc() {
    return addSortByInternal('mangaImageUrl', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByMangaName() {
    return addSortByInternal('mangaName', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByMangaNameDesc() {
    return addSortByInternal('mangaName', Sort.desc);
  }
}

extension DownloadQueryWhereSortThenBy
    on QueryBuilder<Download, Download, QSortThenBy> {
  QueryBuilder<Download, Download, QAfterSortBy> thenByChapterId() {
    return addSortByInternal('chapterId', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByChapterIdDesc() {
    return addSortByInternal('chapterId', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByMangaImageUrl() {
    return addSortByInternal('mangaImageUrl', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByMangaImageUrlDesc() {
    return addSortByInternal('mangaImageUrl', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByMangaName() {
    return addSortByInternal('mangaName', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByMangaNameDesc() {
    return addSortByInternal('mangaName', Sort.desc);
  }
}

extension DownloadQueryWhereDistinct
    on QueryBuilder<Download, Download, QDistinct> {
  QueryBuilder<Download, Download, QDistinct> distinctByChapterId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('chapterId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Download, Download, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Download, Download, QDistinct> distinctByMangaImageUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mangaImageUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<Download, Download, QDistinct> distinctByMangaName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mangaName', caseSensitive: caseSensitive);
  }
}

extension DownloadQueryProperty
    on QueryBuilder<Download, Download, QQueryProperty> {
  QueryBuilder<Download, String, QQueryOperations> chapterIdProperty() {
    return addPropertyNameInternal('chapterId');
  }

  QueryBuilder<Download, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Download, String, QQueryOperations> mangaImageUrlProperty() {
    return addPropertyNameInternal('mangaImageUrl');
  }

  QueryBuilder<Download, String, QQueryOperations> mangaNameProperty() {
    return addPropertyNameInternal('mangaName');
  }
}
