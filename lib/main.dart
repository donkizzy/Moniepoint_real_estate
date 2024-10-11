import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_real_estate/core/app_colors.dart';
import 'package:moniepoint_real_estate/features/bottom_nav/screens/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moniepoint Real Estate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          popupMenuTheme: const PopupMenuThemeData(
            color: alabasterGrey,
          ),
        colorScheme: ColorScheme.fromSeed(seedColor: sunOrange),
        useMaterial3: true,
        textTheme:  GoogleFonts.openSansTextTheme()
      ),
      home: const BottomNav(),
    );
  }
}
