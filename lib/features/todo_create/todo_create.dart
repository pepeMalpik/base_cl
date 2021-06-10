import 'package:fetch_todos/core/providers/loading_provider.dart';
import 'package:fetch_todos/core/widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoCreate extends StatelessWidget {
  const TodoCreate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingProvider = Provider.of<LoadingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola pepe'),
      ),
      body: Stack(
        children: [
          _renderView(),
          LoadingPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          loadingProvider.showLoading(msg: 'testeando...');
        },
      ),
    );
  }

  Widget _renderView() {
    return Container(
      child: Center(
        child: Text('Hola pepe'),
      ),
    );
  }
}
