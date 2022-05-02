// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetChapterCollection on Isar {
  IsarCollection<Chapter> get chapters => getCollection();
}

const ChapterSchema = CollectionSchema(
  name: 'Chapter',
  schema:
      '{"name":"Chapter","idName":"id","properties":[{"name":"chapterId","type":"String"},{"name":"chapterNo","type":"Double"},{"name":"group","type":"String"},{"name":"langCode","type":"String"},{"name":"mangaId","type":"String"},{"name":"name","type":"String"},{"name":"page","type":"Long"},{"name":"read","type":"Bool"},{"name":"sourceId","type":"String"},{"name":"time","type":"String"},{"name":"volume","type":"String"}],"indexes":[{"name":"chapterId_sourceId_mangaId","unique":false,"properties":[{"name":"chapterId","type":"Hash","caseSensitive":true},{"name":"sourceId","type":"Hash","caseSensitive":true},{"name":"mangaId","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'chapterId': 0,
    'chapterNo': 1,
    'group': 2,
    'langCode': 3,
    'mangaId': 4,
    'name': 5,
    'page': 6,
    'read': 7,
    'sourceId': 8,
    'time': 9,
    'volume': 10
  },
  listProperties: {},
  indexIds: {'chapterId_sourceId_mangaId': 0},
  indexValueTypes: {
    'chapterId_sourceId_mangaId': [
      IndexValueType.stringHash,
      IndexValueType.stringHash,
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _chapterGetId,
  setId: _chapterSetId,
  getLinks: _chapterGetLinks,
  attachLinks: _chapterAttachLinks,
  serializeNative: _chapterSerializeNative,
  deserializeNative: _chapterDeserializeNative,
  deserializePropNative: _chapterDeserializePropNative,
  serializeWeb: _chapterSerializeWeb,
  deserializeWeb: _chapterDeserializeWeb,
  deserializePropWeb: _chapterDeserializePropWeb,
  version: 3,
);

int? _chapterGetId(Chapter object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _chapterSetId(Chapter object, int id) {
  object.id = id;
}

List<IsarLinkBase> _chapterGetLinks(Chapter object) {
  return [];
}

void _chapterSerializeNative(
    IsarCollection<Chapter> collection,
    IsarRawObject rawObj,
    Chapter object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.chapterId;
  final _chapterId = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_chapterId.length) as int;
  final value1 = object.chapterNo;
  final _chapterNo = value1;
  final value2 = object.group;
  IsarUint8List? _group;
  if (value2 != null) {
    _group = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_group?.length ?? 0) as int;
  final value3 = object.langCode;
  final _langCode = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_langCode.length) as int;
  final value4 = object.mangaId;
  final _mangaId = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_mangaId.length) as int;
  final value5 = object.name;
  IsarUint8List? _name;
  if (value5 != null) {
    _name = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_name?.length ?? 0) as int;
  final value6 = object.page;
  final _page = value6;
  final value7 = object.read;
  final _read = value7;
  final value8 = object.sourceId;
  final _sourceId = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_sourceId.length) as int;
  final value9 = object.time;
  IsarUint8List? _time;
  if (value9 != null) {
    _time = IsarBinaryWriter.utf8Encoder.convert(value9);
  }
  dynamicSize += (_time?.length ?? 0) as int;
  final value10 = object.volume;
  IsarUint8List? _volume;
  if (value10 != null) {
    _volume = IsarBinaryWriter.utf8Encoder.convert(value10);
  }
  dynamicSize += (_volume?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _chapterId);
  writer.writeDouble(offsets[1], _chapterNo);
  writer.writeBytes(offsets[2], _group);
  writer.writeBytes(offsets[3], _langCode);
  writer.writeBytes(offsets[4], _mangaId);
  writer.writeBytes(offsets[5], _name);
  writer.writeLong(offsets[6], _page);
  writer.writeBool(offsets[7], _read);
  writer.writeBytes(offsets[8], _sourceId);
  writer.writeBytes(offsets[9], _time);
  writer.writeBytes(offsets[10], _volume);
}

Chapter _chapterDeserializeNative(IsarCollection<Chapter> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Chapter();
  object.chapterId = reader.readString(offsets[0]);
  object.chapterNo = reader.readDouble(offsets[1]);
  object.group = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.langCode = reader.readString(offsets[3]);
  object.mangaId = reader.readString(offsets[4]);
  object.name = reader.readStringOrNull(offsets[5]);
  object.page = reader.readLongOrNull(offsets[6]);
  object.read = reader.readBool(offsets[7]);
  object.sourceId = reader.readString(offsets[8]);
  object.time = reader.readStringOrNull(offsets[9]);
  object.volume = reader.readStringOrNull(offsets[10]);
  return object;
}

P _chapterDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _chapterSerializeWeb(
    IsarCollection<Chapter> collection, Chapter object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'chapterId', object.chapterId);
  IsarNative.jsObjectSet(jsObj, 'chapterNo', object.chapterNo);
  IsarNative.jsObjectSet(jsObj, 'group', object.group);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'langCode', object.langCode);
  IsarNative.jsObjectSet(jsObj, 'mangaId', object.mangaId);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'page', object.page);
  IsarNative.jsObjectSet(jsObj, 'read', object.read);
  IsarNative.jsObjectSet(jsObj, 'sourceId', object.sourceId);
  IsarNative.jsObjectSet(jsObj, 'time', object.time);
  IsarNative.jsObjectSet(jsObj, 'volume', object.volume);
  return jsObj;
}

Chapter _chapterDeserializeWeb(
    IsarCollection<Chapter> collection, dynamic jsObj) {
  final object = Chapter();
  object.chapterId = IsarNative.jsObjectGet(jsObj, 'chapterId') ?? '';
  object.chapterNo =
      IsarNative.jsObjectGet(jsObj, 'chapterNo') ?? double.negativeInfinity;
  object.group = IsarNative.jsObjectGet(jsObj, 'group');
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.langCode = IsarNative.jsObjectGet(jsObj, 'langCode') ?? '';
  object.mangaId = IsarNative.jsObjectGet(jsObj, 'mangaId') ?? '';
  object.name = IsarNative.jsObjectGet(jsObj, 'name');
  object.page = IsarNative.jsObjectGet(jsObj, 'page');
  object.read = IsarNative.jsObjectGet(jsObj, 'read') ?? false;
  object.sourceId = IsarNative.jsObjectGet(jsObj, 'sourceId') ?? '';
  object.time = IsarNative.jsObjectGet(jsObj, 'time');
  object.volume = IsarNative.jsObjectGet(jsObj, 'volume');
  return object;
}

P _chapterDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'chapterId':
      return (IsarNative.jsObjectGet(jsObj, 'chapterId') ?? '') as P;
    case 'chapterNo':
      return (IsarNative.jsObjectGet(jsObj, 'chapterNo') ??
          double.negativeInfinity) as P;
    case 'group':
      return (IsarNative.jsObjectGet(jsObj, 'group')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'langCode':
      return (IsarNative.jsObjectGet(jsObj, 'langCode') ?? '') as P;
    case 'mangaId':
      return (IsarNative.jsObjectGet(jsObj, 'mangaId') ?? '') as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name')) as P;
    case 'page':
      return (IsarNative.jsObjectGet(jsObj, 'page')) as P;
    case 'read':
      return (IsarNative.jsObjectGet(jsObj, 'read') ?? false) as P;
    case 'sourceId':
      return (IsarNative.jsObjectGet(jsObj, 'sourceId') ?? '') as P;
    case 'time':
      return (IsarNative.jsObjectGet(jsObj, 'time')) as P;
    case 'volume':
      return (IsarNative.jsObjectGet(jsObj, 'volume')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _chapterAttachLinks(IsarCollection col, int id, Chapter object) {}

extension ChapterQueryWhereSort on QueryBuilder<Chapter, Chapter, QWhere> {
  QueryBuilder<Chapter, Chapter, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Chapter, Chapter, QAfterWhere> anyChapterIdSourceIdMangaId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'chapterId_sourceId_mangaId'));
  }
}

extension ChapterQueryWhere on QueryBuilder<Chapter, Chapter, QWhereClause> {
  QueryBuilder<Chapter, Chapter, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Chapter, Chapter, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Chapter, Chapter, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Chapter, Chapter, QAfterWhereClause> idBetween(
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

  QueryBuilder<Chapter, Chapter, QAfterWhereClause> chapterIdEqualTo(
      String chapterId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'chapterId_sourceId_mangaId',
      value: [chapterId],
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterWhereClause> chapterIdNotEqualTo(
      String chapterId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'chapterId_sourceId_mangaId',
        upper: [chapterId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'chapterId_sourceId_mangaId',
        lower: [chapterId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'chapterId_sourceId_mangaId',
        lower: [chapterId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'chapterId_sourceId_mangaId',
        upper: [chapterId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Chapter, Chapter, QAfterWhereClause> chapterIdSourceIdEqualTo(
      String chapterId, String sourceId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'chapterId_sourceId_mangaId',
      value: [chapterId, sourceId],
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterWhereClause> chapterIdSourceIdNotEqualTo(
      String chapterId, String sourceId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'chapterId_sourceId_mangaId',
        upper: [chapterId, sourceId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'chapterId_sourceId_mangaId',
        lower: [chapterId, sourceId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'chapterId_sourceId_mangaId',
        lower: [chapterId, sourceId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'chapterId_sourceId_mangaId',
        upper: [chapterId, sourceId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Chapter, Chapter, QAfterWhereClause>
      chapterIdSourceIdMangaIdEqualTo(
          String chapterId, String sourceId, String mangaId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'chapterId_sourceId_mangaId',
      value: [chapterId, sourceId, mangaId],
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterWhereClause>
      chapterIdSourceIdMangaIdNotEqualTo(
          String chapterId, String sourceId, String mangaId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'chapterId_sourceId_mangaId',
        upper: [chapterId, sourceId, mangaId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'chapterId_sourceId_mangaId',
        lower: [chapterId, sourceId, mangaId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'chapterId_sourceId_mangaId',
        lower: [chapterId, sourceId, mangaId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'chapterId_sourceId_mangaId',
        upper: [chapterId, sourceId, mangaId],
        includeUpper: false,
      ));
    }
  }
}

extension ChapterQueryFilter
    on QueryBuilder<Chapter, Chapter, QFilterCondition> {
  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterIdEqualTo(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterIdGreaterThan(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterIdLessThan(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterIdBetween(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterIdStartsWith(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterIdEndsWith(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'chapterId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'chapterId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterNoGreaterThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'chapterNo',
      value: value,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterNoLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'chapterNo',
      value: value,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> chapterNoBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'chapterNo',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> groupIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'group',
      value: null,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> groupEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'group',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> groupGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'group',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> groupLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'group',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> groupBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'group',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> groupStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'group',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> groupEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'group',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> groupContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'group',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> groupMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'group',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> langCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'langCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> langCodeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'langCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> langCodeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'langCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> langCodeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'langCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> langCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'langCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> langCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'langCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> langCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'langCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> langCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'langCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> mangaIdEqualTo(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> mangaIdGreaterThan(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> mangaIdLessThan(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> mangaIdBetween(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> mangaIdStartsWith(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> mangaIdEndsWith(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> mangaIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'mangaId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> mangaIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'mangaId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> nameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'name',
      value: null,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> nameGreaterThan(
    String? value, {
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> nameLessThan(
    String? value, {
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> pageIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'page',
      value: null,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> pageEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'page',
      value: value,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> pageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'page',
      value: value,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> pageLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'page',
      value: value,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> pageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'page',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> readEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'read',
      value: value,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> sourceIdEqualTo(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> sourceIdGreaterThan(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> sourceIdLessThan(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> sourceIdBetween(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> sourceIdStartsWith(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> sourceIdEndsWith(
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

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> sourceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sourceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> sourceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sourceId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> timeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'time',
      value: null,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> timeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> timeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> timeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> timeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'time',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> timeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> timeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> timeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'time',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> timeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'time',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> volumeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'volume',
      value: null,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> volumeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'volume',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> volumeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'volume',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> volumeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'volume',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> volumeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'volume',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> volumeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'volume',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> volumeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'volume',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> volumeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'volume',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Chapter, Chapter, QAfterFilterCondition> volumeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'volume',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ChapterQueryLinks
    on QueryBuilder<Chapter, Chapter, QFilterCondition> {}

extension ChapterQueryWhereSortBy on QueryBuilder<Chapter, Chapter, QSortBy> {
  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByChapterId() {
    return addSortByInternal('chapterId', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByChapterIdDesc() {
    return addSortByInternal('chapterId', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByChapterNo() {
    return addSortByInternal('chapterNo', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByChapterNoDesc() {
    return addSortByInternal('chapterNo', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByGroup() {
    return addSortByInternal('group', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByGroupDesc() {
    return addSortByInternal('group', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByLangCode() {
    return addSortByInternal('langCode', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByLangCodeDesc() {
    return addSortByInternal('langCode', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByMangaId() {
    return addSortByInternal('mangaId', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByMangaIdDesc() {
    return addSortByInternal('mangaId', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByPage() {
    return addSortByInternal('page', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByPageDesc() {
    return addSortByInternal('page', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByRead() {
    return addSortByInternal('read', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByReadDesc() {
    return addSortByInternal('read', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortBySourceId() {
    return addSortByInternal('sourceId', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortBySourceIdDesc() {
    return addSortByInternal('sourceId', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByVolume() {
    return addSortByInternal('volume', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> sortByVolumeDesc() {
    return addSortByInternal('volume', Sort.desc);
  }
}

extension ChapterQueryWhereSortThenBy
    on QueryBuilder<Chapter, Chapter, QSortThenBy> {
  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByChapterId() {
    return addSortByInternal('chapterId', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByChapterIdDesc() {
    return addSortByInternal('chapterId', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByChapterNo() {
    return addSortByInternal('chapterNo', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByChapterNoDesc() {
    return addSortByInternal('chapterNo', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByGroup() {
    return addSortByInternal('group', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByGroupDesc() {
    return addSortByInternal('group', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByLangCode() {
    return addSortByInternal('langCode', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByLangCodeDesc() {
    return addSortByInternal('langCode', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByMangaId() {
    return addSortByInternal('mangaId', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByMangaIdDesc() {
    return addSortByInternal('mangaId', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByPage() {
    return addSortByInternal('page', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByPageDesc() {
    return addSortByInternal('page', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByRead() {
    return addSortByInternal('read', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByReadDesc() {
    return addSortByInternal('read', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenBySourceId() {
    return addSortByInternal('sourceId', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenBySourceIdDesc() {
    return addSortByInternal('sourceId', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByVolume() {
    return addSortByInternal('volume', Sort.asc);
  }

  QueryBuilder<Chapter, Chapter, QAfterSortBy> thenByVolumeDesc() {
    return addSortByInternal('volume', Sort.desc);
  }
}

extension ChapterQueryWhereDistinct
    on QueryBuilder<Chapter, Chapter, QDistinct> {
  QueryBuilder<Chapter, Chapter, QDistinct> distinctByChapterId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('chapterId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctByChapterNo() {
    return addDistinctByInternal('chapterNo');
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctByGroup(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('group', caseSensitive: caseSensitive);
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctByLangCode(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('langCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctByMangaId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mangaId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctByPage() {
    return addDistinctByInternal('page');
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctByRead() {
    return addDistinctByInternal('read');
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctBySourceId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sourceId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctByTime(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('time', caseSensitive: caseSensitive);
  }

  QueryBuilder<Chapter, Chapter, QDistinct> distinctByVolume(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('volume', caseSensitive: caseSensitive);
  }
}

extension ChapterQueryProperty
    on QueryBuilder<Chapter, Chapter, QQueryProperty> {
  QueryBuilder<Chapter, String, QQueryOperations> chapterIdProperty() {
    return addPropertyNameInternal('chapterId');
  }

  QueryBuilder<Chapter, double, QQueryOperations> chapterNoProperty() {
    return addPropertyNameInternal('chapterNo');
  }

  QueryBuilder<Chapter, String?, QQueryOperations> groupProperty() {
    return addPropertyNameInternal('group');
  }

  QueryBuilder<Chapter, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Chapter, String, QQueryOperations> langCodeProperty() {
    return addPropertyNameInternal('langCode');
  }

  QueryBuilder<Chapter, String, QQueryOperations> mangaIdProperty() {
    return addPropertyNameInternal('mangaId');
  }

  QueryBuilder<Chapter, String?, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Chapter, int?, QQueryOperations> pageProperty() {
    return addPropertyNameInternal('page');
  }

  QueryBuilder<Chapter, bool, QQueryOperations> readProperty() {
    return addPropertyNameInternal('read');
  }

  QueryBuilder<Chapter, String, QQueryOperations> sourceIdProperty() {
    return addPropertyNameInternal('sourceId');
  }

  QueryBuilder<Chapter, String?, QQueryOperations> timeProperty() {
    return addPropertyNameInternal('time');
  }

  QueryBuilder<Chapter, String?, QQueryOperations> volumeProperty() {
    return addPropertyNameInternal('volume');
  }
}
