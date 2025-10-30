import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/extensions/image_url_extension.dart';
import 'package:pet_finder_app/core/extensions/navigation_extension.dart';
import 'package:pet_finder_app/core/widgets/fancy_network_image.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_cubit.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_state.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';

import '../../../../../core/helpers/toast_helper.dart';
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
          Positioned(
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
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
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

                BlocConsumer<FavoriteCubit, FavoriteState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      addFavoriteSuccess: (message) => ToastHelper.show(
                        context,
                        "Added to favorites Successfully",
                        type: ToastType.success,
                      ),
                      deleteFavoriteSuccess: (message) => ToastHelper.show(
                        context,
                        "Removed from favorites Successfully",
                        type: ToastType.info,
                      ),
                      addFavoriteFailure: (error) {
                        ToastHelper.show(context, error, type: ToastType.error);
                      },
                      deleteFavoriteFailure: (error) {
                        ToastHelper.show(context, error, type: ToastType.error);
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    final cubit = context.read<FavoriteCubit>();
                    final isFavorited = cubit.isFavorited(breed.id);
                    final favoriteId = cubit.getFavoriteId(breed.id);

                    return GestureDetector(
                      onTap: () {
                        if (isFavorited && favoriteId != null) {
                          cubit.deleteFavorite(favoriteId);
                        } else {
                          cubit.addFavorite(breed.id, 'user_${breed.id}');
                        }
                      },
                      child: SvgPicture.asset(
                        isFavorited
                            ? Assets.svgsHeartFilledSvg
                            : Assets.svgsHeartSvg,
                        width: 24.w,
                        height: 24.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
