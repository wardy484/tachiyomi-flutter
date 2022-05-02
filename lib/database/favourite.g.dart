// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetFavouriteCollection on Isar {
  IsarCollection<Favourite> get favourites => getCollection();
}

const FavouriteSchema = CollectionSchema(
  name: 'Favourite',
  schema:
      '{"name":"Favourite","idName":"id","properties":[{"name":"artist","type":"String"},{"name":"author","type":"String"},{"name":"covers","type":"StringList"},{"name":"desc","type":"String"},{"name":"follows","type":"Double"},{"name":"image","type":"String"},{"name":"langFlag","type":"String"},{"name":"lastUpdate","type":"Long"},{"name":"mangaId","type":"String"},{"name":"mangaStatus","type":"String"},{"name":"name","type":"String"},{"name":"newChapterIds","type":"StringList"},{"name":"rating","type":"Double"},{"name":"sourceId","type":"String"},{"name":"titles","type":"StringList"}],"indexes":[{"name":"mangaId_sourceId","unique":false,"properties":[{"name":"mangaId","type":"Hash","caseSensitive":true},{"name":"sourceId","type":"Hash","caseSensitive":true}]}],"links":[{"name":"chapters","target":"Chapter"},{"name":"lastChapterRead","target":"Chapter"},{"name":"tagSections","target":"TagSection"}]}',
  idName: 'id',
  propertyIds: {
    'artist': 0,
    'author': 1,
    'covers': 2,
    'desc': 3,
    'follows': 4,
    'image': 5,
    'langFlag': 6,
    'lastUpdate': 7,
    'mangaId': 8,
    'mangaStatus': 9,
    'name': 10,
    'newChapterIds': 11,
    'rating': 12,
    'sourceId': 13,
    'titles': 14
  },
  listProperties: {'covers', 'newChapterIds', 'titles'},
  indexIds: {'mangaId_sourceId': 0},
  indexValueTypes: {
    'mangaId_sourceId': [
      IndexValueType.stringHash,
      IndexValueType.stringHash,
    ]
  },
  linkIds: {'chapters': 0, 'lastChapterRead': 1, 'tagSections': 2},
  backlinkLinkNames: {},
  getId: _favouriteGetId,
  setId: _favouriteSetId,
  getLinks: _favouriteGetLinks,
  attachLinks: _favouriteAttachLinks,
  serializeNative: _favouriteSerializeNative,
  deserializeNative: _favouriteDeserializeNative,
  deserializePropNative: _favouriteDeserializePropNative,
  serializeWeb: _favouriteSerializeWeb,
  deserializeWeb: _favouriteDeserializeWeb,
  deserializePropWeb: _favouriteDeserializePropWeb,
  version: 3,
);

int? _favouriteGetId(Favourite object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _favouriteSetId(Favourite object, int id) {
  object.id = id;
}

List<IsarLinkBase> _favouriteGetLinks(Favourite object) {
  return [object.chapters, object.lastChapterRead, object.tagSections];
}

void _favouriteSerializeNative(
    IsarCollection<Favourite> collection,
    IsarRawObject rawObj,
    Favourite object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.artist;
  IsarUint8List? _artist;
  if (value0 != null) {
    _artist = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_artist?.length ?? 0) as int;
  final value1 = object.author;
  IsarUint8List? _author;
  if (value1 != null) {
    _author = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_author?.length ?? 0) as int;
  final value2 = object.covers;
  dynamicSize += (value2?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList2;
  if (value2 != null) {
    bytesList2 = [];
    for (var str in value2) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList2.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _covers = bytesList2;
  final value3 = object.desc;
  IsarUint8List? _desc;
  if (value3 != null) {
    _desc = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_desc?.length ?? 0) as int;
  final value4 = object.follows;
  final _follows = value4;
  final value5 = object.image;
  final _image = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_image.length) as int;
  final value6 = object.langFlag;
  IsarUint8List? _langFlag;
  if (value6 != null) {
    _langFlag = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_langFlag?.length ?? 0) as int;
  final value7 = object.lastUpdate;
  final _lastUpdate = value7;
  final value8 = object.mangaId;
  final _mangaId = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_mangaId.length) as int;
  final value9 = object.mangaStatus;
  IsarUint8List? _mangaStatus;
  if (value9 != null) {
    _mangaStatus = IsarBinaryWriter.utf8Encoder.convert(value9);
  }
  dynamicSize += (_mangaStatus?.length ?? 0) as int;
  final value10 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value10);
  dynamicSize += (_name.length) as int;
  final value11 = object.newChapterIds;
  dynamicSize += (value11.length) * 8;
  final bytesList11 = <IsarUint8List>[];
  for (var str in value11) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList11.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _newChapterIds = bytesList11;
  final value12 = object.rating;
  final _rating = value12;
  final value13 = object.sourceId;
  final _sourceId = IsarBinaryWriter.utf8Encoder.convert(value13);
  dynamicSize += (_sourceId.length) as int;
  final value14 = object.titles;
  dynamicSize += (value14.length) * 8;
  final bytesList14 = <IsarUint8List>[];
  for (var str in value14) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList14.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _titles = bytesList14;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _artist);
  writer.writeBytes(offsets[1], _author);
  writer.writeStringList(offsets[2], _covers);
  writer.writeBytes(offsets[3], _desc);
  writer.writeDouble(offsets[4], _follows);
  writer.writeBytes(offsets[5], _image);
  writer.writeBytes(offsets[6], _langFlag);
  writer.writeDateTime(offsets[7], _lastUpdate);
  writer.writeBytes(offsets[8], _mangaId);
  writer.writeBytes(offsets[9], _mangaStatus);
  writer.writeBytes(offsets[10], _name);
  writer.writeStringList(offsets[11], _newChapterIds);
  writer.writeDouble(offsets[12], _rating);
  writer.writeBytes(offsets[13], _sourceId);
  writer.writeStringList(offsets[14], _titles);
}

Favourite _favouriteDeserializeNative(IsarCollection<Favourite> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = Favourite();
  object.artist = reader.readStringOrNull(offsets[0]);
  object.author = reader.readStringOrNull(offsets[1]);
  object.covers = reader.readStringList(offsets[2]);
  object.desc = reader.readStringOrNull(offsets[3]);
  object.follows = reader.readDoubleOrNull(offsets[4]);
  object.id = id;
  object.image = reader.readString(offsets[5]);
  object.langFlag = reader.readStringOrNull(offsets[6]);
  object.lastUpdate = reader.readDateTimeOrNull(offsets[7]);
  object.mangaId = reader.readString(offsets[8]);
  object.mangaStatus = reader.readStringOrNull(offsets[9]);
  object.name = reader.readString(offsets[10]);
  object.newChapterIds = reader.readStringList(offsets[11]) ?? [];
  object.rating = reader.readDoubleOrNull(offsets[12]);
  object.sourceId = reader.readString(offsets[13]);
  object.titles = reader.readStringList(offsets[14]) ?? [];
  _favouriteAttachLinks(collection, id, object);
  return object;
}

P _favouriteDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringList(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringList(offset) ?? []) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _favouriteSerializeWeb(
    IsarCollection<Favourite> collection, Favourite object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'artist', object.artist);
  IsarNative.jsObjectSet(jsObj, 'author', object.author);
  IsarNative.jsObjectSet(jsObj, 'covers', object.covers);
  IsarNative.jsObjectSet(jsObj, 'desc', object.desc);
  IsarNative.jsObjectSet(jsObj, 'follows', object.follows);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'image', object.image);
  IsarNative.jsObjectSet(jsObj, 'langFlag', object.langFlag);
  IsarNative.jsObjectSet(
      jsObj, 'lastUpdate', object.lastUpdate?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'mangaId', object.mangaId);
  IsarNative.jsObjectSet(jsObj, 'mangaStatus', object.mangaStatus);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'newChapterIds', object.newChapterIds);
  IsarNative.jsObjectSet(jsObj, 'rating', object.rating);
  IsarNative.jsObjectSet(jsObj, 'sourceId', object.sourceId);
  IsarNative.jsObjectSet(jsObj, 'titles', object.titles);
  return jsObj;
}

Favourite _favouriteDeserializeWeb(
    IsarCollection<Favourite> collection, dynamic jsObj) {
  final object = Favourite();
  object.artist = IsarNative.jsObjectGet(jsObj, 'artist');
  object.author = IsarNative.jsObjectGet(jsObj, 'author');
  object.covers = (IsarNative.jsObjectGet(jsObj, 'covers') as List?)
      ?.map((e) => e ?? '')
      .toList()
      .cast<String>();
  object.desc = IsarNative.jsObjectGet(jsObj, 'desc');
  object.follows = IsarNative.jsObjectGet(jsObj, 'follows');
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.image = IsarNative.jsObjectGet(jsObj, 'image') ?? '';
  object.langFlag = IsarNative.jsObjectGet(jsObj, 'langFlag');
  object.lastUpdate = IsarNative.jsObjectGet(jsObj, 'lastUpdate') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'lastUpdate'),
              isUtc: true)
          .toLocal()
      : null;
  object.mangaId = IsarNative.jsObjectGet(jsObj, 'mangaId') ?? '';
  object.mangaStatus = IsarNative.jsObjectGet(jsObj, 'mangaStatus');
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  object.newChapterIds =
      (IsarNative.jsObjectGet(jsObj, 'newChapterIds') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          [];
  object.rating = IsarNative.jsObjectGet(jsObj, 'rating');
  object.sourceId = IsarNative.jsObjectGet(jsObj, 'sourceId') ?? '';
  object.titles = (IsarNative.jsObjectGet(jsObj, 'titles') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>() ??
      [];
  _favouriteAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _favouriteDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'artist':
      return (IsarNative.jsObjectGet(jsObj, 'artist')) as P;
    case 'author':
      return (IsarNative.jsObjectGet(jsObj, 'author')) as P;
    case 'covers':
      return ((IsarNative.jsObjectGet(jsObj, 'covers') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>()) as P;
    case 'desc':
      return (IsarNative.jsObjectGet(jsObj, 'desc')) as P;
    case 'follows':
      return (IsarNative.jsObjectGet(jsObj, 'follows')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'image':
      return (IsarNative.jsObjectGet(jsObj, 'image') ?? '') as P;
    case 'langFlag':
      return (IsarNative.jsObjectGet(jsObj, 'langFlag')) as P;
    case 'lastUpdate':
      return (IsarNative.jsObjectGet(jsObj, 'lastUpdate') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'lastUpdate'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'mangaId':
      return (IsarNative.jsObjectGet(jsObj, 'mangaId') ?? '') as P;
    case 'mangaStatus':
      return (IsarNative.jsObjectGet(jsObj, 'mangaStatus')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'newChapterIds':
      return ((IsarNative.jsObjectGet(jsObj, 'newChapterIds') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'rating':
      return (IsarNative.jsObjectGet(jsObj, 'rating')) as P;
    case 'sourceId':
      return (IsarNative.jsObjectGet(jsObj, 'sourceId') ?? '') as P;
    case 'titles':
      return ((IsarNative.jsObjectGet(jsObj, 'titles') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _favouriteAttachLinks(IsarCollection col, int id, Favourite object) {
  object.chapters.attach(col, col.isar.chapters, 'chapters', id);
  object.lastChapterRead.attach(col, col.isar.chapters, 'lastChapterRead', id);
  object.tagSections.attach(col, col.isar.tagSections, 'tagSections', id);
}

extension FavouriteQueryWhereSort
    on QueryBuilder<Favourite, Favourite, QWhere> {
  QueryBuilder<Favourite, Favourite, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Favourite, Favourite, QAfterWhere> anyMangaIdSourceId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'mangaId_sourceId'));
  }
}

extension FavouriteQueryWhere
    on QueryBuilder<Favourite, Favourite, QWhereClause> {
  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> idBetween(
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

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> mangaIdEqualTo(
      String mangaId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'mangaId_sourceId',
      value: [mangaId],
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> mangaIdNotEqualTo(
      String mangaId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'mangaId_sourceId',
        upper: [mangaId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'mangaId_sourceId',
        lower: [mangaId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'mangaId_sourceId',
        lower: [mangaId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'mangaId_sourceId',
        upper: [mangaId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause> mangaIdSourceIdEqualTo(
      String mangaId, String sourceId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'mangaId_sourceId',
      value: [mangaId, sourceId],
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterWhereClause>
      mangaIdSourceIdNotEqualTo(String mangaId, String sourceId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'mangaId_sourceId',
        upper: [mangaId, sourceId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'mangaId_sourceId',
        lower: [mangaId, sourceId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'mangaId_sourceId',
        lower: [mangaId, sourceId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'mangaId_sourceId',
        upper: [mangaId, sourceId],
        includeUpper: false,
      ));
    }
  }
}

extension FavouriteQueryFilter
    on QueryBuilder<Favourite, Favourite, QFilterCondition> {
  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> artistIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'artist',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> artistEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'artist',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> artistGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'artist',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> artistLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'artist',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> artistBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'artist',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> artistStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'artist',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> artistEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'artist',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> artistContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'artist',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> artistMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'artist',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> authorIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'author',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> authorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> authorGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> authorLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> authorBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'author',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> authorContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> authorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'author',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> coversIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'covers',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> coversAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'covers',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> coversAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'covers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      coversAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'covers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> coversAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'covers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> coversAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'covers',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> coversAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'covers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> coversAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'covers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> coversAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'covers',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> coversAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'covers',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> descIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'desc',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> descEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> descGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> descLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> descBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'desc',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> descStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> descEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> descContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> descMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'desc',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> followsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'follows',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> followsGreaterThan(
      double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'follows',
      value: value,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> followsLessThan(
      double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'follows',
      value: value,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> followsBetween(
      double? lower, double? upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'follows',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
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
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> langFlagIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'langFlag',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> langFlagEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'langFlag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> langFlagGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'langFlag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> langFlagLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'langFlag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> langFlagBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'langFlag',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> langFlagStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'langFlag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> langFlagEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'langFlag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> langFlagContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'langFlag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> langFlagMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'langFlag',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> lastUpdateIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'lastUpdate',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> lastUpdateEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lastUpdate',
      value: value,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      lastUpdateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lastUpdate',
      value: value,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> lastUpdateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lastUpdate',
      value: value,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> lastUpdateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lastUpdate',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      mangaStatusIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'mangaStatus',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaStatusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'mangaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      mangaStatusGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'mangaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaStatusLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'mangaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaStatusBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'mangaStatus',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      mangaStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'mangaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'mangaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaStatusContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'mangaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> mangaStatusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'mangaStatus',
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      newChapterIdsAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'newChapterIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      newChapterIdsAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'newChapterIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      newChapterIdsAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'newChapterIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      newChapterIdsAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'newChapterIds',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      newChapterIdsAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'newChapterIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      newChapterIdsAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'newChapterIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      newChapterIdsAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'newChapterIds',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      newChapterIdsAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'newChapterIds',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> ratingIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'rating',
      value: null,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> ratingGreaterThan(
      double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'rating',
      value: value,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> ratingLessThan(
      double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'rating',
      value: value,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> ratingBetween(
      double? lower, double? upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'rating',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
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

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> titlesAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'titles',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition>
      titlesAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'titles',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> titlesAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'titles',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> titlesAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'titles',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> titlesAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'titles',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> titlesAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'titles',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> titlesAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'titles',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> titlesAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'titles',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension FavouriteQueryLinks
    on QueryBuilder<Favourite, Favourite, QFilterCondition> {
  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> chapters(
      FilterQuery<Chapter> q) {
    return linkInternal(
      isar.chapters,
      q,
      'chapters',
    );
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> lastChapterRead(
      FilterQuery<Chapter> q) {
    return linkInternal(
      isar.chapters,
      q,
      'lastChapterRead',
    );
  }

  QueryBuilder<Favourite, Favourite, QAfterFilterCondition> tagSections(
      FilterQuery<TagSection> q) {
    return linkInternal(
      isar.tagSections,
      q,
      'tagSections',
    );
  }
}

extension FavouriteQueryWhereSortBy
    on QueryBuilder<Favourite, Favourite, QSortBy> {
  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByArtist() {
    return addSortByInternal('artist', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByArtistDesc() {
    return addSortByInternal('artist', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByAuthor() {
    return addSortByInternal('author', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByAuthorDesc() {
    return addSortByInternal('author', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByDesc() {
    return addSortByInternal('desc', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByDescDesc() {
    return addSortByInternal('desc', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByFollows() {
    return addSortByInternal('follows', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByFollowsDesc() {
    return addSortByInternal('follows', Sort.desc);
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

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByLangFlag() {
    return addSortByInternal('langFlag', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByLangFlagDesc() {
    return addSortByInternal('langFlag', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByLastUpdate() {
    return addSortByInternal('lastUpdate', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByLastUpdateDesc() {
    return addSortByInternal('lastUpdate', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByMangaId() {
    return addSortByInternal('mangaId', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByMangaIdDesc() {
    return addSortByInternal('mangaId', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByMangaStatus() {
    return addSortByInternal('mangaStatus', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByMangaStatusDesc() {
    return addSortByInternal('mangaStatus', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByRating() {
    return addSortByInternal('rating', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> sortByRatingDesc() {
    return addSortByInternal('rating', Sort.desc);
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
  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByArtist() {
    return addSortByInternal('artist', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByArtistDesc() {
    return addSortByInternal('artist', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByAuthor() {
    return addSortByInternal('author', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByAuthorDesc() {
    return addSortByInternal('author', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByDesc() {
    return addSortByInternal('desc', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByDescDesc() {
    return addSortByInternal('desc', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByFollows() {
    return addSortByInternal('follows', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByFollowsDesc() {
    return addSortByInternal('follows', Sort.desc);
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

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByLangFlag() {
    return addSortByInternal('langFlag', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByLangFlagDesc() {
    return addSortByInternal('langFlag', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByLastUpdate() {
    return addSortByInternal('lastUpdate', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByLastUpdateDesc() {
    return addSortByInternal('lastUpdate', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByMangaId() {
    return addSortByInternal('mangaId', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByMangaIdDesc() {
    return addSortByInternal('mangaId', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByMangaStatus() {
    return addSortByInternal('mangaStatus', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByMangaStatusDesc() {
    return addSortByInternal('mangaStatus', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByRating() {
    return addSortByInternal('rating', Sort.asc);
  }

  QueryBuilder<Favourite, Favourite, QAfterSortBy> thenByRatingDesc() {
    return addSortByInternal('rating', Sort.desc);
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
  QueryBuilder<Favourite, Favourite, QDistinct> distinctByArtist(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('artist', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('author', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByDesc(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('desc', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByFollows() {
    return addDistinctByInternal('follows');
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('image', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByLangFlag(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('langFlag', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByLastUpdate() {
    return addDistinctByInternal('lastUpdate');
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByMangaId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mangaId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByMangaStatus(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('mangaStatus', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctByRating() {
    return addDistinctByInternal('rating');
  }

  QueryBuilder<Favourite, Favourite, QDistinct> distinctBySourceId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sourceId', caseSensitive: caseSensitive);
  }
}

extension FavouriteQueryProperty
    on QueryBuilder<Favourite, Favourite, QQueryProperty> {
  QueryBuilder<Favourite, String?, QQueryOperations> artistProperty() {
    return addPropertyNameInternal('artist');
  }

  QueryBuilder<Favourite, String?, QQueryOperations> authorProperty() {
    return addPropertyNameInternal('author');
  }

  QueryBuilder<Favourite, List<String>?, QQueryOperations> coversProperty() {
    return addPropertyNameInternal('covers');
  }

  QueryBuilder<Favourite, String?, QQueryOperations> descProperty() {
    return addPropertyNameInternal('desc');
  }

  QueryBuilder<Favourite, double?, QQueryOperations> followsProperty() {
    return addPropertyNameInternal('follows');
  }

  QueryBuilder<Favourite, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Favourite, String, QQueryOperations> imageProperty() {
    return addPropertyNameInternal('image');
  }

  QueryBuilder<Favourite, String?, QQueryOperations> langFlagProperty() {
    return addPropertyNameInternal('langFlag');
  }

  QueryBuilder<Favourite, DateTime?, QQueryOperations> lastUpdateProperty() {
    return addPropertyNameInternal('lastUpdate');
  }

  QueryBuilder<Favourite, String, QQueryOperations> mangaIdProperty() {
    return addPropertyNameInternal('mangaId');
  }

  QueryBuilder<Favourite, String?, QQueryOperations> mangaStatusProperty() {
    return addPropertyNameInternal('mangaStatus');
  }

  QueryBuilder<Favourite, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Favourite, List<String>, QQueryOperations>
      newChapterIdsProperty() {
    return addPropertyNameInternal('newChapterIds');
  }

  QueryBuilder<Favourite, double?, QQueryOperations> ratingProperty() {
    return addPropertyNameInternal('rating');
  }

  QueryBuilder<Favourite, String, QQueryOperations> sourceIdProperty() {
    return addPropertyNameInternal('sourceId');
  }

  QueryBuilder<Favourite, List<String>, QQueryOperations> titlesProperty() {
    return addPropertyNameInternal('titles');
  }
}
