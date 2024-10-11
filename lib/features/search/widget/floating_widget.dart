import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_real_estate/core/app_colors.dart';
import 'package:moniepoint_real_estate/features/search/widget/glass_button.dart';

class FloatingWidget extends StatefulWidget {
  const FloatingWidget({
    super.key,
    required this.isExpanded,
  });

  final ValueNotifier<bool> isExpanded;

  @override
  State<FloatingWidget> createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {

  Map<String, IconData> menuTitles = {
    'Cosy areas': Icons.verified_user_outlined,
    'Price': Icons.wallet_outlined,
    'Infrastructure': Icons.pageview_outlined,
    'Without any layer': Icons.layers_outlined,
  };


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0, left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  const GlassButton(
                    height: 50,
                    width: 50,
                    child: Icon(
                      CupertinoIcons.layers_alt,
                      color: Colors.white,
                    ),
                  )
                      .animate(delay: 500.milliseconds).scaleXY(
                    duration: 800.milliseconds,
                    curve: Curves.easeInOut,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PopupMenuButton(
                    position: PopupMenuPosition.over,
                    offset: const Offset(0, -195),
                    popUpAnimationStyle: AnimationStyle(),
                    onSelected: (value) {
                      if (value == 'Price') {
                        widget.isExpanded.value = !widget.isExpanded.value;
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    menuPadding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context) {
                      return menuTitles.keys.map((choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                menuTitles[choice],
                                color: tapaGrey,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                choice,
                                style: const TextStyle(color: tapaGrey, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        );
                      }).toList();
                    },
                    child: const GlassButton(
                      height: 50,
                      width: 50,
                      child: Icon(
                        CupertinoIcons.paperplane,
                        color: Colors.white,
                        size: 18,
                      ),
                    ).animate(delay: 500.milliseconds).scaleXY(
                      duration: 800.milliseconds,
                      curve: Curves.easeInOut,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                decoration: BoxDecoration(color: doveGrey.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      CupertinoIcons.text_alignleft,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'List of variants',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ).animate(delay: 500.milliseconds).scaleXY(
                duration: 800.milliseconds,
                curve: Curves.easeInOut,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
