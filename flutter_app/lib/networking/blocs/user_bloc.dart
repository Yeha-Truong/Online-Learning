import 'dart:async';

import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/networking/repository/repositories.dart';

import '../response.dart';

class UserBloc {
  late UserRepository _repository;
  late StreamController _controller;
  StreamSink<Response<User>> get userSink =>
      _controller.sink as StreamSink<Response<User>>;
  Stream<Response<User>> get userStream =>
      _controller.stream.cast<Response<User>>();
  UserBloc() {
    _controller = StreamController<Response<User>>();
    _repository = UserRepository();
  }

  login(String email, String password) async {
    userSink.add(Response.loading('Sign in...'));
    try {
      await _repository.login(email, password);
      userSink.add(Response.completed(null));
    } catch (e) {
      userSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  getDetails() async {
    userSink.add(Response.loading('Loading details...'));
    try {
      User user = await _repository.getDetail();
      userSink.add(Response.completed(user));
    } catch (e) {
      userSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _controller.close();
  }
}
