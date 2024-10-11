import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_real_estate/features/home/widget/animated_count_up.dart';
import 'package:moniepoint_real_estate/core/app_colors.dart';
import 'package:moniepoint_real_estate/features/home/widget/image_item.dart';
import 'package:moniepoint_real_estate/core/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.2, 0.8],
          colors: [
            alabasterGrey,
            peachYellow,
          ],
        )),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 170),
                duration: 500.milliseconds,
                builder: (BuildContext context, double value, Widget? child) {
                  return Container(
                    width: value,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(15),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: donkeyBrown,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Saint Petersburg",
                          style: TextStyle(fontSize: 14, color: donkeyBrown, fontWeight: FontWeight.w500),
                        )
                      ],
                    ).animate(delay: 0.8.seconds).fadeIn(
                          duration: 500.milliseconds,
                        ),
                  );
                },
              ),
              centerTitle: false,
              actions: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage('https://picsum.photos/1024/1024'),
                ).animate().scale(
                      duration: 1.seconds,
                      curve: Curves.easeInOut,
                    ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Text(
                      'Hi, Marina',
                      style: TextStyle(color: donkeyBrown, fontSize: 24, fontWeight: FontWeight.w500),
                    )
                        .animate(delay: 0.8.seconds)
                        .move(duration: 450.ms, begin: const Offset(0, 10))
                        .fade(duration: 450.ms),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Text(
                      'let\'s select your perfect place',
                      style: TextStyle(color: mineShaftGrey, fontSize: 35, fontWeight: FontWeight.w500),
                    )
                        .animate(delay: 1.1.seconds)
                        .move(duration: 500.ms, begin: const Offset(0, 10))
                        .fade(duration: 500.ms),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: height(context) > 760 ? 200 : 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                padding: const EdgeInsets.only(top: 30, bottom: 10, right: 10, left: 10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: sunOrange,
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      "BUY",
                                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                    const Spacer(),
                                    Column(
                                      children: [
                                        AnimatedCountUp(
                                          duration: 1.5.seconds,
                                          end: 1024,
                                          style: GoogleFonts.manrope(
                                              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 40),
                                        ),
                                        const Text(
                                          "offers",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                padding: const EdgeInsets.only(top: 30, bottom: 10, right: 10, left: 10),
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                                child: Column(
                                  children: [
                                    const Text(
                                      "RENT",
                                      style: TextStyle(color: donkeyBrown, fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                    const Spacer(),
                                    Column(
                                      children: [
                                        AnimatedCountUp(
                                          duration: 1.5.seconds,
                                          end: 2212,
                                          style: GoogleFonts.manrope(
                                              color: donkeyBrown, fontWeight: FontWeight.w800, fontSize: 40),
                                        ),
                                        const Text(
                                          "offers",
                                          style: TextStyle(color: donkeyBrown),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              )),
                        ],
                      ).animate().scale(
                        duration: 1.seconds,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
                  child: const Column(
                    children: [
                      RealEstateItem(
                        isSplit: false,
                        borderRadius: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 400,
                        child: Row(
                          children: [
                            Flexible(
                                child: RealEstateItem(
                              height: 400,
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child: Column(
                              children: [
                                RealEstateItem(
                                  height: 195,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RealEstateItem(
                                  height: 195,
                                )
                              ],
                            ))
                          ],
                        ),
                      )
                    ],
                  )).animate(delay: 1.seconds).slideY(
                duration: 1000.milliseconds,
                begin: 1.5,
                end: 0,
                curve: Curves.easeInOut,
              ),
            )
          ],
        ),
      ),
    );
  }

}
