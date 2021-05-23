import 'dart:async';

import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/networking/repository/repositories.dart';

import '../response.dart';

class UserBloc {
  late UserRepository _repository;
  late StreamController _controller;
  StreamSink<Response<User>> get sink =>
      _controller.sink as StreamSink<Response<User>>;
  Stream<Response<User>> get stream =>
      _controller.stream as Stream<Response<User>>;
  UserBloc() {
    _controller = StreamController<Response<User>>();
    _repository = UserRepository();
  }

  register(String email, String name, String phone, String password) async {
    sink.add(Response.loading('Sign up...'));
    try {
      await _repository.register(email, name, phone, password);
      sink.add(Response.completed(null));
      dispose();
    } catch (e) {
      sink.add(Response.error(e.toString()));
      print(e);
    }
  }

  signin(String email, String password) async {
    sink.add(Response.loading('Sign in...'));
    try {
      User user = await _repository.signin(email, password);
      sink.add(Response.completed(user));
      dispose();
    } catch (e) {
      sink.add(Response.error(e.toString()));
      print(e);
    }
  }

  google(String email, String id) async {
    sink.add(Response.loading('Sign in...'));
    try {
      User user = await _repository.google(email, id);
      sink.add(Response.completed(user));
      dispose();
    } catch (e) {
      sink.add(Response.error(e.toString()));
      print(e);
    }
  }

  changePassword(String email, String old, String password) async {
    sink.add(Response.loading('Changing password...'));
    try {
      await _repository.changePassword(email, old, password);
      sink.add(Response.completed(null));
      dispose();
    } catch (e) {
      sink.add(Response.error(e.toString()));
      print(e);
    }
  }

  forgotPassword(String email) async {
    sink.add(Response.loading('Submitting request...'));
    try {
      await _repository.forgotPassword(email);
      sink.add(Response.completed(null));
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
