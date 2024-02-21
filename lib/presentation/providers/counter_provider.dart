import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider a small piece of state information
final counterProvider = StateProvider<int>((ref) => 5);