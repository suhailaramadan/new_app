import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/news/data/model/news_response/news.dart';
import 'package:new_app/news/data/repository/news_repository.dart';
import 'package:new_app/news/view_model/news_states.dart';
import 'package:new_app/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsStates>{
  late NewsRepository newsRepository;
  NewsViewModel():super(InitialStateNews()) {
    newsRepository=NewsRepository(ServiceLocator.newsDataSources);
  }
  Future<void> getNews(String sourceId)async{
    emit(GetNewsLoading());
    try{
      final news=await newsRepository.getNews(sourceId);
    emit(GetNewsSuccess(news));
    }catch(error){
    emit(GetNewsError(error.toString()));
    }
  }
}

// class NewsViewModel with ChangeNotifier{
//   final NewsRepository newsRepository;
//   NewsViewModel():newsRepository=NewsRepository(ServiceLocator.newsDataSources);
//   List<News> newsList=[];
//   String? errorMessage;
//   bool isLoading=false;
//   Future<void> getNews(String sourceId)async{
//     isLoading=true;
//     notifyListeners();
//   try{
//   newsList=await newsRepository.getNews(sourceId);
//   } 
//   catch(error){
//     errorMessage=error.toString();
//   }
//   isLoading=false;
//   notifyListeners();
//   }

// }