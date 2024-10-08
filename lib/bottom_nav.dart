import 'package:flutter/material.dart';
import 'package:moniepoint_real_estate/custom_bottom_nav.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);

//["assets/search.svg","assets/message.svg","assets/home.svg","assets/heart.svg","assets/user.svg"]
  List<Widget> screens = [
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (BuildContext context, int value, Widget? child) {
        return Scaffold(
          bottomNavigationBar: FloatingNavbar(
            onTap: (int val) {
              selectedIndex.value = val;
            },
            currentIndex: value,
            items: [
              "assets/search.svg",
              "assets/message.svg",
              "assets/home.svg",
              "assets/heart.svg",
              "assets/user.svg"
            ],
          ),
          body: IndexedStack(
            index: value,
            children: screens,
          ),
        );
      },
    );
  }
}
