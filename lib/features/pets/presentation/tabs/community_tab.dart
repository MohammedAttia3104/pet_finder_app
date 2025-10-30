import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theming/app_colors.dart';
import 'package:pet_finder_app/features/pets/widgets/section_title.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCommunityStats(),
          24.verticalSpace,
          const SectionTitle(title: 'Popular Topics'),
          12.verticalSpace,
          _buildTopicsList(),
          24.verticalSpace,
          const SectionTitle(title: 'Recent Posts'),
          12.verticalSpace,
          _buildRecentPosts(),
        ],
      ),
    );
  }

  Widget _buildCommunityStats() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withValues(alpha: 0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(20).r,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Join Our Community',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          8.verticalSpace,
          Text(
            'Connect with 12,456 pet lovers',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(child: _buildCommunityStatItem('2.4K', 'Posts')),
              Expanded(child: _buildCommunityStatItem('856', 'Topics')),
              Expanded(child: _buildCommunityStatItem('12K', 'Members')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        4.verticalSpace,
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildTopicsList() {
    final topics = [
      {'emoji': '💊', 'title': 'Health & Wellness', 'posts': '1.2K'},
      {'emoji': '🍖', 'title': 'Nutrition & Diet', 'posts': '856'},
      {'emoji': '🎾', 'title': 'Play & Exercise', 'posts': '654'},
      {'emoji': '🏠', 'title': 'Adoption Stories', 'posts': '432'},
    ];

    return Column(
      children: topics.map((topic) => _buildTopicCard(topic)).toList(),
    );
  }

  Widget _buildTopicCard(Map<String, String> topic) {
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
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(12).r,
            ),
            child: Center(
              child: Text(topic['emoji']!, style: TextStyle(fontSize: 28.sp)),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic['title']!,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                4.verticalSpace,
                Text(
                  '${topic['posts']} posts',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFF646464),
                  ),
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

  Widget _buildRecentPosts() {
    final posts = [
      {
        'author': 'Sarah M.',
        'time': '2h ago',
        'title': 'Best food for senior cats?',
        'replies': '24',
        'likes': '156',
      },
      {
        'author': 'Mike T.',
        'time': '5h ago',
        'title': 'Tips for first-time dog owners',
        'replies': '18',
        'likes': '92',
      },
      {
        'author': 'Emma R.',
        'time': '1d ago',
        'title': 'My cat won\'t eat, help!',
        'replies': '31',
        'likes': '203',
      },
    ];

    return Column(children: posts.map((post) => _buildPostCard(post)).toList());
  }

  Widget _buildPostCard(Map<String, String> post) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.secondaryColor,
                child: Text(
                  post['author']![0],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post['author']!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      post['time']!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF646464),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Text(
            post['title']!,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          12.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.chat_bubble_outline,
                size: 16.sp,
                color: const Color(0xFF646464),
              ),
              4.horizontalSpace,
              Text(
                '${post['replies']} replies',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF646464),
                ),
              ),
              16.horizontalSpace,
              Icon(
                Icons.favorite_border,
                size: 16.sp,
                color: const Color(0xFF646464),
              ),
              4.horizontalSpace,
              Text(
                '${post['likes']} likes',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF646464),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
