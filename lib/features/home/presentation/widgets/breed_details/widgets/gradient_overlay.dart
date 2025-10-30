import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientOverlay extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const GradientOverlay({
    super.key,
    required this.width,
    this.height = 150,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withValues(alpha: 0.7),
          ],
        ),
        borderRadius: borderRadius,
      ),
    );
  }
}

