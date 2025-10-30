import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_finder_app/features/favorite/data/models/favorite_breed.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;

  ///Get favorites
  const factory FavoriteState.getFavoritesLoading() = GetFavoritesLoading;
  const factory FavoriteState.getFavoritesSuccess(List<FavoriteBreed> favorites) = GetFavoritesSuccess;
  const factory FavoriteState.getFavoritesFailure({required String error}) = GetFavoritesFailure;

  ///Add favorite
  const factory FavoriteState.addFavoriteLoading() = AddFavoriteLoading;
  const factory FavoriteState.addFavoriteSuccess({required String message}) = AddFavoriteSuccess;
  const factory FavoriteState.addFavoriteFailure({required String error}) = AddFavoriteFailure;

  ///Delete favorite
  const factory FavoriteState.deleteFavoriteLoading() = DeleteFavoriteLoading;
  const factory FavoriteState.deleteFavoriteSuccess({required String message}) = DeleteFavoriteSuccess;
  const factory FavoriteState.deleteFavoriteFailure({required String error}) = DeleteFavoriteFailure;
}
