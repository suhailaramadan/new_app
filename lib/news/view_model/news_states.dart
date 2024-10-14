import 'package:new_app/news/data/model/news_response/news.dart';

abstract class NewsStates{}
class InitialStateNews extends NewsStates{}
class GetNewsLoading extends NewsStates{}
class GetNewsError extends NewsStates{
  final String errorMessage;
  GetNewsError(this.errorMessage);
}
class GetNewsSuccess extends NewsStates{
  final List<News> news;
  GetNewsSuccess(this.news);
}