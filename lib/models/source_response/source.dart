class Source {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  const Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id']?.toString(),
        name: json['name']?.toString(),
        description: json['description']?.toString(),
        url: json['url']?.toString(),
        category: json['category']?.toString(),
        language: json['language']?.toString(),
        country: json['country']?.toString(),
      );
}
