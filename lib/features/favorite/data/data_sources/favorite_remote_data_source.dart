import 'package:dio/dio.dart';
import 'package:pet_finder_app/features/favorite/data/models/favorite_breed.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../models/add_favorite_request.dart';
import '../models/add_favorite_response.dart';
import '../models/delete_favorite_response.dart';

part 'favorite_remote_data_source.g.dart';

@RestApi(baseUrl: 'https://api.thecatapi.com/')
abstract class FavoriteRemoteDataSource {
  factory FavoriteRemoteDataSource(Dio dio, {String baseUrl}) =
      _FavoriteRemoteDataSource;

  @GET('v1/favourites')
  Future<List<FavoriteBreed>> getFavorites();

  @POST('v1/favourites')
  Future<AddFavoriteResponse> addFavorite(@Body() AddFavoriteRequest body);

  @DELETE('v1/favourites/{favourite_id}')
  Future<DeleteFavoriteResponse> deleteFavorite(
    @Path('favourite_id') int favoriteId,
  );
}
