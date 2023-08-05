part of 'datasources.dart';

abstract class IHomeDataSource {
  Future<List<CharacterModel>> getCharacters(int page);
  Future<List<EpisodeModel>> getEpisodes(int page);
  Future<List<LocationModel>> getLocations(int page);
}

class HomeDataSource implements IHomeDataSource {
  HomeDataSource({
    required this.dio,
  });

  final Dio dio;

  static const String baseUrl = 'https://rickandmortyapi.com/api';

  @override
  Future<List<CharacterModel>> getCharacters(int page) async {
    final response = await dio.get(
      '$baseUrl/character/?page=$page',
    );
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return List<CharacterModel>.from(
        data['results'].map(CharacterModel.fromJson).toList(),
      );
    }
    //print('ERROR: ${response.statusMessage}');
    return List.empty();
  }

  @override
  Future<List<EpisodeModel>> getEpisodes(int page) async {
    final response = await dio.get(
      '$baseUrl/episode/?page=$page',
    );
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return List<EpisodeModel>.from(
        data['results'].map(EpisodeModel.fromJson).toList(),
      );
    }
    //print('ERROR: ${response.statusMessage}');
    return List.empty();
  }

  @override
  Future<List<LocationModel>> getLocations(int page) async {
    final response = await dio.get(
      '$baseUrl/location/?page=$page',
    );
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return List<LocationModel>.from(
        data['results'].map(LocationModel.fromJson).toList(),
      );
    }
    //print('ERROR: ${response.statusMessage}');
    return List.empty();
  }
}
