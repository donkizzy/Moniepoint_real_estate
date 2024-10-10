import 'package:flutter/material.dart';
import 'package:moniepoint_real_estate/features/search/custom_pop_up_item.dart';


class CustomPopUp extends StatelessWidget {
  final List<CustomPopItem> items;
  final OverlayPortalController controller;
  final int currentIndex;
  final Widget? child;
  final ValueChanged<int>? onTap;

  const CustomPopUp({
    required this.items,
    required this.controller,
    this.currentIndex = 0,
    this.child,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: controller,
      child: child,
      overlayChildBuilder: (context) {
        return Positioned(
          top: 500,
          right: 170,
          bottom: 110,
          child: Container(
            width: 190,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: List.generate(
                items.length,
                    (index) {
                  final item = items.elementAt(index);
                  return CustomPopItem(
                    icon: item.icon,
                    text: item.text,
                    isSelected: currentIndex == index,
                    onTap: () {
                      onTap?.call(index);
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}