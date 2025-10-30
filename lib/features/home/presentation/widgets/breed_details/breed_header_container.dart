import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/extensions/image_url_extension.dart';
import 'package:pet_finder_app/core/extensions/navigation_extension.dart';
import 'package:pet_finder_app/core/widgets/fancy_network_image.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/breed_details/widgets/breed_info_badge.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/breed_details/widgets/gradient_overlay.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../generated/assets.dart';

class BreedHeaderContainer extends StatelessWidget {
  final BreedModel breed;

  const BreedHeaderContainer({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
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
          _buildHeroImage(width),
          _buildGradientOverlay(width),
          _buildBreedInfoBadge(),
          _buildTopNavigationBar(context),
        ],
      ),
    );
  }

  Widget _buildHeroImage(double width) {
    return Positioned(
      bottom: 0,
      child: Hero(
        tag: 'breed_image_${breed.id}',
        child: FancyNetworkImage(
          width: width,
          height: 375.h,
          imagePath: breed.referenceImageId!.toImageUrl(),
          borderRadiusGeometry: BorderRadius.only(
            bottomRight: Radius.circular(30).r,
            bottomLeft: Radius.circular(30).r,
          ),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay(double width) {
    return Positioned(
      bottom: 0,
      child: GradientOverlay(
        width: width,
        height: 150,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30).r,
          bottomLeft: Radius.circular(30).r,
        ),
      ),
    );
  }

  Widget _buildBreedInfoBadge() {
    return Positioned(
      bottom: 20.h,
      left: 20.w,
      right: 20.w,
      child: BreedInfoBadge(breed: breed),
    );
  }

  Widget _buildTopNavigationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBackButton(context),
          _buildFavoriteIcon(),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: Icon(
        Icons.arrow_back_ios,
        size: 24.sp,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget _buildFavoriteIcon() {
    return SvgPicture.asset(
      Assets.svgsHeartSvg,
      width: 24.w,
      height: 24.h,
      colorFilter: ColorFilter.mode(
        AppColors.primaryColor,
        BlendMode.srcIn,
      ),
    );
  }
}
