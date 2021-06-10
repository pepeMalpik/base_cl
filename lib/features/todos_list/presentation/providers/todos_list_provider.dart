import 'package:fetch_todos/core/data/api_response.dart';
import 'package:fetch_todos/core/providers/loading_provider.dart';
import 'package:fetch_todos/features/todos_list/domain/entities/todo-entitie.dart';
import 'package:fetch_todos/features/todos_list/domain/repositories/fetch_todos_repository.dart';
import 'package:flutter/material.dart';

class TodoListProvider with ChangeNotifier {
  final FetchTodosRepository fetchTodosRepository;
  final LoadingProvider loadingProvider;

  ApiResponse<List<TodoEntitie>> _todos;
  ApiResponse<List<TodoEntitie>> get todos => _todos;

  TodoListProvider({
    @required this.fetchTodosRepository,
    @required this.loadingProvider,
  }) {
    _todos = ApiResponse.completed([]);
  }

  fetchTodos() async {
    loadingProvider.showLoading(msg: 'Fetching todos...');
    try {
      final todos = await fetchTodosRepository.fetchTodos();
      _todos = ApiResponse.completed(todos);
      notifyListeners();
    } catch (e) {
      print(e);
      _todos = ApiResponse.error('error fetching todos...');
      notifyListeners();
    }
    loadingProvider.hideLoading();
  }
}
