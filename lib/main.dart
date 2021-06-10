import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fetch_todos/core/dependency_injector.dart';
import 'package:fetch_todos/core/providers/loading_provider.dart';
import 'package:fetch_todos/core/providers/theme_provider.dart';
import 'package:fetch_todos/core/routing/app_routes.dart';
import 'package:fetch_todos/core/routing/route_generator.dart';

import 'package:fetch_todos/features/todos_list/presentation/providers/todos_list_provider.dart';

void main() {
  Dependencyinjector.init();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<LoadingProvider>(create: (_) => getIt()),
        ChangeNotifierProvider<TodoListProvider>(create: (_) => getIt()),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness brightness =
        WidgetsBinding.instance.window.platformBrightness;
    Provider.of<ThemeProvider>(context, listen: false)
        .onChangeApparience(brightness: brightness);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: themeProvider.theme,
      initialRoute: AppRoutes.todo_list,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
