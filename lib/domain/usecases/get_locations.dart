part of 'usecases.dart';

class GetLocations {
  GetLocations(this.homeRepository);

  final IHomeRepository homeRepository;

  Future<Either<String, List<Location>>> call(int page) async {
    return homeRepository.getLocations(page);
  }
}
