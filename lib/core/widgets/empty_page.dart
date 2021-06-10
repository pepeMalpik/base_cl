import 'package:fetch_todos/core/strings.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String msg;
  const EmptyPage({Key key, @required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 50,
            color: Colors.black54,
          ),
          SizedBox(height: 20),
          Text(
            Strings.empty_title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            this.msg,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
