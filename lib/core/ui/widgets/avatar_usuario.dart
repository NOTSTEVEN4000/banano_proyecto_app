import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvatarUsuario extends ConsumerWidget {
  const AvatarUsuario({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(currentSessionProvider);
    final modoActual = ref.watch(temaProvider);
    final esOscuro = modoActual == ThemeMode.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return sessionAsync.when(
      loading: () => const _AvatarLoading(),
      error: (_, __) => const _TriggerCiruclo(inicial: '?', isError: true),
      data: (session) {
        final nombre = session?.nombreCompleto ?? 'Usuario';
        final correo = session?.correo ?? 'Sin correo';
        final inicial = nombre.isNotEmpty ? nombre[0].toUpperCase() : '?';

        return PopupMenuButton<String>(
          offset: const Offset(0, 52),
          // ADAPTACIÓN: El color del borde ahora es relativo al tema
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.5)),
          ),
          color: colorScheme.surface,
          elevation: 10,
          onSelected: (value) {
            if (value == 'logout') {
              ref.read(authControllerProvider.notifier).logout();
            }
          },
          child: _TriggerCiruclo(inicial: inicial),
          itemBuilder: (context) => [
            PopupMenuItem(
              enabled: false,
              child: _MenuHeader(
                nombre: nombre,
                correo: correo,
                inicial: inicial,
              ),
            ),
            const PopupMenuDivider(height: 1),
            const PopupMenuItem(
              value: 'perfil',
              child: _MenuItemContent(
                icon: Icons.person_outline_rounded,
                text: 'Mi Perfil',
              ),
            ),
            const PopupMenuItem(
              value: 'config',
              child: _MenuItemContent(
                icon: Icons.settings_outlined,
                text: 'Configuración',
              ),
            ),
            const PopupMenuDivider(height: 1),
            // OPCIÓN DE CAMBIO DE TEMA CORREGIDA
            PopupMenuItem(
              onTap: () {
                ref.read(temaProvider.notifier).state =
                    esOscuro ? ThemeMode.light : ThemeMode.dark;
              },
              child: _MenuItemContent(
                icon: esOscuro ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                text: esOscuro ? 'Modo Claro' : 'Modo Oscuro',
                color: esOscuro ? Colors.orangeAccent : Colors.indigoAccent,
              ),
            ),
            const PopupMenuItem(
              value: 'logout',
              child: _MenuItemContent(
                icon: Icons.logout_rounded,
                text: 'Cerrar Sesión',
                color: Colors.redAccent,
              ),
            ),
          ],
        );
      },
    );
  }
}

// --- SUB-WIDGETS ADAPTADOS AL TEMA ---

class _TriggerCiruclo extends StatelessWidget {
  final String inicial;
  final bool isError;
  const _TriggerCiruclo({required this.inicial, this.isError = false});

  @override
  Widget build(BuildContext context) {
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
        child: _GradienteCiruclo(
          inicial: inicial,
          size: 40,
          fontSize: 18,
          colorOverride: isError ? Colors.grey : null,
        ),
      ),
    );
  }
}

class _GradienteCiruclo extends StatelessWidget {
  final String inicial;
  final double size;
  final double fontSize;
  final Color? colorOverride;

  const _GradienteCiruclo({
    required this.inicial,
    required this.size,
    required this.fontSize,
    this.colorOverride,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colorOverride != null
              ? [colorOverride!, colorOverride!.withOpacity(0.7)]
              : [theme.primary, theme.secondary.withOpacity(0.8)],
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
}

class _MenuHeader extends StatelessWidget {
  final String nombre, correo, inicial;
  const _MenuHeader({
    required this.nombre,
    required this.correo,
    required this.inicial,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: Row(
        children: [
          _GradienteCiruclo(inicial: inicial, size: 45, fontSize: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  nombre,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: colorScheme.onSurface, // CORRECCIÓN: Adaptativo
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  correo,
                  style: TextStyle(
                    fontSize: 12, 
                    color: colorScheme.onSurfaceVariant // CORRECCIÓN: Adaptativo
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItemContent extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;

  const _MenuItemContent({required this.icon, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(icon, size: 20, color: color ?? colorScheme.onSurfaceVariant),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: color ?? colorScheme.onSurface, // CORRECCIÓN: Adaptativo
            fontWeight: color != null ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class _AvatarLoading extends StatelessWidget {
  const _AvatarLoading();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}