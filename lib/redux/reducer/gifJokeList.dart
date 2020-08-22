import 'package:zuicuo/App.dart';
import 'package:redux/redux.dart';
import '../redux.dart';
import '../actions.dart';
import '../model/Joke.dart';

// action
class GifJokeListRequestAction extends Action {
  int limit;
  String gifJokeType;
  Function callback;
  GifJokeListRequestAction(
      {this.limit = 20,
      this.gifJokeType = JokeType.gif,
      this.callback,
      type: ActionType.GIF_JOKE_LIST_REQUEST})
      : super(type: type);
}

// success action
class GifJokeListSuccessAction extends Action {
  List<Joke> payload;

  GifJokeListSuccessAction(
      {type: ActionType.GIF_JOKE_LIST_SUCCESS, this.payload})
      : super(type: type);
}

// failure action
class GifJokeListFailureAction extends Action {
  String error;
  GifJokeListFailureAction({type: ActionType.GIF_JOKE_LIST_FAILURE, this.error})
      : super(type: type);
}

// 请求子reducer
AppState request(AppState state, GifJokeListRequestAction action) {
  if (action.type == ActionType.GIF_JOKE_LIST_REQUEST) {
    var newState = state.clone();
    RecordPaginate<Joke> list = state.gifJokeList ?? null;
    if (list == null) {
      list = new RecordPaginate<Joke>();
    }
    list.fetching = true;
    list.limit = action.limit;
    list.request = action.gifJokeType;
    list.loaded = list.loaded ?? false;
    newState.gifJokeList = list;
    return newState;
  }
  return state;
}

// 成功获取数据 子reducer
AppState success(AppState state, GifJokeListSuccessAction action) {
  if (action.type == ActionType.GIF_JOKE_LIST_SUCCESS) {
    RecordPaginate<Joke> list = state.gifJokeList ?? null;
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
    state.gifJokeList = list;
    return state;
  }
  return state;
}

// 获取数据失败 子reducer
AppState failure(AppState state, GifJokeListFailureAction action) {
  if (action.type == ActionType.GIF_JOKE_LIST_FAILURE) {
    RecordPaginate<Joke> list = state.gifJokeList ?? null;
    if (list == null) {
      list = new RecordPaginate<Joke>();
    }
    list.fetching = false;
    list.error = action.error;
    list.loaded = true;
  }
  return state;
}

Map gifJokeListReducer() {
  return {
    ActionType.GIF_JOKE_LIST_REQUEST: request,
    ActionType.GIF_JOKE_LIST_SUCCESS: success,
    ActionType.GIF_JOKE_LIST_FAILURE: failure,
  };
}

// saga 要先执行next();否则数据更新顺序会乱
gifJokeListSaga(Store<AppState> store, dynamic action, NextDispatcher next) {
  next(action);
  if (action.type == ActionType.GIF_JOKE_LIST_REQUEST) {
    loadData(store, action);
  }
}

loadData(store, GifJokeListRequestAction action) async {
  //请求数据
  try {
    var res = await app.api.get('/getJoke',
        queryParameters: {'count': action.limit, 'type': action.gifJokeType});
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
    dispatch(GifJokeListSuccessAction(payload: list));
  } catch (e) {
    dispatch(GifJokeListFailureAction(error: e.toString()));
  }
  if (action.callback != null) {
    action.callback();
  }
}
