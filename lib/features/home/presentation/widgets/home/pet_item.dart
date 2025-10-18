import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/extensions/navigation_extension.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_cubit.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_state.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';

import '../../../../../core/helpers/toast_helper.dart';
import '../../../../../core/widgets/fancy_network_image.dart';
import '../../../../../generated/assets.dart';

class PetItem extends StatelessWidget {
  final BreedModel breed;
  final String? breedImage;

  const PetItem({super.key, required this.breed, required this.breedImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.breedDetailsScreen,
        arguments: {'breedId': breed.id},
      ),
      child: Container(
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
                imagePath:
                    breedImage ??
                    'https://img.freepik.com/free-vector/illustration-gallery-icon_53876-27002.jpg',
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
                        colorFilter: ColorFilter.mode(
                          Color(0xFF646464),
                          BlendMode.srcIn,
                        ),
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

            /// Favorite icon - with state management
            Padding(
              padding: EdgeInsets.only(right: 12.w, top: 16.h),
              child: BlocConsumer<FavoriteCubit, FavoriteState>(
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
                      key: Key("favorite_key"),
                      isFavorited
                          ? Assets.svgsHeartFilledSvg
                          : Assets.svgsHeartSvg,
                      width: 28.w,
                      height: 28.h,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
