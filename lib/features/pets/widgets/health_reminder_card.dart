import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthReminderCard extends StatelessWidget {
  final String title;
  final String date;
  final bool isUrgent;
  final VoidCallback? onTap;

  const HealthReminderCard({
    super.key,
    required this.title,
    required this.date,
    this.isUrgent = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isUrgent ? Colors.red.withValues(alpha: 0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12).r,
          border: Border.all(
            color: isUrgent
                ? Colors.red.withValues(alpha: 0.3)
                : Colors.grey.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: isUrgent
                    ? Colors.red.withValues(alpha: 0.1)
                    : const Color(0xFFE1F8F9),
                borderRadius: BorderRadius.circular(10).r,
              ),
              child: Icon(
                Icons.calendar_today,
                color: isUrgent ? Colors.red : const Color(0xFF44BDB6),
                size: 20.sp,
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFF646464),
                    ),
                  ),
                ],
              ),
            ),
            if (isUrgent)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: Text(
                  'Urgent',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
