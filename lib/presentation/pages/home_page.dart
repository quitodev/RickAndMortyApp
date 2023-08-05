part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route route() {
    return CupertinoPageRoute(
      settings: const RouteSettings(name: '/'),
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, preferences) {
        if (preferences.data?.getBool('isLoggedIn') ?? false) {
          return BlocProvider(
            create: (context) => HomeCubit(
              getCharactersUseCase: getIt<GetCharacters>(),
              getEpisodesUseCase: getIt<GetEpisodes>(),
              getLocationsUseCase: getIt<GetLocations>(),
            )..getInitalData(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.status is HomeInitial ||
                    state.status is ShowLoading) {
                  return const CircularProgress();
                }
                if (state.status is ShowData) {
                  return const _HomeContent();
                }
                return const ErrorMessage();
              },
            ),
          );
        }
        return const AccessMessage();
      },
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColoredBox(
        color: const Color.fromARGB(255, 32, 32, 32),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    text: 'Characters',
                    iconLeft: Icons.person_outline_rounded,
                    iconRight: Icons.navigate_next_rounded,
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/characters_page',
                    ),
                  ),
                  CharactersList(
                    characters: state.characters,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TitleText(
                    text: 'Episodes',
                    iconLeft: Icons.tv_rounded,
                    iconRight: Icons.navigate_next_rounded,
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/episodes_page',
                    ),
                  ),
                  EpisodesList(
                    episodes: state.episodes,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TitleText(
                    text: 'Locations',
                    iconLeft: Icons.rocket_launch_outlined,
                    iconRight: Icons.navigate_next_rounded,
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/locations_page',
                    ),
                  ),
                  LocationsList(
                    locations: state.locations,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
