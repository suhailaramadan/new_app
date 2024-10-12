import 'package:new_app/news/data/data_source/news_data_Api_source.dart';
import 'package:new_app/sources/data/data_source/sources_api_data_source.dart';

class ServiceLocator{
  static final sourcesDataSources=SourcesApiDataSource();
  static final newsDataSources=NewsApiDataSource();
}