import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/breed_details/widgets/characteristic_card.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/breed_details/widgets/section_title.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/breed_details/widgets/special_feature_chip.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/breed_details/widgets/temperament_chip.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/breed_details/widgets/trait_progress_bar.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../generated/assets.dart';

class BreedMainDetails extends StatelessWidget {
  final BreedModel breed;

  const BreedMainDetails({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          16.verticalSpace,
          const SectionTitle(title: "About :"),
          8.verticalSpace,
          _buildDescription(),
          24.verticalSpace,
          _buildTemperamentSection(),
          24.verticalSpace,
          _buildKeyCharacteristics(),
          24.verticalSpace,
          _buildPersonalityTraits(),
          24.verticalSpace,
          _buildAdditionalInfo(),
          if (_hasSpecialFeatures()) ...[
            24.verticalSpace,
            _buildSpecialFeatures(),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              breed.name,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            4.verticalSpace,
            Row(
              children: [
                SvgPicture.asset(
                  Assets.svgsLocationSvg,
                  width: 16.w,
                  height: 16.h,
                ),
                4.horizontalSpace,
                Text(
                  breed.origin,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF646464),
                  ),
                ),
              ],
            ),
          ],
        ),
        Tooltip(
          message: "intelligence",
          child: Text(
            "${breed.intelligence}%",
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      breed.description,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: const Color(0xFF646464),
        height: 1.4,
      ),
    );
  }

  Widget _buildTemperamentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Temperament :"),
        12.verticalSpace,
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: breed.temperament
              .split(',')
              .map((trait) => TemperamentChip(label: trait.trim()))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildKeyCharacteristics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Key Characteristics :"),
        12.verticalSpace,
        Row(
          children: [
            Expanded(
              child: CharacteristicCard(
                icon: Icons.monitor_weight_outlined,
                label: "Weight",
                value: "${breed.weight.imperial} lbs",
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: CharacteristicCard(
                icon: Icons.calendar_today_outlined,
                label: "Life Span",
                value: "${breed.lifeSpan} yrs",
              ),
            ),
          ],
        ),
        12.verticalSpace,
        Row(
          children: [
            Expanded(
              child: CharacteristicCard(
                icon: Icons.home_outlined,
                label: "Indoor",
                value: breed.indoor == 1 ? "Yes" : "No",
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: CharacteristicCard(
                icon: Icons.pets_outlined,
                label: "Lap Cat",
                value: breed.lap == 1 ? "Yes" : "No",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPersonalityTraits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Personality Traits :"),
        16.verticalSpace,
        ..._buildTraitsList([
          ("Affection Level", breed.affectionLevel),
          ("Child Friendly", breed.childFriendly),
          ("Dog Friendly", breed.dogFriendly),
          ("Energy Level", breed.energyLevel),
          ("Intelligence", breed.intelligence),
          ("Social Needs", breed.socialNeeds),
          ("Stranger Friendly", breed.strangerFriendly),
        ]),
      ],
    );
  }

  Widget _buildAdditionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Additional Info :"),
        12.verticalSpace,
        ..._buildTraitsList([
          ("Adaptability", breed.adaptability),
          ("Grooming", breed.grooming),
          ("Health Issues", breed.healthIssues),
          ("Shedding Level", breed.sheddingLevel),
          ("Vocalisation", breed.vocalisation),
        ]),
      ],
    );
  }

  List<Widget> _buildTraitsList(List<(String, int)> traits) {
    final widgets = <Widget>[];
    for (int i = 0; i < traits.length; i++) {
      widgets.add(TraitProgressBar(label: traits[i].$1, value: traits[i].$2));
      if (i < traits.length - 1) {
        widgets.add(12.verticalSpace);
      }
    }
    return widgets;
  }

  bool _hasSpecialFeatures() {
    return breed.hypoallergenic == 1 ||
        breed.rare == 1 ||
        breed.hairless == 1 ||
        breed.rex == 1 ||
        breed.natural == 1;
  }

  Widget _buildSpecialFeatures() {
    final features = <String>[];
    if (breed.hypoallergenic == 1) features.add("🌟 Hypoallergenic");
    if (breed.rare == 1) features.add("💎 Rare Breed");
    if (breed.hairless == 1) features.add("✨ Hairless");
    if (breed.rex == 1) features.add("🐱 Rex Coat");
    if (breed.natural == 1) features.add("🌿 Natural Breed");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Special Features :"),
        12.verticalSpace,
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: features
              .map((feature) => SpecialFeatureChip(label: feature))
              .toList(),
        ),
        24.verticalSpace,
      ],
    );
  }
}
