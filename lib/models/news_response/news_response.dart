import 'article.dart';

class NewsResponse {
  String? status;
  num? totalResults;
  List<Article>? articles;

  NewsResponse({this.status, this.totalResults, this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json['status']?.toString(),
        totalResults: num.tryParse(json['totalResults'].toString()),
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (status != null) 'status': status,
        if (totalResults != null) 'totalResults': totalResults,
        if (articles != null)
          'articles': articles?.map((e) => e.toJson()).toList(),
      };
}
