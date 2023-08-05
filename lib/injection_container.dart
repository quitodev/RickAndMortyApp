import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/data/datasources/datasources.dart';
import 'package:rick_and_morty_app/data/repositories/repositories_impl.dart';
import 'package:rick_and_morty_app/domain/repositories/repositories.dart';
import 'package:rick_and_morty_app/domain/usecases/usecases.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await setupHome();
}

Future<void> setupHome() async {
  getIt
    // DATASOURCES
    ..registerLazySingleton<IHomeDataSource>(
      () => HomeDataSource(
        dio: Dio(),
      ),
    )
    // REPOSITORIES
    ..registerLazySingleton<IHomeRepository>(
      () => HomeRepositoryImpl(
        getIt<IHomeDataSource>(),
      ),
    )
    // USECASES
    ..registerLazySingleton<GetCharacters>(
      () => GetCharacters(
        getIt<IHomeRepository>(),
      ),
    )
    ..registerLazySingleton<GetEpisodes>(
      () => GetEpisodes(
        getIt<IHomeRepository>(),
      ),
    )
    ..registerLazySingleton<GetLocations>(
      () => GetLocations(
        getIt<IHomeRepository>(),
      ),
    );
}
