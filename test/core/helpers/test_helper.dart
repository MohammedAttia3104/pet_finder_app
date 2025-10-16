import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';
import 'package:pet_finder_app/features/home/data/models/weight.dart';
import 'package:pet_finder_app/features/home/data/repositories/home_repository.dart';

///Global
class MockDio extends Mock implements Dio {}

///Home
//Models
class FakeBreedModel extends Fake implements BreedModel {}
class FakeWeight extends Fake implements Weight {}

//Data Sources
class MockHomeRemoteDataSource extends Mock implements HomeRemoteDataSource {}

//Repositories
class MockHomeRepository extends Mock implements HomeRepository {}

///Only Used for Custom Models
void registerTestFallbacks() {
  registerFallbackValue(FakeBreedModel());
  registerFallbackValue(FakeWeight());
}