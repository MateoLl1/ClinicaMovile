
import 'package:flutter/material.dart';

class AppTheme {
  
  final bool isDark;

  AppTheme({required this.isDark});


  ThemeData getTheme() =>ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.blue
  );
}