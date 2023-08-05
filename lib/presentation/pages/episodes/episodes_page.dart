part of '../pages.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({super.key});

  static Route route() {
    return CupertinoPageRoute(
      settings: const RouteSettings(name: '/episodes_page'),
      builder: (_) => const EpisodesPage(),
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
            )..getEpisodes(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.status is HomeInitial ||
                    state.status is ShowLoading) {
                  return const CircularProgress();
                }
                if (state.status is ShowData) {
                  return const _EpisodesContent();
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

class _EpisodesContent extends StatelessWidget {
  const _EpisodesContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                TitleText(
                  text: 'Episodes',
                  iconLeft: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(
                  height: 24,
                ),
                const EpisodesListFull(),
                const SizedBox(
                  height: 24,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class EpisodesListFull extends StatefulWidget {
  const EpisodesListFull({super.key});

  @override
  State<EpisodesListFull> createState() => _EpisodesListFullState();
}

class _EpisodesListFullState extends State<EpisodesListFull> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      BlocProvider.of<HomeCubit>(context).getEpisodes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: controller,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                state.episodes.length,
                ((index) {
                  return EpisodeItem(
                    episode: state.episodes[index],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
