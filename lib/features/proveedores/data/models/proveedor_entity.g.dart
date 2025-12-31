// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proveedor_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProveedorEntityCollection on Isar {
  IsarCollection<ProveedorEntity> get proveedorEntitys => this.collection();
}

const ProveedorEntitySchema = CollectionSchema(
  name: r'ProveedorEntity',
  id: -9109719234279725962,
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
    r'diasCredito': PropertySchema(
      id: 4,
      name: r'diasCredito',
      type: IsarType.long,
    ),
    r'direccionCiudad': PropertySchema(
      id: 5,
      name: r'direccionCiudad',
      type: IsarType.string,
    ),
    r'direccionDetalle': PropertySchema(
      id: 6,
      name: r'direccionDetalle',
      type: IsarType.string,
    ),
    r'direccionProvincia': PropertySchema(
      id: 7,
      name: r'direccionProvincia',
      type: IsarType.string,
    ),
    r'estado': PropertySchema(
      id: 8,
      name: r'estado',
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
    r'formaPago': PropertySchema(
      id: 11,
      name: r'formaPago',
      type: IsarType.string,
    ),
    r'idExterno': PropertySchema(
      id: 12,
      name: r'idExterno',
      type: IsarType.string,
    ),
    r'moneda': PropertySchema(
      id: 13,
      name: r'moneda',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 14,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'observaciones': PropertySchema(
      id: 15,
      name: r'observaciones',
      type: IsarType.string,
    ),
    r'pendienteSync': PropertySchema(
      id: 16,
      name: r'pendienteSync',
      type: IsarType.bool,
    ),
    r'precioActual': PropertySchema(
      id: 17,
      name: r'precioActual',
      type: IsarType.double,
    ),
    r'precioFormateado': PropertySchema(
      id: 18,
      name: r'precioFormateado',
      type: IsarType.string,
    ),
    r'rucCi': PropertySchema(
      id: 19,
      name: r'rucCi',
      type: IsarType.string,
    ),
    r'saldoFormateado': PropertySchema(
      id: 20,
      name: r'saldoFormateado',
      type: IsarType.string,
    ),
    r'saldoPagado': PropertySchema(
      id: 21,
      name: r'saldoPagado',
      type: IsarType.double,
    ),
    r'saldoPorPagar': PropertySchema(
      id: 22,
      name: r'saldoPorPagar',
      type: IsarType.double,
    ),
    r'tipo': PropertySchema(
      id: 23,
      name: r'tipo',
      type: IsarType.string,
    )
  },
  estimateSize: _proveedorEntityEstimateSize,
  serialize: _proveedorEntitySerialize,
  deserialize: _proveedorEntityDeserialize,
  deserializeProp: _proveedorEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'idExterno': IndexSchema(
      id: -8371681127384749097,
      name: r'idExterno',
      unique: true,
      replace: false,
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
  getId: _proveedorEntityGetId,
  getLinks: _proveedorEntityGetLinks,
  attach: _proveedorEntityAttach,
  version: '3.1.0+1',
);

int _proveedorEntityEstimateSize(
  ProveedorEntity object,
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
  {
    final value = object.formaPago;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.idExterno.length * 3;
  bytesCount += 3 + object.moneda.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.observaciones;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.precioFormateado.length * 3;
  {
    final value = object.rucCi;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.saldoFormateado.length * 3;
  bytesCount += 3 + object.tipo.length * 3;
  return bytesCount;
}

void _proveedorEntitySerialize(
  ProveedorEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.activo);
  writer.writeString(offsets[1], object.contactoCorreo);
  writer.writeString(offsets[2], object.contactoNombre);
  writer.writeString(offsets[3], object.contactoTelefono);
  writer.writeLong(offsets[4], object.diasCredito);
  writer.writeString(offsets[5], object.direccionCiudad);
  writer.writeString(offsets[6], object.direccionDetalle);
  writer.writeString(offsets[7], object.direccionProvincia);
  writer.writeString(offsets[8], object.estado);
  writer.writeDateTime(offsets[9], object.fechaActualizacion);
  writer.writeDateTime(offsets[10], object.fechaCreacion);
  writer.writeString(offsets[11], object.formaPago);
  writer.writeString(offsets[12], object.idExterno);
  writer.writeString(offsets[13], object.moneda);
  writer.writeString(offsets[14], object.nombre);
  writer.writeString(offsets[15], object.observaciones);
  writer.writeBool(offsets[16], object.pendienteSync);
  writer.writeDouble(offsets[17], object.precioActual);
  writer.writeString(offsets[18], object.precioFormateado);
  writer.writeString(offsets[19], object.rucCi);
  writer.writeString(offsets[20], object.saldoFormateado);
  writer.writeDouble(offsets[21], object.saldoPagado);
  writer.writeDouble(offsets[22], object.saldoPorPagar);
  writer.writeString(offsets[23], object.tipo);
}

ProveedorEntity _proveedorEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProveedorEntity();
  object.activo = reader.readBool(offsets[0]);
  object.contactoCorreo = reader.readStringOrNull(offsets[1]);
  object.contactoNombre = reader.readString(offsets[2]);
  object.contactoTelefono = reader.readString(offsets[3]);
  object.diasCredito = reader.readLongOrNull(offsets[4]);
  object.direccionCiudad = reader.readString(offsets[5]);
  object.direccionDetalle = reader.readString(offsets[6]);
  object.direccionProvincia = reader.readString(offsets[7]);
  object.estado = reader.readString(offsets[8]);
  object.fechaActualizacion = reader.readDateTime(offsets[9]);
  object.fechaCreacion = reader.readDateTime(offsets[10]);
  object.formaPago = reader.readStringOrNull(offsets[11]);
  object.id = id;
  object.idExterno = reader.readString(offsets[12]);
  object.moneda = reader.readString(offsets[13]);
  object.nombre = reader.readString(offsets[14]);
  object.observaciones = reader.readStringOrNull(offsets[15]);
  object.pendienteSync = reader.readBool(offsets[16]);
  object.precioActual = reader.readDouble(offsets[17]);
  object.rucCi = reader.readStringOrNull(offsets[19]);
  object.saldoPagado = reader.readDouble(offsets[21]);
  object.saldoPorPagar = reader.readDouble(offsets[22]);
  object.tipo = reader.readString(offsets[23]);
  return object;
}

P _proveedorEntityDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _proveedorEntityGetId(ProveedorEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _proveedorEntityGetLinks(ProveedorEntity object) {
  return [];
}

void _proveedorEntityAttach(
    IsarCollection<dynamic> col, Id id, ProveedorEntity object) {
  object.id = id;
}

extension ProveedorEntityByIndex on IsarCollection<ProveedorEntity> {
  Future<ProveedorEntity?> getByIdExterno(String idExterno) {
    return getByIndex(r'idExterno', [idExterno]);
  }

  ProveedorEntity? getByIdExternoSync(String idExterno) {
    return getByIndexSync(r'idExterno', [idExterno]);
  }

  Future<bool> deleteByIdExterno(String idExterno) {
    return deleteByIndex(r'idExterno', [idExterno]);
  }

  bool deleteByIdExternoSync(String idExterno) {
    return deleteByIndexSync(r'idExterno', [idExterno]);
  }

  Future<List<ProveedorEntity?>> getAllByIdExterno(
      List<String> idExternoValues) {
    final values = idExternoValues.map((e) => [e]).toList();
    return getAllByIndex(r'idExterno', values);
  }

  List<ProveedorEntity?> getAllByIdExternoSync(List<String> idExternoValues) {
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

  Future<Id> putByIdExterno(ProveedorEntity object) {
    return putByIndex(r'idExterno', object);
  }

  Id putByIdExternoSync(ProveedorEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'idExterno', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdExterno(List<ProveedorEntity> objects) {
    return putAllByIndex(r'idExterno', objects);
  }

  List<Id> putAllByIdExternoSync(List<ProveedorEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idExterno', objects, saveLinks: saveLinks);
  }
}

extension ProveedorEntityQueryWhereSort
    on QueryBuilder<ProveedorEntity, ProveedorEntity, QWhere> {
  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProveedorEntityQueryWhere
    on QueryBuilder<ProveedorEntity, ProveedorEntity, QWhereClause> {
  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterWhereClause>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterWhereClause>
      idExternoEqualTo(String idExterno) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idExterno',
        value: [idExterno],
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterWhereClause>
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
}

extension ProveedorEntityQueryFilter
    on QueryBuilder<ProveedorEntity, ProveedorEntity, QFilterCondition> {
  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      activoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activo',
        value: value,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoCorreoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactoCorreo',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoCorreoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactoCorreo',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoCorreoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactoCorreo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoCorreoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactoCorreo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoCorreoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoCorreo',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoCorreoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactoCorreo',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoNombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoNombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactoNombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactoNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoTelefonoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactoTelefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoTelefonoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactoTelefono',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoTelefonoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactoTelefono',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      contactoTelefonoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactoTelefono',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      diasCreditoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'diasCredito',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      diasCreditoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'diasCredito',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      diasCreditoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diasCredito',
        value: value,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      diasCreditoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diasCredito',
        value: value,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      diasCreditoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diasCredito',
        value: value,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      diasCreditoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diasCredito',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionCiudadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccionCiudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionCiudadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccionCiudad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionCiudadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionCiudad',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionCiudadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccionCiudad',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionDetalleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccionDetalle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionDetalleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccionDetalle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionDetalleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionDetalle',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionDetalleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccionDetalle',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionProvinciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccionProvincia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionProvinciaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccionProvincia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionProvinciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccionProvincia',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      direccionProvinciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccionProvincia',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      estadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      estadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'formaPago',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'formaPago',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formaPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formaPago',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formaPago',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formaPago',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      formaPagoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formaPago',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      idExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      idExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      idExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      idExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      monedaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'moneda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      monedaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'moneda',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      monedaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moneda',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      monedaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'moneda',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      nombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      observacionesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      observacionesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observaciones',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      observacionesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      observacionesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      observacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      observacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      pendienteSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendienteSync',
        value: value,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      precioFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      precioFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      precioFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      precioFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precioFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      precioFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      precioFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      precioFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'precioFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      precioFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'precioFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      precioFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precioFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      precioFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'precioFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      rucCiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rucCi',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      rucCiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rucCi',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      rucCiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rucCi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      rucCiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rucCi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      rucCiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rucCi',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      rucCiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rucCi',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoFormateadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoFormateadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoFormateadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoFormateadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoFormateado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoFormateadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'saldoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoFormateadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'saldoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoFormateadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'saldoFormateado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoFormateadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'saldoFormateado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoFormateadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoFormateadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'saldoFormateado',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoPagadoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoPagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoPagadoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoPagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoPagadoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoPagado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoPagadoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoPagado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoPorPagarEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoPorPagar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoPorPagarGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoPorPagar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoPorPagarLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoPorPagar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      saldoPorPagarBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoPorPagar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      tipoEqualTo(
    String value, {
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      tipoGreaterThan(
    String value, {
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      tipoLessThan(
    String value, {
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      tipoBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      tipoStartsWith(
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      tipoEndsWith(
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

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      tipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterFilterCondition>
      tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }
}

extension ProveedorEntityQueryObject
    on QueryBuilder<ProveedorEntity, ProveedorEntity, QFilterCondition> {}

extension ProveedorEntityQueryLinks
    on QueryBuilder<ProveedorEntity, ProveedorEntity, QFilterCondition> {}

extension ProveedorEntityQuerySortBy
    on QueryBuilder<ProveedorEntity, ProveedorEntity, QSortBy> {
  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> sortByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByContactoCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoCorreo', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByContactoCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoCorreo', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByContactoNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoNombre', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByContactoNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoNombre', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByContactoTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoTelefono', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByContactoTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoTelefono', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByDiasCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasCredito', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByDiasCreditoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasCredito', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByDireccionCiudad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionCiudad', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByDireccionCiudadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionCiudad', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByDireccionDetalle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionDetalle', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByDireccionDetalleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionDetalle', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByDireccionProvincia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionProvincia', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByDireccionProvinciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionProvincia', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByFormaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formaPago', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByFormaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formaPago', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> sortByMoneda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByMonedaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByPrecioActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioActual', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByPrecioActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioActual', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByPrecioFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioFormateado', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByPrecioFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioFormateado', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> sortByRucCi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rucCi', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByRucCiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rucCi', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortBySaldoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFormateado', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortBySaldoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFormateado', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortBySaldoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPagado', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortBySaldoPagadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPagado', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortBySaldoPorPagar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPorPagar', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortBySaldoPorPagarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPorPagar', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension ProveedorEntityQuerySortThenBy
    on QueryBuilder<ProveedorEntity, ProveedorEntity, QSortThenBy> {
  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> thenByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByContactoCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoCorreo', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByContactoCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoCorreo', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByContactoNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoNombre', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByContactoNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoNombre', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByContactoTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoTelefono', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByContactoTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactoTelefono', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByDiasCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasCredito', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByDiasCreditoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasCredito', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByDireccionCiudad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionCiudad', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByDireccionCiudadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionCiudad', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByDireccionDetalle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionDetalle', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByDireccionDetalleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionDetalle', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByDireccionProvincia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionProvincia', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByDireccionProvinciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccionProvincia', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByFormaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formaPago', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByFormaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formaPago', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> thenByMoneda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByMonedaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneda', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByObservaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByObservacionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observaciones', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByPrecioActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioActual', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByPrecioActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioActual', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByPrecioFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioFormateado', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByPrecioFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precioFormateado', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> thenByRucCi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rucCi', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByRucCiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rucCi', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenBySaldoFormateado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFormateado', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenBySaldoFormateadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoFormateado', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenBySaldoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPagado', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenBySaldoPagadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPagado', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenBySaldoPorPagar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPorPagar', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenBySaldoPorPagarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoPorPagar', Sort.desc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QAfterSortBy>
      thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension ProveedorEntityQueryWhereDistinct
    on QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct> {
  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct> distinctByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activo');
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByContactoCorreo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactoCorreo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByContactoNombre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactoNombre',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByContactoTelefono({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactoTelefono',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByDiasCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasCredito');
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByDireccionCiudad({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccionCiudad',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByDireccionDetalle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccionDetalle',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByDireccionProvincia({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccionProvincia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct> distinctByFormaPago(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formaPago', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct> distinctByIdExterno(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idExterno', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct> distinctByMoneda(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moneda', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByObservaciones({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observaciones',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendienteSync');
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByPrecioActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioActual');
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctByPrecioFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precioFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct> distinctByRucCi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rucCi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctBySaldoFormateado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoFormateado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctBySaldoPagado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoPagado');
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct>
      distinctBySaldoPorPagar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoPorPagar');
    });
  }

  QueryBuilder<ProveedorEntity, ProveedorEntity, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension ProveedorEntityQueryProperty
    on QueryBuilder<ProveedorEntity, ProveedorEntity, QQueryProperty> {
  QueryBuilder<ProveedorEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProveedorEntity, bool, QQueryOperations> activoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activo');
    });
  }

  QueryBuilder<ProveedorEntity, String?, QQueryOperations>
      contactoCorreoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactoCorreo');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations>
      contactoNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactoNombre');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations>
      contactoTelefonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactoTelefono');
    });
  }

  QueryBuilder<ProveedorEntity, int?, QQueryOperations> diasCreditoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasCredito');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations>
      direccionCiudadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccionCiudad');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations>
      direccionDetalleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccionDetalle');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations>
      direccionProvinciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccionProvincia');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<ProveedorEntity, DateTime, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<ProveedorEntity, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ProveedorEntity, String?, QQueryOperations> formaPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formaPago');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations> idExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idExterno');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations> monedaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moneda');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<ProveedorEntity, String?, QQueryOperations>
      observacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observaciones');
    });
  }

  QueryBuilder<ProveedorEntity, bool, QQueryOperations>
      pendienteSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendienteSync');
    });
  }

  QueryBuilder<ProveedorEntity, double, QQueryOperations>
      precioActualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioActual');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations>
      precioFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precioFormateado');
    });
  }

  QueryBuilder<ProveedorEntity, String?, QQueryOperations> rucCiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rucCi');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations>
      saldoFormateadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoFormateado');
    });
  }

  QueryBuilder<ProveedorEntity, double, QQueryOperations>
      saldoPagadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoPagado');
    });
  }

  QueryBuilder<ProveedorEntity, double, QQueryOperations>
      saldoPorPagarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoPorPagar');
    });
  }

  QueryBuilder<ProveedorEntity, String, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}
