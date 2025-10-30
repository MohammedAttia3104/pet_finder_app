import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theming/app_colors.dart';
import 'package:pet_finder_app/features/pets/widgets/section_title.dart';
import 'package:pet_finder_app/features/pets/widgets/service_category_card.dart';

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Popular Services'),
          12.verticalSpace,
          _buildServicesGrid(),
          24.verticalSpace,
          const SectionTitle(title: 'Nearby Providers'),
          12.verticalSpace,
          _buildNearbyProviders(),
        ],
      ),
    );
  }

  Widget _buildServicesGrid() {
    final services = [
      {
        'icon': Icons.medical_services,
        'title': 'Veterinary',
        'providers': '24',
        'color': Colors.red,
      },
      {
        'icon': Icons.content_cut,
        'title': 'Grooming',
        'providers': '18',
        'color': Colors.blue,
      },
      {
        'icon': Icons.school,
        'title': 'Training',
        'providers': '12',
        'color': Colors.orange,
      },
      {
        'icon': Icons.pets,
        'title': 'Pet Sitting',
        'providers': '31',
        'color': Colors.purple,
      },
      {
        'icon': Icons.hotel,
        'title': 'Boarding',
        'providers': '15',
        'color': Colors.green,
      },
      {
        'icon': Icons.local_shipping,
        'title': 'Pet Taxi',
        'providers': '8',
        'color': Colors.cyan,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.85,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return ServiceCategoryCard(
          icon: service['icon'] as IconData,
          title: service['title'] as String,
          providerCount: service['providers'] as String,
          color: service['color'] as Color,
        );
      },
    );
  }

  Widget _buildNearbyProviders() {
    final providers = [
      {
        'name': 'Happy Paws Clinic',
        'rating': '4.8',
        'distance': '1.2 km',
        'type': 'Veterinary',
      },
      {
        'name': 'Pet Spa & Grooming',
        'rating': '4.9',
        'distance': '2.5 km',
        'type': 'Grooming',
      },
      {
        'name': 'Puppy Training Academy',
        'rating': '4.7',
        'distance': '3.1 km',
        'type': 'Training',
      },
    ];

    return Column(
      children: providers
          .map((provider) => _buildProviderCard(provider))
          .toList(),
    );
  }

  Widget _buildProviderCard(Map<String, String> provider) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16).r,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(12).r,
            ),
            child: Icon(
              Icons.store,
              color: AppColors.primaryColor,
              size: 32.sp,
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider['name']!,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                4.verticalSpace,
                Text(
                  provider['type']!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                6.verticalSpace,
                Row(
                  children: [
                    Icon(Icons.star, size: 14.sp, color: Colors.amber),
                    4.horizontalSpace,
                    Text(
                      provider['rating']!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    12.horizontalSpace,
                    Icon(
                      Icons.location_on,
                      size: 14.sp,
                      color: const Color(0xFF646464),
                    ),
                    4.horizontalSpace,
                    Text(
                      provider['distance']!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF646464),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: const Color(0xFF646464),
          ),
        ],
      ),
    );
  }
}
