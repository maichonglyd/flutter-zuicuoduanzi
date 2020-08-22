import 'package:zuicuo/components/BaseItem.dart';
import 'package:zuicuo/components/baseWidget.dart';
import 'package:zuicuo/redux/model/Joke.dart';
import 'package:zuicuo/theme.dart';
import 'package:flutter/material.dart';

class VideoJoke extends StatelessWidget {
  final Joke joke;
  VideoJoke({Key key, @required this.joke}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseItem(
      joke: this.joke,
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              joke.text,
              style: TextStyle(
                color: FontColor.dark,
                fontSize: FontSize.md,
              ),
            ),
            paddingBottom(SpaceSize.lg),
            Container(
              width: rpx(690),
              child: Stack(
                children: <Widget>[
                  Image(
                    loadingBuilder: (ctx, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Container(
                          height: rpx(300),
                          child: Center(
                              child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          )));
                    },
                    image: NetworkImage(joke.thumbnail),
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Container(
                      color: BgColor.black.withAlpha(100),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Center(
                      child: image('images/icon_play.png', rpx(120), rpx(120),
                          BgColor.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
