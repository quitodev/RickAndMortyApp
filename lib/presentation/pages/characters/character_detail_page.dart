part of '../pages.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({
    required this.character,
    super.key,
  });

  final Character character;

  static Route route({
    required Character character,
  }) {
    return CupertinoPageRoute(
      settings: const RouteSettings(name: '/character_detail_page'),
      builder: (_) => CharacterDetailPage(character: character),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, preferences) {
        if (preferences.data?.getBool('isLoggedIn') ?? false) {
          return _CharacterContent(
            character: character,
          );
        }
        return const AccessMessage();
      },
    );
  }
}

class _CharacterContent extends StatelessWidget {
  const _CharacterContent({
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              TitleText(
                text: character.name,
                iconLeft: Icons.arrow_back_ios_new_rounded,
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(
                height: 56,
              ),
              Center(
                child: CharacterItem(
                  character: character,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              _CharacterDescription(
                title: 'Gender',
                description: character.gender,
                icon: Icons.face_outlined,
              ),
              const SizedBox(
                height: 24,
              ),
              _CharacterDescription(
                title: 'Status',
                description: character.status,
                icon: Icons.monitor_heart_outlined,
              ),
              const SizedBox(
                height: 24,
              ),
              _CharacterDescription(
                title: 'Species',
                description: character.species,
                icon: Icons.safety_divider_outlined,
              ),
              const SizedBox(
                height: 24,
              ),
              _CharacterDescription(
                title: 'Origin',
                description: character.origin.name,
                icon: Icons.public_outlined,
              ),
              const SizedBox(
                height: 24,
              ),
              _CharacterDescription(
                title: 'Location',
                description: character.location.name,
                icon: Icons.rocket_launch_outlined,
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CharacterDescription extends StatelessWidget {
  const _CharacterDescription({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: const Color.fromARGB(255, 46, 225, 196),
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 46, 225, 196),
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          description,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 252, 213),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
