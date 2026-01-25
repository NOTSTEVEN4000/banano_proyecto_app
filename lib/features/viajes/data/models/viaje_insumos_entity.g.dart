// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viaje_insumos_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetViajeInsumosEntityCollection on Isar {
  IsarCollection<ViajeInsumosEntity> get viajeInsumosEntitys =>
      this.collection();
}

const ViajeInsumosEntitySchema = CollectionSchema(
  name: r'ViajeInsumosEntity',
  id: 1959874827095973370,
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
    r'fechaActualizacion': PropertySchema(
      id: 2,
      name: r'fechaActualizacion',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 3,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'haciendaIdExterno': PropertySchema(
      id: 4,
      name: r'haciendaIdExterno',
      type: IsarType.string,
    ),
    r'idExterno': PropertySchema(
      id: 5,
      name: r'idExterno',
      type: IsarType.string,
    ),
    r'items': PropertySchema(
      id: 6,
      name: r'items',
      type: IsarType.objectList,
      target: r'ItemInsumo',
    ),
    r'pendienteSync': PropertySchema(
      id: 7,
      name: r'pendienteSync',
      type: IsarType.bool,
    ),
    r'viajeIdExterno': PropertySchema(
      id: 8,
      name: r'viajeIdExterno',
      type: IsarType.string,
    )
  },
  estimateSize: _viajeInsumosEntityEstimateSize,
  serialize: _viajeInsumosEntitySerialize,
  deserialize: _viajeInsumosEntityDeserialize,
  deserializeProp: _viajeInsumosEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ItemInsumo': ItemInsumoSchema},
  getId: _viajeInsumosEntityGetId,
  getLinks: _viajeInsumosEntityGetLinks,
  attach: _viajeInsumosEntityAttach,
  version: '3.1.0+1',
);

int _viajeInsumosEntityEstimateSize(
  ViajeInsumosEntity object,
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
  bytesCount += 3 + object.haciendaIdExterno.length * 3;
  bytesCount += 3 + object.idExterno.length * 3;
  bytesCount += 3 + object.items.length * 3;
  {
    final offsets = allOffsets[ItemInsumo]!;
    for (var i = 0; i < object.items.length; i++) {
      final value = object.items[i];
      bytesCount += ItemInsumoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.viajeIdExterno.length * 3;
  return bytesCount;
}

void _viajeInsumosEntitySerialize(
  ViajeInsumosEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actualizadoPor);
  writer.writeString(offsets[1], object.creadoPor);
  writer.writeDateTime(offsets[2], object.fechaActualizacion);
  writer.writeDateTime(offsets[3], object.fechaCreacion);
  writer.writeString(offsets[4], object.haciendaIdExterno);
  writer.writeString(offsets[5], object.idExterno);
  writer.writeObjectList<ItemInsumo>(
    offsets[6],
    allOffsets,
    ItemInsumoSchema.serialize,
    object.items,
  );
  writer.writeBool(offsets[7], object.pendienteSync);
  writer.writeString(offsets[8], object.viajeIdExterno);
}

ViajeInsumosEntity _viajeInsumosEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ViajeInsumosEntity();
  object.actualizadoPor = reader.readStringOrNull(offsets[0]);
  object.creadoPor = reader.readStringOrNull(offsets[1]);
  object.fechaActualizacion = reader.readDateTime(offsets[2]);
  object.fechaCreacion = reader.readDateTime(offsets[3]);
  object.haciendaIdExterno = reader.readString(offsets[4]);
  object.id = id;
  object.idExterno = reader.readString(offsets[5]);
  object.items = reader.readObjectList<ItemInsumo>(
        offsets[6],
        ItemInsumoSchema.deserialize,
        allOffsets,
        ItemInsumo(),
      ) ??
      [];
  object.pendienteSync = reader.readBool(offsets[7]);
  object.viajeIdExterno = reader.readString(offsets[8]);
  return object;
}

P _viajeInsumosEntityDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readObjectList<ItemInsumo>(
            offset,
            ItemInsumoSchema.deserialize,
            allOffsets,
            ItemInsumo(),
          ) ??
          []) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _viajeInsumosEntityGetId(ViajeInsumosEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _viajeInsumosEntityGetLinks(
    ViajeInsumosEntity object) {
  return [];
}

void _viajeInsumosEntityAttach(
    IsarCollection<dynamic> col, Id id, ViajeInsumosEntity object) {
  object.id = id;
}

extension ViajeInsumosEntityQueryWhereSort
    on QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QWhere> {
  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ViajeInsumosEntityQueryWhere
    on QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QWhereClause> {
  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterWhereClause>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterWhereClause>
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

extension ViajeInsumosEntityQueryFilter
    on QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QFilterCondition> {
  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      actualizadoPorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualizadoPor',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      actualizadoPorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualizadoPor',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      actualizadoPorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actualizadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      actualizadoPorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actualizadoPor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      actualizadoPorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualizadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      actualizadoPorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actualizadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      creadoPorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creadoPor',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      creadoPorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creadoPor',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      creadoPorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      creadoPorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'creadoPor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      creadoPorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      creadoPorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'creadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      fechaActualizacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      haciendaIdExternoEqualTo(
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      haciendaIdExternoGreaterThan(
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      haciendaIdExternoLessThan(
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      haciendaIdExternoBetween(
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      haciendaIdExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'haciendaIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      haciendaIdExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'haciendaIdExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      haciendaIdExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'haciendaIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      haciendaIdExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'haciendaIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      idExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      idExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      idExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      idExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      pendienteSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendienteSync',
        value: value,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      viajeIdExternoEqualTo(
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      viajeIdExternoGreaterThan(
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      viajeIdExternoLessThan(
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      viajeIdExternoBetween(
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      viajeIdExternoStartsWith(
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      viajeIdExternoEndsWith(
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

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      viajeIdExternoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'viajeIdExterno',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      viajeIdExternoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'viajeIdExterno',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      viajeIdExternoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viajeIdExterno',
        value: '',
      ));
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      viajeIdExternoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'viajeIdExterno',
        value: '',
      ));
    });
  }
}

extension ViajeInsumosEntityQueryObject
    on QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QFilterCondition> {
  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterFilterCondition>
      itemsElement(FilterQuery<ItemInsumo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension ViajeInsumosEntityQueryLinks
    on QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QFilterCondition> {}

extension ViajeInsumosEntityQuerySortBy
    on QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QSortBy> {
  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByActualizadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByActualizadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByCreadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByCreadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByHaciendaIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByHaciendaIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByViajeIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      sortByViajeIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.desc);
    });
  }
}

extension ViajeInsumosEntityQuerySortThenBy
    on QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QSortThenBy> {
  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByActualizadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByActualizadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualizadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByCreadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByCreadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByFechaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByHaciendaIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByHaciendaIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haciendaIdExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idExterno', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByPendienteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendienteSync', Sort.desc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByViajeIdExterno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.asc);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QAfterSortBy>
      thenByViajeIdExternoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viajeIdExterno', Sort.desc);
    });
  }
}

extension ViajeInsumosEntityQueryWhereDistinct
    on QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QDistinct> {
  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QDistinct>
      distinctByActualizadoPor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualizadoPor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QDistinct>
      distinctByCreadoPor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creadoPor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QDistinct>
      distinctByFechaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaActualizacion');
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QDistinct>
      distinctByHaciendaIdExterno({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'haciendaIdExterno',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QDistinct>
      distinctByIdExterno({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idExterno', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QDistinct>
      distinctByPendienteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendienteSync');
    });
  }

  QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QDistinct>
      distinctByViajeIdExterno({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viajeIdExterno',
          caseSensitive: caseSensitive);
    });
  }
}

extension ViajeInsumosEntityQueryProperty
    on QueryBuilder<ViajeInsumosEntity, ViajeInsumosEntity, QQueryProperty> {
  QueryBuilder<ViajeInsumosEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ViajeInsumosEntity, String?, QQueryOperations>
      actualizadoPorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualizadoPor');
    });
  }

  QueryBuilder<ViajeInsumosEntity, String?, QQueryOperations>
      creadoPorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creadoPor');
    });
  }

  QueryBuilder<ViajeInsumosEntity, DateTime, QQueryOperations>
      fechaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaActualizacion');
    });
  }

  QueryBuilder<ViajeInsumosEntity, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ViajeInsumosEntity, String, QQueryOperations>
      haciendaIdExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'haciendaIdExterno');
    });
  }

  QueryBuilder<ViajeInsumosEntity, String, QQueryOperations>
      idExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idExterno');
    });
  }

  QueryBuilder<ViajeInsumosEntity, List<ItemInsumo>, QQueryOperations>
      itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<ViajeInsumosEntity, bool, QQueryOperations>
      pendienteSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendienteSync');
    });
  }

  QueryBuilder<ViajeInsumosEntity, String, QQueryOperations>
      viajeIdExternoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viajeIdExterno');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ItemInsumoSchema = Schema(
  name: r'ItemInsumo',
  id: -8095791566753211025,
  properties: {
    r'cantidad': PropertySchema(
      id: 0,
      name: r'cantidad',
      type: IsarType.long,
    ),
    r'insumo': PropertySchema(
      id: 1,
      name: r'insumo',
      type: IsarType.string,
      enumMap: _ItemInsumoinsumoEnumValueMap,
    )
  },
  estimateSize: _itemInsumoEstimateSize,
  serialize: _itemInsumoSerialize,
  deserialize: _itemInsumoDeserialize,
  deserializeProp: _itemInsumoDeserializeProp,
);

int _itemInsumoEstimateSize(
  ItemInsumo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.insumo.name.length * 3;
  return bytesCount;
}

void _itemInsumoSerialize(
  ItemInsumo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cantidad);
  writer.writeString(offsets[1], object.insumo.name);
}

ItemInsumo _itemInsumoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ItemInsumo();
  object.cantidad = reader.readLong(offsets[0]);
  object.insumo =
      _ItemInsumoinsumoValueEnumMap[reader.readStringOrNull(offsets[1])] ??
          InsumoTipo.CARTON;
  return object;
}

P _itemInsumoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (_ItemInsumoinsumoValueEnumMap[reader.readStringOrNull(offset)] ??
          InsumoTipo.CARTON) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ItemInsumoinsumoEnumValueMap = {
  r'CARTON': r'CARTON',
  r'FUNDA': r'FUNDA',
  r'CARTULINA': r'CARTULINA',
};
const _ItemInsumoinsumoValueEnumMap = {
  r'CARTON': InsumoTipo.CARTON,
  r'FUNDA': InsumoTipo.FUNDA,
  r'CARTULINA': InsumoTipo.CARTULINA,
};

extension ItemInsumoQueryFilter
    on QueryBuilder<ItemInsumo, ItemInsumo, QFilterCondition> {
  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> cantidadEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition>
      cantidadGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> cantidadLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cantidad',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> cantidadBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cantidad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> insumoEqualTo(
    InsumoTipo value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insumo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> insumoGreaterThan(
    InsumoTipo value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'insumo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> insumoLessThan(
    InsumoTipo value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'insumo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> insumoBetween(
    InsumoTipo lower,
    InsumoTipo upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'insumo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> insumoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'insumo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> insumoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'insumo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> insumoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'insumo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> insumoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'insumo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition> insumoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'insumo',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemInsumo, ItemInsumo, QAfterFilterCondition>
      insumoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'insumo',
        value: '',
      ));
    });
  }
}

extension ItemInsumoQueryObject
    on QueryBuilder<ItemInsumo, ItemInsumo, QFilterCondition> {}
