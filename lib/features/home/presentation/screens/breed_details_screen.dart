import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/home/controllers/home_cubit.dart';
import 'package:pet_finder_app/features/home/controllers/home_state.dart';

import '../../../../core/theming/app_colors.dart';
import '../widgets/breed_details/adopt_me_button.dart';
import '../widgets/breed_details/breed_header_container.dart';
import '../widgets/breed_details/breed_main_details.dart'; // Refactored widget

class BreedDetailsScreen extends StatefulWidget {
  final String breedId;

  const BreedDetailsScreen({super.key, required this.breedId});

  @override
  State<BreedDetailsScreen> createState() => _BreedDetailsScreenState();
}

class _BreedDetailsScreenState extends State<BreedDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().getBreedById(widget.breedId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            getBreedDetailsLoading: () => Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
            getBreedDetailsSuccess: (breed) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BreedHeaderContainer(breed: breed),
                  20.verticalSpace,
                  BreedMainDetails(breed: breed),
                  20.verticalSpace,
                  AdoptMeButton(),
                  40.verticalSpace,
                ],
              ),
            ),
            getBreedDetailsError: (error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64.sp, color: Colors.red),
                  16.verticalSpace,
                  Text(
                    'Error: $error',
                    style: TextStyle(fontSize: 16.sp, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  16.verticalSpace,
                  ElevatedButton(
                    onPressed: () =>
                        context.read<HomeCubit>().getBreedById(widget.breedId),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
