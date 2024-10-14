import 'package:new_app/sources/data/Models/source_response/source.dart';

abstract class SourcesStates{}
class InitialState extends SourcesStates{}
class GetSourcesLoading extends SourcesStates{}
class GetSourcesError extends SourcesStates{
  final String errorMessage;
  GetSourcesError(this.errorMessage);
}
class GetSourcesSuccess extends SourcesStates{
  final List<Source>sources;
  GetSourcesSuccess(this.sources);
}