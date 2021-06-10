import 'package:fetch_todos/features/todos_list/domain/entities/todo-entitie.dart';
import 'package:flutter/material.dart';

class TodoModel extends TodoEntitie {
  TodoModel({
    @required userId,
    @required id,
    @required title,
    @required completed,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          completed: completed,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );
}
