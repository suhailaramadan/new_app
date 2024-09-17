import 'dart:convert';

import 'package:new_app/shared/api_constance.dart';
import 'package:new_app/sources/data/Models/source_response/source_response.dart';
import 'package:http/http.dart' as http;

class SourcesDataSource {
  Future<SourceResponse> getSources(String? categoryId) async {
    final url = Uri.https(APIConstance.baseURL, APIConstance.sourceEndpoint,
        {"apiKey": APIConstance.apiKey, "category": categoryId});
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }
}
