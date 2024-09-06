import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/api/api_constance.dart';
import 'package:new_app/models/news_response/news_response.dart';
import 'package:new_app/models/source_response/source_response.dart';

class APIService {
  static Future<SourceResponse> getSources(String categoryId) async {
    final url = Uri.https(APIConstance.baseURL, APIConstance.sourceEndpoit,
        {"apiKey": APIConstance.apiKey, "category": categoryId});
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String categoryId) async {
    final url = Uri.https(APIConstance.baseURL, APIConstance.newsEndpoit,
        {"apiKey": APIConstance.apiKey, "sources": categoryId});
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
