import 'package:fetch_todos/core/routing/app_routes.dart';
import 'package:fetch_todos/features/todo_create/todo_create.dart';
import 'package:fetch_todos/features/todos_list/presentation/todos_list.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.todo_list:
        return MaterialPageRoute(builder: (_) => TodosList());
        break;
      case AppRoutes.todo_create:
        return MaterialPageRoute(builder: (_) => TodoCreate());
        break;
      default:
        return MaterialPageRoute(builder: (_) => TodosList());
    }
  }
}
