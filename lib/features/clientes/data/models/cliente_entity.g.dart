// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClienteEntityCollection on Isar {
  IsarCollection<ClienteEntity> get clienteEntitys => this.collection();
}

const ClienteEntitySchema = CollectionSchema(
  name: r'ClienteEntity',
  id: -7095570591501621264,
  properties: {
    r'activo': PropertySchema(
      id: 0,
      name: r'activo',
      type: IsarType.bool,
    ),
    r'contactoCorreo': PropertySchema(
      id: 1,
      name: r'contactoCorreo',
      type: IsarType.string,
    ),
    r'contactoNombre': PropertySchema(
      id: 2,
      name: r'contactoNombre',
      type: IsarType.string,
    ),
    r'contactoTelefono': PropertySchema(
      id: 3,
      name: r'contactoTelefono',
      type: IsarType.string,
    ),
    r'direccionCiudad': PropertySchema(
      id: 4,
      name: r'direccionCiudad',
      type: IsarType.string,
    ),
    r'direccionDetalle': PropertySchema(
      id: 5,
      name: r'direccionDetalle',
      type: IsarType.string,
    ),
    r'direccionProvincia': PropertySchema(
      id: 6,
      name: r'direccionProvincia',
      type: IsarType.string,
    ),
    r'estado': PropertySchema(
      id: 7,
      name: r'estado',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 8,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 9,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'idExterno': PropertySchema(
      id: 10,
      name: r'idExterno',
      type: IsarType.string,
    ),
    r'moneda': PropertySchema(
      id: 11,
      name: r'moneda',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 12,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 13,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'pendienteSync': PropertySchema(
      id: 14,
      name: r'pendienteSync',
      type: IsarType.bool,
    ),
    r'precioActual': PropertySchema(
      id: 15,
      name: r'precioActual',
      type: IsarType.double,
    ),
    r'rucCi': PropertySchema(
      id: 16,
      name: r'rucCi',
      type: IsarType.string,
    ),
    r'saldoTotalCobrado': PropertySchema(
      id: 17,
      name: r'saldoTotalCobrado',
      type: IsarType.double,
    ),
    r'saldoTotalPorCobrar': PropertySchema(
      id: 18,
      name: r'saldoTotalPorCobrar',
      type: IsarType.double,
    ),
    r'saldoUltimaActualizacion': PropertySchema(
      id: 19,
      name: r'saldoUltimaActualizacion',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _clienteEntityEstimateSize,
  serialize: _clienteEntitySerialize,
  deserialize: _clienteEntityDeserialize,
  deserializeProp: _clienteEntityDeserializeProp,
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
    ),
    r'rucCi': IndexSchema(
      id: -2071891859989323190,
      name: r'rucCi',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'rucCi',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _clienteEntityGetId,
  getLinks: _clienteEntityGetLinks,
  attach: _clienteEntityAttach,
  version: '3.1.0+1',
);

int _clienteEntityEstimateSize(
  ClienteEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contactoCorreo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.contactoNombre.length * 3;
  bytesCount += 3 + object.contactoTelefono.length * 3;
  bytesCount += 3 + object.direccionCiudad.length * 3;
  bytesCount += 3 + object.direccionDetalle.length * 3;
  bytesCount += 3 + object.direccionProvincia.length * 3;
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.idExterno.length * 3;
  bytesCount += 3 + object.moneda.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rucCi;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _clienteEntitySerialize(
  ClienteEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.activo);
  writer.writeString(offsets[1], object.contactoCorreo);
  writer.writeString(offsets[2], object.contactoNombre);
  writer.writeString(offsets[3], object.contactoTelefono);
  writer.writeString(offsets[4], object.direccionCiudad);
  writer.writeString(offsets[5], object.direccionDetalle);
  writer.writeString(offsets[6], object.direccionProvincia);
  writer.writeString(offsets[7], object.estado);
  writer.writeDateTime(offsets[8], object.fechaActualizacion);
  writer.writeDateTime(offsets[9], object.fechaCreacion);
  writer.writeString(offsets[10], object.idExterno);
  writer.writeString(offsets[11], object.moneda);
  writer.writeString(offsets[12], object.nombre);
  writer.writeString(offsets[13], object.observaciones);
  writer.writeBool(offsets[14], object.pendienteSync);
  writer.writeDouble(offsets[15], object.precioActual);
  writer.writeString(offsets[16], object.rucCi);
  writer.writeDouble(offsets[17], object.saldoTotalCobrado);
  writer.writeDouble(offsets[18], object.saldoTotalPorCobrar);
  writer.writeDateTime(offsets[19], object.saldoUltimaActualizacion);
}

ClienteEntity _clienteEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClienteEntity();
  object.activo = reader.readBool(offsets[0]);
  object.contactoCorreo = reader.readStringOrNull(offsets[1]);
  object.contactoNombre = reader.readString(offsets[2]);
  object.contactoTelefono = reader.readString(offsets[3]);
  object.direccionCiudad = reader.readString(offsets[4]);
  object.direccionDetalle = reader.readString(offsets[5]);
  object.direccionProvincia = reader.readString(offsets[6]);
  object.estado = reader.readString(offsets[7]);
  object.fechaActualizacion = reader.readDateTime(offsets[8]);
  object.fechaCreacion = reader.readDateTime(offsets[9]);
  object.id = id;
  object.idExterno = reader.readString(offsets[10]);
  object.moneda = reader.readString(offsets[11]);
  object.nombre = reader.readString(offsets[12]);
  object.observaciones = reader.readStringOrNull(offsets[13]);
  object.pendienteSync = reader.readBool(offsets[14]);
  object.precioActual = reader.readDouble(offsets[15]);
  object.rucCi = reader.readStringOrNull(offsets[16]);
  object.saldoTotalCobrado = reader.readDouble(offsets[17]);
  object.saldoTotalPorCobrar = reader.readDouble(offsets[18]);
  object.saldoUltimaActualizacion = reader.readDateTimeOrNull(offsets[19]);
  return object;
}

P _clienteEntityDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _clienteEntityGetId(ClienteEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _clienteEntityGetLinks(ClienteEntity object) {
  return [];
}

void _clienteEntityAttach(
    IsarCollection<dynamic> col, Id id, ClienteEntity object) {
  object.id = id;
}

extension ClienteEntityByIndex on IsarCollection<ClienteEntity> {
  Future<ClienteEntity?> getByIdExterno(String idExterno) {
    return getByIndex(r'idExterno', [idExterno]);
  }

  ClienteEntity? getByIdExternoSync(String idExterno) {
    return getByIndexSync(r'idExterno', [idExterno]);
  }

  Future<bool> deleteByIdExterno(String idExterno) {
    return deleteByIndex(r'idExterno', [idExterno]);
  }

  bool deleteByIdExternoSync(String idExterno) {
    return deleteByIndexSync(r'idExterno', [idExterno]);
  }

  Future<List<ClienteEntity?>> getAllByIdExterno(List<String> idExternoValues) {
    final values = idExternoValues.map((e) => [e]).toList();
    return getAllByIndex(r'idExterno', values);
  }

  List<ClienteEntity?> getAllByIdExternoSync(List<String> idExternoValues) {
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

  Future<Id> putByIdExterno(ClienteEntity object) {
    return putByIndex(r'idExterno', object);
  }

  Id putByIdExternoSync(ClienteEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'idExterno', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdExterno(List<ClienteEntity> objects) {
    return putAllByIndex(r'idExterno', objects);
  }

  List<Id> putAllByIdExternoSync(List<ClienteEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idExterno', objects, saveLinks: saveLinks);
  }
}

extension ClienteEntityQueryWhereSort
    on QueryBuilder<ClienteEntity, ClienteEntity, QWhere> {
  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClienteEntityQueryWhere
    on QueryBuilder<ClienteEntity, ClienteEntity, QWhereClause> {
  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause>
      idExternoEqualTo(String idExterno) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idExterno',
        value: [idExterno],
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause>
      idExternoNotEqualTo(String idExterno) {
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause> rucCiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rucCi',
        value: [null],
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause>
      rucCiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'rucCi',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause> rucCiEqualTo(
      String? rucCi) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rucCi',
        value: [rucCi],
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterWhereClause> rucCiNotEqualTo(
      String? rucCi) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rucCi',
              lower: [],
              upper: [rucCi],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rucCi',
              lower: [rucCi],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rucCi',
              lower: [rucCi],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rucCi',
              lower: [],
              upper: [rucCi],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ClienteEntityQueryFilter
    on QueryBuilder<ClienteEntity, ClienteEntity, QFilterCondition> {
  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      activoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activo',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactoCorreo',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactoCorreo',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoCorreo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactoCorreo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactoCorreo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactoCorreo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactoCorreo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactoCorreo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactoCorreo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactoCorreo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoCorreo',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoCorreoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactoCorreo',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoNombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoNombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoNombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoNombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactoNombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoNombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoNombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoNombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoNombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactoNombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactoNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoTelefonoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoTelefonoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactoTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoTelefonoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactoTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoTelefonoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactoTelefono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoTelefonoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactoTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoTelefonoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactoTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoTelefonoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactoTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoTelefonoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactoTelefono',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoTelefonoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoTelefono',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      contactoTelefonoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactoTelefono',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionCiudadEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionCiudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionCiudadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direccionCiudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionCiudadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direccionCiudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionCiudadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direccionCiudad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionCiudadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direccionCiudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionCiudadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direccionCiudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionCiudadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccionCiudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionCiudadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccionCiudad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionCiudadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionCiudad',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionCiudadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccionCiudad',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionDetalleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionDetalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionDetalleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direccionDetalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionDetalleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direccionDetalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionDetalleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direccionDetalle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionDetalleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direccionDetalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionDetalleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direccionDetalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionDetalleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccionDetalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionDetalleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccionDetalle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionDetalleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionDetalle',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionDetalleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccionDetalle',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionProvinciaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionProvincia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionProvinciaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direccionProvincia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionProvinciaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direccionProvincia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionProvinciaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direccionProvincia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionProvinciaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direccionProvincia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionProvinciaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direccionProvincia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionProvinciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccionProvincia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionProvinciaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccionProvincia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionProvinciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionProvincia',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      direccionProvinciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccionProvincia',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      estadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      estadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      idExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      idExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      idExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      idExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      monedaEqualTo(
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      monedaGreaterThan(
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      monedaLessThan(
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      monedaBetween(
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      monedaStartsWith(
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      monedaEndsWith(
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

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      monedaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'moneda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      monedaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'moneda',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      monedaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moneda',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      monedaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'moneda',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      nombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'observaciones',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      pendienteSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendienteSync',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      precioActualEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioActual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      precioActualGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioActual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      precioActualLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioActual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      precioActualBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioActual',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rucCi',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rucCi',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rucCi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rucCi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rucCi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rucCi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rucCi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rucCi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rucCi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rucCi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rucCi',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      rucCiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rucCi',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoTotalCobradoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoTotalCobrado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoTotalCobradoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoTotalCobrado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoTotalCobradoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoTotalCobrado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoTotalCobradoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoTotalCobrado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoTotalPorCobrarEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoTotalPorCobrar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoTotalPorCobrarGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoTotalPorCobrar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoTotalPorCobrarLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoTotalPorCobrar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoTotalPorCobrarBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoTotalPorCobrar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoUltimaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'saldoUltimaActualizacion',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoUltimaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'saldoUltimaActualizacion',
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoUltimaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoUltimaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoUltimaActualizacionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoUltimaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoUltimaActualizacionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoUltimaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterFilterCondition>
      saldoUltimaActualizacionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoUltimaActualizacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ClienteEntityQueryObject
    on QueryBuilder<ClienteEntity, ClienteEntity, QFilterCondition> {}

extension ClienteEntityQueryLinks
    on QueryBuilder<ClienteEntity, ClienteEntity, QFilterCondition> {}

extension ClienteEntityQuerySortBy
    on QueryBuilder<ClienteEntity, ClienteEntity, QSortBy> {
  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByContactoCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoCorreo', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByContactoCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoCorreo', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByContactoNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoNombre', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByContactoNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoNombre', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByContactoTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoTelefono', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByContactoTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoTelefono', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByDireccionCiudad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionCiudad', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByDireccionCiudadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionCiudad', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByDireccionDetalle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionDetalle', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByDireccionDetalleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionDetalle', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByDireccionProvincia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionProvincia', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByDireccionProvinciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionProvincia', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByMoneda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByMonedaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByPrecioActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioActual', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortByPrecioActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioActual', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByRucCi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rucCi', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> sortByRucCiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rucCi', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortBySaldoTotalCobrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoTotalCobrado', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortBySaldoTotalCobradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoTotalCobrado', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortBySaldoTotalPorCobrar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoTotalPorCobrar', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortBySaldoTotalPorCobrarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoTotalPorCobrar', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortBySaldoUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoUltimaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      sortBySaldoUltimaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoUltimaActualizacion', Sort.desc);
    });
  }
}

extension ClienteEntityQuerySortThenBy
    on QueryBuilder<ClienteEntity, ClienteEntity, QSortThenBy> {
  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByContactoCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoCorreo', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByContactoCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoCorreo', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByContactoNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoNombre', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByContactoNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoNombre', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByContactoTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoTelefono', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByContactoTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoTelefono', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByDireccionCiudad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionCiudad', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByDireccionCiudadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionCiudad', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByDireccionDetalle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionDetalle', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByDireccionDetalleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionDetalle', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByDireccionProvincia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionProvincia', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByDireccionProvinciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionProvincia', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByMoneda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByMonedaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByPrecioActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioActual', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenByPrecioActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioActual', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByRucCi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rucCi', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy> thenByRucCiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rucCi', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenBySaldoTotalCobrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoTotalCobrado', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenBySaldoTotalCobradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoTotalCobrado', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenBySaldoTotalPorCobrar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoTotalPorCobrar', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenBySaldoTotalPorCobrarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoTotalPorCobrar', Sort.desc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenBySaldoUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoUltimaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QAfterSortBy>
      thenBySaldoUltimaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoUltimaActualizacion', Sort.desc);
    });
  }
}

extension ClienteEntityQueryWhereDistinct
    on QueryBuilder<ClienteEntity, ClienteEntity, QDistinct> {
  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct> distinctByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activo');
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctByContactoCorreo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactoCorreo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctByContactoNombre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactoNombre',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctByContactoTelefono({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactoTelefono',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctByDireccionCiudad({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccionCiudad',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctByDireccionDetalle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccionDetalle',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctByDireccionProvincia({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccionProvincia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct> distinctByIdExterno(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idExterno', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct> distinctByMoneda(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moneda', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct> distinctByObservaciones(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendienteSync');
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctByPrecioActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioActual');
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct> distinctByRucCi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rucCi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctBySaldoTotalCobrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoTotalCobrado');
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctBySaldoTotalPorCobrar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoTotalPorCobrar');
    });
  }

  QueryBuilder<ClienteEntity, ClienteEntity, QDistinct>
      distinctBySaldoUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoUltimaActualizacion');
    });
  }
}

extension ClienteEntityQueryProperty
    on QueryBuilder<ClienteEntity, ClienteEntity, QQueryProperty> {
  QueryBuilder<ClienteEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClienteEntity, bool, QQueryOperations> activoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activo');
    });
  }

  QueryBuilder<ClienteEntity, String?, QQueryOperations>
      contactoCorreoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactoCorreo');
    });
  }

  QueryBuilder<ClienteEntity, String, QQueryOperations>
      contactoNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactoNombre');
    });
  }

  QueryBuilder<ClienteEntity, String, QQueryOperations>
      contactoTelefonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactoTelefono');
    });
  }

  QueryBuilder<ClienteEntity, String, QQueryOperations>
      direccionCiudadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccionCiudad');
    });
  }

  QueryBuilder<ClienteEntity, String, QQueryOperations>
      direccionDetalleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccionDetalle');
    });
  }

  QueryBuilder<ClienteEntity, String, QQueryOperations>
      direccionProvinciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccionProvincia');
    });
  }

  QueryBuilder<ClienteEntity, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<ClienteEntity, DateTime, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<ClienteEntity, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ClienteEntity, String, QQueryOperations> idExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idExterno');
    });
  }

  QueryBuilder<ClienteEntity, String, QQueryOperations> monedaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moneda');
    });
  }

  QueryBuilder<ClienteEntity, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<ClienteEntity, String?, QQueryOperations>
      observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<ClienteEntity, bool, QQueryOperations> pendienteSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendienteSync');
    });
  }

  QueryBuilder<ClienteEntity, double, QQueryOperations> precioActualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioActual');
    });
  }

  QueryBuilder<ClienteEntity, String?, QQueryOperations> rucCiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rucCi');
    });
  }

  QueryBuilder<ClienteEntity, double, QQueryOperations>
      saldoTotalCobradoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoTotalCobrado');
    });
  }

  QueryBuilder<ClienteEntity, double, QQueryOperations>
      saldoTotalPorCobrarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoTotalPorCobrar');
    });
  }

  QueryBuilder<ClienteEntity, DateTime?, QQueryOperations>
      saldoUltimaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoUltimaActualizacion');
    });
  }
}
