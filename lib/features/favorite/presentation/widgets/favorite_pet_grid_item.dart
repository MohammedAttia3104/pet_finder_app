import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/theming/app_colors.dart';
import 'package:pet_finder_app/core/theming/font_weight_helper.dart';
import 'package:pet_finder_app/features/favorite/data/models/favorite_breed.dart';

import '../../../../../core/widgets/fancy_network_image.dart';
import '../../../../generated/assets.dart';

class FavoritePetGridItem extends StatelessWidget {
  final FavoriteBreed favorite;
  final VoidCallback onDelete;

  const FavoritePetGridItem({
    super.key,
    required this.favorite,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162.w,
      height: 212.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8).r,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w, bottom: 9.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          FancyNetworkImage(
            imagePath:
                // favorite.imageId.toImageUrl() ??
                'https://img.freepik.com/free-vector/illustration-gallery-icon_53876-27002.jpg',
            width: 162.w,
            height: 140.h,
            borderRadiusGeometry: BorderRadius.all(Radius.circular(8).r),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.semiBold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  2.verticalSpace,
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.svgsLocationSvg,
                        width: 16.w,
                        height: 16.h,
                      ),
                      4.horizontalSpace,
                      Text(
                        "origin",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF646464),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(right: 4.0.w, top: 4.0.h),
                child: GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    padding: EdgeInsets.fromLTRB(4.w, 5.h, 4.w, 5.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6).r,
                    ),
                    child: SvgPicture.asset(
                      Assets.svgsHeartSvg,
                      width: 16.w,
                      height: 16.h,
                      colorFilter: ColorFilter.mode(
                        Colors.red,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
