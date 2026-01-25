import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerificarCodigoPage extends ConsumerStatefulWidget {
  final String correo;
  const VerificarCodigoPage({super.key, required this.correo});

  @override
  ConsumerState<VerificarCodigoPage> createState() => _VerificarCodigoPageState();
}

class _VerificarCodigoPageState extends ConsumerState<VerificarCodigoPage> {
  final _codigoController = TextEditingController();
  final _nuevaClaveController = TextEditingController();
  final _confirmarClaveController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _verClave = false;

  @override
  void dispose() {
    _codigoController.dispose();
    _nuevaClaveController.dispose();
    _confirmarClaveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificación'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Hemos enviado un código a:',
                style: TextStyle(fontSize: 16, color: colorScheme.onSurfaceVariant),
              ),
              Text(
                widget.correo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 32),

              if (state.error != null) _buildErrorBanner(state.error!, colorScheme),

              const SizedBox(height: 8),

              // --- CAMPO PARA EL CÓDIGO ---
              TextFormField(
                controller: _codigoController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 12,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: 'Código de 6 dígitos',
                  alignLabelWithHint: true,
                  counterText: "",
                  filled: true,
                  // Uso de opacidad para que se adapte al fondo oscuro/claro
                  fillColor: colorScheme.surfaceVariant.withOpacity(0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (v) => v!.length < 6 ? 'El código debe tener 6 dígitos' : null,
              ),

              const SizedBox(height: 24),

              // --- CAMPO: NUEVA CONTRASEÑA ---
              TextFormField(
                controller: _nuevaClaveController,
                obscureText: !_verClave,
                decoration: InputDecoration(
                  labelText: 'Nueva Contraseña',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    icon: Icon(_verClave ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _verClave = !_verClave),
                  ),
                  filled: true,
                  fillColor: colorScheme.surfaceVariant.withOpacity(0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (v) => v!.length < 6 ? 'Mínimo 6 caracteres' : null,
              ),

              const SizedBox(height: 16),

              // --- CAMPO: CONFIRMAR CONTRASEÑA ---
              TextFormField(
                controller: _confirmarClaveController,
                obscureText: !_verClave,
                decoration: InputDecoration(
                  labelText: 'Confirmar Nueva Contraseña',
                  prefixIcon: const Icon(Icons.lock_reset_rounded),
                  filled: true,
                  fillColor: colorScheme.surfaceVariant.withOpacity(0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (v) {
                  if (v!.isEmpty) return 'Repite la contraseña';
                  if (v != _nuevaClaveController.text) return 'Las contraseñas no coinciden';
                  return null;
                },
              ),

              const SizedBox(height: 32),

              FilledButton(
                onPressed: state.loading ? null : _confirmarCambio,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 58),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: state.loading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text('Restablecer Contraseña', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorBanner(String message, ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // Colores dinámicos del tema para errores
        color: colorScheme.errorContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.error.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: colorScheme.error, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: colorScheme.onErrorContainer, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmarCambio() async {
    if (!_formKey.currentState!.validate()) return;

    final exito = await ref.read(authControllerProvider.notifier).confirmarNuevaClave(
          widget.correo,
          _codigoController.text.trim(),
          _nuevaClaveController.text,
        );

    if (exito) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contraseña actualizada correctamente'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }
}