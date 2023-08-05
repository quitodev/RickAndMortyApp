part of 'entities.dart';

class Character extends Equatable {
  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.empty() {
    return Character(
      id: 0,
      name: '',
      status: '',
      species: '',
      type: '',
      gender: '',
      origin: CharacterOrigin.empty(),
      location: CharacterLocation.empty(),
      image: '',
      episode: List.empty(),
      url: '',
      created: '',
    );
  }

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterOrigin origin;
  final CharacterLocation location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,
      ];
}

class CharacterOrigin extends Equatable {
  const CharacterOrigin({
    required this.name,
    required this.url,
  });

  factory CharacterOrigin.empty() {
    return const CharacterOrigin(
      name: '',
      url: '',
    );
  }

  final String name;
  final String url;

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}

class CharacterLocation extends Equatable {
  const CharacterLocation({
    required this.name,
    required this.url,
  });

  factory CharacterLocation.empty() {
    return const CharacterLocation(
      name: '',
      url: '',
    );
  }

  final String name;
  final String url;

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
