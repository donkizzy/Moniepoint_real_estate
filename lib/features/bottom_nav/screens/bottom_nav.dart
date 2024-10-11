import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_real_estate/features/bottom_nav/widget/custom_bottom_nav.dart';
import 'package:moniepoint_real_estate/features/home/screens/home.dart';
import 'package:moniepoint_real_estate/features/search/screens/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  ValueNotifier<int> selectedIndex = ValueNotifier(2);

  List<Widget> screens = [
    const SearchPage(),
    const Placeholder(),
    const HomePage(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (BuildContext context, int value, Widget? child) {
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: FloatingNavbar(
            onTap: (int val) {
              selectedIndex.value = val;
            },
            currentIndex: value,
            items: const [
              "assets/search.svg",
              "assets/message.svg",
              "assets/home.svg",
              "assets/heart.svg",
              "assets/user.svg"
            ],
          ).animate(delay: 2.5.seconds).slideY(
            duration: 1000.milliseconds,
            begin: 1.5,
            end: 0,
            curve: Curves.easeInOut,
          ),
          body: screens[value],
        );
      },
    );
  }
}
