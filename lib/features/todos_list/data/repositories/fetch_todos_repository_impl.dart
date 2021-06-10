import 'dart:convert';

import 'package:fetch_todos/features/todos_list/data/models/todo_model.dart';
import 'package:fetch_todos/features/todos_list/domain/entities/todo-entitie.dart';
import 'package:fetch_todos/features/todos_list/domain/repositories/fetch_todos_repository.dart';
import 'package:fetch_todos/features/todos_list/domain/services/fetch_todos_service.dart';
import 'package:flutter/material.dart';

class FetchTodosRepositoryImp extends FetchTodosRepository {
  final FetchTodosService service;

  FetchTodosRepositoryImp({@required this.service});
  @override
  Future<List<TodoEntitie>> fetchTodos() async {
    final response = await service.fetchTodos();
    final todos = List<TodoEntitie>.from(
      json.decode(response).map(
            (x) => TodoModel.fromJson(x),
          ),
    );
    return todos;
  }
}
