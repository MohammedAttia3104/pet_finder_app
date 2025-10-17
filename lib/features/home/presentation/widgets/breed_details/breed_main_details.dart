import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../generated/assets.dart';
import 'adopt_me_button.dart';

class BreedMainDetails extends StatelessWidget {
  final BreedModel breed;
  const BreedMainDetails({super.key, required this.breed});

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
                    breed.name,
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
                        breed.origin,
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
             Tooltip(
               message: "intelligence",
               child: Text(
                 "${breed.intelligence}%",
                 style: TextStyle(
                   fontSize: 26.sp,
                   fontWeight: FontWeight.bold,
                   color: AppColors.primaryColor,
                 ),
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
            breed.description,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF646464),
              height: 1.4,
            ),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
