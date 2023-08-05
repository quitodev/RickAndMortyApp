part of 'entities.dart';

class Location extends Equatable {
  const Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory Location.empty() {
    return Location(
      id: 0,
      name: '',
      type: '',
      dimension: '',
      residents: List.empty(),
      url: '',
      created: '',
    );
  }

  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        dimension,
        residents,
        url,
        created,
      ];
}
