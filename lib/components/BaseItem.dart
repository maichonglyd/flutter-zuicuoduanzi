import 'package:zuicuo/components/baseWidget.dart';
import 'package:zuicuo/redux/model/Joke.dart';
import 'package:zuicuo/theme.dart';
import 'package:flutter/material.dart';

class BaseItem extends StatelessWidget {
  final Joke joke;
  final Widget child;
  BaseItem({Key key, @required this.joke, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool hasComment = joke.topCommentsContent != null;
    return Container(
      color: BgColor.white,
      padding: space(SpaceSize.lg),
      margin: spaceBottom(SpaceSize.md),
      child: Column(
        children: <Widget>[
          Container(
            margin: spaceBottom(SpaceSize.md),
            decoration: borderBottom(),
            padding: spaceBottom(SpaceSize.md),
            height: rpx(100),
            child: Row(
              children: <Widget>[
                imageCirc(joke.header, rpx(80), rpx(80), rpx(40)),
                paddingLeft(SpaceSize.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      text(joke.name),
                      text(joke.passtime,
                          size: FontSize.sm, color: FontColor.light)
                    ],
                  ),
                )
              ],
            ),
          ),
          child,
          hasComment
              ? Container(
                  padding: spaceTop(SpaceSize.md),
                  margin: spaceTop(SpaceSize.md),
                  decoration: borderTop(),
                  child: Row(
                    children: <Widget>[
                      imageCirc(
                          joke.topCommentsHeader, rpx(50), rpx(50), rpx(25)),
                      paddingLeft(SpaceSize.md),
                      Expanded(
                        child: text(joke.topCommentsName),
                      ),
                    ],
                  ))
              : Container(),
          hasComment
              ? Container(
                  alignment: Alignment.topLeft,
                  padding: spaceLeft(rpx(70)),
                  margin: spaceTop(SpaceSize.sm),
                  child: Text(
                    joke.topCommentsContent,
                    style: TextStyle(
                      color: FontColor.dark,
                      fontSize: FontSize.md,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
