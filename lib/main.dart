import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

void main() => runApp(const WidgetsMainApp());

class WidgetsMainApp extends StatelessWidget {
  const WidgetsMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/buttons': (context) => ButtonsScreen(),
        '/cards': (context) => CardsScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        selectedColor: 0,
      ).getTheme(),
      title: 'Material App',
      home: const HomeScreen(),
    );
  }
}

// git checkout -- .  -> will recover all up to the last commit.
