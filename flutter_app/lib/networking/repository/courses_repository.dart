import 'package:flutter_app/models/models.dart';
import '../client.dart';

class CoursesRepository {
  APIClient _client = APIClient();

  Future<List<CourseInfo>> topCourses(
      CoursesType type, int limit, int page) async {
    List<CourseInfo> courses = [];
    String path;
    switch (type) {
      case CoursesType.NEW:
        path = '/course/top-new';
        break;
      case CoursesType.RATE:
        path = '/course/top-rate';
        break;
      case CoursesType.SELL:
        path = '/course/top-sell';
        break;
      default:
        path = '/course/top-new';
        break;
    }
    var response = ((await _client.post(
            path,
            {
              'limit': limit,
              'page': page,
            },
            authorization: false))['payload'] as List<dynamic>?)
        ?.map((e) => CourseInfo.fromJson(e as Map<String, dynamic>))
        .toList();
    courses = response!;
    return courses;
  }
}

enum CoursesType { NEW, RATE, SELL }
