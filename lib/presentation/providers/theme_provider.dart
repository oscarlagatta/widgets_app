// State => isDarkModeProvider
// StateProvider a small piece of state information
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Immutable Colors List
final colorListProvider = Provider((ref) => colorList);

// A simple int
final selectedIndexColorProvider = StateProvider<int>((ref) => 0);


// Object of type AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
        (ref) => ThemeNotifier(),
);

// Controller or Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // ThemeNotifier(super.state);
  // state -> NEW AppTheme()

  ThemeNotifier(): super (AppTheme());

  void toggleDarkMode() {
    state = state.copyWidth(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWidth(selectedColor: colorIndex);
  }
}
