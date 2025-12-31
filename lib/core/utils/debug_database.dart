import 'dart:developer';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:isar/isar.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';

class DebugDatabase {
  static Future<void> imprimirRegistros(Isar isar) async {
    print('--- 🔎 DEPURACIÓN DE BASE DE DATOS ISAR ---');

    // --- VEHÍCULOS ---
    final vehiculos = await isar.vehiculoEntitys.where().findAll();
    print('\n🚗 VEHÍCULOS ENCONTRADOS: ${vehiculos.length}');
    for (var v in vehiculos) {
      log('ID: ${v.id} | Placa: ${v.placa} | Activo: ${v.activo} | Sync: ${v.pendienteSync} | Estado: ${v.estado}');
    }

    // --- CLIENTES ---
    final clientes = await isar.clienteEntitys.where().findAll();
    print('\n👤 CLIENTES ENCONTRADOS: ${clientes.length}');
    for (var c in clientes) {
      log('ID: ${c.id} | IDexterno: ${c.idExterno} | Nombre: ${c.nombre} | Activo: ${c.activo} | Estado: ${c.estado} | Sync: ${c.pendienteSync} | RUC: ${c.rucCi}');
    }

// --- CLIENTES ---
    final proveedores = await isar.proveedorEntitys.where().findAll();
    print('\n👤 CLIENTES ENCONTRADOS: ${clientes.length}');
    for (var c in proveedores) {
      log('ID: ${c.id} | IDexterno: ${c.idExterno} | Nombre: ${c.nombre} | Activo: ${c.activo} | Estado: ${c.estado} | Sync: ${c.pendienteSync} | RUC: ${c.rucCi}');
    }

    print('\n------------------------------------------');
  }

  static Future<void> limpiarCliente(Isar isar) async {
    await isar.writeTxn(() async {
      final count = await isar.clienteEntitys.where().deleteAll();
      print('🧹 Registros de CLIENTES eliminados: $count');
    });
  }
}