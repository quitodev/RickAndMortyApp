part of 'models.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.id,
    required super.name,
    required super.type,
    required super.dimension,
    required super.residents,
    required super.url,
    required super.created,
  });

  factory LocationModel.fromJson(dynamic json) {
    return LocationModel(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      dimension: json['dimension'] as String,
      residents: List.from(
        (json['residents'] as List).map((e) => e as String),
      ),
      url: json['url'] as String,
      created: json['created'] as String,
    );
  }
}
