import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/widgets/svg_icon.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../generated/assets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppStrings.findYourForeverPet, style: AppStyles.font24BlackBold),
        SvgIcon(svgIcon: Assets.svgsNotificationSvg),
      ],
    );
  }
}
