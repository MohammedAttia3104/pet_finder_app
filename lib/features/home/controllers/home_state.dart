import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  ///Get Breeds
  const factory HomeState.getBreedsLoading() = BreedsLoading;

  const factory HomeState.getBreedsSuccess(List<BreedModel> breeds) =
      BreedsSuccess;

  const factory HomeState.getBreedsError(String message) = BreedsError;

  ///pagination
  const factory HomeState.paginationLoading() = PaginationLoading;

  const factory HomeState.paginationFailure(
      {required String errorMessage}) = PaginationFailure;
}
