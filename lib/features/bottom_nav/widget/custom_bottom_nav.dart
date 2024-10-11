import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_real_estate/core/app_colors.dart';

typedef ItemBuilder = Widget Function(
    BuildContext context, int index, String items);

class FloatingNavbar extends StatefulWidget {
  final List<String> items;
  final int currentIndex;
  final void Function(int val)? onTap;
  final ItemBuilder itemBuilder;

  FloatingNavbar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    ItemBuilder? itemBuilder,
  })  : assert(items.length > 1),
        assert(items.length <= 5),
        assert(currentIndex <= items.length),
        itemBuilder = itemBuilder ??
            _defaultItemBuilder(
              currentIndex: currentIndex,
              items: items,
              onTap: onTap,
            );

  @override
  FloatingNavbarState createState() => FloatingNavbarState();
}

class FloatingNavbarState extends State<FloatingNavbar> {
  List<String> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 3,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: mineShaftGrey,
          ),
          child: Row(
            children: items
                .asMap()
                .map((i, f) {
              return MapEntry(i, widget.itemBuilder(context, i, f));
            }).values.toList(),
          ),
        ),
      ),
    );
  }
}

ItemBuilder _defaultItemBuilder({
  Function(int val)? onTap,
  required List<String> items,
  int? currentIndex,
}) {
  return (BuildContext context, int index, String item) {
    var isSelected = currentIndex == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
          color: isSelected
              ? sunOrange
              : tuataraBlack,
          ),
      child: GestureDetector(
        onTap: () {
          onTap!(index);
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding:  EdgeInsets.all(isSelected ?  15: 10),
          child: Center(
            child: SvgPicture.asset(
              items[index],
              height: 25,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  };
}