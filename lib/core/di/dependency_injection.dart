import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_cubit.dart';
import 'package:pet_finder_app/features/home/controllers/home_cubit.dart';
import 'package:pet_finder_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:pet_finder_app/features/home/data/repositories/home_repository.dart';

import '../../features/favorite/data/data_sources/favorite_remote_data_source.dart';
import '../../features/favorite/data/repositories/favorite_repository.dart';
import '../networking/dio_factory.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  ///Home
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(dio),
  );

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerFactory<HomeCubit>(() => HomeCubit(homeRepository: sl()));

  ///Favorite
  sl.registerLazySingleton<FavoriteRemoteDataSource>(
    () => FavoriteRemoteDataSource(dio),
  );

  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerFactory<FavoriteCubit>(() => FavoriteCubit(sl()));
}
