import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/extensions/image_url_extension.dart';
import 'package:pet_finder_app/features/home/controllers/home_cubit.dart';
import 'package:pet_finder_app/features/home/controllers/home_state.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/home/pet_item.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/home/pet_item_skeleton.dart';

class HomePetsListView extends StatelessWidget {
  final ScrollController scrollController;

  const HomePetsListView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return state.maybeWhen(
          getBreedsLoading: () => ListView.separated(
            itemBuilder: (context, index) => PetItemSkeleton(),
            separatorBuilder: (_, _) => 12.verticalSpace,
            itemCount: 5,
          ),
          getBreedsError: (failure) => Center(child: Text('Failed to load breeds')),
          paginationLoading: () {
            return ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) {
                if (index < cubit.breeds.length) {
                  final breed = cubit.breeds[index];
                  final breedImage = breed.referenceImageId?.toImageUrl();
                  return PetItem(breed: breed, breedImage: breedImage);
                } else {
                  // Show shimmer skeleton for pagination loading
                  return PetItemSkeleton();
                }
              },
              separatorBuilder: (_, _) => 12.verticalSpace,
              itemCount: cubit.breeds.length + 5,
            );
          },
          getBreedsSuccess: (breeds) {
            return ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) {
                final breed = breeds[index];
                final breedImage = breed.referenceImageId?.toImageUrl();
                return PetItem(breed: breed, breedImage: breedImage);
              },
              separatorBuilder: (_, _) => 12.verticalSpace,
              itemCount: breeds.length,
            );
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
