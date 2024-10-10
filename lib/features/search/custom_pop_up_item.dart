import 'package:flutter/material.dart';
import 'package:moniepoint_real_estate/app_colors.dart';

class CustomPopItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const CustomPopItem({
    super.key,
    required this.icon,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      visualDensity: VisualDensity.compact,
      leading: Icon(
        icon,
        color: alabasterGrey,
        size: 20,
      ),
      onTap: onTap,
      selectedColor: sunOrange,
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? sunOrange : alabasterGrey,
          fontSize: 13.5,
        ),
      ),
    );
  }
}