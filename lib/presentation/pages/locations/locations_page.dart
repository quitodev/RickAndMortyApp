part of '../pages.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  static Route route() {
    return CupertinoPageRoute(
      settings: const RouteSettings(name: '/locations_page'),
      builder: (_) => const LocationsPage(),
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
            )..getLocations(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.status is HomeInitial ||
                    state.status is ShowLoading) {
                  return const CircularProgress();
                }
                if (state.status is ShowData) {
                  return const _LocationsContent();
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

class _LocationsContent extends StatelessWidget {
  const _LocationsContent();

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
                  text: 'Locations',
                  iconLeft: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(
                  height: 24,
                ),
                const LocationsListFull(),
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

class LocationsListFull extends StatefulWidget {
  const LocationsListFull({super.key});

  @override
  State<LocationsListFull> createState() => _LocationsListFullState();
}

class _LocationsListFullState extends State<LocationsListFull> {
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
      BlocProvider.of<HomeCubit>(context).getLocations();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              controller: controller,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: state.locations.length,
              itemBuilder: (context, index) {
                return LocationItem(
                  location: state.locations[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
