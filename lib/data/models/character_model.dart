part of 'models.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
    required super.origin,
    required super.location,
    required super.image,
    required super.episode,
    required super.url,
    required super.created,
  });

  factory CharacterModel.fromJson(dynamic json) {
    return CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: CharacterOriginModel.fromJson(
        json['origin'] as Map<String, dynamic>,
      ),
      location: CharacterLocationModel.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      image: json['image'] as String,
      episode: List.from(
        (json['episode'] as List).map((e) => e as String),
      ),
      url: json['url'] as String,
      created: json['created'] as String,
    );
  }
}

class CharacterOriginModel extends CharacterOrigin {
  const CharacterOriginModel({
    required super.name,
    required super.url,
  });

  factory CharacterOriginModel.fromJson(dynamic json) {
    return CharacterOriginModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}

class CharacterLocationModel extends CharacterLocation {
  const CharacterLocationModel({
    required super.name,
    required super.url,
  });

  factory CharacterLocationModel.fromJson(dynamic json) {
    return CharacterLocationModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
