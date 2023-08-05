import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/domain/entities/entities.dart';
import 'package:rick_and_morty_app/domain/usecases/usecases.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getCharactersUseCase,
    required this.getEpisodesUseCase,
    required this.getLocationsUseCase,
  }) : super(
          HomeState(
            status: HomeInitial(),
            characters: List.empty(),
            episodes: List.empty(),
            locations: List.empty(),
            charactersPage: 0,
            episodesPage: 0,
            locationsPage: 0,
            characterSearch: List.empty(),
          ),
        );

  final GetCharacters getCharactersUseCase;
  final GetEpisodes getEpisodesUseCase;
  final GetLocations getLocationsUseCase;

  void showLoading() {
    emit(
      state.copyWith(
        status: ShowLoading(),
      ),
    );
  }

  void showError() {
    emit(
      state.copyWith(
        status: ShowError(),
      ),
    );
  }

  Future<void> getInitalData() async {
    await getCharacters();
    await getEpisodes();
    await getLocations();
  }

  Future<void> getCharacters() async {
    if (state.charactersPage < 42) {
      final either = await getCharactersUseCase.call(state.charactersPage + 1);
      either.fold(
        (failure) {
          showError();
          return;
        },
        (characters) {
          emit(
            state.copyWith(
              status: ShowData(),
              characters: List<Character>.from(state.characters)
                ..addAll(characters),
              charactersPage: state.charactersPage + 1,
              characterSearch: List<Character>.from(state.characters)
                ..addAll(characters),
            ),
          );
        },
      );
    }
  }

  Future<void> getEpisodes() async {
    if (state.episodesPage < 3) {
      final either = await getEpisodesUseCase.call(state.episodesPage + 1);
      either.fold(
        (failure) {
          showError();
          return;
        },
        (episodes) {
          emit(
            state.copyWith(
              status: ShowData(),
              episodes: List<Episode>.from(state.episodes)..addAll(episodes),
              episodesPage: state.episodesPage + 1,
            ),
          );
        },
      );
    }
  }

  Future<void> getLocations() async {
    if (state.locationsPage < 7) {
      final either = await getLocationsUseCase.call(state.locationsPage + 1);
      either.fold(
        (failure) {
          showError();
          return;
        },
        (locations) {
          emit(
            state.copyWith(
              status: ShowData(),
              locations: List<Location>.from(state.locations)
                ..addAll(locations),
              locationsPage: state.locationsPage + 1,
            ),
          );
        },
      );
    }
  }

  void searchCharacter(String value) {
    if (value.isEmpty) {
      emit(
        state.copyWith(
          status: ShowData(),
          characterSearch: state.characters,
        ),
      );
      return;
    }
    final result = state.characterSearch
        .where((character) =>
            character.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    emit(
      state.copyWith(
        status: ShowData(),
        characterSearch: result,
      ),
    );
  }
}
