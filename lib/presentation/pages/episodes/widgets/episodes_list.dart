part of 'widgets.dart';

class EpisodesList extends StatelessWidget {
  const EpisodesList({
    required this.episodes,
    super.key,
  });

  final List<Episode> episodes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: SizedBox(
        height: 130,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(width: 8);
          },
          scrollDirection: Axis.horizontal,
          itemCount: episodes.length,
          itemBuilder: (context, index) {
            return EpisodeItem(
              episode: episodes[index],
            );
          },
        ),
      ),
    );
  }
}
