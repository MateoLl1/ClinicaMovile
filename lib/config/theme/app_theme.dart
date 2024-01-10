
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  
  final bool isDark;

  AppTheme({required this.isDark});

  ThemeData getTheme() =>ThemeData(
    useMaterial3: true,
    brightness: isDark ? Brightness.dark : Brightness.light ,
    colorSchemeSeed: Colors.blue,
    appBarTheme: const AppBarTheme(
      centerTitle: true
    ),
    textTheme: TextTheme(
     
      titleLarge: GoogleFonts.exo2(
        fontSize: 30,
      ),

      // PARRAFOS
      bodyMedium: GoogleFonts.exo2(
        fontSize: 15,
      ),

      labelLarge: GoogleFonts.exo2(
        fontSize: 20,
        color: Colors.white
      ),

      labelMedium: GoogleFonts.exo2(
        fontSize: 13,
        color: Colors.white,
        
      ),
      

      //BOTONES CON FONDOS CLAROS
      bodySmall: GoogleFonts.exo2(
        fontSize: 15,
        color: !isDark ? Colors.white : Colors.black
      ),
    )
  );
}