import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  ValueNotifier<int> selectedIndex = ValueNotifier(0) ;
  List<Widget> screens=  [const Placeholder(),const Placeholder(),const Placeholder(),const Placeholder(),const Placeholder(),] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (BuildContext context, int value, Widget? child) {
          return Container(
            height: 80,
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CurvedNavigationBar(
                  height: 50,
                  backgroundColor: Colors.white,
                  color: Colors.white,
                  buttonBackgroundColor: Colors.grey.shade300,
                  onTap: (index){
                    selectedIndex.value = index ;
                  },
                  index: value,
                  items: const <Widget>[
                    Icon(Icons.home),
                    Icon(Icons.search),
                    Icon(Icons.settings),
                    Icon(Icons.person),
                    Icon(Icons.person),
                  ]),

            ),

          ) ;
        },
      ),
      body:  const IndexedStack(
        children: [],
      ),
    );
  }
}
