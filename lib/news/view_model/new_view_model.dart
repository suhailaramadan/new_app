import 'package:flutter/material.dart';
import 'package:new_app/news/data/data_source/news_data_source.dart';
import 'package:new_app/news/data/model/news_response/news.dart';

class NewsViewModel with ChangeNotifier{
  List<News> newsList=[];
  String? errorMessage;
  bool isLoading=false;
  final dataSource=NewsDataSource();
  Future<void> getNews(String? sourceId)async{
    isLoading=true;
    notifyListeners();
  final response=await dataSource.getNews(sourceId: sourceId);
  try{
  if(response.status=="ok"&& response.articles !=null){
    newsList=response.articles!;
  }else {
    errorMessage="Failed to get news";
  }
  }catch(error){
    errorMessage=error.toString();
  }
  isLoading=false;
  notifyListeners();
  }

}