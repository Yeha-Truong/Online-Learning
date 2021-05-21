import 'dart:async';

import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/networking/repository/repositories.dart';

import '../response.dart';

class CourseBloc {
  late CourseRepository _repository;
  late StreamController _controller;
  StreamSink<Response<CourseDetail>> get courseSink =>
      _controller.sink as StreamSink<Response<CourseDetail>>;
  Stream<Response<CourseDetail>> get courseStream =>
      _controller.stream as Stream<Response<CourseDetail>>;
  CourseBloc() {
    _controller = StreamController<Response<CourseDetail>>();
    _repository = CourseRepository();
  }

  getDetails(String id) async {
    courseSink.add(Response.loading('Loading details...'));
    try {
      CourseDetail detail = await _repository.getDetail(id);
      courseSink.add(Response.completed(detail));
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
