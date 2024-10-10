import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moniepoint_real_estate/app_colors.dart';

class GlassButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? tooltip;
  final Widget? child;
  final VoidCallback? onTap;
  const GlassButton({
    super.key,
    this.height,
    this.width,
    this.tooltip,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: doveGrey.withOpacity(0.5),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(30),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: onTap,
              child: Tooltip(
                message: tooltip,
                child: Ink(
                  height: height,
                  width: width,
                  padding: const EdgeInsets.all(10),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}