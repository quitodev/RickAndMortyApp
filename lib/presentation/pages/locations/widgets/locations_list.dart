part of 'widgets.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({
    required this.locations,
    super.key,
  });

  final List<Location> locations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: SizedBox(
        height: 220,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return LocationItem(
              location: locations[index],
            );
          },
        ),
      ),
    );
  }
}
