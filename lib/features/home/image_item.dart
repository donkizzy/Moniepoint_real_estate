import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_real_estate/app_colors.dart';
import 'package:moniepoint_real_estate/utils.dart';

class RealEstateItem extends StatelessWidget {
  final double height;

  final bool isSplit;

  final double borderRadius;

  const RealEstateItem({super.key, this.height = 200, this.isSplit = true, this.borderRadius = 15});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.network(
            'https://picsum.photos/1024/1024',
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 50, end: width(context)),
            curve: Curves.easeInToLinear,
            duration: 1.seconds,
            builder: (BuildContext context, double value, Widget? child) {
              return Container(
                width: value,
                decoration: BoxDecoration(
                  color: coralReefGrey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          if (!isSplit) ...[
                            const Spacer(),
                            const Text(
                              'Gladkova St., 25',
                              style: TextStyle(
                                color: mineShaftGrey,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ).animate(delay: 1.2.seconds).fadeIn(
                                  duration: 1.2.seconds,
                                ),
                            const Spacer()
                          ] else ...[
                            const SizedBox(
                              width: 10,
                            ),
                             Expanded(
                                child: const Text(
                              'Gladkova St., 25',
                              style: TextStyle(
                                color: mineShaftGrey,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ).animate(delay: 1.2.seconds).fadeIn(
                                  duration: 1.2.seconds,
                                ),),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ],
                      ).animate(delay: 1.2.seconds).fadeIn(
                            duration: 1.seconds,
                          ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      margin: const EdgeInsets.only(right: 3, bottom: 3, top: 3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: alabasterGrey,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
