import 'dart:async';

import 'package:zuicuo/components/EmptyPage.dart';
import 'package:zuicuo/components/ImageJoke.dart';
import 'package:zuicuo/components/LoadingPage.dart';
import 'package:zuicuo/components/ErrorPage.dart';
import 'package:zuicuo/components/PullDownRefresh.dart';
import 'package:zuicuo/components/baseWidget.dart';
import 'package:zuicuo/redux/actions.dart';
import 'package:zuicuo/redux/model/Joke.dart';
import 'package:zuicuo/redux/reducer/imageJokeList.dart';
import 'package:zuicuo/redux/redux.dart';
import 'package:zuicuo/redux/redux_mixin.dart';
import 'package:zuicuo/theme.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePage();
  }
}

class _ImagePage extends State<ImagePage> with ReduxMixin {
  RecordPaginate<Joke> jokeList;

  @override
  void connect(AppState state) {
    var list = state.imageJokeList;
    if (list == null || (!list.fetching && !list.loaded)) {
      dispatch(ImageJokeListRequestAction());
    }
    if (list?.request == JokeType.image) {
      setState(() {
        jokeList = list;
      });
    }
  }

  Future<void> _refresh() async {
    Completer c = Completer();
    dispatch(ImageJokeListRequestAction(callback: () {
      c.complete();
    }));
    return c;
  }

  Future<void> _loadMore() async {
    Completer c = Completer();
    if (this.jokeList != null && !jokeList.fetching && jokeList.loaded) {
      dispatch(ImageJokeListRequestAction(callback: () {
        c.complete();
      }));
    }
    return c;
  }

  Widget _buildBody() {
    if (jokeList == null ||
        (jokeList != null && jokeList.fetching && !jokeList.loaded)) {
      return LoadingPage();
    } else if (jokeList != null && jokeList.error != null) {
      return ErrorPage(
        word: jokeList.error,
      );
    }
    List<Joke> list = jokeList.results ?? [];
    if (list.length <= 0) {
      return EmptyPage();
    }
    return Column(
      children: list.map((Joke item) => ImageJoke(joke: item)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgColor.light,
      appBar: AppBar(
        elevation: 0,
        title: text('图文', color: FontColor.white, size: FontSize.lg),
        centerTitle: true,
      ),
      body: PullDownRefresh(
        child: _buildBody(),
        refresh: this._refresh,
        loadMore: this._loadMore,
      ),
    );
  }
}
