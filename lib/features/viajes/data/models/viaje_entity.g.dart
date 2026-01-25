// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viaje_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetViajeEntityCollection on Isar {
  IsarCollection<ViajeEntity> get viajeEntitys => this.collection();
}

const ViajeEntitySchema = CollectionSchema(
  name: r'ViajeEntity',
  id: 2998656743162665097,
  properties: {
    r'activo': PropertySchema(
      id: 0,
      name: r'activo',
      type: IsarType.bool,
    ),
    r'actualizadoPor': PropertySchema(
      id: 1,
      name: r'actualizadoPor',
      type: IsarType.string,
    ),
    r'clienteIdExterno': PropertySchema(
      id: 2,
      name: r'clienteIdExterno',
      type: IsarType.string,
    ),
    r'creadoPor': PropertySchema(
      id: 3,
      name: r'creadoPor',
      type: IsarType.string,
    ),
    r'descripcionDestino': PropertySchema(
      id: 4,
      name: r'descripcionDestino',
      type: IsarType.string,
    ),
    r'destinoTipo': PropertySchema(
      id: 5,
      name: r'destinoTipo',
      type: IsarType.string,
    ),
    r'empresaId': PropertySchema(
      id: 6,
      name: r'empresaId',
      type: IsarType.string,
    ),
    r'estado': PropertySchema(
      id: 7,
      name: r'estado',
      type: IsarType.string,
      enumMap: _ViajeEntityestadoEnumValueMap,
    ),
    r'fecha': PropertySchema(
      id: 8,
      name: r'fecha',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 9,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 10,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaFin': PropertySchema(
      id: 11,
      name: r'fechaFin',
      type: IsarType.dateTime,
    ),
    r'fechaInicio': PropertySchema(
      id: 12,
      name: r'fechaInicio',
      type: IsarType.dateTime,
    ),
    r'haciendaIdExterno': PropertySchema(
      id: 13,
      name: r'haciendaIdExterno',
      type: IsarType.string,
    ),
    r'idExterno': PropertySchema(
      id: 14,
      name: r'idExterno',
      type: IsarType.string,
    ),
    r'notas': PropertySchema(
      id: 15,
      name: r'notas',
      type: IsarType.string,
    ),
    r'pendienteSync': PropertySchema(
      id: 16,
      name: r'pendienteSync',
      type: IsarType.bool,
    ),
    r'tipo': PropertySchema(
      id: 17,
      name: r'tipo',
      type: IsarType.string,
      enumMap: _ViajeEntitytipoEnumValueMap,
    ),
    r'totalCajas': PropertySchema(
      id: 18,
      name: r'totalCajas',
      type: IsarType.long,
    ),
    r'totalGastoCajas': PropertySchema(
      id: 19,
      name: r'totalGastoCajas',
      type: IsarType.double,
    ),
    r'totalVentaCajas': PropertySchema(
      id: 20,
      name: r'totalVentaCajas',
      type: IsarType.double,
    ),
    r'vehiculoIdExterno': PropertySchema(
      id: 21,
      name: r'vehiculoIdExterno',
      type: IsarType.string,
    )
  },
  estimateSize: _viajeEntityEstimateSize,
  serialize: _viajeEntitySerialize,
  deserialize: _viajeEntityDeserialize,
  deserializeProp: _viajeEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'idExterno': IndexSchema(
      id: -8371681127384749097,
      name: r'idExterno',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'idExterno',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _viajeEntityGetId,
  getLinks: _viajeEntityGetLinks,
  attach: _viajeEntityAttach,
  version: '3.1.0+1',
);

int _viajeEntityEstimateSize(
  ViajeEntity object,
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
  {
    final value = object.descripcionDestino;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.destinoTipo.length * 3;
  bytesCount += 3 + object.empresaId.length * 3;
  bytesCount += 3 + object.estado.name.length * 3;
  bytesCount += 3 + object.fecha.length * 3;
  {
    final value = object.haciendaIdExterno;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.idExterno.length * 3;
  {
    final value = object.notas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tipo.name.length * 3;
  bytesCount += 3 + object.vehiculoIdExterno.length * 3;
  return bytesCount;
}

void _viajeEntitySerialize(
  ViajeEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.activo);
  writer.writeString(offsets[1], object.actualizadoPor);
  writer.writeString(offsets[2], object.clienteIdExterno);
  writer.writeString(offsets[3], object.creadoPor);
  writer.writeString(offsets[4], object.descripcionDestino);
  writer.writeString(offsets[5], object.destinoTipo);
  writer.writeString(offsets[6], object.empresaId);
  writer.writeString(offsets[7], object.estado.name);
  writer.writeString(offsets[8], object.fecha);
  writer.writeDateTime(offsets[9], object.fechaActualizacion);
  writer.writeDateTime(offsets[10], object.fechaCreacion);
  writer.writeDateTime(offsets[11], object.fechaFin);
  writer.writeDateTime(offsets[12], object.fechaInicio);
  writer.writeString(offsets[13], object.haciendaIdExterno);
  writer.writeString(offsets[14], object.idExterno);
  writer.writeString(offsets[15], object.notas);
  writer.writeBool(offsets[16], object.pendienteSync);
  writer.writeString(offsets[17], object.tipo.name);
  writer.writeLong(offsets[18], object.totalCajas);
  writer.writeDouble(offsets[19], object.totalGastoCajas);
  writer.writeDouble(offsets[20], object.totalVentaCajas);
  writer.writeString(offsets[21], object.vehiculoIdExterno);
}

ViajeEntity _viajeEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ViajeEntity();
  object.activo = reader.readBool(offsets[0]);
  object.actualizadoPor = reader.readStringOrNull(offsets[1]);
  object.clienteIdExterno = reader.readStringOrNull(offsets[2]);
  object.creadoPor = reader.readStringOrNull(offsets[3]);
  object.descripcionDestino = reader.readStringOrNull(offsets[4]);
  object.destinoTipo = reader.readString(offsets[5]);
  object.empresaId = reader.readString(offsets[6]);
  object.estado =
      _ViajeEntityestadoValueEnumMap[reader.readStringOrNull(offsets[7])] ??
          EstadoViaje.CREADO;
  object.fecha = reader.readString(offsets[8]);
  object.fechaActualizacion = reader.readDateTime(offsets[9]);
  object.fechaCreacion = reader.readDateTime(offsets[10]);
  object.fechaFin = reader.readDateTimeOrNull(offsets[11]);
  object.fechaInicio = reader.readDateTimeOrNull(offsets[12]);
  object.haciendaIdExterno = reader.readStringOrNull(offsets[13]);
  object.id = id;
  object.idExterno = reader.readString(offsets[14]);
  object.notas = reader.readStringOrNull(offsets[15]);
  object.pendienteSync = reader.readBool(offsets[16]);
  object.tipo =
      _ViajeEntitytipoValueEnumMap[reader.readStringOrNull(offsets[17])] ??
          TipoViaje.INSUMOS;
  object.totalCajas = reader.readLong(offsets[18]);
  object.totalGastoCajas = reader.readDouble(offsets[19]);
  object.totalVentaCajas = reader.readDouble(offsets[20]);
  object.vehiculoIdExterno = reader.readString(offsets[21]);
  return object;
}

P _viajeEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_ViajeEntityestadoValueEnumMap[reader.readStringOrNull(offset)] ??
          EstadoViaje.CREADO) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (_ViajeEntitytipoValueEnumMap[reader.readStringOrNull(offset)] ??
          TipoViaje.INSUMOS) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ViajeEntityestadoEnumValueMap = {
  r'CREADO': r'CREADO',
  r'EN_RUTA': r'EN_RUTA',
  r'ENTREGADO': r'ENTREGADO',
  r'ANULADO': r'ANULADO',
};
const _ViajeEntityestadoValueEnumMap = {
  r'CREADO': EstadoViaje.CREADO,
  r'EN_RUTA': EstadoViaje.EN_RUTA,
  r'ENTREGADO': EstadoViaje.ENTREGADO,
  r'ANULADO': EstadoViaje.ANULADO,
};
const _ViajeEntitytipoEnumValueMap = {
  r'INSUMOS': r'INSUMOS',
  r'CAJAS': r'CAJAS',
};
const _ViajeEntitytipoValueEnumMap = {
  r'INSUMOS': TipoViaje.INSUMOS,
  r'CAJAS': TipoViaje.CAJAS,
};

Id _viajeEntityGetId(ViajeEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _viajeEntityGetLinks(ViajeEntity object) {
  return [];
}

void _viajeEntityAttach(
    IsarCollection<dynamic> col, Id id, ViajeEntity object) {
  object.id = id;
}

extension ViajeEntityByIndex on IsarCollection<ViajeEntity> {
  Future<ViajeEntity?> getByIdExterno(String idExterno) {
    return getByIndex(r'idExterno', [idExterno]);
  }

  ViajeEntity? getByIdExternoSync(String idExterno) {
    return getByIndexSync(r'idExterno', [idExterno]);
  }

  Future<bool> deleteByIdExterno(String idExterno) {
    return deleteByIndex(r'idExterno', [idExterno]);
  }

  bool deleteByIdExternoSync(String idExterno) {
    return deleteByIndexSync(r'idExterno', [idExterno]);
  }

  Future<List<ViajeEntity?>> getAllByIdExterno(List<String> idExternoValues) {
    final values = idExternoValues.map((e) => [e]).toList();
    return getAllByIndex(r'idExterno', values);
  }

  List<ViajeEntity?> getAllByIdExternoSync(List<String> idExternoValues) {
    final values = idExternoValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idExterno', values);
  }

  Future<int> deleteAllByIdExterno(List<String> idExternoValues) {
    final values = idExternoValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idExterno', values);
  }

  int deleteAllByIdExternoSync(List<String> idExternoValues) {
    final values = idExternoValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idExterno', values);
  }

  Future<Id> putByIdExterno(ViajeEntity object) {
    return putByIndex(r'idExterno', object);
  }

  Id putByIdExternoSync(ViajeEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'idExterno', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdExterno(List<ViajeEntity> objects) {
    return putAllByIndex(r'idExterno', objects);
  }

  List<Id> putAllByIdExternoSync(List<ViajeEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idExterno', objects, saveLinks: saveLinks);
  }
}

extension ViajeEntityQueryWhereSort
    on QueryBuilder<ViajeEntity, ViajeEntity, QWhere> {
  QueryBuilder<ViajeEntity, ViajeEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ViajeEntityQueryWhere
    on QueryBuilder<ViajeEntity, ViajeEntity, QWhereClause> {
  QueryBuilder<ViajeEntity, ViajeEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterWhereClause> idExternoEqualTo(
      String idExterno) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idExterno',
        value: [idExterno],
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterWhereClause> idExternoNotEqualTo(
      String idExterno) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idExterno',
              lower: [],
              upper: [idExterno],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idExterno',
              lower: [idExterno],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idExterno',
              lower: [idExterno],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idExterno',
              lower: [],
              upper: [idExterno],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ViajeEntityQueryFilter
    on QueryBuilder<ViajeEntity, ViajeEntity, QFilterCondition> {
  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> activoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activo',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualizadoPor',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualizadoPor',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorEqualTo(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorGreaterThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorLessThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorBetween(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorStartsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorEndsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actualizadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actualizadoPor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualizadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      actualizadoPorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actualizadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clienteIdExterno',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clienteIdExterno',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoEqualTo(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoGreaterThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoLessThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoBetween(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoStartsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoEndsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clienteIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clienteIdExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clienteIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      clienteIdExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clienteIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creadoPor',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creadoPor',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorEqualTo(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorGreaterThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorLessThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorBetween(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorStartsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorEndsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'creadoPor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      creadoPorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'creadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcionDestino',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcionDestino',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcionDestino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcionDestino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcionDestino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcionDestino',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcionDestino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcionDestino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcionDestino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcionDestino',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcionDestino',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      descripcionDestinoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcionDestino',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      destinoTipoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinoTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      destinoTipoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destinoTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      destinoTipoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destinoTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      destinoTipoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destinoTipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      destinoTipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destinoTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      destinoTipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destinoTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      destinoTipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destinoTipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      destinoTipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destinoTipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      destinoTipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinoTipo',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      destinoTipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destinoTipo',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      empresaIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'empresaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      empresaIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'empresaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      empresaIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'empresaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      empresaIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'empresaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      empresaIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'empresaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      empresaIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'empresaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      empresaIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'empresaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      empresaIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'empresaId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      empresaIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'empresaId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      empresaIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'empresaId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> estadoEqualTo(
    EstadoViaje value, {
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      estadoGreaterThan(
    EstadoViaje value, {
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> estadoLessThan(
    EstadoViaje value, {
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> estadoBetween(
    EstadoViaje lower,
    EstadoViaje upper, {
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> estadoEndsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> estadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> estadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> fechaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> fechaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> fechaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fecha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> fechaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> fechaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> fechaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> fechaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fecha',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> fechaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fecha',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaActualizacionGreaterThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaActualizacionLessThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaActualizacionBetween(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaCreacionGreaterThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaCreacionLessThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaCreacionBetween(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaFinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaFin',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaFinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaFin',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> fechaFinEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaFinGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaFinLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> fechaFinBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaFin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaInicioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaInicio',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaInicioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaInicio',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaInicioEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaInicioGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaInicioLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      fechaInicioBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaInicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'haciendaIdExterno',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'haciendaIdExterno',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoEqualTo(
    String? value, {
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoGreaterThan(
    String? value, {
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoLessThan(
    String? value, {
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoStartsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoEndsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'haciendaIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'haciendaIdExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'haciendaIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      haciendaIdExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'haciendaIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      idExternoEqualTo(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      idExternoGreaterThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      idExternoLessThan(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      idExternoBetween(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      idExternoStartsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      idExternoEndsWith(
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

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      idExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      idExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      idExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      idExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> notasEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      notasGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> notasLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> notasBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> notasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> notasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> notasContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> notasMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      pendienteSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendienteSync',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> tipoEqualTo(
    TipoViaje value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> tipoGreaterThan(
    TipoViaje value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> tipoLessThan(
    TipoViaje value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> tipoBetween(
    TipoViaje lower,
    TipoViaje upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> tipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> tipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> tipoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> tipoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition> tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalCajasEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCajas',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalCajasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCajas',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalCajasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCajas',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalCajasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCajas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalGastoCajasEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalGastoCajas',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalGastoCajasGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalGastoCajas',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalGastoCajasLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalGastoCajas',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalGastoCajasBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalGastoCajas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalVentaCajasEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalVentaCajas',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalVentaCajasGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalVentaCajas',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalVentaCajasLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalVentaCajas',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      totalVentaCajasBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalVentaCajas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      vehiculoIdExternoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiculoIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      vehiculoIdExternoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehiculoIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      vehiculoIdExternoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehiculoIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      vehiculoIdExternoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehiculoIdExterno',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      vehiculoIdExternoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehiculoIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      vehiculoIdExternoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehiculoIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      vehiculoIdExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehiculoIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      vehiculoIdExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehiculoIdExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      vehiculoIdExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiculoIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterFilterCondition>
      vehiculoIdExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehiculoIdExterno',
        value: '',
      ));
    });
  }
}

extension ViajeEntityQueryObject
    on QueryBuilder<ViajeEntity, ViajeEntity, QFilterCondition> {}

extension ViajeEntityQueryLinks
    on QueryBuilder<ViajeEntity, ViajeEntity, QFilterCondition> {}

extension ViajeEntityQuerySortBy
    on QueryBuilder<ViajeEntity, ViajeEntity, QSortBy> {
  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByActualizadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByActualizadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByClienteIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByClienteIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByCreadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByCreadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByDescripcionDestino() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionDestino', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByDescripcionDestinoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionDestino', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByDestinoTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinoTipo', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByDestinoTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinoTipo', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByEmpresaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresaId', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByEmpresaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresaId', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByFechaFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByFechaInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByHaciendaIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByHaciendaIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByTotalCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCajas', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByTotalCajasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCajas', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByTotalGastoCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGastoCajas', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByTotalGastoCajasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGastoCajas', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> sortByTotalVentaCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVentaCajas', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByTotalVentaCajasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVentaCajas', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByVehiculoIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculoIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      sortByVehiculoIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculoIdExterno', Sort.desc);
    });
  }
}

extension ViajeEntityQuerySortThenBy
    on QueryBuilder<ViajeEntity, ViajeEntity, QSortThenBy> {
  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByActualizadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByActualizadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByClienteIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByClienteIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clienteIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByCreadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByCreadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByDescripcionDestino() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionDestino', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByDescripcionDestinoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionDestino', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByDestinoTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinoTipo', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByDestinoTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinoTipo', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByEmpresaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresaId', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByEmpresaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresaId', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByFechaFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByFechaInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByHaciendaIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByHaciendaIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByTotalCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCajas', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByTotalCajasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCajas', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByTotalGastoCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGastoCajas', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByTotalGastoCajasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGastoCajas', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy> thenByTotalVentaCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVentaCajas', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByTotalVentaCajasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVentaCajas', Sort.desc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByVehiculoIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculoIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QAfterSortBy>
      thenByVehiculoIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculoIdExterno', Sort.desc);
    });
  }
}

extension ViajeEntityQueryWhereDistinct
    on QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> {
  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activo');
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByActualizadoPor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualizadoPor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByClienteIdExterno(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clienteIdExterno',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByCreadoPor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creadoPor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct>
      distinctByDescripcionDestino({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcionDestino',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByDestinoTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinoTipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByEmpresaId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'empresaId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByFecha(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaFin');
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaInicio');
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByHaciendaIdExterno(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'haciendaIdExterno',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByIdExterno(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idExterno', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByNotas(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendienteSync');
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByTotalCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCajas');
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct>
      distinctByTotalGastoCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalGastoCajas');
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct>
      distinctByTotalVentaCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalVentaCajas');
    });
  }

  QueryBuilder<ViajeEntity, ViajeEntity, QDistinct> distinctByVehiculoIdExterno(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehiculoIdExterno',
          caseSensitive: caseSensitive);
    });
  }
}

extension ViajeEntityQueryProperty
    on QueryBuilder<ViajeEntity, ViajeEntity, QQueryProperty> {
  QueryBuilder<ViajeEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ViajeEntity, bool, QQueryOperations> activoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activo');
    });
  }

  QueryBuilder<ViajeEntity, String?, QQueryOperations>
      actualizadoPorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualizadoPor');
    });
  }

  QueryBuilder<ViajeEntity, String?, QQueryOperations>
      clienteIdExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clienteIdExterno');
    });
  }

  QueryBuilder<ViajeEntity, String?, QQueryOperations> creadoPorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creadoPor');
    });
  }

  QueryBuilder<ViajeEntity, String?, QQueryOperations>
      descripcionDestinoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcionDestino');
    });
  }

  QueryBuilder<ViajeEntity, String, QQueryOperations> destinoTipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinoTipo');
    });
  }

  QueryBuilder<ViajeEntity, String, QQueryOperations> empresaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'empresaId');
    });
  }

  QueryBuilder<ViajeEntity, EstadoViaje, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<ViajeEntity, String, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<ViajeEntity, DateTime, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<ViajeEntity, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ViajeEntity, DateTime?, QQueryOperations> fechaFinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaFin');
    });
  }

  QueryBuilder<ViajeEntity, DateTime?, QQueryOperations> fechaInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaInicio');
    });
  }

  QueryBuilder<ViajeEntity, String?, QQueryOperations>
      haciendaIdExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'haciendaIdExterno');
    });
  }

  QueryBuilder<ViajeEntity, String, QQueryOperations> idExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idExterno');
    });
  }

  QueryBuilder<ViajeEntity, String?, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }

  QueryBuilder<ViajeEntity, bool, QQueryOperations> pendienteSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendienteSync');
    });
  }

  QueryBuilder<ViajeEntity, TipoViaje, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<ViajeEntity, int, QQueryOperations> totalCajasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCajas');
    });
  }

  QueryBuilder<ViajeEntity, double, QQueryOperations>
      totalGastoCajasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalGastoCajas');
    });
  }

  QueryBuilder<ViajeEntity, double, QQueryOperations>
      totalVentaCajasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalVentaCajas');
    });
  }

  QueryBuilder<ViajeEntity, String, QQueryOperations>
      vehiculoIdExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehiculoIdExterno');
    });
  }
}
