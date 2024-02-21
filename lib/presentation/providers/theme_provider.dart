// State => isDarkModeProvider
// StateProvider a small piece of state information
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Immutable Colors List
final colorListProvider = Provider((ref) => colorList);

// A simple int
final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

