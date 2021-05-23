import 'package:flutter_app/networking/authentication.dart';

import '../client.dart';

class SearchRepository {
  APIClient _client = APIClient();

  Future<Map<String, dynamic>> history() async {
    var response =
        await _client.get('/course/search-history', authorization: true);
    return response;
  }

  Future<Map<String, dynamic>> delete(String id) async {
    var response = await _client.get('/course/delete-search-history/${id}',
        authorization: true);
    return response['payload'];
  }

  Future<Map<String, dynamic>> courses(
      String keyword, int offset, List<String> category) async {
    var token = await Authentication().token;
    var response = await _client.post(
        '/course/searchV2',
        {
          'token': token,
          'keyword': keyword,
          'limit': 10,
          'offset': offset,
          'opt': {
            'sort': {
              'attribute': 'price',
              'rule': 'ASC',
            },
            'category': category,
          }
        },
        authorization: false);
    return response['payload'];
  }

  Future<Map<String, dynamic>> bar(String keyword, int offset) async {
    var response = await _client.post(
        '/course/search-bar',
        {
          'keyword': keyword,
          'offset': offset,
          'opt': {
            'sort': {
              'attribute': 'price',
              'rule': 'ASC',
            },
          }
        },
        authorization: false);
    return response['payload'];
  }
}
