import 'dart:convert';

import 'package:state_management/universities/data/data.dart';
import 'package:http/http.dart' as http;

class UniversityService {
  static const _baseUrl = 'http://universities.hipolabs.com';

  Future<List<ApiUniversity>> getUniversities({
    required int offset,
    required int limit,
    required String country,
  }) async {
    const route = '/search';
    final params = {
      'offset': offset,
      'limit': limit,
      'country': country,
    };
    final response = await http.get(
      Uri.http(_baseUrl, route, params),
    );

    return (jsonDecode(response.body) as List<Map<String, dynamic>>)
        .map((json) => ApiUniversity.fromJson(json))
        .toList();
  }
}
