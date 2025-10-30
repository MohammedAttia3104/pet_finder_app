import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theming/app_colors.dart';
import 'package:pet_finder_app/core/theming/font_weight_helper.dart';
import 'package:pet_finder_app/features/home/controllers/home_cubit.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_strings.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.categories, style: AppStyles.font20BlackBold),
          14.verticalSpace,
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return FilterChip(
                  label: Text(categories[index]),
                  onSelected: (value) {
                    if (selectedIndex != index) {
                      setState(() {
                        selectedIndex = index;
                      });
                      context.read<HomeCubit>().selectCategory(
                        categories[index],
                      );
                    }
                  },
                  selected: isSelected,
                  selectedColor: AppColors.primaryColor,
                  backgroundColor: AppColors.secondaryColor,
                  labelStyle: TextStyle(
                    color: selectedIndex == index
                        ? Colors.white
                        : AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  elevation: 0,
                  pressElevation: 0,
                  shadowColor: Colors.transparent,
                  showCheckmark: false,
                  side: BorderSide.none,
                );
              },
              separatorBuilder: (context, index) => 8.horizontalSpace,
            ),
          ),
        ],
      ),
    );
  }
}

List<String> categories = [
  'All',
  'Dogs',
  'Cats',
  'Birds',
  'Rabbits',
  'Fish',
  'Reptiles',
  'Hamsters',
  'Guinea Pigs',
  'Turtles',
  'Frogs',
];
