import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';
import '../../services/app_state.dart';

class SplashScreen extends StatefulWidget {
  final AppState appState;

  const SplashScreen({super.key, required this.appState});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _bgController;
  late AnimationController _itemsController;
  late AnimationController _textController;

  late Animation<double> _bgScale;
  late Animation<double> _burgerScale;
  late Animation<double> _dishScale;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    // 1. Background Animation
    _bgController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _bgScale = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _bgController, curve: Curves.easeOutCirc));

    // 2. Food Items Staggered Animation
    _itemsController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _burgerScale = Tween<double>(begin: 0.0, end: 1.2).animate(CurvedAnimation(parent: _itemsController, curve: const Interval(0.0, 0.6, curve: Curves.elasticOut)));
    _dishScale = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _itemsController, curve: const Interval(0.4, 1.0, curve: Curves.elasticOut)));

    // 3. Text and Branding Animation
    _textController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));
    _textSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOutQuart));

    _playAnimations();
  }

  Future<void> _playAnimations() async {
    await _bgController.forward();
    await _itemsController.forward();
    await _textController.forward();

    // Navigate to Login after a short delay
    Timer(const Duration(milliseconds: 1200), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(appState: widget.appState),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _bgController.dispose();
    _itemsController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFDE8E1), Color(0xFFFAD1C4)], // Matching AuthLayout pastel gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              
              // Decorative Stack
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Center decorative circle
                    ScaleTransition(
                      scale: _bgScale,
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // Top-right Indian Dish Illustration
                    Positioned(
                      top: 10,
                      right: 20,
                      child: ScaleTransition(
                        scale: _dishScale,
                        child: Image.network(
                          'https://cdn3d.iconscout.com/3d/premium/thumb/indian-food-6889446-5654571.png', 
                          width: 140,
                          height: 140,
                          errorBuilder: (ctx, err, st) => const Icon(Icons.ramen_dining, size: 100, color: Colors.orange),
                        ),
                      ),
                    ),

                    // Bottom-left Burger Illustration
                    Positioned(
                      bottom: 10,
                      left: 20,
                      child: ScaleTransition(
                        scale: _burgerScale,
                        child: Image.network(
                          'https://cdn3d.iconscout.com/3d/premium/thumb/burger-4994236-4160453.png', 
                          width: 180,
                          height: 180,
                          errorBuilder: (ctx, err, st) => const Icon(Icons.lunch_dining, size: 120, color: Colors.deepOrange),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 1),

              // Bottom Branding Text
              FadeTransition(
                opacity: _textOpacity,
                child: SlideTransition(
                  position: _textSlide,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF5C40),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'KRMU Eats',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Fresh. Fast. On Campus.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
