import 'package:zuicuo/components/baseWidget.dart';
import 'package:zuicuo/pages/AllPage.dart';
import 'package:zuicuo/pages/GifPage.dart';
import 'package:zuicuo/pages/ImagePage.dart';
import 'package:zuicuo/pages/TextPage.dart';
import 'package:zuicuo/pages/VideoPage.dart';
import 'package:zuicuo/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _current = 0;
  void _handleTap(int index) {
    setState(() {
      this._current = index;
    });
  }

  // 底部导航栏跳转
  findBody() {
    if (_current == 0) {
      return AllPage();
    }
    if (_current == 1) {
      return VideoPage();
    }
    if (_current == 2) {
      return ImagePage();
    }
    if (_current == 3) {
      return GifPage();
    }
    if (_current == 4) {
      return TextPage();
    }
    return new Text('data, ${this._current}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: this.findBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._current,
        showUnselectedLabels: true,
        selectedFontSize: FontSize.sm,
        unselectedFontSize: FontSize.sm,
        onTap: this._handleTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: image('images/icon_home.png', rpx(40), rpx(40)),
            activeIcon:
                image('images/icon_home.png', rpx(40), rpx(40), Colors.blue),
            title: Container(
              padding: spaceTop(SpaceSize.sm),
              child: text('全部',
                  size: FontSize.sm,
                  color: _current == 0 ? FontColor.blue : FontColor.dark),
            ),
          ),
          BottomNavigationBarItem(
              icon: image('images/icon_video.png', rpx(40), rpx(40)),
              activeIcon:
                  image('images/icon_video.png', rpx(40), rpx(40), Colors.blue),
              title: Container(
                padding: spaceTop(SpaceSize.sm),
                child: text('视频',
                    size: FontSize.sm,
                    color: _current == 1 ? FontColor.blue : FontColor.dark),
              )),
          BottomNavigationBarItem(
              icon: image('images/icon_image.png', rpx(40), rpx(40)),
              activeIcon:
                  image('images/icon_image.png', rpx(40), rpx(40), Colors.blue),
              title: Container(
                padding: spaceTop(SpaceSize.sm),
                child: text('图文',
                    size: FontSize.sm,
                    color: _current == 2 ? FontColor.blue : FontColor.dark),
              )),
          BottomNavigationBarItem(
              icon: image('images/icon_gif.png', rpx(40), rpx(40)),
              activeIcon:
                  image('images/icon_gif.png', rpx(40), rpx(40), Colors.blue),
              title: Container(
                padding: spaceTop(SpaceSize.sm),
                child: text('动图',
                    size: FontSize.sm,
                    color: _current == 3 ? FontColor.blue : FontColor.dark),
              )),
          BottomNavigationBarItem(
              icon: image('images/icon_text.png', rpx(40), rpx(40)),
              activeIcon:
                  image('images/icon_text.png', rpx(40), rpx(40), Colors.blue),
              title: Container(
                padding: spaceTop(SpaceSize.sm),
                child: text('文字',
                    size: FontSize.sm,
                    color: _current == 4 ? FontColor.blue : FontColor.dark),
              ))
        ],
      ),
    );
  }
}
