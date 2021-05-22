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
      _controller.stream as Stream<Response<User>>;
  UserBloc() {
    _controller = StreamController<Response<User>>();
    _repository = UserRepository();
  }

  register(String email, String name, String phone, String password) async {
    userSink.add(Response.loading('Sign up...'));
    try {
      await _repository.register(email, name, phone, password);
      userSink.add(Response.completed(null));
      dispose();
    } catch (e) {
      userSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  login(String email, String password) async {
    userSink.add(Response.loading('Sign up...'));
    try {
      User user = await _repository.signin(email, password);
      userSink.add(Response.completed(user));
      dispose();
    } catch (e) {
      userSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _controller.close();
  }
}
