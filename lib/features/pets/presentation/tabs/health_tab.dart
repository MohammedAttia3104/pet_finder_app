import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theming/app_colors.dart';
import 'package:pet_finder_app/features/pets/widgets/health_reminder_card.dart';
import 'package:pet_finder_app/features/pets/widgets/section_title.dart';

class HealthTab extends StatelessWidget {
  const HealthTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHealthTrackerCard(),
          24.verticalSpace,
          const SectionTitle(title: 'Health Reminders'),
          12.verticalSpace,
          _buildHealthReminders(),
          24.verticalSpace,
          const SectionTitle(title: 'Vet Visits'),
          12.verticalSpace,
          _buildVetVisits(),
        ],
      ),
    );
  }

  Widget _buildHealthTrackerCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6B46C1), Color(0xFF9333EA)],
        ),
        borderRadius: BorderRadius.circular(20).r,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9333EA).withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Health Score',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20).r,
                ),
                child: Text(
                  'Excellent',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              Text(
                '92',
                style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              8.horizontalSpace,
              Text(
                '/100',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              _buildHealthMetric('Weight', '12.5 kg', Icons.monitor_weight_outlined),
              20.horizontalSpace,
              _buildHealthMetric('Activity', '8.2 km', Icons.directions_run),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthMetric(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: Colors.white.withValues(alpha: 0.8)),
        8.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHealthReminders() {
    return const Column(
      children: [
        HealthReminderCard(
          title: 'Vaccination Due',
          date: 'Nov 5, 2025',
          isUrgent: true,
        ),
        HealthReminderCard(
          title: 'Flea Treatment',
          date: 'Nov 15, 2025',
        ),
        HealthReminderCard(
          title: 'Dental Checkup',
          date: 'Dec 1, 2025',
        ),
      ],
    );
  }

  Widget _buildVetVisits() {
    return Container(
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
      child: Column(
        children: [
          _buildVetVisitItem('Last Visit', 'Oct 15, 2025', 'Annual Checkup', Colors.green),
          Divider(height: 24.h),
          _buildVetVisitItem('Next Visit', 'Nov 5, 2025', 'Vaccination', AppColors.primaryColor),
        ],
      ),
    );
  }

  Widget _buildVetVisitItem(String label, String date, String purpose, Color color) {
    return Row(
      children: [
        Container(
          width: 8.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4).r,
          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),
              ),
              4.verticalSpace,
              Text(
                date,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              2.verticalSpace,
              Text(
                purpose,
                style: TextStyle(fontSize: 13.sp, color: color),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

