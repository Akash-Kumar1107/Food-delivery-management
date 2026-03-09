import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/auth/splash_screen.dart';
import 'services/app_state.dart';

class KrmuEatsApp extends StatefulWidget {
  const KrmuEatsApp({super.key});

  @override
  State<KrmuEatsApp> createState() => _KrmuEatsAppState();
}

class _KrmuEatsAppState extends State<KrmuEatsApp> {
  final AppState appState = AppState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KRMU Eats',
      theme: AppTheme.lightTheme,
      home: SplashScreen(appState: appState),
    );
  }
}
