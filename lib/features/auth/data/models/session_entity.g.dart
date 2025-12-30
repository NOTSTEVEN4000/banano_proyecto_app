// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSessionEntityCollection on Isar {
  IsarCollection<SessionEntity> get sessionEntitys => this.collection();
}

const SessionEntitySchema = CollectionSchema(
  name: r'SessionEntity',
  id: 7472964409236372477,
  properties: {
    r'correo': PropertySchema(
      id: 0,
      name: r'correo',
      type: IsarType.string,
    ),
    r'creadoEn': PropertySchema(
      id: 1,
      name: r'creadoEn',
      type: IsarType.dateTime,
    ),
    r'nombreCompleto': PropertySchema(
      id: 2,
      name: r'nombreCompleto',
      type: IsarType.string,
    ),
    r'rol': PropertySchema(
      id: 3,
      name: r'rol',
      type: IsarType.string,
    ),
    r'token': PropertySchema(
      id: 4,
      name: r'token',
      type: IsarType.string,
    ),
    r'usuarioId': PropertySchema(
      id: 5,
      name: r'usuarioId',
      type: IsarType.string,
    )
  },
  estimateSize: _sessionEntityEstimateSize,
  serialize: _sessionEntitySerialize,
  deserialize: _sessionEntityDeserialize,
  deserializeProp: _sessionEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _sessionEntityGetId,
  getLinks: _sessionEntityGetLinks,
  attach: _sessionEntityAttach,
  version: '3.1.0+1',
);

int _sessionEntityEstimateSize(
  SessionEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.correo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nombreCompleto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rol;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.token;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.usuarioId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sessionEntitySerialize(
  SessionEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.correo);
  writer.writeDateTime(offsets[1], object.creadoEn);
  writer.writeString(offsets[2], object.nombreCompleto);
  writer.writeString(offsets[3], object.rol);
  writer.writeString(offsets[4], object.token);
  writer.writeString(offsets[5], object.usuarioId);
}

SessionEntity _sessionEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SessionEntity();
  object.correo = reader.readStringOrNull(offsets[0]);
  object.creadoEn = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.nombreCompleto = reader.readStringOrNull(offsets[2]);
  object.rol = reader.readStringOrNull(offsets[3]);
  object.token = reader.readStringOrNull(offsets[4]);
  object.usuarioId = reader.readStringOrNull(offsets[5]);
  return object;
}

P _sessionEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sessionEntityGetId(SessionEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sessionEntityGetLinks(SessionEntity object) {
  return [];
}

void _sessionEntityAttach(
    IsarCollection<dynamic> col, Id id, SessionEntity object) {
  object.id = id;
}

extension SessionEntityQueryWhereSort
    on QueryBuilder<SessionEntity, SessionEntity, QWhere> {
  QueryBuilder<SessionEntity, SessionEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SessionEntityQueryWhere
    on QueryBuilder<SessionEntity, SessionEntity, QWhereClause> {
  QueryBuilder<SessionEntity, SessionEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<SessionEntity, SessionEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterWhereClause> idBetween(
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

extension SessionEntityQueryFilter
    on QueryBuilder<SessionEntity, SessionEntity, QFilterCondition> {
  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correo',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correo',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correo',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      correoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correo',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      creadoEnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creadoEn',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      creadoEnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creadoEn',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      creadoEnEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creadoEn',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      creadoEnGreaterThan(
    DateTime? value, {
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

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      creadoEnLessThan(
    DateTime? value, {
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

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      creadoEnBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
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

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombreCompleto',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombreCompleto',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreCompleto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreCompleto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreCompleto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreCompleto',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      nombreCompletoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreCompleto',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      rolIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rol',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      rolIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rol',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition> rolEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      rolGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition> rolLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition> rolBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      rolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition> rolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition> rolContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition> rolMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      rolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rol',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      rolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rol',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'token',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'token',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'token',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'token',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'token',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      tokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'token',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usuarioId',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usuarioId',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuarioId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usuarioId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterFilterCondition>
      usuarioIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usuarioId',
        value: '',
      ));
    });
  }
}

extension SessionEntityQueryObject
    on QueryBuilder<SessionEntity, SessionEntity, QFilterCondition> {}

extension SessionEntityQueryLinks
    on QueryBuilder<SessionEntity, SessionEntity, QFilterCondition> {}

extension SessionEntityQuerySortBy
    on QueryBuilder<SessionEntity, SessionEntity, QSortBy> {
  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> sortByCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> sortByCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> sortByCreadoEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoEn', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy>
      sortByCreadoEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoEn', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy>
      sortByNombreCompleto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCompleto', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy>
      sortByNombreCompletoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCompleto', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> sortByRol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rol', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> sortByRolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rol', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> sortByToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> sortByTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy>
      sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }
}

extension SessionEntityQuerySortThenBy
    on QueryBuilder<SessionEntity, SessionEntity, QSortThenBy> {
  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> thenByCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> thenByCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> thenByCreadoEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoEn', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy>
      thenByCreadoEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoEn', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy>
      thenByNombreCompleto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCompleto', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy>
      thenByNombreCompletoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreCompleto', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> thenByRol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rol', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> thenByRolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rol', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> thenByToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> thenByTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.desc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy> thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QAfterSortBy>
      thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }
}

extension SessionEntityQueryWhereDistinct
    on QueryBuilder<SessionEntity, SessionEntity, QDistinct> {
  QueryBuilder<SessionEntity, SessionEntity, QDistinct> distinctByCorreo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QDistinct> distinctByCreadoEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creadoEn');
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QDistinct>
      distinctByNombreCompleto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreCompleto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QDistinct> distinctByRol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rol', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QDistinct> distinctByToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'token', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SessionEntity, SessionEntity, QDistinct> distinctByUsuarioId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId', caseSensitive: caseSensitive);
    });
  }
}

extension SessionEntityQueryProperty
    on QueryBuilder<SessionEntity, SessionEntity, QQueryProperty> {
  QueryBuilder<SessionEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SessionEntity, String?, QQueryOperations> correoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correo');
    });
  }

  QueryBuilder<SessionEntity, DateTime?, QQueryOperations> creadoEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creadoEn');
    });
  }

  QueryBuilder<SessionEntity, String?, QQueryOperations>
      nombreCompletoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreCompleto');
    });
  }

  QueryBuilder<SessionEntity, String?, QQueryOperations> rolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rol');
    });
  }

  QueryBuilder<SessionEntity, String?, QQueryOperations> tokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'token');
    });
  }

  QueryBuilder<SessionEntity, String?, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }
}
