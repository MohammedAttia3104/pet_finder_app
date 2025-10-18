import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/home/controllers/home_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/home/home_header.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/home/home_search_bar.dart';

import '../widgets/home/home_categories.dart';
import '../widgets/home/home_pets_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    // Fetch initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().getBreedsPaginated();
    });
  }

  void _scrollListener() {
    final cubit = context.read<HomeCubit>();

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * 0.7 &&
        !cubit.hasReachedMax) {
      cubit.getBreedsPaginated();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 40.h,
          ),
          child: Column(
            children: [
              HomeHeader(),
              20.verticalSpace,
              HomeSearchBar(),
              20.verticalSpace,
              HomeCategories(),
              24.verticalSpace,
              Expanded(
                child: HomePetsListView(scrollController: _scrollController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
