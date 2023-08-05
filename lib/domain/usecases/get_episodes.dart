part of 'usecases.dart';

class GetEpisodes {
  GetEpisodes(this.homeRepository);

  final IHomeRepository homeRepository;

  Future<Either<String, List<Episode>>> call(int page) async {
    return homeRepository.getEpisodes(page);
  }
}
