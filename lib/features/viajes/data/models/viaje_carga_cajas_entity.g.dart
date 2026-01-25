// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viaje_carga_cajas_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetViajeCargaCajasEntityCollection on Isar {
  IsarCollection<ViajeCargaCajasEntity> get viajeCargaCajasEntitys =>
      this.collection();
}

const ViajeCargaCajasEntitySchema = CollectionSchema(
  name: r'ViajeCargaCajasEntity',
  id: 2815721127494886467,
  properties: {
    r'actualizadoPor': PropertySchema(
      id: 0,
      name: r'actualizadoPor',
      type: IsarType.string,
    ),
    r'cantidadCajas': PropertySchema(
      id: 1,
      name: r'cantidadCajas',
      type: IsarType.long,
    ),
    r'clienteIdExterno': PropertySchema(
      id: 2,
      name: r'clienteIdExterno',
      type: IsarType.string,
    ),
    r'costoCompraUnitario': PropertySchema(
      id: 3,
      name: r'costoCompraUnitario',
      type: IsarType.double,
    ),
    r'creadoPor': PropertySchema(
      id: 4,
      name: r'creadoPor',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 5,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 6,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'haciendaIdExterno': PropertySchema(
      id: 7,
      name: r'haciendaIdExterno',
      type: IsarType.string,
    ),
    r'idExterno': PropertySchema(
      id: 8,
      name: r'idExterno',
      type: IsarType.string,
    ),
    r'moneda': PropertySchema(
      id: 9,
      name: r'moneda',
      type: IsarType.string,
    ),
    r'pendienteSync': PropertySchema(
      id: 10,
      name: r'pendienteSync',
      type: IsarType.bool,
    ),
    r'precioVentaUnitario': PropertySchema(
      id: 11,
      name: r'precioVentaUnitario',
      type: IsarType.double,
    ),
    r'proveedorIdExterno': PropertySchema(
      id: 12,
      name: r'proveedorIdExterno',
      type: IsarType.string,
    ),
    r'totalCompra': PropertySchema(
      id: 13,
      name: r'totalCompra',
      type: IsarType.double,
    ),
    r'totalVenta': PropertySchema(
      id: 14,
      name: r'totalVenta',
      type: IsarType.double,
    ),
    r'utilidadBruta': PropertySchema(
      id: 15,
      name: r'utilidadBruta',
      type: IsarType.double,
    ),
    r'viajeIdExterno': PropertySchema(
      id: 16,
      name: r'viajeIdExterno',
      type: IsarType.string,
    )
  },
  estimateSize: _viajeCargaCajasEntityEstimateSize,
  serialize: _viajeCargaCajasEntitySerialize,
  deserialize: _viajeCargaCajasEntityDeserialize,
  deserializeProp: _viajeCargaCajasEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _viajeCargaCajasEntityGetId,
  getLinks: _viajeCargaCajasEntityGetLinks,
  attach: _viajeCargaCajasEntityAttach,
  version: '3.1.0+1',
);

int _viajeCargaCajasEntityEstimateSize(
  ViajeCargaCajasEntity object,
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
    final value = object.clienteIdExterno;
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
  bytesCount += 3 + object.haciendaIdExterno.length * 3;
  bytesCount += 3 + object.idExterno.length * 3;
  bytesCount += 3 + object.moneda.length * 3;
  bytesCount += 3 + object.proveedorIdExterno.length * 3;
  bytesCount += 3 + object.viajeIdExterno.length * 3;
  return bytesCount;
}

void _viajeCargaCajasEntitySerialize(
  ViajeCargaCajasEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actualizadoPor);
  writer.writeLong(offsets[1], object.cantidadCajas);
  writer.writeString(offsets[2], object.clienteIdExterno);
  writer.writeDouble(offsets[3], object.costoCompraUnitario);
  writer.writeString(offsets[4], object.creadoPor);
  writer.writeDateTime(offsets[5], object.fechaActualizacion);
  writer.writeDateTime(offsets[6], object.fechaCreacion);
  writer.writeString(offsets[7], object.haciendaIdExterno);
  writer.writeString(offsets[8], object.idExterno);
  writer.writeString(offsets[9], object.moneda);
  writer.writeBool(offsets[10], object.pendienteSync);
  writer.writeDouble(offsets[11], object.precioVentaUnitario);
  writer.writeString(offsets[12], object.proveedorIdExterno);
  writer.writeDouble(offsets[13], object.totalCompra);
  writer.writeDouble(offsets[14], object.totalVenta);
  writer.writeDouble(offsets[15], object.utilidadBruta);
  writer.writeString(offsets[16], object.viajeIdExterno);
}

ViajeCargaCajasEntity _viajeCargaCajasEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ViajeCargaCajasEntity();
  object.actualizadoPor = reader.readStringOrNull(offsets[0]);
  object.cantidadCajas = reader.readLong(offsets[1]);
  object.clienteIdExterno = reader.readStringOrNull(offsets[2]);
  object.costoCompraUnitario = reader.readDouble(offsets[3]);
  object.creadoPor = reader.readStringOrNull(offsets[4]);
  object.fechaActualizacion = reader.readDateTime(offsets[5]);
  object.fechaCreacion = reader.readDateTime(offsets[6]);
  object.haciendaIdExterno = reader.readString(offsets[7]);
  object.id = id;
  object.idExterno = reader.readString(offsets[8]);
  object.moneda = reader.readString(offsets[9]);
  object.pendienteSync = reader.readBool(offsets[10]);
  object.precioVentaUnitario = reader.readDoubleOrNull(offsets[11]);
  object.proveedorIdExterno = reader.readString(offsets[12]);
  object.totalCompra = reader.readDouble(offsets[13]);
  object.totalVenta = reader.readDoubleOrNull(offsets[14]);
  object.utilidadBruta = reader.readDoubleOrNull(offsets[15]);
  object.viajeIdExterno = reader.readString(offsets[16]);
  return object;
}

P _viajeCargaCajasEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _viajeCargaCajasEntityGetId(ViajeCargaCajasEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _viajeCargaCajasEntityGetLinks(
    ViajeCargaCajasEntity object) {
  return [];
}

void _viajeCargaCajasEntityAttach(
    IsarCollection<dynamic> col, Id id, ViajeCargaCajasEntity object) {
  object.id = id;
}

extension ViajeCargaCajasEntityQueryWhereSort
    on QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QWhere> {
  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ViajeCargaCajasEntityQueryWhere on QueryBuilder<ViajeCargaCajasEntity,
    ViajeCargaCajasEntity, QWhereClause> {
  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterWhereClause>
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterWhereClause>
      idBetween(
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

extension ViajeCargaCajasEntityQueryFilter on QueryBuilder<
    ViajeCargaCajasEntity, ViajeCargaCajasEntity, QFilterCondition> {
  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> actualizadoPorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualizadoPor',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> actualizadoPorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualizadoPor',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> actualizadoPorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualizadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> actualizadoPorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actualizadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> cantidadCajasEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidadCajas',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> cantidadCajasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cantidadCajas',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> cantidadCajasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cantidadCajas',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> cantidadCajasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cantidadCajas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> clienteIdExternoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clienteIdExterno',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> clienteIdExternoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clienteIdExterno',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> clienteIdExternoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> clienteIdExternoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clienteIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> clienteIdExternoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clienteIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> clienteIdExternoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clienteIdExterno',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> clienteIdExternoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clienteIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> clienteIdExternoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clienteIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
          QAfterFilterCondition>
      clienteIdExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clienteIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
          QAfterFilterCondition>
      clienteIdExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clienteIdExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> clienteIdExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> clienteIdExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clienteIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> costoCompraUnitarioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'costoCompraUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> costoCompraUnitarioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'costoCompraUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> costoCompraUnitarioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'costoCompraUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> costoCompraUnitarioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'costoCompraUnitario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> creadoPorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creadoPor',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> creadoPorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creadoPor',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> creadoPorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> creadoPorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'creadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> fechaActualizacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> haciendaIdExternoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'haciendaIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> haciendaIdExternoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'haciendaIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> haciendaIdExternoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'haciendaIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> haciendaIdExternoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'haciendaIdExterno',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> haciendaIdExternoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'haciendaIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> haciendaIdExternoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'haciendaIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
          QAfterFilterCondition>
      haciendaIdExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'haciendaIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
          QAfterFilterCondition>
      haciendaIdExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'haciendaIdExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> haciendaIdExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'haciendaIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> haciendaIdExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'haciendaIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> idExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> idExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> monedaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moneda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> monedaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'moneda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> monedaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'moneda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> monedaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'moneda',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> monedaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'moneda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> monedaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'moneda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
          QAfterFilterCondition>
      monedaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'moneda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
          QAfterFilterCondition>
      monedaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'moneda',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> monedaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moneda',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> monedaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'moneda',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> pendienteSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendienteSync',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> precioVentaUnitarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precioVentaUnitario',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> precioVentaUnitarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precioVentaUnitario',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> precioVentaUnitarioEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioVentaUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> precioVentaUnitarioGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioVentaUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> precioVentaUnitarioLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioVentaUnitario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> precioVentaUnitarioBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioVentaUnitario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> proveedorIdExternoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedorIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> proveedorIdExternoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proveedorIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> proveedorIdExternoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proveedorIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> proveedorIdExternoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proveedorIdExterno',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> proveedorIdExternoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'proveedorIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> proveedorIdExternoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'proveedorIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
          QAfterFilterCondition>
      proveedorIdExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'proveedorIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
          QAfterFilterCondition>
      proveedorIdExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'proveedorIdExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> proveedorIdExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proveedorIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> proveedorIdExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'proveedorIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> totalCompraEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCompra',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> totalCompraGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCompra',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> totalCompraLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCompra',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> totalCompraBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCompra',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> totalVentaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalVenta',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> totalVentaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalVenta',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> totalVentaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalVenta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> totalVentaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalVenta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> totalVentaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalVenta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> totalVentaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalVenta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> utilidadBrutaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'utilidadBruta',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> utilidadBrutaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'utilidadBruta',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> utilidadBrutaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'utilidadBruta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> utilidadBrutaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'utilidadBruta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> utilidadBrutaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'utilidadBruta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> utilidadBrutaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'utilidadBruta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
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

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> viajeIdExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viajeIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity,
      QAfterFilterCondition> viajeIdExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'viajeIdExterno',
        value: '',
      ));
    });
  }
}

extension ViajeCargaCajasEntityQueryObject on QueryBuilder<
    ViajeCargaCajasEntity, ViajeCargaCajasEntity, QFilterCondition> {}

extension ViajeCargaCajasEntityQueryLinks on QueryBuilder<ViajeCargaCajasEntity,
    ViajeCargaCajasEntity, QFilterCondition> {}

extension ViajeCargaCajasEntityQuerySortBy
    on QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QSortBy> {
  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByActualizadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByActualizadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByCantidadCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadCajas', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByCantidadCajasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadCajas', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByClienteIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByClienteIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByCostoCompraUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costoCompraUnitario', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByCostoCompraUnitarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costoCompraUnitario', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByCreadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByCreadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByHaciendaIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByHaciendaIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByMoneda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByMonedaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByPrecioVentaUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioVentaUnitario', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByPrecioVentaUnitarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioVentaUnitario', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByProveedorIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByProveedorIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByTotalCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompra', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByTotalCompraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompra', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByTotalVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVenta', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByTotalVentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVenta', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByUtilidadBruta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utilidadBruta', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByUtilidadBrutaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utilidadBruta', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByViajeIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      sortByViajeIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.desc);
    });
  }
}

extension ViajeCargaCajasEntityQuerySortThenBy
    on QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QSortThenBy> {
  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByActualizadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByActualizadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByCantidadCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadCajas', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByCantidadCajasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadCajas', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByClienteIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByClienteIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByCostoCompraUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costoCompraUnitario', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByCostoCompraUnitarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costoCompraUnitario', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByCreadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByCreadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByHaciendaIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByHaciendaIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByMoneda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByMonedaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByPrecioVentaUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioVentaUnitario', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByPrecioVentaUnitarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioVentaUnitario', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByProveedorIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByProveedorIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proveedorIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByTotalCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompra', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByTotalCompraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompra', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByTotalVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVenta', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByTotalVentaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVenta', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByUtilidadBruta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utilidadBruta', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByUtilidadBrutaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utilidadBruta', Sort.desc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByViajeIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QAfterSortBy>
      thenByViajeIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.desc);
    });
  }
}

extension ViajeCargaCajasEntityQueryWhereDistinct
    on QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct> {
  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByActualizadoPor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualizadoPor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByCantidadCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cantidadCajas');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByClienteIdExterno({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteIdExterno',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByCostoCompraUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'costoCompraUnitario');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByCreadoPor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creadoPor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByHaciendaIdExterno({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'haciendaIdExterno',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByIdExterno({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idExterno', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByMoneda({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moneda', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendienteSync');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByPrecioVentaUnitario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioVentaUnitario');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByProveedorIdExterno({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proveedorIdExterno',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByTotalCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCompra');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByTotalVenta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalVenta');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByUtilidadBruta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'utilidadBruta');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, ViajeCargaCajasEntity, QDistinct>
      distinctByViajeIdExterno({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viajeIdExterno',
          caseSensitive: caseSensitive);
    });
  }
}

extension ViajeCargaCajasEntityQueryProperty on QueryBuilder<
    ViajeCargaCajasEntity, ViajeCargaCajasEntity, QQueryProperty> {
  QueryBuilder<ViajeCargaCajasEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, String?, QQueryOperations>
      actualizadoPorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualizadoPor');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, int, QQueryOperations>
      cantidadCajasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cantidadCajas');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, String?, QQueryOperations>
      clienteIdExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteIdExterno');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, double, QQueryOperations>
      costoCompraUnitarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'costoCompraUnitario');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, String?, QQueryOperations>
      creadoPorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creadoPor');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, DateTime, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, String, QQueryOperations>
      haciendaIdExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'haciendaIdExterno');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, String, QQueryOperations>
      idExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idExterno');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, String, QQueryOperations>
      monedaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moneda');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, bool, QQueryOperations>
      pendienteSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendienteSync');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, double?, QQueryOperations>
      precioVentaUnitarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioVentaUnitario');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, String, QQueryOperations>
      proveedorIdExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proveedorIdExterno');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, double, QQueryOperations>
      totalCompraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCompra');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, double?, QQueryOperations>
      totalVentaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalVenta');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, double?, QQueryOperations>
      utilidadBrutaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'utilidadBruta');
    });
  }

  QueryBuilder<ViajeCargaCajasEntity, String, QQueryOperations>
      viajeIdExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viajeIdExterno');
    });
  }
}
