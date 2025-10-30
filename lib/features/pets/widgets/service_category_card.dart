import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String providerCount;
  final Color color;
  final VoidCallback? onTap;

  const ServiceCategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.providerCount,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12).r,
              ),
              child: Icon(icon, color: color, size: 28.sp),
            ),
            12.verticalSpace,
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            4.verticalSpace,
            Text(
              '$providerCount nearby',
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF646464),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

