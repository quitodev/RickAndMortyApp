part of 'widgets.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/character_detail_page',
        arguments: character,
      ),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 47, 47, 47),
          image: DecorationImage(
            image: NetworkImage(character.image),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(150.0),
          ),
          border: Border.all(
            color: const Color.fromARGB(255, 219, 219, 219),
            width: 3,
          ),
        ),
      ),
    );
  }
}
