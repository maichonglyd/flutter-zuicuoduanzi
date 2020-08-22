import 'dart:async';

import 'package:zuicuo/components/EmptyPage.dart';
import 'package:zuicuo/components/ImageJoke.dart';
import 'package:zuicuo/components/LoadingPage.dart';
import 'package:zuicuo/components/ErrorPage.dart';
import 'package:zuicuo/components/PullDownRefresh.dart';
import 'package:zuicuo/components/TextJoke.dart';
import 'package:zuicuo/components/VideoJoke.dart';
import 'package:zuicuo/components/baseWidget.dart';
import 'package:zuicuo/redux/actions.dart';
import 'package:zuicuo/redux/model/Joke.dart';
import 'package:zuicuo/redux/reducer/allJokeList.dart';
import 'package:zuicuo/redux/redux.dart';
import 'package:zuicuo/redux/redux_mixin.dart';
import 'package:zuicuo/theme.dart';
import 'package:flutter/material.dart';

class AllPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllPage();
  }
}

class _AllPage extends State<AllPage> with ReduxMixin {
  RecordPaginate<Joke> jokeList;

  @override
  void connect(AppState state) {
    var list = state.allJokeList;
    if (list == null || (!list.fetching && !list.loaded)) {
      dispatch(AllJokeListRequestAction());
    }
    if (list?.request == JokeType.all) {
      setState(() {
        jokeList = list;
      });
    }
  }

  Future<void> _refresh() async {
    Completer c = Completer();
    dispatch(
      AllJokeListRequestAction(
        refresh: true,
        callback: () {
          c.complete();
        },
      ),
    );
    return c;
  }

  Future<void> _loadMore() async {
    Completer c = Completer();
    if (this.jokeList != null && !jokeList.fetching && jokeList.loaded) {
      dispatch(AllJokeListRequestAction(callback: () {
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
      children: list.map((Joke item) {
        if (item.type == JokeType.image || item.type == JokeType.gif) {
          return ImageJoke(joke: item);
        } else if (item.type == JokeType.video) {
          return VideoJoke(joke: item);
        }
        return TextJoke(joke: item);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgColor.light,
      appBar: AppBar(
        elevation: 0,
        title: text('全部', color: FontColor.white, size: FontSize.lg),
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
