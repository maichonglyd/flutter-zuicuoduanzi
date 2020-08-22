import 'package:zuicuo/components/baseWidget.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String word;
  EmptyPage({this.word});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: text(this.word ?? '暂无数据'),
      ),
    );
  }
}
