import 'package:zuicuo/components/BaseItem.dart';
import 'package:zuicuo/redux/model/Joke.dart';
import 'package:zuicuo/theme.dart';
import 'package:flutter/material.dart';

class TextJoke extends StatelessWidget {
  final Joke joke;
  TextJoke({Key key, @required this.joke}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseItem(
      joke: this.joke,
      child: Container(
        alignment: Alignment.topLeft,
        child: Text(
          joke.text,
          style: TextStyle(
            color: FontColor.dark,
            fontSize: FontSize.md,
          ),
        ),
      ),
    );
  }
}
