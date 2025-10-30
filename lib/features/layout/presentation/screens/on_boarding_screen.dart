import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/extensions/hex_color_extension.dart';
import 'package:pet_finder_app/core/extensions/navigation_extension.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/core/theming/app_colors.dart';

import '../../../../generated/assets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const Spacer(flex: 2),

              /// Pet Image
              Image.asset(
                Assets.imagesOnBoarding,
                height: 305.h,
                fit: BoxFit.contain,
              ),
              69.verticalSpace,

              /// Title
              Text(
                'Find Your Best\nCompanion With us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.6,
                ),
              ),
              10.verticalSpace,

              /// Subtitle
              Text(
                'Join & discover the best suitable pets as\nper your preferences in your location',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: "9F9F9F".toColor(),
                  height: 1.6,
                ),
              ),
              const Spacer(flex: 2),

              /// Get Started Button
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () => context.pushNameAndRemoveUntil(
                    Routes.layoutScreen,
                    predicate: (route) => false,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                    elevation: 4,
                    shadowColor: AppColors.primaryColor.withValues(alpha: 0.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pets, size: 24.sp),
                      SizedBox(width: 8.w),
                      Text(
                        'Get started',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              40.verticalSpace,

            ],
          ),
        ),
      ),
    );
  }
}
