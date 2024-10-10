import 'package:flutter/material.dart';
import 'package:moniepoint_real_estate/features/bottom_nav/custom_bottom_nav.dart';
import 'package:moniepoint_real_estate/features/home/home.dart';
import 'package:moniepoint_real_estate/features/search/search.dart';

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
          ),
          body: screens[value],
        );
      },
    );
  }
}
