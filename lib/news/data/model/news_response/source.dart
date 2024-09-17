class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id']?.toString(),
        name: json['name']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
      };
}
