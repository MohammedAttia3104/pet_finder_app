import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String svgIcon;

  const SvgIcon({super.key, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgIcon,
      width: 24.w,
      height: 24.h,
    );
  }
}
