import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PetItemSkeleton extends StatelessWidget {
  const PetItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: Duration(milliseconds: 1000),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width - 32.w,
        height: 124.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8).r,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Pet Image Skeleton
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                top: 6.h,
                bottom: 6.h,
                right: 16.w,
              ),
              child: Bone.square(
                size: 112.w,
                borderRadius: BorderRadius.all(Radius.circular(8).r),
              ),
            ),

            /// Pet Details Skeleton
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Breed Name Skeleton
                  Bone.text(
                    words: 2,
                    fontSize: 18.sp,
                    borderRadius: BorderRadius.circular(4).r,
                  ),
                  4.verticalSpace,
                  // Weight Skeleton
                  Bone.text(
                    words: 2,
                    fontSize: 14.sp,
                    borderRadius: BorderRadius.circular(4).r,
                  ),
                  2.verticalSpace,
                  // Life Span Skeleton
                  Bone.text(
                    words: 2,
                    fontSize: 14.sp,
                    borderRadius: BorderRadius.circular(4).r,
                  ),
                  8.verticalSpace,
                  // Location Row Skeleton
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Bone.square(
                        size: 16.w,
                        borderRadius: BorderRadius.circular(2).r,
                      ),
                      4.horizontalSpace,
                      Bone.text(
                        words: 1,
                        fontSize: 14.sp,
                        borderRadius: BorderRadius.circular(4).r,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
