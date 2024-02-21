import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() => runApp(
      // ProviderScope keeps a reference
      // to all the providers we use
      const ProviderScope(
        child: WidgetsMainApp(),
      ),
    );

class WidgetsMainApp extends ConsumerWidget {
  const WidgetsMainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch(isDarkModeProvider);
    final selectedColor = ref.watch(selectedIndexColorProvider);
    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        selectedColor: selectedColor,
        isDarkMode: isDarkMode,
      ).getTheme(),
    );
  }
}

// git checkout -- .  -> will recover all up to the last commit.
