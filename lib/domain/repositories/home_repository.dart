part of 'repositories.dart';

abstract class IHomeRepository {
  Future<Either<String, List<Character>>> getCharacters(int page);
  Future<Either<String, List<Episode>>> getEpisodes(int page);
  Future<Either<String, List<Location>>> getLocations(int page);
}
