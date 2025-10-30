import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/pets/widgets/care_tip_card.dart';
import 'package:pet_finder_app/features/pets/widgets/section_title.dart';
import 'package:pet_finder_app/features/pets/widgets/stat_card.dart';
import 'package:pet_finder_app/features/pets/widgets/training_guide_card.dart';

class CareTab extends StatelessWidget {
  const CareTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuickStats(),
          24.verticalSpace,
          const SectionTitle(title: 'Essential Care Tips'),
          12.verticalSpace,
          _buildCareTipsList(),
          24.verticalSpace,
          const SectionTitle(title: 'Training Guides'),
          12.verticalSpace,
          _buildTrainingGuides(),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Row(
      children: [
        const Expanded(
          child: StatCard(
            icon: Icons.book_outlined,
            title: '48',
            subtitle: 'Articles',
            color: Color(0xFF44BDB6),
          ),
        ),
        12.horizontalSpace,
        const Expanded(
          child: StatCard(
            icon: Icons.video_library_outlined,
            title: '32',
            subtitle: 'Videos',
            color: Colors.orange,
          ),
        ),
        12.horizontalSpace,
        const Expanded(
          child: StatCard(
            icon: Icons.tips_and_updates_outlined,
            title: '156',
            subtitle: 'Tips',
            color: Colors.purple,
          ),
        ),
      ],
    );
  }

  Widget _buildCareTipsList() {
    final tips = [
      {
        'icon': Icons.restaurant_outlined,
        'title': 'Nutrition Guide',
        'description': 'Learn about balanced diet and feeding schedules',
        'color': Colors.green,
      },
      {
        'icon': Icons.bathtub_outlined,
        'title': 'Grooming Tips',
        'description': 'Keep your pet clean and healthy',
        'color': Colors.blue,
      },
      {
        'icon': Icons.fitness_center_outlined,
        'title': 'Exercise Routine',
        'description': 'Daily activities for healthy pets',
        'color': Colors.orange,
      },
      {
        'icon': Icons.medical_services_outlined,
        'title': 'Healthcare',
        'description': 'Vaccination schedule and checkups',
        'color': Colors.red,
      },
    ];

    return Column(
      children: tips
          .map((tip) => CareTipCard(
                icon: tip['icon'] as IconData,
                title: tip['title'] as String,
                description: tip['description'] as String,
                color: tip['color'] as Color,
              ))
          .toList(),
    );
  }

  Widget _buildTrainingGuides() {
    final guides = [
      {'title': 'Basic Commands', 'duration': '15 min', 'level': 'Beginner'},
      {'title': 'House Training', 'duration': '25 min', 'level': 'Beginner'},
      {'title': 'Leash Training', 'duration': '20 min', 'level': 'Intermediate'},
      {'title': 'Advanced Tricks', 'duration': '30 min', 'level': 'Advanced'},
    ];

    return SizedBox(
      height: 180.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: guides.length,
        itemBuilder: (context, index) => TrainingGuideCard(
          title: guides[index]['title']!,
          duration: guides[index]['duration']!,
          level: guides[index]['level']!,
        ),
      ),
    );
  }
}

