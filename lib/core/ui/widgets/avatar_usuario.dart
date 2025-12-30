import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvatarUsuario extends ConsumerWidget {
  const AvatarUsuario({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(currentSessionProvider);

    return sessionAsync.when(
      loading: () => const _AvatarLoading(),
      error: (_, __) => _buildTrigger(context, '?', isError: true),
      data: (session) {
        final nombre = session?.nombreCompleto ?? 'Usuario';
        final correo = session?.correo ?? 'Sin correo';
        final inicial = nombre.isNotEmpty ? nombre[0].toUpperCase() : '?';

        return PopupMenuButton<String>(
          offset: const Offset(0, 52),
          // Diseño del contenedor del menú
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black.withOpacity(0.05)),
          ),
          elevation: 10,
          shadowColor: Colors.black26,
          onSelected: (value) {
            if (value == 'logout') {
              ref.read(authControllerProvider.notifier).logout();
            }
          },
          // Trigger del menú (el círculo que se ve en el AppBar)
          child: _buildTrigger(context, inicial),
          itemBuilder: (context) => [
            // Cabecera personalizada del menú
            PopupMenuItem(
              enabled: false,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Row(
                  children: [
                    _buildCirculoAvatar(context, inicial, size: 45, fontSize: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            nombre,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            correo,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const PopupMenuDivider(height: 1),
            // Opciones del menú
            _buildMenuItem(
              value: 'perfil',
              icon: Icons.person_outline_rounded,
              text: 'Mi Perfil',
            ),
            _buildMenuItem(
              value: 'config',
              icon: Icons.settings_outlined,
              text: 'Configuración',
            ),
            const PopupMenuDivider(height: 1),
            _buildMenuItem(
              value: 'logout',
              icon: Icons.logout_rounded,
              text: 'Cerrar Sesión',
              color: Colors.redAccent,
            ),
          ],
        );
      },
    );
  }

  // El botón circular que aparece en el AppBar
  Widget _buildTrigger(BuildContext context, String inicial, {bool isError = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: _buildCirculoAvatar(
          context, 
          inicial, 
          size: 40, 
          fontSize: 18, 
          colorOverride: isError ? Colors.grey : null
        ),
      ),
    );
  }

  // El círculo con gradiente
  Widget _buildCirculoAvatar(BuildContext context, String inicial, 
      {required double size, required double fontSize, Color? colorOverride}) {
    final primary = Theme.of(context).colorScheme.primary;
    final secondary = Theme.of(context).colorScheme.secondary;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colorOverride != null 
            ? [colorOverride, colorOverride.withOpacity(0.7)]
            : [primary, secondary.withOpacity(0.8)],
        ),
      ),
      child: Center(
        child: Text(
          inicial,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Constructor de items del menú para consistencia
  PopupMenuItem<String> _buildMenuItem({
    required String value,
    required IconData icon,
    required String text,
    Color? color,
  }) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20, color: color ?? Colors.black54),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: color ?? Colors.black87,
              fontWeight: color != null ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget de carga simplificado
class _AvatarLoading extends StatelessWidget {
  const _AvatarLoading();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ),
    );
  }
}