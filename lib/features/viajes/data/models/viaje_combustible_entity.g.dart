// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viaje_combustible_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetViajeCombustibleEntityCollection on Isar {
  IsarCollection<ViajeCombustibleEntity> get viajeCombustibleEntitys =>
      this.collection();
}

const ViajeCombustibleEntitySchema = CollectionSchema(
  name: r'ViajeCombustibleEntity',
  id: 2594007244293499972,
  properties: {
    r'actualizadoPor': PropertySchema(
      id: 0,
      name: r'actualizadoPor',
      type: IsarType.string,
    ),
    r'creadoPor': PropertySchema(
      id: 1,
      name: r'creadoPor',
      type: IsarType.string,
    ),
    r'detalle': PropertySchema(
      id: 2,
      name: r'detalle',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 3,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 4,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaHora': PropertySchema(
      id: 5,
      name: r'fechaHora',
      type: IsarType.dateTime,
    ),
    r'idExterno': PropertySchema(
      id: 6,
      name: r'idExterno',
      type: IsarType.string,
    ),
    r'litros': PropertySchema(
      id: 7,
      name: r'litros',
      type: IsarType.double,
    ),
    r'montoUSD': PropertySchema(
      id: 8,
      name: r'montoUSD',
      type: IsarType.double,
    ),
    r'pendienteSync': PropertySchema(
      id: 9,
      name: r'pendienteSync',
      type: IsarType.bool,
    ),
    r'viajeIdExterno': PropertySchema(
      id: 10,
      name: r'viajeIdExterno',
      type: IsarType.string,
    )
  },
  estimateSize: _viajeCombustibleEntityEstimateSize,
  serialize: _viajeCombustibleEntitySerialize,
  deserialize: _viajeCombustibleEntityDeserialize,
  deserializeProp: _viajeCombustibleEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _viajeCombustibleEntityGetId,
  getLinks: _viajeCombustibleEntityGetLinks,
  attach: _viajeCombustibleEntityAttach,
  version: '3.1.0+1',
);

int _viajeCombustibleEntityEstimateSize(
  ViajeCombustibleEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.actualizadoPor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.creadoPor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.detalle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.idExterno.length * 3;
  bytesCount += 3 + object.viajeIdExterno.length * 3;
  return bytesCount;
}

void _viajeCombustibleEntitySerialize(
  ViajeCombustibleEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actualizadoPor);
  writer.writeString(offsets[1], object.creadoPor);
  writer.writeString(offsets[2], object.detalle);
  writer.writeDateTime(offsets[3], object.fechaActualizacion);
  writer.writeDateTime(offsets[4], object.fechaCreacion);
  writer.writeDateTime(offsets[5], object.fechaHora);
  writer.writeString(offsets[6], object.idExterno);
  writer.writeDouble(offsets[7], object.litros);
  writer.writeDouble(offsets[8], object.montoUSD);
  writer.writeBool(offsets[9], object.pendienteSync);
  writer.writeString(offsets[10], object.viajeIdExterno);
}

ViajeCombustibleEntity _viajeCombustibleEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ViajeCombustibleEntity();
  object.actualizadoPor = reader.readStringOrNull(offsets[0]);
  object.creadoPor = reader.readStringOrNull(offsets[1]);
  object.detalle = reader.readStringOrNull(offsets[2]);
  object.fechaActualizacion = reader.readDateTime(offsets[3]);
  object.fechaCreacion = reader.readDateTime(offsets[4]);
  object.fechaHora = reader.readDateTime(offsets[5]);
  object.id = id;
  object.idExterno = reader.readString(offsets[6]);
  object.litros = reader.readDoubleOrNull(offsets[7]);
  object.montoUSD = reader.readDouble(offsets[8]);
  object.pendienteSync = reader.readBool(offsets[9]);
  object.viajeIdExterno = reader.readString(offsets[10]);
  return object;
}

P _viajeCombustibleEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _viajeCombustibleEntityGetId(ViajeCombustibleEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _viajeCombustibleEntityGetLinks(
    ViajeCombustibleEntity object) {
  return [];
}

void _viajeCombustibleEntityAttach(
    IsarCollection<dynamic> col, Id id, ViajeCombustibleEntity object) {
  object.id = id;
}

extension ViajeCombustibleEntityQueryWhereSort
    on QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QWhere> {
  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ViajeCombustibleEntityQueryWhere on QueryBuilder<
    ViajeCombustibleEntity, ViajeCombustibleEntity, QWhereClause> {
  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterWhereClause> idBetween(
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

extension ViajeCombustibleEntityQueryFilter on QueryBuilder<
    ViajeCombustibleEntity, ViajeCombustibleEntity, QFilterCondition> {
  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> actualizadoPorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualizadoPor',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> actualizadoPorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualizadoPor',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> actualizadoPorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualizadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> actualizadoPorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualizadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> actualizadoPorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualizadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> actualizadoPorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualizadoPor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> actualizadoPorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actualizadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> actualizadoPorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actualizadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
          QAfterFilterCondition>
      actualizadoPorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actualizadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
          QAfterFilterCondition>
      actualizadoPorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actualizadoPor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> actualizadoPorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualizadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> actualizadoPorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actualizadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> creadoPorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creadoPor',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> creadoPorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creadoPor',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> creadoPorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> creadoPorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> creadoPorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> creadoPorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creadoPor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> creadoPorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> creadoPorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
          QAfterFilterCondition>
      creadoPorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
          QAfterFilterCondition>
      creadoPorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'creadoPor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> creadoPorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> creadoPorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'creadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> detalleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'detalle',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> detalleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'detalle',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> detalleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> detalleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> detalleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> detalleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detalle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> detalleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> detalleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
          QAfterFilterCondition>
      detalleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
          QAfterFilterCondition>
      detalleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detalle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> detalleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detalle',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> detalleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detalle',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaActualizacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaActualizacionGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaActualizacionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaActualizacionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaActualizacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaCreacionGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaCreacionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaCreacionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCreacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaHoraEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaHora',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaHoraGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaHora',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaHoraLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaHora',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> fechaHoraBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaHora',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idExternoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idExternoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idExternoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idExternoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idExterno',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idExternoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idExternoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
          QAfterFilterCondition>
      idExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
          QAfterFilterCondition>
      idExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> idExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> litrosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'litros',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> litrosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'litros',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> litrosEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'litros',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> litrosGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'litros',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> litrosLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'litros',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> litrosBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'litros',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> montoUSDEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoUSD',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> montoUSDGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoUSD',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> montoUSDLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoUSD',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> montoUSDBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoUSD',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> pendienteSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendienteSync',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> viajeIdExternoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viajeIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> viajeIdExternoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'viajeIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> viajeIdExternoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'viajeIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> viajeIdExternoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'viajeIdExterno',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> viajeIdExternoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'viajeIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> viajeIdExternoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'viajeIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
          QAfterFilterCondition>
      viajeIdExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'viajeIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
          QAfterFilterCondition>
      viajeIdExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'viajeIdExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> viajeIdExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viajeIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity,
      QAfterFilterCondition> viajeIdExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'viajeIdExterno',
        value: '',
      ));
    });
  }
}

extension ViajeCombustibleEntityQueryObject on QueryBuilder<
    ViajeCombustibleEntity, ViajeCombustibleEntity, QFilterCondition> {}

extension ViajeCombustibleEntityQueryLinks on QueryBuilder<
    ViajeCombustibleEntity, ViajeCombustibleEntity, QFilterCondition> {}

extension ViajeCombustibleEntityQuerySortBy
    on QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QSortBy> {
  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByActualizadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByActualizadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByCreadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByCreadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByDetalle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detalle', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByDetalleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detalle', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByFechaHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHora', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByFechaHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHora', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByLitros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litros', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByLitrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litros', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByMontoUSD() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoUSD', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByMontoUSDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoUSD', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByViajeIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      sortByViajeIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.desc);
    });
  }
}

extension ViajeCombustibleEntityQuerySortThenBy on QueryBuilder<
    ViajeCombustibleEntity, ViajeCombustibleEntity, QSortThenBy> {
  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByActualizadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByActualizadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByCreadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByCreadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByDetalle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detalle', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByDetalleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detalle', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByFechaHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHora', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByFechaHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHora', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByLitros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litros', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByLitrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litros', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByMontoUSD() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoUSD', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByMontoUSDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoUSD', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByViajeIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QAfterSortBy>
      thenByViajeIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.desc);
    });
  }
}

extension ViajeCombustibleEntityQueryWhereDistinct
    on QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct> {
  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByActualizadoPor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualizadoPor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByCreadoPor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creadoPor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByDetalle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detalle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByFechaHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaHora');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByIdExterno({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idExterno', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByLitros() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'litros');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByMontoUSD() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoUSD');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendienteSync');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, ViajeCombustibleEntity, QDistinct>
      distinctByViajeIdExterno({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viajeIdExterno',
          caseSensitive: caseSensitive);
    });
  }
}

extension ViajeCombustibleEntityQueryProperty on QueryBuilder<
    ViajeCombustibleEntity, ViajeCombustibleEntity, QQueryProperty> {
  QueryBuilder<ViajeCombustibleEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, String?, QQueryOperations>
      actualizadoPorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualizadoPor');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, String?, QQueryOperations>
      creadoPorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creadoPor');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, String?, QQueryOperations>
      detalleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detalle');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, DateTime, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, DateTime, QQueryOperations>
      fechaHoraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaHora');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, String, QQueryOperations>
      idExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idExterno');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, double?, QQueryOperations>
      litrosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'litros');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, double, QQueryOperations>
      montoUSDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoUSD');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, bool, QQueryOperations>
      pendienteSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendienteSync');
    });
  }

  QueryBuilder<ViajeCombustibleEntity, String, QQueryOperations>
      viajeIdExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viajeIdExterno');
    });
  }
}
