// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiculo_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVehiculoEntityCollection on Isar {
  IsarCollection<VehiculoEntity> get vehiculoEntitys => this.collection();
}

const VehiculoEntitySchema = CollectionSchema(
  name: r'VehiculoEntity',
  id: 8126668270339291112,
  properties: {
    r'activo': PropertySchema(
      id: 0,
      name: r'activo',
      type: IsarType.bool,
    ),
    r'anio': PropertySchema(
      id: 1,
      name: r'anio',
      type: IsarType.long,
    ),
    r'capacidadCajas': PropertySchema(
      id: 2,
      name: r'capacidadCajas',
      type: IsarType.long,
    ),
    r'color': PropertySchema(
      id: 3,
      name: r'color',
      type: IsarType.string,
    ),
    r'conductorAsignado': PropertySchema(
      id: 4,
      name: r'conductorAsignado',
      type: IsarType.string,
    ),
    r'conductorAsignadoNombre': PropertySchema(
      id: 5,
      name: r'conductorAsignadoNombre',
      type: IsarType.string,
    ),
    r'estado': PropertySchema(
      id: 6,
      name: r'estado',
      type: IsarType.string,
    ),
    r'fechaActualizacion': PropertySchema(
      id: 7,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 8,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'idExterno': PropertySchema(
      id: 9,
      name: r'idExterno',
      type: IsarType.string,
    ),
    r'kilometrajeActual': PropertySchema(
      id: 10,
      name: r'kilometrajeActual',
      type: IsarType.long,
    ),
    r'marca': PropertySchema(
      id: 11,
      name: r'marca',
      type: IsarType.string,
    ),
    r'modelo': PropertySchema(
      id: 12,
      name: r'modelo',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 13,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'pendienteSync': PropertySchema(
      id: 14,
      name: r'pendienteSync',
      type: IsarType.bool,
    ),
    r'placa': PropertySchema(
      id: 15,
      name: r'placa',
      type: IsarType.string,
    ),
    r'tipo': PropertySchema(
      id: 16,
      name: r'tipo',
      type: IsarType.string,
    )
  },
  estimateSize: _vehiculoEntityEstimateSize,
  serialize: _vehiculoEntitySerialize,
  deserialize: _vehiculoEntityDeserialize,
  deserializeProp: _vehiculoEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _vehiculoEntityGetId,
  getLinks: _vehiculoEntityGetLinks,
  attach: _vehiculoEntityAttach,
  version: '3.1.0+1',
);

int _vehiculoEntityEstimateSize(
  VehiculoEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.color;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.conductorAsignado;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.conductorAsignadoNombre;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.estado;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.idExterno.length * 3;
  bytesCount += 3 + object.marca.length * 3;
  bytesCount += 3 + object.modelo.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.placa.length * 3;
  bytesCount += 3 + object.tipo.length * 3;
  return bytesCount;
}

void _vehiculoEntitySerialize(
  VehiculoEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.activo);
  writer.writeLong(offsets[1], object.anio);
  writer.writeLong(offsets[2], object.capacidadCajas);
  writer.writeString(offsets[3], object.color);
  writer.writeString(offsets[4], object.conductorAsignado);
  writer.writeString(offsets[5], object.conductorAsignadoNombre);
  writer.writeString(offsets[6], object.estado);
  writer.writeDateTime(offsets[7], object.fechaActualizacion);
  writer.writeDateTime(offsets[8], object.fechaCreacion);
  writer.writeString(offsets[9], object.idExterno);
  writer.writeLong(offsets[10], object.kilometrajeActual);
  writer.writeString(offsets[11], object.marca);
  writer.writeString(offsets[12], object.modelo);
  writer.writeString(offsets[13], object.nombre);
  writer.writeBool(offsets[14], object.pendienteSync);
  writer.writeString(offsets[15], object.placa);
  writer.writeString(offsets[16], object.tipo);
}

VehiculoEntity _vehiculoEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VehiculoEntity();
  object.activo = reader.readBool(offsets[0]);
  object.anio = reader.readLongOrNull(offsets[1]);
  object.capacidadCajas = reader.readLongOrNull(offsets[2]);
  object.color = reader.readStringOrNull(offsets[3]);
  object.conductorAsignado = reader.readStringOrNull(offsets[4]);
  object.conductorAsignadoNombre = reader.readStringOrNull(offsets[5]);
  object.estado = reader.readStringOrNull(offsets[6]);
  object.fechaActualizacion = reader.readDateTime(offsets[7]);
  object.fechaCreacion = reader.readDateTime(offsets[8]);
  object.id = id;
  object.idExterno = reader.readString(offsets[9]);
  object.kilometrajeActual = reader.readLongOrNull(offsets[10]);
  object.marca = reader.readString(offsets[11]);
  object.modelo = reader.readString(offsets[12]);
  object.nombre = reader.readString(offsets[13]);
  object.pendienteSync = reader.readBool(offsets[14]);
  object.placa = reader.readString(offsets[15]);
  object.tipo = reader.readString(offsets[16]);
  return object;
}

P _vehiculoEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vehiculoEntityGetId(VehiculoEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vehiculoEntityGetLinks(VehiculoEntity object) {
  return [];
}

void _vehiculoEntityAttach(
    IsarCollection<dynamic> col, Id id, VehiculoEntity object) {
  object.id = id;
}

extension VehiculoEntityQueryWhereSort
    on QueryBuilder<VehiculoEntity, VehiculoEntity, QWhere> {
  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VehiculoEntityQueryWhere
    on QueryBuilder<VehiculoEntity, VehiculoEntity, QWhereClause> {
  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterWhereClause> idBetween(
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

extension VehiculoEntityQueryFilter
    on QueryBuilder<VehiculoEntity, VehiculoEntity, QFilterCondition> {
  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      activoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activo',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      anioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'anio',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      anioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'anio',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      anioEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anio',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      anioGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'anio',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      anioLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'anio',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      anioBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'anio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      capacidadCajasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'capacidadCajas',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      capacidadCajasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'capacidadCajas',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      capacidadCajasEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacidadCajas',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      capacidadCajasGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capacidadCajas',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      capacidadCajasLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capacidadCajas',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      capacidadCajasBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capacidadCajas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'color',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      colorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conductorAsignado',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conductorAsignado',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conductorAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conductorAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conductorAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conductorAsignado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'conductorAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'conductorAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'conductorAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'conductorAsignado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conductorAsignado',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'conductorAsignado',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conductorAsignadoNombre',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conductorAsignadoNombre',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conductorAsignadoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conductorAsignadoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conductorAsignadoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conductorAsignadoNombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'conductorAsignadoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'conductorAsignadoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'conductorAsignadoNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'conductorAsignadoNombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conductorAsignadoNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      conductorAsignadoNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'conductorAsignadoNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      estadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estado',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      estadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estado',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      estadoEqualTo(
    String? value, {
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      estadoGreaterThan(
    String? value, {
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      estadoLessThan(
    String? value, {
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      estadoBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      estadoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      estadoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      idExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      idExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      idExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      idExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      kilometrajeActualIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kilometrajeActual',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      kilometrajeActualIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kilometrajeActual',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      kilometrajeActualEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kilometrajeActual',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      kilometrajeActualGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kilometrajeActual',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      kilometrajeActualLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kilometrajeActual',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      kilometrajeActualBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kilometrajeActual',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      marcaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      marcaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      marcaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      marcaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      marcaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      marcaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      marcaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      marcaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'marca',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      marcaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marca',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      marcaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'marca',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      modeloEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      modeloGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      modeloLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      modeloBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      modeloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      modeloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      modeloContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      modeloMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modelo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      modeloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelo',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      modeloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modelo',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      nombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      pendienteSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendienteSync',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      placaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      placaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'placa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      placaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'placa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      placaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'placa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      placaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'placa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      placaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'placa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      placaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'placa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      placaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'placa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      placaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placa',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      placaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'placa',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
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

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      tipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterFilterCondition>
      tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }
}

extension VehiculoEntityQueryObject
    on QueryBuilder<VehiculoEntity, VehiculoEntity, QFilterCondition> {}

extension VehiculoEntityQueryLinks
    on QueryBuilder<VehiculoEntity, VehiculoEntity, QFilterCondition> {}

extension VehiculoEntityQuerySortBy
    on QueryBuilder<VehiculoEntity, VehiculoEntity, QSortBy> {
  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByAnio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anio', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByAnioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anio', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByCapacidadCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacidadCajas', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByCapacidadCajasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacidadCajas', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByConductorAsignado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductorAsignado', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByConductorAsignadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductorAsignado', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByConductorAsignadoNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductorAsignadoNombre', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByConductorAsignadoNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductorAsignadoNombre', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByKilometrajeActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kilometrajeActual', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByKilometrajeActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kilometrajeActual', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByMarca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByMarcaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByModelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByModeloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      sortByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByPlaca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placa', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByPlacaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placa', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension VehiculoEntityQuerySortThenBy
    on QueryBuilder<VehiculoEntity, VehiculoEntity, QSortThenBy> {
  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByAnio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anio', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByAnioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anio', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByCapacidadCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacidadCajas', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByCapacidadCajasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacidadCajas', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByConductorAsignado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductorAsignado', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByConductorAsignadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductorAsignado', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByConductorAsignadoNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductorAsignadoNombre', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByConductorAsignadoNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductorAsignadoNombre', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByKilometrajeActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kilometrajeActual', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByKilometrajeActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kilometrajeActual', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByMarca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByMarcaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByModelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByModeloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy>
      thenByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByPlaca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placa', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByPlacaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placa', Sort.desc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension VehiculoEntityQueryWhereDistinct
    on QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> {
  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> distinctByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activo');
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> distinctByAnio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'anio');
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct>
      distinctByCapacidadCajas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacidadCajas');
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> distinctByColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct>
      distinctByConductorAsignado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'conductorAsignado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct>
      distinctByConductorAsignadoNombre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'conductorAsignadoNombre',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> distinctByIdExterno(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idExterno', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct>
      distinctByKilometrajeActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kilometrajeActual');
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> distinctByMarca(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'marca', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> distinctByModelo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct>
      distinctByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendienteSync');
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> distinctByPlaca(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'placa', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoEntity, VehiculoEntity, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension VehiculoEntityQueryProperty
    on QueryBuilder<VehiculoEntity, VehiculoEntity, QQueryProperty> {
  QueryBuilder<VehiculoEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VehiculoEntity, bool, QQueryOperations> activoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activo');
    });
  }

  QueryBuilder<VehiculoEntity, int?, QQueryOperations> anioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anio');
    });
  }

  QueryBuilder<VehiculoEntity, int?, QQueryOperations>
      capacidadCajasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacidadCajas');
    });
  }

  QueryBuilder<VehiculoEntity, String?, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<VehiculoEntity, String?, QQueryOperations>
      conductorAsignadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'conductorAsignado');
    });
  }

  QueryBuilder<VehiculoEntity, String?, QQueryOperations>
      conductorAsignadoNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'conductorAsignadoNombre');
    });
  }

  QueryBuilder<VehiculoEntity, String?, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<VehiculoEntity, DateTime, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<VehiculoEntity, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<VehiculoEntity, String, QQueryOperations> idExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idExterno');
    });
  }

  QueryBuilder<VehiculoEntity, int?, QQueryOperations>
      kilometrajeActualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kilometrajeActual');
    });
  }

  QueryBuilder<VehiculoEntity, String, QQueryOperations> marcaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'marca');
    });
  }

  QueryBuilder<VehiculoEntity, String, QQueryOperations> modeloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelo');
    });
  }

  QueryBuilder<VehiculoEntity, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<VehiculoEntity, bool, QQueryOperations> pendienteSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendienteSync');
    });
  }

  QueryBuilder<VehiculoEntity, String, QQueryOperations> placaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'placa');
    });
  }

  QueryBuilder<VehiculoEntity, String, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}
