// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outbox_operation.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOutboxOperationCollection on Isar {
  IsarCollection<OutboxOperation> get outboxOperations => this.collection();
}

const OutboxOperationSchema = CollectionSchema(
  name: r'OutboxOperation',
  id: 895575349614289390,
  properties: {
    r'creadoEn': PropertySchema(
      id: 0,
      name: r'creadoEn',
      type: IsarType.dateTime,
    ),
    r'endpoint': PropertySchema(
      id: 1,
      name: r'endpoint',
      type: IsarType.string,
    ),
    r'estado': PropertySchema(
      id: 2,
      name: r'estado',
      type: IsarType.string,
    ),
    r'idOperacion': PropertySchema(
      id: 3,
      name: r'idOperacion',
      type: IsarType.string,
    ),
    r'intentos': PropertySchema(
      id: 4,
      name: r'intentos',
      type: IsarType.long,
    ),
    r'metodo': PropertySchema(
      id: 5,
      name: r'metodo',
      type: IsarType.string,
    ),
    r'payloadJson': PropertySchema(
      id: 6,
      name: r'payloadJson',
      type: IsarType.string,
    ),
    r'ultimoError': PropertySchema(
      id: 7,
      name: r'ultimoError',
      type: IsarType.string,
    )
  },
  estimateSize: _outboxOperationEstimateSize,
  serialize: _outboxOperationSerialize,
  deserialize: _outboxOperationDeserialize,
  deserializeProp: _outboxOperationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _outboxOperationGetId,
  getLinks: _outboxOperationGetLinks,
  attach: _outboxOperationAttach,
  version: '3.1.0+1',
);

int _outboxOperationEstimateSize(
  OutboxOperation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.endpoint.length * 3;
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.idOperacion.length * 3;
  bytesCount += 3 + object.metodo.length * 3;
  bytesCount += 3 + object.payloadJson.length * 3;
  {
    final value = object.ultimoError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _outboxOperationSerialize(
  OutboxOperation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.creadoEn);
  writer.writeString(offsets[1], object.endpoint);
  writer.writeString(offsets[2], object.estado);
  writer.writeString(offsets[3], object.idOperacion);
  writer.writeLong(offsets[4], object.intentos);
  writer.writeString(offsets[5], object.metodo);
  writer.writeString(offsets[6], object.payloadJson);
  writer.writeString(offsets[7], object.ultimoError);
}

OutboxOperation _outboxOperationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OutboxOperation();
  object.creadoEn = reader.readDateTime(offsets[0]);
  object.endpoint = reader.readString(offsets[1]);
  object.estado = reader.readString(offsets[2]);
  object.id = id;
  object.idOperacion = reader.readString(offsets[3]);
  object.intentos = reader.readLong(offsets[4]);
  object.metodo = reader.readString(offsets[5]);
  object.payloadJson = reader.readString(offsets[6]);
  object.ultimoError = reader.readStringOrNull(offsets[7]);
  return object;
}

P _outboxOperationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _outboxOperationGetId(OutboxOperation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _outboxOperationGetLinks(OutboxOperation object) {
  return [];
}

void _outboxOperationAttach(
    IsarCollection<dynamic> col, Id id, OutboxOperation object) {
  object.id = id;
}

extension OutboxOperationQueryWhereSort
    on QueryBuilder<OutboxOperation, OutboxOperation, QWhere> {
  QueryBuilder<OutboxOperation, OutboxOperation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OutboxOperationQueryWhere
    on QueryBuilder<OutboxOperation, OutboxOperation, QWhereClause> {
  QueryBuilder<OutboxOperation, OutboxOperation, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OutboxOperationQueryFilter
    on QueryBuilder<OutboxOperation, OutboxOperation, QFilterCondition> {
  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      creadoEnEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creadoEn',
        value: value,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      creadoEnGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creadoEn',
        value: value,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      creadoEnLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creadoEn',
        value: value,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      creadoEnBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creadoEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      endpointEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      endpointGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      endpointLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      endpointBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endpoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      endpointStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      endpointEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      endpointContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      endpointMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endpoint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      endpointIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endpoint',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      endpointIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endpoint',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      estadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      estadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      estadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      estadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      estadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      estadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      estadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      estadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idOperacionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idOperacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idOperacionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idOperacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idOperacionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idOperacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idOperacionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idOperacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idOperacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idOperacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idOperacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idOperacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idOperacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idOperacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idOperacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idOperacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idOperacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idOperacion',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      idOperacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idOperacion',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      intentosEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intentos',
        value: value,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      intentosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intentos',
        value: value,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      intentosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intentos',
        value: value,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      intentosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intentos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      metodoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      metodoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      metodoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      metodoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metodo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      metodoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      metodoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      metodoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metodo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      metodoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metodo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      metodoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metodo',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      metodoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metodo',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      payloadJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      payloadJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      payloadJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      payloadJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payloadJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      payloadJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      payloadJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      payloadJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      payloadJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'payloadJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      payloadJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payloadJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      payloadJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payloadJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ultimoError',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ultimoError',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ultimoError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ultimoError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ultimoError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ultimoError',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ultimoError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ultimoError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ultimoError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ultimoError',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ultimoError',
        value: '',
      ));
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterFilterCondition>
      ultimoErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ultimoError',
        value: '',
      ));
    });
  }
}

extension OutboxOperationQueryObject
    on QueryBuilder<OutboxOperation, OutboxOperation, QFilterCondition> {}

extension OutboxOperationQueryLinks
    on QueryBuilder<OutboxOperation, OutboxOperation, QFilterCondition> {}

extension OutboxOperationQuerySortBy
    on QueryBuilder<OutboxOperation, OutboxOperation, QSortBy> {
  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByCreadoEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoEn', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByCreadoEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoEn', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByIdOperacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperacion', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByIdOperacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperacion', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByIntentos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intentos', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByIntentosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intentos', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy> sortByMetodo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodo', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByMetodoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodo', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByUltimoError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimoError', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      sortByUltimoErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimoError', Sort.desc);
    });
  }
}

extension OutboxOperationQuerySortThenBy
    on QueryBuilder<OutboxOperation, OutboxOperation, QSortThenBy> {
  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByCreadoEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoEn', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByCreadoEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoEn', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByIdOperacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperacion', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByIdOperacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idOperacion', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByIntentos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intentos', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByIntentosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intentos', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy> thenByMetodo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodo', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByMetodoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metodo', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByUltimoError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimoError', Sort.asc);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QAfterSortBy>
      thenByUltimoErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimoError', Sort.desc);
    });
  }
}

extension OutboxOperationQueryWhereDistinct
    on QueryBuilder<OutboxOperation, OutboxOperation, QDistinct> {
  QueryBuilder<OutboxOperation, OutboxOperation, QDistinct>
      distinctByCreadoEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creadoEn');
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QDistinct> distinctByEndpoint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endpoint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QDistinct>
      distinctByIdOperacion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idOperacion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QDistinct>
      distinctByIntentos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intentos');
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QDistinct> distinctByMetodo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metodo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QDistinct>
      distinctByPayloadJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payloadJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OutboxOperation, OutboxOperation, QDistinct>
      distinctByUltimoError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ultimoError', caseSensitive: caseSensitive);
    });
  }
}

extension OutboxOperationQueryProperty
    on QueryBuilder<OutboxOperation, OutboxOperation, QQueryProperty> {
  QueryBuilder<OutboxOperation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OutboxOperation, DateTime, QQueryOperations> creadoEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creadoEn');
    });
  }

  QueryBuilder<OutboxOperation, String, QQueryOperations> endpointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endpoint');
    });
  }

  QueryBuilder<OutboxOperation, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<OutboxOperation, String, QQueryOperations>
      idOperacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idOperacion');
    });
  }

  QueryBuilder<OutboxOperation, int, QQueryOperations> intentosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intentos');
    });
  }

  QueryBuilder<OutboxOperation, String, QQueryOperations> metodoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metodo');
    });
  }

  QueryBuilder<OutboxOperation, String, QQueryOperations>
      payloadJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payloadJson');
    });
  }

  QueryBuilder<OutboxOperation, String?, QQueryOperations>
      ultimoErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ultimoError');
    });
  }
}
