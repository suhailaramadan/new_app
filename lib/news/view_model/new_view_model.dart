import 'package:flutter/material.dart';
import 'package:new_app/news/data/model/news_response/news.dart';
import 'package:new_app/news/data/repository/news_repository.dart';
import 'package:new_app/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier{
  final NewsRepository newsRepository;
  NewsViewModel():newsRepository=NewsRepository(ServiceLocator.newsDataSources);
  List<News> newsList=[];
  String? errorMessage;
  bool isLoading=false;
  Future<void> getNews(String sourceId)async{
    isLoading=true;
    notifyListeners();
  try{
  newsList=await newsRepository.getNews(sourceId);
  } 
  catch(error){
    errorMessage=error.toString();
  }
  isLoading=false;
  notifyListeners();
  }

}