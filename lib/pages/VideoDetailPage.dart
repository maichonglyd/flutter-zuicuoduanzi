import 'package:zuicuo/redux/model/Joke.dart';
import 'package:zuicuo/theme.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class VideoDetailPage extends StatefulWidget {
  final Joke joke;
  VideoDetailPage({Key key, this.joke}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _VideoDetailPage();
  }
}

class _VideoDetailPage extends State<VideoDetailPage> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(
        widget.joke.video ??
            'http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4',
        autoPlay: true);
  }

  @override
  void dispose() {
    player.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgColor.black,
      appBar: AppBar(
        backgroundColor: BgColor.black,
      ),
      body: Container(
          child: FijkView(
        color: BgColor.black,
        fit: FijkFit.contain,
        cover: NetworkImage(widget.joke.thumbnail),
        player: player,
      )),
    );
  }
}
