import 'package:zuicuo/App.dart';
import 'package:zuicuo/redux/actions.dart';
import 'package:zuicuo/redux/model/Joke.dart';
import 'package:zuicuo/redux/reducer/allJokeList.dart';
import 'package:zuicuo/redux/reducer/gifJokeList.dart';
import 'package:zuicuo/redux/reducer/imageJokeList.dart';
import 'package:zuicuo/redux/reducer/textJokeList.dart';
import 'package:zuicuo/redux/reducer/videoJokeList.dart';

import './reducer/startup.dart';

dispatch<T extends Action>(T action) {
  app.store.dispatch(action);
}

// Store的数据类型，所有在Store的顶层显示的数据在此处定义
class AppState {
  String startup;
  RecordPaginate<Joke> allJokeList;
  RecordPaginate<Joke> videoJokeList;
  RecordPaginate<Joke> imageJokeList;
  RecordPaginate<Joke> gifJokeList;
  RecordPaginate<Joke> textJokeList;
  AppState({
    this.startup,
    this.allJokeList,
    this.gifJokeList,
    this.imageJokeList,
    this.textJokeList,
    this.videoJokeList,
  });

  clone() {
    var newState = new AppState(
      startup: this.startup,
      allJokeList: this.allJokeList,
      gifJokeList: this.gifJokeList,
      imageJokeList: this.imageJokeList,
      textJokeList: this.textJokeList,
      videoJokeList: this.videoJokeList,
    );
    return newState;
  }
}

// 总 reducer,根据类型不同，和type不同，分化到不同文件中处理子reducer,
AppState mainReducer(AppState state, dynamic action) {
  Map<dynamic, dynamic> subReducer = {};
  subReducer.addAll(startUpReducer());
  subReducer.addAll(allJokeListReducer());
  subReducer.addAll(imageJokeListReducer());
  subReducer.addAll(videoJokeListReducer());
  subReducer.addAll(gifJokeListReducer());
  subReducer.addAll(textJokeListReducer());

  Function fn = subReducer[action.type];
  if (fn != null) {
    return fn(state, action);
  }
  return state;
}

AppState initialState() {
  return new AppState(startup: 'noRequest');
}
