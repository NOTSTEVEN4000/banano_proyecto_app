
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
  final _clave = TextEditingController();
  bool _verClave = false;

  @override
  void dispose() {
    _entrada.dispose();
    _clave.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 8),
                      const Icon(Icons.local_shipping_rounded, size: 54),
                      const SizedBox(height: 12),
                      Text(
                        'Control de Cajas',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Inicia sesión para continuar',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
                      ),
                      const SizedBox(height: 18),

                      if (state.error != null) ...[
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                // ignore: deprecated_member_use
                                color: Colors.orange.withOpacity(.10),
                                borderRadius: BorderRadius.circular(14),
                                // ignore: deprecated_member_use
                                border: Border.all(color: Colors.orange.withOpacity(.35)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.lock_clock_rounded, color: Colors.orange),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Acceso denegado',
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          state.error!,
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          'Consejo: verifica tus datos de acceso e inténtalo de nuevo.',
                                          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _entrada,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                labelText: 'Usuario o correo',
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (v) => (v == null || v.trim().isEmpty) ? 'Ingresa tu usuario/correo' : null,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _clave,
                              obscureText: !_verClave,
                              decoration: InputDecoration(
                                labelText: 'Clave',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () => setState(() => _verClave = !_verClave),
                                  icon: Icon(_verClave ? Icons.visibility_off : Icons.visibility),
                                ),
                              ),
                              validator: (v) => (v == null || v.isEmpty) ? 'Ingresa tu clave' : null,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      FilledButton(
                        onPressed: state.loading
                            ? null
                            : () async {
                                if (!_formKey.currentState!.validate()) return;
                                await ref.read(authControllerProvider.notifier).login(
                                      _entrada.text.trim(),
                                      _clave.text,
                                    );
                              },
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: state.loading
                            ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                            : const Text('Entrar'),
                      ),

                      const SizedBox(height: 10),
                      Text(
                        'Desarrollado por Steven Guevara',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
