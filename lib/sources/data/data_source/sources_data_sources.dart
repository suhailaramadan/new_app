import 'package:new_app/sources/data/Models/source_response/source.dart';

abstract class SourcesDataSources{
Future<List<Source>> getSources(String categoryId);

}