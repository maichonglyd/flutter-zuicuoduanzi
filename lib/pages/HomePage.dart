import 'package:zuicuo/components/baseWidget.dart';
import 'package:zuicuo/pages/AllPage.dart';
import 'package:zuicuo/pages/GifPage.dart';
import 'package:zuicuo/pages/ImagePage.dart';
import 'package:zuicuo/pages/TextPage.dart';
import 'package:zuicuo/pages/VideoPage.dart';
import 'package:zuicuo/r.dart';
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
              icon: image(R.imagesIconHomePng, rpx(40), rpx(40)),
              activeIcon:
                  image(R.imagesIconHomePng, rpx(40), rpx(40), Colors.blue),
              label: '全部'),
          BottomNavigationBarItem(
              icon: image(R.imagesIconVideoPng, rpx(40), rpx(40)),
              activeIcon:
                  image(R.imagesIconVideoPng, rpx(40), rpx(40), Colors.blue),
              label: '视频'),
          BottomNavigationBarItem(
              icon: image(R.imagesIconImagePng, rpx(40), rpx(40)),
              activeIcon:
                  image(R.imagesIconImagePng, rpx(40), rpx(40), Colors.blue),
              label: '图文'),
          BottomNavigationBarItem(
              icon: image(R.imagesIconGifPng, rpx(40), rpx(40)),
              activeIcon:
                  image(R.imagesIconGifPng, rpx(40), rpx(40), Colors.blue),
              label: '动图'),
          BottomNavigationBarItem(
              icon: image(R.imagesIconTextPng, rpx(40), rpx(40)),
              activeIcon:
                  image(R.imagesIconTextPng, rpx(40), rpx(40), Colors.blue),
              label: '文字')
        ],
      ),
    );
  }
}
