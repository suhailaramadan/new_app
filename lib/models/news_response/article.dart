import 'source.dart';

class Article {
  Source? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json['source'] == null
            ? null
            : Source.fromJson(Map<String, dynamic>.from(json['source'])),
        author: json['author'],
        title: json['title']?.toString(),
        description: json['description']?.toString(),
        url: json['url']?.toString(),
        urlToImage: json['urlToImage']?.toString(),
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.tryParse(json['publishedAt'].toString()),
        content: json['content']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (source != null) 'source': source?.toJson(),
        if (author != null) 'author': author,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (url != null) 'url': url,
        if (urlToImage != null) 'urlToImage': urlToImage,
        if (publishedAt != null) 'publishedAt': publishedAt?.toIso8601String(),
        if (content != null) 'content': content,
      };
}
