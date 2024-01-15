import 'package:flutter/material.dart';

var themeData = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.orangeAccent,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(color: Colors.orangeAccent),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      showUnselectedLabels: true),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
  useMaterial3: true,
);
