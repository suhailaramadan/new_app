import 'package:new_app/news/data/model/news_response/news.dart';
abstract class NewsDataSource{
  Future<List<News>>getNews(String sourceId);
}