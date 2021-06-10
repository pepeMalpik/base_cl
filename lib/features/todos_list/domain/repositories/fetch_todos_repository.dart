import 'package:fetch_todos/features/todos_list/domain/entities/todo-entitie.dart';

abstract class FetchTodosRepository {
  Future<List<TodoEntitie>> fetchTodos();
}
