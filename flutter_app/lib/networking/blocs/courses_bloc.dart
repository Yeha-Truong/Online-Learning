import 'dart:async';

import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/networking/repository/repositories.dart';

import '../response.dart';

class CoursesBloc {
  late CoursesRepository _repository;
  late StreamController _controller;
  StreamSink<Response<List<CourseInfo>>> get courseSink =>
      _controller.sink as StreamSink<Response<List<CourseInfo>>>;
  Stream<Response<List<CourseInfo>>> get courseStream =>
      _controller.stream as Stream<Response<List<CourseInfo>>>;
  CoursesBloc() {
    _controller = StreamController<Response<List<CourseInfo>>>();
    _repository = CoursesRepository();
  }

  topCourses(CoursesType type, int limit, int page) async {
    courseSink.add(Response.loading('Loading details...'));
    try {
      List<CourseInfo> courses =
          await _repository.topCourses(type, limit, page);
      courseSink.add(Response.completed(courses));
      dispose();
    } catch (e) {
      courseSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _controller.close();
  }
}
