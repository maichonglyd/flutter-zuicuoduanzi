import 'package:zuicuo/components/baseWidget.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String word;
  ErrorPage({this.word});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: text(this.word),
      ),
    );
  }
}
