part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.characters,
    required this.episodes,
    required this.locations,
    required this.charactersPage,
    required this.episodesPage,
    required this.locationsPage,
    required this.characterSearch,
  });

  final HomeStatus status;
  final List<Character> characters;
  final List<Episode> episodes;
  final List<Location> locations;
  final int charactersPage;
  final int episodesPage;
  final int locationsPage;
  final List<Character> characterSearch;

  HomeState copyWith({
    HomeStatus? status,
    List<Character>? characters,
    List<Episode>? episodes,
    List<Location>? locations,
    int? charactersPage,
    int? episodesPage,
    int? locationsPage,
    List<Character>? characterSearch,
  }) {
    return HomeState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      episodes: episodes ?? this.episodes,
      locations: locations ?? this.locations,
      charactersPage: charactersPage ?? this.charactersPage,
      episodesPage: episodesPage ?? this.episodesPage,
      locationsPage: locationsPage ?? this.locationsPage,
      characterSearch: characterSearch ?? this.characterSearch,
    );
  }

  @override
  List<Object?> get props => [
        status,
        characters,
        episodes,
        locations,
        charactersPage,
        episodesPage,
        locationsPage,
        characterSearch,
      ];
}

abstract class HomeStatus {}

class HomeInitial extends HomeStatus {}

class ShowLoading extends HomeStatus {}

class ShowData extends HomeStatus {}

class ShowError extends HomeStatus {}
