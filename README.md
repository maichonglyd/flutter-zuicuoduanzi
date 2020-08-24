# 最矬段子

一个资源很差、界面很 low 的搞笑段子练手软件
包含文字、图片、动图展示、视频播放，数据加载、下拉刷新

# 使用的库

### dio: ^3.0.8

用于网络请求

### flutter_redux: ^0.6.0 redux:

用于数据流转

### flutter_easyrefresh: ^2.1.5

用于下拉刷新和上拉加载

### fijkplayer: ^0.8.7

用于视频播放

# 主要试验功能

使用 `redux` 系列流转数据的时候需要在各个需要数据的页面中接收更新后的数据，但 `flutter` 本身并没有这样的功能，`redux` 中也没有提供基类之类的东西，或者不太好用，就没有管这一块，所以本项目使用了 `mixins` 来给各个需要数据的组件进行附加功能：

```dart
import 'dart:async';
import 'package:zuicuo/App.dart';
import 'package:zuicuo/redux/redux.dart';
import 'package:flutter/material.dart';

mixin ReduxMixin<T extends StatefulWidget> on State<T> {
  /// stream 是因为redux是使用Stream来通知数据变化的
  /// 想要在页面销毁时取消监听，需要在监听时得到一个stream对象
  @protected
  StreamSubscription stream;


  @mustCallSuper
  void initState() {
    super.initState();
    /// 页面初始化时监听redux数据变化，并先主动触发一下
    /// 这样一进页面就能先得到一次数据
    stream = app.store.onChange.listen(connect);
    this.connect(app.store.state);
  }

  /// 页面中重写此方法就可以得到整个数据
  void connect(AppState state) {}

  @mustCallSuper
  void dispose() {
    /// 页面销毁时取消监听
    if (stream != null) {
      stream.cancel();
    }
    super.dispose();
  }
}

```

写组件时也很简单,和正常的写法没有什么区别，只是在继承 State 的类后另使用上 mixins 并重写 connect 方法就可以：

```dart
/// 这一段没有什么特殊，和正常写法一样
class TextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextPage();
  }
}
/// 在这里加上了 with ReduxMixin 就是使用这个mixin 别的没有任何变化
class _TextPage extends State<TextPage> with ReduxMixin {
  /// 定义一个变量 用于存放redux中的数据
  RecordPaginate<Joke> jokeList;

  /// 重写connect方法 每次进页面 或有数据变动
  /// 该方法就会被触发，可以得到最新数据
  @override
  void connect(AppState state) {
    var list = state.textJokeList;
    if (list == null || (!list.fetching && !list.loaded)) {
      /// 请求新数据
      dispatch(TextJokeListRequestAction());
    }
    if (list?.request == JokeType.text) {
      /// 发现本组件内需要的数据有变动 就刷新页面
      setState(() {
        jokeList = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

```

#

完结 撒花~~
