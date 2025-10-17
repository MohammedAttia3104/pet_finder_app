import 'package:dio/dio.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'home_remote_data_source.g.dart';

@RestApi(baseUrl: 'https://api.thecatapi.com/')
abstract class HomeRemoteDataSource {
  factory HomeRemoteDataSource(Dio dio, {String baseUrl}) =
      _HomeRemoteDataSource;

  @GET('v1/breeds')
  Future<List<BreedModel>> getBreedsPaginated(
    @Query('limit') int limit,
    @Query('page') int page,
  );

  @GET('v1/breeds/search')
  Future<List<BreedModel>> searchBreeds(
    @Query('q') String query,
    @Query('attach_image') int attachImage,
  );
}
