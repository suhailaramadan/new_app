import 'package:flutter/material.dart';
import 'package:new_app/shared/service_locator.dart';
import 'package:new_app/sources/data/Models/source_response/source.dart';
import 'package:new_app/sources/repository/sources_repository.dart';

class SourcesViewModel with ChangeNotifier{
  final repository=SourcesRepository(ServiceLocator.sourcesDataSources);
  List<Source> sources=[];
  String? errorMessage;
  bool isLoading=false;
  Future<void> getSources(String categoryId)async{
    isLoading=true;
    notifyListeners();
    try{
    sources=await repository.getSources(categoryId);
    }catch(error){
      errorMessage=error.toString();
    }
    isLoading=false;
    notifyListeners();
  }
}