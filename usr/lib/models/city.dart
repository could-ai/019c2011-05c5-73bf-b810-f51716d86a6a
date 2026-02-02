class City {
  final String name;
  final String? imageUrl;
  final List<String> tags;
  final double? rating;

  City({
    required this.name,
    this.imageUrl,
    this.tags = const [],
    this.rating,
  });
}