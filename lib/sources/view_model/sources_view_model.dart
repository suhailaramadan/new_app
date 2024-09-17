import 'package:flutter/material.dart';
import 'package:new_app/sources/data/Models/source_response/source.dart';
import 'package:new_app/sources/data/Models/source_response/source_response.dart';
import 'package:new_app/sources/data/data_source/sources_data_source.dart';

class SourcesViewModel with ChangeNotifier{
  final dataSource=SourcesDataSource();
  List<Source> sources=[];
  String? errorMessage;
  bool isLoading=false;
  Future<void> getSources(String categoryId)async{
    isLoading=true;
    notifyListeners();
    try{
    final SourceResponse response=await dataSource.getSources(categoryId);
    if(response.sources!=null && response.status=="ok"){
    sources=response.sources!;
    }else{
      errorMessage="Faild to get sources";
    }
    }catch(error){
      errorMessage=error.toString();
    }
    isLoading=false;
    notifyListeners();
  }
}