import 'package:pet_finder_app/core/networking/api_result.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data_sources/home_remote_data_source.dart';
import '../models/breed_model.dart';

abstract class HomeRepository {
  Future<ApiResult<List<BreedModel>>> getBreedsPaginated(int limit, int page);
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<BreedModel>>> getBreedsPaginated(
    int limit,
    int page,
  ) async {
    try {
      final breeds = await remoteDataSource.getBreedsPaginated(limit, page);
      return ApiResult.success(breeds);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
