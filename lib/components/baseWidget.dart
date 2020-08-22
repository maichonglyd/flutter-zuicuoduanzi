import 'dart:io';
import 'dart:ui';
import '../theme.dart';
import 'package:flutter/material.dart';

/**
 * [Padding]        padding[x]        各个方向的内边距    直接使用
 * 
 * [EdgeInsets]     space[x]          各个方向的间隔      多用于padding属性或margin属性
 * 
 * [Text]           text              文本              内容 颜色 字号 粗体 对齐 溢出
 * 
 * [Image]          image             图片              本地或网络图片 给定宽高
 * 
 * [ClipRRect]      imageCirc[x]      各个方向圆角图片    直接使用
 * 
 * [BorderSide]     borderSide        边线              用于border属性
 * 
 * [BoxDecoration]  border[x]         各个方向边框        多用于Container.decoration属性
 * 
 * [BoxDecoration]  bgAndBorder[x]    背景色和边框        多用于Container.decoration属性
 * 
 * [BoxDecoration]  bgAndCirc[x]      背景色和圆角        多用于Container.decoration属性
 */

/// 左侧内边距
Padding paddingLeft([double x]) {
  var t = x ?? SpaceSize.lg;
  return new Padding(padding: new EdgeInsets.only(left: t));
}

/// 右侧内边距
Padding paddingRight([double x]) {
  var t = x ?? SpaceSize.lg;
  return new Padding(padding: new EdgeInsets.only(right: t));
}

/// 上侧内边距
Padding paddingTop([double x]) {
  var t = x ?? SpaceSize.lg;
  return new Padding(padding: new EdgeInsets.only(top: t));
}

/// 下侧内边距
Padding paddingBottom([double x]) {
  var t = x ?? SpaceSize.lg;
  return new Padding(padding: new EdgeInsets.only(bottom: t));
}

/// 左右两侧内边距 只写一个参数代表两侧用同一个值
Padding paddingHorizontal([double left, double right]) {
  var tl = left ?? SpaceSize.lg;
  var tr = right ?? left ?? SpaceSize.lg;
  return new Padding(padding: new EdgeInsets.only(left: tl, right: tr));
}

/// 上下两侧内边距 只写一个参数代表两侧用同一个值
Padding paddingVerticality([double top, double bottom]) {
  var tt = top ?? SpaceSize.lg;
  var tb = bottom ?? top ?? SpaceSize.lg;
  return new Padding(padding: new EdgeInsets.only(top: tt, bottom: tb));
}

/// 四周不同的内边距
Padding paddingRound(double top, double right, double bottom, double left) {
  return new Padding(
      padding: new EdgeInsets.only(
          top: top, bottom: bottom, left: left, right: right));
}

/// 四周相同的内边距
Padding padding([double x]) {
  var t = x ?? SpaceSize.lg;
  return new Padding(padding: new EdgeInsets.all(t));
}

/// 左侧间距
EdgeInsets spaceLeft([double x]) {
  var t = x ?? SpaceSize.lg;
  return new EdgeInsets.only(left: t);
}

/// 右侧间距
EdgeInsets spaceRight([double x]) {
  var t = x ?? SpaceSize.lg;
  return new EdgeInsets.only(right: t);
}

/// 上侧间距
EdgeInsets spaceTop([double x]) {
  var t = x ?? SpaceSize.lg;
  return new EdgeInsets.only(top: t);
}

/// 下侧间距
EdgeInsets spaceBottom([double x]) {
  var t = x ?? SpaceSize.lg;
  return new EdgeInsets.only(bottom: t);
}

/// 左右两侧间距  只写一个参数代表两侧用同一个值
EdgeInsets spaceHorizontal([double left, double right]) {
  var tl = left ?? SpaceSize.lg;
  var tr = right ?? left ?? SpaceSize.lg;
  return new EdgeInsets.only(left: tl, right: tr);
}

/// 上下两侧间距 只写一个参数代表两侧用同一个值
EdgeInsets spaceVerticality([double top, double bottom]) {
  var tt = top ?? SpaceSize.lg;
  var tb = bottom ?? top ?? SpaceSize.lg;
  return new EdgeInsets.only(top: tt, bottom: tb);
}

/// 四周不同间距
EdgeInsets spaceRound(double top, double right, double bottom, double left) {
  return new EdgeInsets.only(
      top: top, bottom: bottom, left: left, right: right);
}

/// 四周相同间距
EdgeInsets space([double x]) {
  var t = x ?? SpaceSize.lg;
  return new EdgeInsets.all(t);
}

/// 文本
///
/// * [String] v 内容
/// * [double] size 字号 默认为 FontSize.md
/// * [Color] color 颜色 默认为 FontColor.dark
/// * [double] height 行高 默认为 1.0
/// * [bool] blod 粗体 默认为 false
/// * [String] align 文本对齐方式； 如需使用，传值为单词的首字母 默认为 s
///
///            [s]tart [c]enter [e]nd [j]ustify [l]eft [r]ight
///
/// * [String] overflow 溢出；只能决定文字最后是否显示省略号 如需使用，传值为单词的首字母 默认为 c
///
///            [c]lip [e]llipsis [f]ade [v]isable
/// * [int] maxLines 显示最大行数
/// * [bool] deleteline 显示删除线 与underline同时存在时显示删除线
/// * [bool] underline 显示下划线 与deleteline同时存在时显示删除线
Text text(String v,
    {double size,
    Color color,
    double height,
    bool blod = false,
    String align,
    String overflow,
    int maxLines,
    bool deleteline = false,
    bool underline = false}) {
  TextAlign textAlign = TextAlign.start;
  if (align != null && align != 's') {
    switch (align) {
      case 'c':
        textAlign = TextAlign.center;
        break;
      case 'e':
        textAlign = TextAlign.end;
        break;
      case 'j':
        textAlign = TextAlign.justify;
        break;
      case 'l':
        textAlign = TextAlign.left;
        break;
      case 'r':
        textAlign = TextAlign.right;
        break;
    }
  }
  TextOverflow of = TextOverflow.visible;
  if (overflow != null) {
    switch (overflow) {
      case 'e':
        of = TextOverflow.ellipsis;
        break;
      case 'f':
        of = TextOverflow.fade;
        break;
      case 'v':
        of = TextOverflow.visible;
        break;
      case 'n':
        of = null;
        break;
    }
  }

  TextDecoration td;
  if (underline) td = TextDecoration.underline;
  if (deleteline) td = TextDecoration.lineThrough;

  return new Text(
    v ?? '',
    textAlign: textAlign,
    overflow: of,
    maxLines: maxLines ?? 100,
    softWrap: true,
    style: new TextStyle(
        height: height,
        decoration: td,
        color: color ?? FontColor.dark,
        fontSize: size ?? FontSize.md,
        fontWeight: blod ? FontWeight.bold : null),
  );
}

/// 显示一个给定宽高的图片
///
/// 可以是网络图片 也可以是本地图片，网络图片需要以http开头
Image image(dynamic img, double width, double height, [Color color]) {
  if (img is File) {
    return Image.file(img,
        fit: BoxFit.fill, width: width, height: height, color: color);
  } else if (img.startsWith('http')) {
    return Image.network(img,
        fit: BoxFit.fill, width: width, height: height, color: color);
  } else if (img.length <= 0) {
    return Image.asset('images/pic_default.jpg',
        fit: BoxFit.fill, width: width, height: height, color: color);
  }
  return Image.asset(img,
      fit: BoxFit.fill, width: width, height: height, color: color);
}

/// 显示一个给定宽高-左侧两个圆角的图片
///
/// 可以是网络图片 也可以是本地图片，网络图片需要以http开头
ClipRRect imageCircLeft(dynamic img, double width, double height, double radius,
    [Color color]) {
  var r = Radius.circular(radius);
  return new ClipRRect(
      child: image(img, width, height, color),
      borderRadius: new BorderRadius.only(topLeft: r, bottomLeft: r));
}

/// 显示一个给定宽高-上侧两个圆角的图片
///
/// 可以是网络图片 也可以是本地图片，网络图片需要以http开头
ClipRRect imageCircTop(
    dynamic img, double width, double height, double radius) {
  var r = Radius.circular(radius);
  return new ClipRRect(
      child: image(img, width, height),
      borderRadius: new BorderRadius.only(topLeft: r, topRight: r));
}

/// 显示一个给定宽高-右侧两个圆角的图片
///
/// 可以��网���图片 也可以是��地图片，网络图片需要以http开头
ClipRRect imageCircRight(
    dynamic img, double width, double height, double radius) {
  var r = Radius.circular(radius);
  return new ClipRRect(
      child: image(img, width, height),
      borderRadius: new BorderRadius.only(bottomRight: r, topRight: r));
}

/// 显示一个给定宽高-下侧两个圆角的图片
///
/// 可以是网络图片 也可以是本地图片，网络图片需要以http开头
ClipRRect imageCircBottom(
    dynamic img, double width, double height, double radius) {
  var r = Radius.circular(radius);
  return new ClipRRect(
      child: image(img, width, height),
      borderRadius: new BorderRadius.only(bottomRight: r, bottomLeft: r));
}

/// 显示一个给定宽高-四个圆角的图片
///
/// 可以是网络图片 也可以是本地图片，网络图片需要以http开头
ClipRRect imageCirc(dynamic img, double width, double height, double radius) {
  var r = Radius.circular(radius);
  return new ClipRRect(
      child: image(img, width, height), borderRadius: new BorderRadius.all(r));
}

/// 边线宽度和颜色 默认宽度为1，颜色为BorderColor.light
BorderSide borderSide([double width, Color color]) {
  return new BorderSide(
      width: width ?? rpx(1), color: color ?? BorderColor.light);
}

/// 左边框
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration borderLeft({double width, Color color}) {
  return new BoxDecoration(border: new Border(left: borderSide(width, color)));
}

/// 右边框
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration borderRight({double width, Color color}) {
  return new BoxDecoration(border: new Border(right: borderSide(width, color)));
}

/// 上边框
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration borderTop({double width, Color color}) {
  return new BoxDecoration(border: new Border(top: borderSide(width, color)));
}

/// 下边框
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration borderBottom({double width, Color color}) {
  return new BoxDecoration(
      border: new Border(bottom: borderSide(width, color)));
}

/// 四边框
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration border({double width, Color color}) {
  return new BoxDecoration(
      border:
          new Border.all(width: width ?? 1, color: color ?? BorderColor.light));
}

/// 边框和圆角
/// * [double] radius 圆角
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration borderCirc({double width, Color color, @required double radius}) {
  return new BoxDecoration(
      border:
          new Border.all(color: color ?? BorderColor.light, width: width ?? 1),
      borderRadius: new BorderRadius.circular(radius));
}

/// 背景色和左边框
/// * [Color] bg 背景色 默认为BgColor.white
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration bgAndBorderLeft({Color bg, double width, Color color}) {
  return new BoxDecoration(
      color: bg ?? BgColor.white,
      border: new Border(left: borderSide(width, color)));
}

/// 背景色和右边框
/// * [Color] bg 背景色 默认为BgColor.white
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration bgAndBorderRight({Color bg, double width, Color color}) {
  return new BoxDecoration(
      color: bg ?? BgColor.white,
      border: new Border(right: borderSide(width, color)));
}

/// 背景色和上边框
/// * [Color] bg 背景色 默认为BgColor.white
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration bgAndBorderTop({Color bg, double width, Color color}) {
  return new BoxDecoration(
      color: bg ?? BgColor.white,
      border: new Border(top: borderSide(width, color)));
}

/// 背景色和下边框
/// * [Color] bg 背景色 默认为BgColor.white
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration bgAndBorderBottom({Color bg, double width, Color color}) {
  return new BoxDecoration(
      color: bg ?? BgColor.white,
      border: new Border(bottom: borderSide(width, color)));
}

/// 背景色和四边框
/// * [Color] bg 背景色 默认为BgColor.white
/// * [double] width 宽度 默认为1
/// * [Color] color 边框颜色 默认为BorderColor.light
BoxDecoration bgAndBorder({Color bg, double width, Color color}) {
  return new BoxDecoration(
      color: bg ?? BgColor.white,
      border:
          new Border.all(width: width ?? 1, color: color ?? BorderColor.light));
}

/// 背景色和左侧两圆角
/// * [Color] bg 背景色 默认为BgColor.white
/// * [double] radius 宽度 默认为0
BoxDecoration bgAndCircLeft({Color bg, double radius}) {
  var r = Radius.circular(radius ?? 0);
  return new BoxDecoration(
      color: bg ?? BgColor.white,
      borderRadius: new BorderRadius.only(bottomLeft: r, topLeft: r));
}

/// 背景色和上侧两圆角
/// * [Color] bg 背景色 默认为BgColor.white
/// * [double] radius 宽度 默认为0
BoxDecoration bgAndCircTop({Color bg, double radius}) {
  var r = Radius.circular(radius ?? 0);
  return new BoxDecoration(
      color: bg ?? BgColor.white,
      borderRadius: new BorderRadius.only(topRight: r, topLeft: r));
}

/// 背景色和右侧两圆角
/// * [Color] bg 背景色 默认为BgColor.white
/// * [double] radius 宽度 默认为0
BoxDecoration bgAndCircRight({Color bg, double radius}) {
  var r = Radius.circular(radius ?? 0);
  return new BoxDecoration(
      color: bg ?? BgColor.white,
      borderRadius: new BorderRadius.only(topRight: r, bottomRight: r));
}

/// 背景色和下侧两圆角
/// * [Color] bg 背景色 默认为BgColor.white
/// * [double] radius 宽度 默认为0
BoxDecoration bgAndCircBottom({Color bg, double radius}) {
  var r = Radius.circular(radius ?? 0);
  return new BoxDecoration(
      color: bg ?? BgColor.white,
      borderRadius: new BorderRadius.only(bottomLeft: r, bottomRight: r));
}

/// 背景色和四圆角
/// * [Color] bg 背景色 默认为BgColor.white
/// * [double] radius 宽度 默认为0
BoxDecoration bgAndCirc({Color bg, double radius}) {
  return new BoxDecoration(
      color: bg ?? BgColor.white,
      borderRadius: new BorderRadius.all(Radius.circular(radius ?? 0)));
}

PreferredSize appBarBorder({AppBar child}) {
  return PreferredSize(
    child: Container(decoration: borderBottom(), child: child),
    preferredSize: Size.fromHeight(kToolbarHeight),
  );
}
