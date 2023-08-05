part of 'widgets.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({
    required this.characters,
    super.key,
  });

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: SizedBox(
        height: 150,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
          scrollDirection: Axis.horizontal,
          itemCount: characters.length,
          itemBuilder: (context, index) {
            return CharacterItem(
              character: characters[index],
            );
          },
        ),
      ),
    );
  }
}
