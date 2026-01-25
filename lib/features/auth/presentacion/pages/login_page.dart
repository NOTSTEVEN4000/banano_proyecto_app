import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/auth/presentacion/pages/recuperar_password_page.dart';
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

  // COLORES PERSONALIZADOS PARA EL ESTILO "CREMITA"
  static const colorCremita = Color(0xFFFDF5E6); 
  static const colorCafeBanano = Color(0xFF4E342E); // Un café elegante para textos y botones

  @override
  void dispose() {
    _entrada.dispose();
    _nombre.dispose();
    _clave.dispose();
    _claveRepetir.dispose();
    super.dispose();
  }

  void _toggleMode() {
    setState(() {
      _isLogin = !_isLogin;
      _formKey.currentState?.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      backgroundColor: colorCremita,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildHeader(),
                  _buildFormContent(authState),
                  const _FooterText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Hero(
          tag: 'logo_app',
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: colorCremita,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.orange.withOpacity(0.2), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/logotipo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'BANARUTA APP',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            color: colorCafeBanano,
          ),
        ),
      ],
    );
  }

  Widget _buildFormContent(dynamic state) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorCremita,
        borderRadius: BorderRadius.circular(32),
        // Sombra suave para dar volumen sin romper el color
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _isLogin ? 'Iniciar Sesión' : 'Crea tu cuenta',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                color: colorCafeBanano,
              ),
            ),
            const SizedBox(height: 24),
            
            if (state.error != null)
              _buildErrorBanner(state.error!),

            if (!_isLogin) ...[
              _buildTextField(
                controller: _nombre,
                label: 'Nombre completo',
                icon: Icons.person_outline,
                validator: (v) => v!.isEmpty ? 'Ingresa tu nombre' : null,
              ),
              const SizedBox(height: 16),
            ],

            _buildTextField(
              controller: _entrada,
              label: 'Usuario o Correo',
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

            if (_isLogin)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RecuperarPasswordPage()),
                  ),
                  child: Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(color: colorCafeBanano.withOpacity(0.7)),
                  ),
                ),
              ),

            const SizedBox(height: 24),
            _buildSubmitButton(state.loading),
          ],
        ),
      ),
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
      style: const TextStyle(color: colorCafeBanano),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: colorCafeBanano.withOpacity(0.6)),
        prefixIcon: Icon(icon, color: colorCafeBanano.withOpacity(0.5)),
        filled: true,
        fillColor: Colors.brown.withOpacity(0.04),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.brown.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 2),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onToggleClave,
                icon: Icon(
                  verClave ? Icons.visibility_off : Icons.visibility,
                  color: colorCafeBanano.withOpacity(0.5),
                ),
              )
            : null,
      ),
      validator: validator,
    );
  }

  Widget _buildSubmitButton(bool isLoading) {
    return FilledButton(
      onPressed: isLoading ? null : _handleSubmit,
      style: FilledButton.styleFrom(
        backgroundColor: colorCafeBanano,
        foregroundColor: colorCremita,
        minimumSize: const Size(double.infinity, 58),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 2,
      ),
      child: isLoading
          ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 3, color: colorCremita))
          : const Text('INGRESAR', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
    );
  }


  Widget _buildErrorBanner(String message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.redAccent.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.redAccent, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(message, style: const TextStyle(color: Colors.redAccent, fontSize: 13))),
        ],
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final dynamic authNotifier = ref.read(authControllerProvider.notifier);

    if (_isLogin) {
      await authNotifier.login(_entrada.text.trim(), _clave.text);
    } else {
      try {
        await authNotifier.register(
          nombre: _nombre.text.trim(),
          correo: _entrada.text.trim(),
          password: _clave.text,
        );
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error en el registro.')),
          );
        }
      }
    }
  }
}

class _FooterText extends StatelessWidget {
  const _FooterText();
  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: 0.5,
      child: Text(
        'Desarrollado por Steven Guevara - 2026',
        style: TextStyle(fontSize: 12, color: _LoginPageState.colorCafeBanano),
      ),
    );
  }
}