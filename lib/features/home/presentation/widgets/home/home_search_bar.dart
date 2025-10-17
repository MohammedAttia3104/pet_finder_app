import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/home/controllers/home_cubit.dart';
import 'package:pet_finder_app/features/home/controllers/home_state.dart';

import '../../../../../core/utils/app_strings.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return Container(
          width: MediaQuery.sizeOf(context).width - 32.w,
          height: 42.h,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(12).r,
          ),
          child: TextField(
            controller: _searchController,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText: AppStrings.search,
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, size: 20.w),
              suffixIcon: cubit.isSearching || _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.close, size: 20.w),
                      onPressed: () {
                        _searchController.clear();
                        cubit.clearSearch();
                      },
                    )
                  : Icon(Icons.filter_list, size: 20.w),
              contentPadding: EdgeInsets.symmetric(vertical: 10.h),
            ),
            onChanged: (text) {
              cubit.searchBreeds(text);
            },
          ),
        );
      },
    );
  }
}
