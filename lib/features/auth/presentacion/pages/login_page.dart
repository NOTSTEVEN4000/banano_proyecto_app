import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  
  final _entrada = TextEditingController(); 
  final _nombre = TextEditingController();  
  final _clave = TextEditingController();
  final _claveRepetir = TextEditingController();
  
  bool _isLogin = true; 
  bool _verClave = false;

  void _toggleMode() {
    setState(() {
      _isLogin = !_isLogin;
      _formKey.currentState?.reset();
    });
  }

  @override
  void dispose() {
    _entrada.dispose();
    _nombre.dispose();
    _clave.dispose();
    _claveRepetir.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primary.withOpacity(0.08),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  children: [
                    _buildHeader(colorScheme),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          )
                        ],
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              _isLogin ? 'Bienvenido' : 'Crear Cuenta',
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _isLogin ? 'Ingresa tus credenciales' : 'Completa los datos',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 24),

                            if (state.error != null) _buildErrorBanner(state.error!),

                            if (!_isLogin) ...[
                              _buildTextField(
                                controller: _nombre,
                                label: 'Nombre Completo',
                                icon: Icons.person_outline,
                                validator: (v) => v!.isEmpty ? 'Campo requerido' : null,
                              ),
                              const SizedBox(height: 16),
                            ],

                            _buildTextField(
                              controller: _entrada,
                              label: _isLogin ? 'Usuario o correo' : 'Correo electrónico',
                              icon: Icons.alternate_email_rounded,
                              validator: (v) => v!.isEmpty ? 'Campo requerido' : null,
                            ),
                            const SizedBox(height: 16),

                            _buildTextField(
                              controller: _clave,
                              label: 'Contraseña',
                              icon: Icons.lock_outline_rounded,
                              isPassword: true,
                              verClave: _verClave,
                              onToggleClave: () => setState(() => _verClave = !_verClave),
                              validator: (v) => v!.length < 6 ? 'Mínimo 6 caracteres' : null,
                            ),
                            
                            if (!_isLogin) ...[
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: _claveRepetir,
                                label: 'Confirmar Contraseña',
                                icon: Icons.lock_reset_rounded,
                                isPassword: true,
                                verClave: _verClave,
                                onToggleClave: () => setState(() => _verClave = !_verClave),
                                validator: (v) => v != _clave.text ? 'Las claves no coinciden' : null,
                              ),
                            ],

                            const SizedBox(height: 24),

                            _buildSubmitButton(state.loading),

                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: state.loading ? null : _toggleMode,
                              child: Text(
                                _isLogin ? '¿No tienes cuenta? Regístrate' : '¿Ya tienes cuenta? Inicia sesión',
                                style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.primary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Desarrollado por Steven Guevara - 2026',
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: colorScheme.primary, shape: BoxShape.circle),
          child: const Icon(Icons.local_shipping_rounded, size: 48, color: Colors.white),
        ),
        const SizedBox(height: 16),
        const Text('BANANO APP', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: 2)),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
    bool verClave = false,
    VoidCallback? onToggleClave,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && !verClave,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 22),
        suffixIcon: isPassword 
          ? IconButton(onPressed: onToggleClave, icon: Icon(verClave ? Icons.visibility_off : Icons.visibility))
          : null,
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey[200]!)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
      ),
      validator: validator,
    );
  }

  // BOTÓN ACTUALIZADO CON VERDE OSCURO Y MEJOR VISIBILIDAD
  Widget _buildSubmitButton(bool isLoading) {
    return FilledButton(
      onPressed: isLoading ? null : _handleSubmit,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: const Size(double.infinity, 54),
        // Mantiene un tono suave del color primario para que no se vea blanco
        disabledBackgroundColor: Theme.of(context).primaryColor.withOpacity(0.15),
      ),
      child: isLoading 
        ? const SizedBox(
            height: 24, 
            width: 24, 
            child: CircularProgressIndicator(
              strokeWidth: 3,
              // Color Verde Oscuro (Green 900)
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1B5E20)),
            ),
          )
        : Text(
            _isLogin ? 'Iniciar Sesión' : 'Crear Cuenta', 
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
    );
  }

  Widget _buildErrorBanner(String message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.red[100]!)),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(message, style: const TextStyle(color: Colors.red, fontSize: 13))),
        ],
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final authNotifier = ref.read(authControllerProvider.notifier);
    if (_isLogin) {
      await authNotifier.login(_entrada.text.trim(), _clave.text);
    } else {
       // Lógica de registro
    }
  }
}