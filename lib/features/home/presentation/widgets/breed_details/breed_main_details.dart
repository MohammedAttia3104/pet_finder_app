import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../generated/assets.dart';
import 'adopt_me_button.dart';

class BreedMainDetails extends StatelessWidget {
  const BreedMainDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tom",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.svgsLocationSvg,
                        width: 16.w,
                        height: 16.h,
                      ),
                      4.horizontalSpace,
                      Text(
                        "2.7 km away",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF646464),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "\$100",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Text(
            "About :",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          8.verticalSpace,
          Text(
            "Tom is a playful and loyal Golden Retriever who loves being around people. He’s 1 years old, full of energy, and always ready for a game of fetch. Tom enjoys morning walks, belly rubs, and taking long naps after playtime. He’s gentle with kids, gets along well with other pets, and makes the perfect family companion.",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF646464),
              height: 1.4,
            ),
          ),
          24.verticalSpace,
          AdoptMeButton(),
          40.verticalSpace,
        ],
      ),
    );
  }
}
