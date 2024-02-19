import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() => runApp(const WidgetsMainApp());

class WidgetsMainApp extends StatelessWidget {
  const WidgetsMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        selectedColor: 3,
      ).getTheme(),
      title: 'Material App',
    );
  }
}

// git checkout -- .  -> will recover all up to the last commit.
