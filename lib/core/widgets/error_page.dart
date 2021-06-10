import 'package:fetch_todos/core/strings.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errMsg;

  const ErrorPage({Key key, @required this.errMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 50,
            color: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            Strings.errorTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            this.errMsg,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
