import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';

import '../../../../../core/widgets/fancy_network_image.dart';
import '../../../../../generated/assets.dart';

class PetItem extends StatelessWidget {
  final BreedModel breed;
  final String? breedImage;

  const PetItem({super.key, required this.breed, required this.breedImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 32.w,
      height: 124.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8).r,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Pet Image
          Padding(
            padding: EdgeInsets.only(
              left: 10.w,
              top: 6.h,
              bottom: 6.h,
              right: 16.w,
            ),
            child: FancyNetworkImage(
              imagePath: breedImage ?? 'https://img.freepik.com/free-vector/illustration-gallery-icon_53876-27002.jpg',
              width: 112.w,
              height: 112.h,
              borderRadiusGeometry: BorderRadius.all(Radius.circular(8).r),
            ),
          ),

          /// Pet Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  breed.name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Text(
                  '${breed.weight.imperial} lbs',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF646464),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                2.verticalSpace,
                Text(
                  '${breed.lifeSpan} years old',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF646464),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                8.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.svgsLocationSvg,
                      width: 16.w,
                      height: 16.h,
                    ),
                    4.horizontalSpace,
                    Expanded(
                      child: Text(
                        breed.origin,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF646464),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Favorite icon
          Padding(
            padding: EdgeInsets.only(right: 12.w, top: 16.h),
            child: SvgPicture.asset(
              Assets.svgsHeartSvg,
              width: 28.w,
              height: 28.h,
            ),
          ),
        ],
      ),
    );
  }
}

