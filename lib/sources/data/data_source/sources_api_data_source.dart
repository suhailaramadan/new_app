import 'dart:convert';

import 'package:new_app/shared/api_constance.dart';
import 'package:new_app/sources/data/Models/source_response/source.dart';
import 'package:new_app/sources/data/Models/source_response/source_response.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/sources/data/data_source/sources_data_sources.dart';

class SourcesApiDataSource extends SourcesDataSources{
  @override
  Future<List<Source>> getSources(String categoryId) async {
    final url = Uri.https(APIConstance.baseURL, APIConstance.sourceEndpoint,
        {"apiKey": APIConstance.apiKey, "category": categoryId});
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    final sourcesResponse=SourceResponse.fromJson(json);
    if(sourcesResponse.status=="ok"&& sourcesResponse.sources!=null){
      return sourcesResponse.sources!;
    }
    else{
      throw Exception("Faild to get sources");
    }
  
  }
}
