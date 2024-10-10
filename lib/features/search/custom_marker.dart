import 'package:flutter/material.dart';
import 'package:moniepoint_real_estate/app_colors.dart';


class CustomMarker extends StatelessWidget {
  const CustomMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: sunOrange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(0),
        ),
      ),
      child: const Icon(
        Icons.business,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}