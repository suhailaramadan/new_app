import 'package:new_app/sources/data/Models/source_response/source.dart';
import 'package:new_app/sources/data/data_source/sources_data_sources.dart';

class SourcesRepository{
  final SourcesDataSources dataSource;
  SourcesRepository(this.dataSource);
  Future<List<Source>>getSources(String categoryId){
  return dataSource.getSources(categoryId);
  }
}