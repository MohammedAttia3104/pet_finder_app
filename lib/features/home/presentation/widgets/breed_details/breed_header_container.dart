import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/extensions/navigation_extension.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../generated/assets.dart';

class BreedHeaderContainer extends StatelessWidget {
  const BreedHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final width =  MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      height: 375.h,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30).r,
          bottomLeft: Radius.circular(30).r,
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30).r,
                bottomLeft: Radius.circular(30).r,
              ),
              child: Image.asset(
                Assets.imagesDog,
                width: width,
                height: 280.h,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 40.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 24.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                SvgPicture.asset(
                  Assets.svgsHeartSvg,
                  width: 32.w,
                  height: 32.h,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
