import 'package:zuicuo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

typedef AsyncFunction = Future Function();

class PullDownRefresh extends StatelessWidget {
  final AsyncFunction refresh;
  final AsyncFunction loadMore;
  final Widget child;
  PullDownRefresh({Key key, this.refresh, this.loadMore, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      header: ClassicalHeader(
        refreshReadyText: '松手后刷新',
        refreshText: '下滑刷新',
        refreshedText: '刷新完成',
        refreshingText: '加载中...',
        infoText: '更新时间:${DateTime.now().hour}:${DateTime.now().minute}',
        textColor: FontColor.dark,
        infoColor: FontColor.dark,
      ),
      footer: ClassicalFooter(
        loadText: '加载更多',
        loadedText: '加载完成',
        loadingText: '加载中...',
        infoText: '更新时间:${DateTime.now().hour}:${DateTime.now().minute}',
        textColor: FontColor.dark,
        infoColor: FontColor.dark,
      ),
      onRefresh: refresh,
      onLoad: loadMore,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SafeArea(
                child: this.child,
              )
            ],
          ),
        )
      ],
    );
  }
}
