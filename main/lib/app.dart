import 'package:flutter/material.dart';
import 'features/settings/app_router.dart';

class AppTheme{
  static const Color background = Color(0xFFF7F7F5);
  static const Color surface = Colors.white;

  static const Color textPrimary = Color(0xFF1F1F1F);
  static const Color textSecondary = Color(0xFF6B6B6B);

  static const Color border = Color(0xFFE8E8E5);

  static const Color primary = Color(0xFF4F46E5);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.background,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: AppTheme.textPrimary),
          bodySmall: TextStyle(color: AppTheme.textSecondary),
        ),
        dividerColor: AppTheme.border,
        colorScheme: ColorScheme.light(
          primary: AppTheme.primary,
          surface: AppTheme.surface,
          onSurface: AppTheme.textPrimary,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}