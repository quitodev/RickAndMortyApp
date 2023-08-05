part of 'usecases.dart';

class GetCharacters {
  GetCharacters(this.homeRepository);

  final IHomeRepository homeRepository;

  Future<Either<String, List<Character>>> call(int page) async {
    return homeRepository.getCharacters(page);
  }
}
