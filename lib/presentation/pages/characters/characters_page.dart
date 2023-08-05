part of '../pages.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  static Route route() {
    return CupertinoPageRoute(
      settings: const RouteSettings(name: '/characters_page'),
      builder: (_) => const CharactersPage(),
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
            )..getCharacters(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.status is HomeInitial ||
                    state.status is ShowLoading) {
                  return const CircularProgress();
                }
                if (state.status is ShowData) {
                  return const _CharactersContent();
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

class _CharactersContent extends StatelessWidget {
  const _CharactersContent();

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
                  text: 'Characters',
                  iconLeft: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SearchCharacter(),
                const SizedBox(
                  height: 24,
                ),
                const CharactersListFull(),
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

class SearchCharacter extends StatefulWidget {
  const SearchCharacter({super.key});

  @override
  State<SearchCharacter> createState() => _SearchCharacterState();
}

class _SearchCharacterState extends State<SearchCharacter> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          autocorrect: false,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 46, 225, 196),
          ),
          onChanged: (value) {
            context.read<HomeCubit>().searchCharacter(value);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIconColor: const Color.fromARGB(255, 46, 225, 196),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.text = '';
                context.read<HomeCubit>().searchCharacter('');
              },
              child: const Icon(
                Icons.cancel_rounded,
                color: Color.fromARGB(255, 224, 164, 0),
              ),
            ),
            hintText: 'Search a character',
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 29, 145, 125),
            ),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 46, 225, 196),
          height: 2,
        )
      ],
    );
  }
}

class CharactersListFull extends StatefulWidget {
  const CharactersListFull({super.key});

  @override
  State<CharactersListFull> createState() => _CharactersListFullState();
}

class _CharactersListFullState extends State<CharactersListFull> {
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
      BlocProvider.of<HomeCubit>(context).getCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: controller,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.characterSearch.isEmpty) {
              return const Center(
                child: Text(
                  'No characters found',
                  style: TextStyle(
                    color: Color.fromARGB(255, 46, 225, 196),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                state.characterSearch.length,
                ((index) {
                  return CharacterItem(
                    character: state.characterSearch[index],
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
