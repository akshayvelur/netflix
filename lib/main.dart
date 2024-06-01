import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Clone',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 24)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: Colors.black),fontFamily: GoogleFonts.ptSans().fontFamily,
            
        useMaterial3: true,
        
      ),home: SplashScreen(),
    );
  }
}