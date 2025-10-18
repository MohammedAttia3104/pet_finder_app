import 'package:pet_finder_app/core/networking/api_result.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data_sources/favorite_remote_data_source.dart';
import '../models/add_favorite_request.dart';
import '../models/add_favorite_response.dart';
import '../models/delete_favorite_response.dart';
import '../models/favorite_breed.dart';

abstract class FavoriteRepository {
  Future<ApiResult<List<FavoriteBreed>>> fetchFavorites();

  Future<ApiResult<AddFavoriteResponse>> addFavorite(
    AddFavoriteRequest request,
  );

  Future<ApiResult<DeleteFavoriteResponse>> deleteFavorite(int favoriteId);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource remoteDataSource;

  FavoriteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<FavoriteBreed>>> fetchFavorites() async {
    try {
      final favorites = await remoteDataSource.getFavorites();
      return ApiResult.success(favorites);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<AddFavoriteResponse>> addFavorite(
    AddFavoriteRequest request,
  ) async {
    try {
      final response = await remoteDataSource.addFavorite(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<DeleteFavoriteResponse>> deleteFavorite(
    int favoriteId,
  ) async {
    try {
      final response = await remoteDataSource.deleteFavorite(favoriteId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
