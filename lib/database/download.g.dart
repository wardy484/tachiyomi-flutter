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
      '{"name":"Download","idName":"id","properties":[{"name":"chapterId","type":"String"},{"name":"chapterName","type":"String"},{"name":"createdAt","type":"Long"},{"name":"image","type":"String"},{"name":"mangaId","type":"String"},{"name":"mangaName","type":"String"},{"name":"status","type":"Long"},{"name":"updatedAt","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'chapterId': 0,
    'chapterName': 1,
    'createdAt': 2,
    'image': 3,
    'mangaId': 4,
    'mangaName': 5,
    'status': 6,
    'updatedAt': 7
  },
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

const _downloadDownloadStatusConverter = DownloadStatusConverter();

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
  final value1 = object.chapterName;
  final _chapterName = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_chapterName.length) as int;
  final value2 = object.createdAt;
  final _createdAt = value2;
  final value3 = object.image;
  final _image = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_image.length) as int;
  final value4 = object.mangaId;
  final _mangaId = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_mangaId.length) as int;
  final value5 = object.mangaName;
  final _mangaName = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_mangaName.length) as int;
  final value6 = _downloadDownloadStatusConverter.toIsar(object.status);
  final _status = value6;
  final value7 = object.updatedAt;
  final _updatedAt = value7;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _chapterId);
  writer.writeBytes(offsets[1], _chapterName);
  writer.writeDateTime(offsets[2], _createdAt);
  writer.writeBytes(offsets[3], _image);
  writer.writeBytes(offsets[4], _mangaId);
  writer.writeBytes(offsets[5], _mangaName);
  writer.writeLong(offsets[6], _status);
  writer.writeDateTime(offsets[7], _updatedAt);
}

Download _downloadDeserializeNative(IsarCollection<Download> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Download();
  object.chapterId = reader.readString(offsets[0]);
  object.chapterName = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.id = id;
  object.image = reader.readString(offsets[3]);
  object.mangaId = reader.readString(offsets[4]);
  object.mangaName = reader.readString(offsets[5]);
  object.status =
      _downloadDownloadStatusConverter.fromIsar(reader.readLong(offsets[6]));
  object.updatedAt = reader.readDateTime(offsets[7]);
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_downloadDownloadStatusConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _downloadSerializeWeb(
    IsarCollection<Download> collection, Download object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'chapterId', object.chapterId);
  IsarNative.jsObjectSet(jsObj, 'chapterName', object.chapterName);
  IsarNative.jsObjectSet(
      jsObj, 'createdAt', object.createdAt.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'image', object.image);
  IsarNative.jsObjectSet(jsObj, 'mangaId', object.mangaId);
  IsarNative.jsObjectSet(jsObj, 'mangaName', object.mangaName);
  IsarNative.jsObjectSet(
      jsObj, 'status', _downloadDownloadStatusConverter.toIsar(object.status));
  IsarNative.jsObjectSet(
      jsObj, 'updatedAt', object.updatedAt.toUtc().millisecondsSinceEpoch);
  return jsObj;
}

Download _downloadDeserializeWeb(
    IsarCollection<Download> collection, dynamic jsObj) {
  final object = Download();
  object.chapterId = IsarNative.jsObjectGet(jsObj, 'chapterId') ?? '';
  object.chapterName = IsarNative.jsObjectGet(jsObj, 'chapterName') ?? '';
  object.createdAt = IsarNative.jsObjectGet(jsObj, 'createdAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'createdAt'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.image = IsarNative.jsObjectGet(jsObj, 'image') ?? '';
  object.mangaId = IsarNative.jsObjectGet(jsObj, 'mangaId') ?? '';
  object.mangaName = IsarNative.jsObjectGet(jsObj, 'mangaName') ?? '';
  object.status = _downloadDownloadStatusConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'status') ?? double.negativeInfinity);
  object.updatedAt = IsarNative.jsObjectGet(jsObj, 'updatedAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'updatedAt'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  return object;
}

P _downloadDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'chapterId':
      return (IsarNative.jsObjectGet(jsObj, 'chapterId') ?? '') as P;
    case 'chapterName':
      return (IsarNative.jsObjectGet(jsObj, 'chapterName') ?? '') as P;
    case 'createdAt':
      return (IsarNative.jsObjectGet(jsObj, 'createdAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createdAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'image':
      return (IsarNative.jsObjectGet(jsObj, 'image') ?? '') as P;
    case 'mangaId':
      return (IsarNative.jsObjectGet(jsObj, 'mangaId') ?? '') as P;
    case 'mangaName':
      return (IsarNative.jsObjectGet(jsObj, 'mangaName') ?? '') as P;
    case 'status':
      return (_downloadDownloadStatusConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'status') ??
              double.negativeInfinity)) as P;
    case 'updatedAt':
      return (IsarNative.jsObjectGet(jsObj, 'updatedAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'updatedAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
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

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'chapterName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition>
      chapterNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'chapterName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'chapterName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'chapterName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'chapterName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'chapterName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'chapterName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> chapterNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'chapterName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
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

  QueryBuilder<Download, Download, QAfterFilterCondition> imageEqualTo(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> imageGreaterThan(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> imageLessThan(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> imageBetween(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> imageStartsWith(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> imageEndsWith(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> imageContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'image',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaIdEqualTo(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaIdGreaterThan(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaIdLessThan(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaIdBetween(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaIdStartsWith(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaIdEndsWith(
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

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'mangaId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> mangaIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'mangaId',
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

  QueryBuilder<Download, Download, QAfterFilterCondition> statusEqualTo(
      DownloadStatus value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'status',
      value: _downloadDownloadStatusConverter.toIsar(value),
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> statusGreaterThan(
    DownloadStatus value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'status',
      value: _downloadDownloadStatusConverter.toIsar(value),
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> statusLessThan(
    DownloadStatus value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'status',
      value: _downloadDownloadStatusConverter.toIsar(value),
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> statusBetween(
    DownloadStatus lower,
    DownloadStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'status',
      lower: _downloadDownloadStatusConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _downloadDownloadStatusConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updatedAt',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'updatedAt',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'updatedAt',
      value: value,
    ));
  }

  QueryBuilder<Download, Download, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'updatedAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
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

  QueryBuilder<Download, Download, QAfterSortBy> sortByChapterName() {
    return addSortByInternal('chapterName', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByChapterNameDesc() {
    return addSortByInternal('chapterName', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByImage() {
    return addSortByInternal('image', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByImageDesc() {
    return addSortByInternal('image', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByMangaId() {
    return addSortByInternal('mangaId', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByMangaIdDesc() {
    return addSortByInternal('mangaId', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByMangaName() {
    return addSortByInternal('mangaName', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByMangaNameDesc() {
    return addSortByInternal('mangaName', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByUpdatedAt() {
    return addSortByInternal('updatedAt', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> sortByUpdatedAtDesc() {
    return addSortByInternal('updatedAt', Sort.desc);
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

  QueryBuilder<Download, Download, QAfterSortBy> thenByChapterName() {
    return addSortByInternal('chapterName', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByChapterNameDesc() {
    return addSortByInternal('chapterName', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByImage() {
    return addSortByInternal('image', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByImageDesc() {
    return addSortByInternal('image', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByMangaId() {
    return addSortByInternal('mangaId', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByMangaIdDesc() {
    return addSortByInternal('mangaId', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByMangaName() {
    return addSortByInternal('mangaName', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByMangaNameDesc() {
    return addSortByInternal('mangaName', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByUpdatedAt() {
    return addSortByInternal('updatedAt', Sort.asc);
  }

  QueryBuilder<Download, Download, QAfterSortBy> thenByUpdatedAtDesc() {
    return addSortByInternal('updatedAt', Sort.desc);
  }
}

extension DownloadQueryWhereDistinct
    on QueryBuilder<Download, Download, QDistinct> {
  QueryBuilder<Download, Download, QDistinct> distinctByChapterId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('chapterId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Download, Download, QDistinct> distinctByChapterName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('chapterName', caseSensitive: caseSensitive);
  }

  QueryBuilder<Download, Download, QDistinct> distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<Download, Download, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Download, Download, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('image', caseSensitive: caseSensitive);
  }

  QueryBuilder<Download, Download, QDistinct> distinctByMangaId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mangaId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Download, Download, QDistinct> distinctByMangaName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mangaName', caseSensitive: caseSensitive);
  }

  QueryBuilder<Download, Download, QDistinct> distinctByStatus() {
    return addDistinctByInternal('status');
  }

  QueryBuilder<Download, Download, QDistinct> distinctByUpdatedAt() {
    return addDistinctByInternal('updatedAt');
  }
}

extension DownloadQueryProperty
    on QueryBuilder<Download, Download, QQueryProperty> {
  QueryBuilder<Download, String, QQueryOperations> chapterIdProperty() {
    return addPropertyNameInternal('chapterId');
  }

  QueryBuilder<Download, String, QQueryOperations> chapterNameProperty() {
    return addPropertyNameInternal('chapterName');
  }

  QueryBuilder<Download, DateTime, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<Download, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Download, String, QQueryOperations> imageProperty() {
    return addPropertyNameInternal('image');
  }

  QueryBuilder<Download, String, QQueryOperations> mangaIdProperty() {
    return addPropertyNameInternal('mangaId');
  }

  QueryBuilder<Download, String, QQueryOperations> mangaNameProperty() {
    return addPropertyNameInternal('mangaName');
  }

  QueryBuilder<Download, DownloadStatus, QQueryOperations> statusProperty() {
    return addPropertyNameInternal('status');
  }

  QueryBuilder<Download, DateTime, QQueryOperations> updatedAtProperty() {
    return addPropertyNameInternal('updatedAt');
  }
}
