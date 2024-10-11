import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_real_estate/core/app_colors.dart';


class CustomMarker extends StatefulWidget {
  final bool isExpanded ;
  const CustomMarker({super.key, required this.isExpanded});

  @override
  State<CustomMarker> createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: 1200.ms);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _animation.value,
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(5),
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
            child: !widget.isExpanded ? const Icon(
              Icons.business,
              color: Colors.white,
              size: 20,
            ) :  const Text('13,000km',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),
          ),
        ) ;
      },
    );
  }
}