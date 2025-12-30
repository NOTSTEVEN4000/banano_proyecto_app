class RoleManager {
  final String? rol;

  RoleManager(this.rol);

  bool get esAdministrador => rol == 'ADMINISTRADOR';
  bool get esOperador => rol == 'OPERADOR';
  bool get esAutenticado => rol != null;

  // Permisos específicos
  bool get puedeCrear => esAdministrador || esOperador;
  bool get puedeEditar => esAdministrador || esOperador; // Ambos pueden editar
  bool get puedeEliminar => esAdministrador || esOperador; // Solo admin puede eliminar
}

