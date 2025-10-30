import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theming/app_colors.dart';

class TraitProgressBar extends StatelessWidget {
  final String label;
  final int value;
  final int maxValue;

  const TraitProgressBar({
    super.key,
    required this.label,
    required this.value,
    this.maxValue = 5,
  });

  @override
  Widget build(BuildContext context) {
    final progress = value / maxValue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              "$value/$maxValue",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        8.verticalSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(10).r,
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8.h,
            backgroundColor: Colors.grey.withValues(alpha: 0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              _getColorForValue(value),
            ),
          ),
        ),
      ],
    );
  }

  Color _getColorForValue(int value) {
    if (value >= 4) return Colors.green;
    if (value >= 3) return AppColors.primaryColor;
    if (value >= 2) return Colors.orange;
    return Colors.red;
  }
}

