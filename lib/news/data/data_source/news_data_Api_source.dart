import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_app/news/data/data_source/news_data_sources.dart';
import 'package:new_app/news/data/model/news_response/news.dart';
import 'package:new_app/shared/api_constance.dart';
import 'package:new_app/news/data/model/news_response/news_response.dart';
class NewsApiDataSource extends NewsDataSource{
  @override
  Future<List<News>> getNews(String sourceId)
  // String? query, int? page, int? pageSize})
  async {
    final url = Uri.https(APIConstance.baseURL, APIConstance.newsEndpoit, {
      "apiKey": APIConstance.apiKey,
      "sources": sourceId,
      // "q": query,
      // "pageSize": pageSize.toString(),
      // "page": page.toString()
    });
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    final newsResponse= NewsResponse.fromJson(json);
    if(newsResponse.status=="ok"&& newsResponse.articles!=null){
      return newsResponse.articles!;
  }else {
    throw Exception("Failed to get news");
  }
  }
}