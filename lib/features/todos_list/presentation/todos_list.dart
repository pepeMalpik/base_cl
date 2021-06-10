import 'package:fetch_todos/core/data/api_response.dart';
import 'package:fetch_todos/core/widgets/empty_page.dart';
import 'package:fetch_todos/core/widgets/error_page.dart';
import 'package:fetch_todos/features/todos_list/presentation/providers/todos_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosList extends StatelessWidget {
  const TodosList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoListProvider>(context);
    return Scaffold(
      body: _renderView(provider: provider),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.fetchTodos();
        },
        child: Icon(Icons.download_outlined),
      ),
    );
  }

  Widget _renderView({@required TodoListProvider provider}) {
    if (provider.todos.status == Status.COMPLETED &&
        provider.todos.data.length == 0)
      return EmptyPage(msg: 'Aún no hay datos que mostrar.');
    if (provider.todos.status == Status.COMPLETED)
      return _renderList(provider: provider);
    return ErrorPage(errMsg: 'Lo sentimos ha ocurrido un error');
  }

  Widget _renderList({@required TodoListProvider provider}) {
    return Container(
      child: ListView.builder(
        itemCount: provider.todos.data.length,
        itemBuilder: (_, i) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(provider.todos.data[i].id.toString()),
            ),
            title: Text(provider.todos.data[i].title),
          );
        },
      ),
    );
  }
}
