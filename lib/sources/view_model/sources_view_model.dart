import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/service_locator.dart';
import 'package:new_app/sources/repository/sources_repository.dart';
import 'package:new_app/sources/view_model/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesStates>{
  late final SourcesRepository repository;
  SourcesViewModel():super(InitialState()){
    repository=SourcesRepository(ServiceLocator.sourcesDataSources);
  }
  Future<void> getSources(String categoryId)async{
    emit(GetSourcesLoading());
    try{
      final sources=await repository.getSources(categoryId);
      emit(GetSourcesSuccess(sources));
    }catch(error){
      emit(GetSourcesError(error.toString()));
    }
  }

}

// class SourcesViewModel with ChangeNotifier{
//   final repository=SourcesRepository(ServiceLocator.sourcesDataSources);
//   List<Source> sources=[];
//   String? errorMessage;
//   bool isLoading=false;
//   Future<void> getSources(String categoryId)async{
//     isLoading=true;
//     notifyListeners();
//     try{
//     sources=await repository.getSources(categoryId);
//     }catch(error){
//       errorMessage=error.toString();
//     }
//     isLoading=false;
//     notifyListeners();
//   }
// }