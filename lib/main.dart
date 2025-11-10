import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(const FinanceMateApp());
}

class FinanceMateApp extends StatelessWidget {
  const FinanceMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Mate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.orange, // Aksen oranye tetap dipakai
        
        // === PERUBAHAN: Tema diubah ke Mode Gelap ===
        brightness: Brightness.dark,
        // === BATAS PERUBAHAN ===
        
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white, // Pastikan teks dasar putih
                displayColor: Colors.white,
              ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}