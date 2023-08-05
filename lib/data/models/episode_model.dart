part of 'models.dart';

class EpisodeModel extends Episode {
  const EpisodeModel({
    required super.id,
    required super.name,
    required super.airDate,
    required super.episode,
    required super.characters,
    required super.url,
    required super.created,
  });

  factory EpisodeModel.fromJson(dynamic json) {
    return EpisodeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      airDate: json['air_date'] as String,
      episode: json['episode'] as String,
      characters: List.from(
        (json['characters'] as List).map((e) => e as String),
      ),
      url: json['url'] as String,
      created: json['created'] as String,
    );
  }
}
