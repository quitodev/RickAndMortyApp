part of 'entities.dart';

class Episode extends Equatable {
  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory Episode.empty() {
    return Episode(
      id: 0,
      name: '',
      airDate: '',
      episode: '',
      characters: List.empty(),
      url: '',
      created: '',
    );
  }

  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  @override
  List<Object?> get props => [
        id,
        name,
        airDate,
        episode,
        characters,
        url,
        created,
      ];
}
