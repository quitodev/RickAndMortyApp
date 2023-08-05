part of 'repositories_impl.dart';

class HomeRepositoryImpl implements IHomeRepository {
  HomeRepositoryImpl(this.homeDataSource);

  final IHomeDataSource homeDataSource;

  @override
  Future<Either<String, List<Character>>> getCharacters(int page) async {
    try {
      final result = await homeDataSource.getCharacters(page);
      return Right(result);
    } catch (_) {
      return const Left('Error de conexión');
    }
  }

  @override
  Future<Either<String, List<Episode>>> getEpisodes(int page) async {
    try {
      final result = await homeDataSource.getEpisodes(page);
      return Right(result);
    } catch (_) {
      return const Left('Error de conexión');
    }
  }

  @override
  Future<Either<String, List<Location>>> getLocations(int page) async {
    try {
      final result = await homeDataSource.getLocations(page);
      return Right(result);
    } catch (_) {
      return const Left('Error de conexión');
    }
  }
}
