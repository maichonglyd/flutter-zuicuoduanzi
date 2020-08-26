import 'dart:async';
import 'package:zuicuo/App.dart';
import 'package:zuicuo/redux/redux.dart';
import 'package:flutter/material.dart';

mixin ReduxMixin<T extends StatefulWidget> on State<T> {
  @protected
  StreamSubscription stream;
  @mustCallSuper
  void initState() {
    super.initState();
    stream = app.store.onChange.listen(connect);
    this.connect(app.store.state);
  }

  void connect(AppState state) {}

  void setData(Function callback) {
    assert(callback != null, 'setData的参数callback不能为空');
    if (this.mounted) {
      setState(callback);
    }
  }

  @mustCallSuper
  void dispose() {
    if (stream != null) {
      stream.cancel();
    }
    super.dispose();
  }
}
