import 'package:flutter/material.dart';
import 'package:fetch_todos/core/data/api_path.dart';
import 'package:fetch_todos/core/data/http_client.dart';
import 'package:fetch_todos/features/todos_list/domain/services/fetch_todos_service.dart';

class FetchTodosServiceImp extends FetchTodosService {
  final HttpClient client;

  FetchTodosServiceImp({@required this.client});
  @override
  Future<String> fetchTodos() async {
    await Future.delayed(const Duration(seconds: 5), () => "5");

    return client.fetchData(APIPathHelper.getValue(APIPath.fetch_todos));
  }
}
