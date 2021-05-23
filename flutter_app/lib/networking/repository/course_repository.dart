import 'package:flutter_app/models/models.dart';

import '../client.dart';

class CourseRepository {
  APIClient _client = APIClient();

  Future<CourseDetail> getDetail(String id) async {
    CourseDetail user = CourseDetail.fromJson((await _client.get(
        '/course/get-course-detail/$id/userId',
        authorization: false))['payload']);
    return user;
  }
}
