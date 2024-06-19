import 'package:flutter/material.dart';
import 'package:sync_async/src/models/todo_model.dart';
import 'package:sync_async/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final repository = TodoRepository();
  final state = ValueNotifier<HomeState>(HomeState.start);

  start() async {
    state.value = HomeState.loading;
    try {
      todos = await repository.fetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
    
  }
}

enum HomeState { start, loading, success, error }