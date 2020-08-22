import 'package:zuicuo/App.dart';
import 'package:redux/redux.dart';
import '../redux.dart';
import '../actions.dart';
import '../model/Joke.dart';

// action
class VideoJokeListRequestAction extends Action {
  int limit;
  String videoJokeType;
  Function callback;
  VideoJokeListRequestAction(
      {this.limit = 20,
      this.videoJokeType = JokeType.video,
      this.callback,
      type: ActionType.VIDEO_JOKE_LIST_REQUEST})
      : super(type: type);
}

// success action
class VideoJokeListSuccessAction extends Action {
  List<Joke> payload;

  VideoJokeListSuccessAction(
      {type: ActionType.VIDEO_JOKE_LIST_SUCCESS, this.payload})
      : super(type: type);
}

// failure action
class VideoJokeListFailureAction extends Action {
  String error;
  VideoJokeListFailureAction(
      {type: ActionType.VIDEO_JOKE_LIST_FAILURE, this.error})
      : super(type: type);
}

// 请求子reducer
AppState request(AppState state, VideoJokeListRequestAction action) {
  if (action.type == ActionType.VIDEO_JOKE_LIST_REQUEST) {
    var newState = state.clone();
    RecordPaginate<Joke> list = state.videoJokeList ?? null;
    if (list == null) {
      list = new RecordPaginate<Joke>();
    }
    list.fetching = true;
    list.limit = action.limit;
    list.request = action.videoJokeType;
    list.loaded = list.loaded ?? false;
    newState.videoJokeList = list;
    return newState;
  }
  return state;
}

// 成功获取数据 子reducer
AppState success(AppState state, VideoJokeListSuccessAction action) {
  if (action.type == ActionType.VIDEO_JOKE_LIST_SUCCESS) {
    RecordPaginate<Joke> list = state.videoJokeList ?? null;
    if (list == null) {
      list = new RecordPaginate<Joke>();
    }
    list.fetching = false;
    list.loaded = true;
    list.error = null;
    if (list.results == null || list.results.length <= 0) {
      list.results = action.payload;
    } else {
      List<Joke> t = list.results.toList();
      t.addAll(action.payload);
      list.results = t;
    }
    state.videoJokeList = list;
    return state;
  }
  return state;
}

// 获取数据失败 子reducer
AppState failure(AppState state, VideoJokeListFailureAction action) {
  if (action.type == ActionType.VIDEO_JOKE_LIST_FAILURE) {
    RecordPaginate<Joke> list = state.videoJokeList ?? null;
    if (list == null) {
      list = new RecordPaginate<Joke>();
    }
    list.fetching = false;
    list.error = action.error;
    list.loaded = true;
  }
  return state;
}

Map videoJokeListReducer() {
  return {
    ActionType.VIDEO_JOKE_LIST_REQUEST: request,
    ActionType.VIDEO_JOKE_LIST_SUCCESS: success,
    ActionType.VIDEO_JOKE_LIST_FAILURE: failure,
  };
}

// saga 要先执行next();否则数据更新顺序会乱
videoJokeListSaga(Store<AppState> store, dynamic action, NextDispatcher next) {
  next(action);
  if (action.type == ActionType.VIDEO_JOKE_LIST_REQUEST) {
    loadData(store, action);
  }
}

loadData(store, VideoJokeListRequestAction action) async {
  //请求数据
  try {
    var res = await app.api.get('/getJoke',
        queryParameters: {'count': action.limit, 'type': action.videoJokeType});
    var data = res.data;
    List results = data['result'];
    List<Joke> list = [];
    if (results != null) {
      results.forEach((item) {
        Joke j = Joke.parse(item);
        if (j != null) {
          list.add(j);
        }
      });
    }
    dispatch(VideoJokeListSuccessAction(payload: list));
  } catch (e) {
    dispatch(VideoJokeListFailureAction(error: e.toString()));
  }
  if (action.callback != null) {
    action.callback();
  }
}
