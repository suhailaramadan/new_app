import 'package:new_app/news/data/data_source/news_data_Api_source.dart';
import 'package:new_app/news/data/model/news_response/news.dart';
class NewsRepository{
  final NewsApiDataSource dataSource;
  NewsRepository(this.dataSource);
  Future<List<News>> getNews(String sourceId){
  return dataSource.getNews(sourceId);
  }
}