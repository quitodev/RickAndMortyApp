part of 'widgets.dart';

class EpisodeItem extends StatelessWidget {
  const EpisodeItem({
    required this.episode,
    super.key,
  });

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ColoredBox(
          color: const Color.fromARGB(255, 47, 47, 47),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  episode.episode,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Text(
                  episode.airDate,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 226, 159, 89),
                    fontSize: 12,
                  ),
                ),
                Text(
                  episode.name,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 252, 213),
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
