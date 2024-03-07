import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavRepo =
    ChangeNotifierProvider<BottomNavProvider>((ref) => BottomNavProvider());

class BottomNavProvider extends ChangeNotifier {
  int tabIndex = 0;
  updateIndex(int val) {
    tabIndex = val;
    notifyListeners();
  }
}
