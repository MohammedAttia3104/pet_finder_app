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
                  return PetItemSkeleton();
                }
              },
              separatorBuilder: (_, _) => 12.verticalSpace,
              itemCount: cubit.breeds.length + 3,
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
          searchBreedsLoading: () => ListView.separated(
            itemBuilder: (context, index) => PetItemSkeleton(),
            separatorBuilder: (_, _) => 12.verticalSpace,
            itemCount: 3,
          ),
          searchBreedsSuccess: (breeds) {
            if (breeds.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 64.w, color: Colors.grey),
                    16.verticalSpace,
                    Text(
                      'No breeds found',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                final breed = breeds[index];
                final breedImage = breed.referenceImageId?.toImageUrl();
                return PetItem(breed: breed, breedImage: breedImage);
              },
              separatorBuilder: (_, _) => 12.verticalSpace,
              itemCount: breeds.length,
            );
          },
          searchBreedsError: (failure) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64.w, color: Colors.red),
                16.verticalSpace,
                Text(
                  'Search failed',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
                8.verticalSpace,
                Text(
                  failure,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
