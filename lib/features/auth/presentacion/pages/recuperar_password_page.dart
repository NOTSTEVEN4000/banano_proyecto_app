import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/auth/presentacion/pages/verificar_codigo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecuperarPasswordPage extends ConsumerStatefulWidget {
  const RecuperarPasswordPage({super.key});

  @override
  ConsumerState<RecuperarPasswordPage> createState() => _RecuperarPasswordPageState();
}

class _RecuperarPasswordPageState extends ConsumerState<RecuperarPasswordPage> {
  final _correoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar Acceso')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.lock_reset, size: 80, color: Colors.blue),
              const SizedBox(height: 24),
              const Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Ingresa tu correo electrónico y te enviaremos un código de 6 dígitos para restablecerla.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 126, 126, 126))
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _correoController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
                validator: (v) => v!.isEmpty ? 'Ingresa tu correo' : null,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: state.loading ? null : _enviarCodigo,
                style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                child: state.loading 
                  ? const CircularProgressIndicator(color: Colors.white) 
                  : const Text('Enviar Código'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _enviarCodigo() async {
    if (!_formKey.currentState!.validate()) return;
    
    final correo = _correoController.text.trim();
    final exito = await ref.read(authControllerProvider.notifier).solicitarCodigo(correo);

    if (exito && mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => VerificarCodigoPage(correo: correo)),
      );
    }
  }
}