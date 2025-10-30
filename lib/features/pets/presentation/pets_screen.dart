import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theming/app_colors.dart';
import 'package:pet_finder_app/features/pets/presentation/tabs/care_tab.dart';
import 'package:pet_finder_app/features/pets/presentation/tabs/community_tab.dart';
import 'package:pet_finder_app/features/pets/presentation/tabs/health_tab.dart';
import 'package:pet_finder_app/features/pets/presentation/tabs/services_tab.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  CareTab(),
                  HealthTab(),
                  ServicesTab(),
                  CommunityTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pet Care',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              4.verticalSpace,
              Text(
                'Everything for your furry friends',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF646464),
                ),
              ),
            ],
          ),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(12).r,
            ),
            child: Icon(
              Icons.pets,
              color: AppColors.primaryColor,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorColor: AppColors.primaryColor,
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: const Color(0xFF646464),
        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
        tabs: const [
          Tab(text: 'Care Tips'),
          Tab(text: 'Health'),
          Tab(text: 'Services'),
          Tab(text: 'Community'),
        ],
      ),
    );
  }
}