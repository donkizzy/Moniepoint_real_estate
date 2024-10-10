import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_real_estate/app_colors.dart';
import 'package:moniepoint_real_estate/features/bottom_nav/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: sunOrange),
        useMaterial3: true,
        textTheme:  GoogleFonts.openSansTextTheme()
      ),
      home: const BottomNav(),
    );
  }
}
