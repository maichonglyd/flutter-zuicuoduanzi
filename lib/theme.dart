import 'dart:ui';
import 'package:flutter/material.dart';

final MediaQueryData mediaQueryData = MediaQueryData.fromWindow(window);
final baseScreenWidth = 750;
final sizeRatio = mediaQueryData.size.width / baseScreenWidth;

double rpx(double size) {
  return size * sizeRatio;
}

class FontSize {
  /// 20
  static double xs = rpx(20);

  /// 24
  static double sm = rpx(24);

  /// 28
  static double md = rpx(28);

  /// 32
  static double lg = rpx(32);

  /// 36
  static double xl = rpx(36);

  /// 42
  static double xxl = rpx(42);
}

class SpaceSize {
  /// 5
  static double xs = rpx(5);

  /// 10
  static double sm = rpx(10);

  /// 20
  static double md = rpx(20);

  /// 30
  static double lg = rpx(30);

  /// 40
  static double xl = rpx(40);

  /// 50
  static double xxl = rpx(50);

  /// 60
  static double xxxl = rpx(60);
}

class BorderRadiusSize {
  /// 5
  static double xs = rpx(5);

  /// 10
  static double sm = rpx(10);

  /// 20
  static double md = rpx(20);

  /// 30
  static double lg = rpx(30);

  /// 40
  static double xl = rpx(40);

  /// 50
  static double xxl = rpx(50);

  /// 60
  static double xxxl = rpx(60);
}

class FontColor {
  static Color white = Colors.white;

  ///0xff999999
  static Color light = new Color(0xff999999);

  /// 0xff666666
  static Color grey = new Color(0xff666666);

  /// 0xff333333
  static Color dark = new Color(0xff333333);

  /// 0xff000000
  static Color black = new Color(0xff000000);
  static Color red = new Color(0xfffb3d55);
  static Color orange = new Color(0xffee9f16);
  static Color purple = new Color(0xffb724e5);
  static Color blue = new Color(0xff3686f2);
  static Color green = new Color(0xff01c1a3);
}

class BgColor {
  static Color white = Colors.white;

  ///0xfff9f9f9
  static Color light = new Color(0xfff9f9f9);

  ///0xffF4F4F4
  static Color grey = new Color(0xffF4F4F4);

  ///0xffb2b2b2
  static Color dark = new Color(0xffb2b2b2);

  ///0xff000000
  static Color black = new Color(0xff000000);
  static Color red = new Color(0xfffb3d55);

  ///0xffff5167
  static Color redLight = new Color(0xffff5167).withAlpha(25);

  ///0xffE1364C
  static Color redDark = new Color(0xffE1364C);
  static Color orange = new Color(0xffee9f16);
  static Color purple = new Color(0xffb724e5);
  static Color blue = new Color(0xff3686f2);
  static Color green = new Color(0xff01c1a3);
}

class BorderColor {
  static Color white = Colors.white;

  ///0xffefefef
  static Color light = new Color(0xffefefef);

  ///0xffdddddd
  static Color grey = new Color(0xffdddddd);

  ///0xff666666
  static Color dark = new Color(0xff666666);

  ///0xff333333
  static Color black = new Color(0xff333333);
  static Color red = new Color(0xfffb3d55);
  static Color orange = new Color(0xffee9f16);
  static Color purple = new Color(0xffb724e5);
  static Color blue = new Color(0xff3686f2);
  static Color green = new Color(0xff01c1a3);
}
