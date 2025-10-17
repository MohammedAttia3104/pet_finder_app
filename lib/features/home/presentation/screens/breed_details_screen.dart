import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/breed_details/breed_header_container.dart';
import '../widgets/breed_details/breed_main_details.dart';

class BreedDetailsScreen extends StatelessWidget {
  const BreedDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BreedHeaderContainer(),

            20.verticalSpace,

            BreedMainDetails(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
