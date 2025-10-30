import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theming/app_styles.dart';
import 'package:pet_finder_app/core/utils/app_strings.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_cubit.dart';
import 'package:pet_finder_app/features/favorite/presentation/widgets/favorite_grid_view.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/home/home_categories.dart';

import '../../../../core/theming/app_colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteCubit>().getFavorites();
    });
  }

  Future<void> _refreshFavorites() async {
    await context.read<FavoriteCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshFavorites,
          color: AppColors.primaryColor,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0.w,
                right: 16.0.w,
                top: 40.0.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.yourFavoritePets,
                    style: AppStyles.font24BlackBold,
                  ),
                  20.verticalSpace,
                  HomeCategories(),
                  24.verticalSpace,
                  const FavoriteGridView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
