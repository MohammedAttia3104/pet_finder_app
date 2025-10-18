import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/theming/app_colors.dart';

import '../../../../generated/assets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final List<String> _icons = const [
    Assets.svgsHomeSvg,
    Assets.svgsHeartSvg,
    Assets.svgsPetsSvg,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_icons.length, (index) {
          final isSelected = selectedIndex == index;
          final keys = [
            const Key('bottom_nav_home'),
            const Key('bottom_nav_favorites'),
            const Key('bottom_nav_pets'),
          ];
          return GestureDetector(
            key: keys[index],
            onTap: () => onItemTapped(index),
            child: SvgPicture.asset(
              _icons[index],
              width: 30.w,
              height: 30.h,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primaryColor : AppColors.greyColor,
                BlendMode.srcIn,
              ),
            ),
          );
        }),
      ),
    );
  }
}
