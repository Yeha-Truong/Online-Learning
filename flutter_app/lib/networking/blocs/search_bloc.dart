import 'dart:async';
import 'package:flutter_app/networking/repository/repositories.dart';
import '../response.dart';

class SearchBloc {
  late SearchRepository _repository;
  late StreamController _controller;
  StreamSink<Response<Map<String, dynamic>>> get sink =>
      _controller.sink as StreamSink<Response<Map<String, dynamic>>>;
  Stream<Response<Map<String, dynamic>>> get stream =>
      _controller.stream as Stream<Response<Map<String, dynamic>>>;
  SearchBloc() {
    _controller = StreamController<Response<Map<String, dynamic>>>();
    _repository = SearchRepository();
  }

  history() async {
    sink.add(Response.loading('Loading...'));
    try {
      Map<String, dynamic> response = await _repository.history();
      sink.add(Response.completed(response));
      dispose();
    } catch (e) {
      sink.add(Response.error(e.toString()));
      print(e);
    }
  }

  delete(String id) async {
    sink.add(Response.loading('Deleting...'));
    try {
      await _repository.delete(id);
      sink.add(Response.completed(null));
      dispose();
    } catch (e) {
      sink.add(Response.error(e.toString()));
      print(e);
    }
  }

  courses(String keyword, offset, List<String> category) async {
    sink.add(Response.loading('Searching...'));
    try {
      Map<String, dynamic> response =
          await _repository.courses(keyword, offset, category);
      sink.add(Response.completed(response));
      dispose();
    } catch (e) {
      sink.add(Response.error(e.toString()));
      print(e);
    }
  }

  bar(String keyword, offset) async {
    sink.add(Response.loading('Searching...'));
    try {
      Map<String, dynamic> response = await _repository.bar(keyword, offset);
      sink.add(Response.completed(response));
      dispose();
    } catch (e) {
      sink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _controller.close();
  }
}
