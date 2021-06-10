import 'package:fetch_todos/core/dependency_injector.dart';
import 'package:fetch_todos/core/providers/loading_provider.dart';
import 'package:fetch_todos/core/widgets/loading_page.dart';
import 'package:fetch_todos/features/todos_list/presentation/providers/todos_list_provider.dart';
import 'package:fetch_todos/features/todos_list/presentation/todos_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Dependencyinjector.init();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingProvider>(create: (_) => getIt()),
        ChangeNotifierProvider<TodoListProvider>(create: (_) => getIt())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Stack(
          children: [
            TodosList(),
            LoadingPage(),
          ],
        ),
      ),
    );
  }
}
