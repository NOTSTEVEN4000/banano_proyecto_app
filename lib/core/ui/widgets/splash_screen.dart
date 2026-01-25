import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _moveAnimation;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Configuramos el controlador (2 segundos por ciclo)
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(); // Se repite infinitamente

    // 2. Animación de movimiento horizontal (desplazamiento)
    _moveAnimation = Tween<double>(begin: -20.0, end: 20.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // 3. Animación de rebote (simula vibración del camión)
    _bounceAnimation = Tween<double>(begin: 0.0, end: -5.0).animate(
      CurvedAnimation(
        parent: _controller,
        // Usamos un intervalo para que rebote más rápido que el movimiento
        curve: const Interval(0.0, 0.5, curve: Curves.elasticIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // El AnimatedBuilder reconstruye solo esta parte para optimizar rendimiento
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_moveAnimation.value, _bounceAnimation.value),
                  child: const Icon(
                    Icons.local_shipping_rounded,
                    size: 100, // Un poco más grande para que destaque
                    color: Colors.deepPurple,
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            // Un indicador de carga más elegante que combine
            const SizedBox(
              width: 150,
              child: LinearProgressIndicator(
                backgroundColor: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Cargando aplicación...",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}