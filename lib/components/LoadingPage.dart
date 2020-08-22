import 'package:zuicuo/components/baseWidget.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: text('加载中...'),
      ),
    );
  }
}
