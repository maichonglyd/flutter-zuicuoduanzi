import 'package:zuicuo/components/BaseItem.dart';
import 'package:zuicuo/components/baseWidget.dart';
import 'package:zuicuo/redux/model/Joke.dart';
import 'package:zuicuo/theme.dart';
import 'package:flutter/material.dart';

class ImageJoke extends StatelessWidget {
  final Joke joke;
  ImageJoke({Key key, @required this.joke}) : super(key: key);
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
              child: Image(
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
                image: NetworkImage(joke.images),
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }
}
