import 'package:zuicuo/App.dart';
import 'package:redux/redux.dart';
import '../redux.dart';
import '../actions.dart';
import '../model/Joke.dart';

// action
class AllJokeListRequestAction extends Action {
  final int limit;
  final String allJokeType;
  final Function callback;
  final bool refresh;
  AllJokeListRequestAction(
      {this.limit = 20,
      this.refresh = false,
      this.allJokeType = JokeType.all,
      this.callback,
      type: ActionType.ALL_JOKE_LIST_REQUEST})
      : super(type: type);
}

// success action
class AllJokeListSuccessAction extends Action {
  List<Joke> payload;
  bool refresh;

  AllJokeListSuccessAction(
      {type: ActionType.ALL_JOKE_LIST_SUCCESS, this.refresh, this.payload})
      : super(type: type);
}

// failure action
class AllJokeListFailureAction extends Action {
  String error;
  AllJokeListFailureAction({type: ActionType.ALL_JOKE_LIST_FAILURE, this.error})
      : super(type: type);
}

// 请求子reducer
AppState request(AppState state, AllJokeListRequestAction action) {
  if (action.type == ActionType.ALL_JOKE_LIST_REQUEST) {
    var newState = state.clone();
    RecordPaginate<Joke> list = state.allJokeList ?? null;
    if (list == null) {
      list = new RecordPaginate<Joke>();
    }
    list.fetching = true;
    list.limit = action.limit;
    list.request = action.allJokeType;
    list.loaded = list.loaded ?? false;
    newState.allJokeList = list;
    return newState;
  }
  return state;
}

// 成功获取数据 子reducer
AppState success(AppState state, AllJokeListSuccessAction action) {
  if (action.type == ActionType.ALL_JOKE_LIST_SUCCESS) {
    RecordPaginate<Joke> list = state.allJokeList ?? null;
    if (list == null) {
      list = new RecordPaginate<Joke>();
    }
    list.fetching = false;
    list.loaded = true;
    list.error = null;
    if (list.results == null || list.results.length <= 0 || action.refresh) {
      print('---11111');
      list.results = action.payload;
    } else {
      print('2222222');
      List<Joke> t = list.results.toList();
      t.addAll(action.payload);
      list.results = t;
    }
    state.allJokeList = list;
    return state;
  }
  return state;
}

// 获取数据失败 子reducer
AppState failure(AppState state, AllJokeListFailureAction action) {
  if (action.type == ActionType.ALL_JOKE_LIST_FAILURE) {
    RecordPaginate<Joke> list = state.allJokeList ?? null;
    if (list == null) {
      list = new RecordPaginate<Joke>();
    }
    list.fetching = false;
    list.error = action.error;
    list.loaded = true;
  }
  return state;
}

Map allJokeListReducer() {
  return {
    ActionType.ALL_JOKE_LIST_REQUEST: request,
    ActionType.ALL_JOKE_LIST_SUCCESS: success,
    ActionType.ALL_JOKE_LIST_FAILURE: failure,
  };
}

// saga 要先执行next();否则数据更新顺序会乱
allJokeListSaga(Store<AppState> store, dynamic action, NextDispatcher next) {
  next(action);
  if (action.type == ActionType.ALL_JOKE_LIST_REQUEST) {
    print('----saga  action.refresh ${action.refresh}');
    loadData(store, action);
  }
}

loadData(store, AllJokeListRequestAction action) async {
  //请求数据
  try {
    var res = await app.api.get('/getJoke',
        queryParameters: {'count': action.limit, 'type': action.allJokeType});
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
    print('----action.refresh,${action.refresh ?? false}');
    dispatch(AllJokeListSuccessAction(
        payload: list, refresh: action.refresh ?? false));
  } catch (e) {
    dispatch(AllJokeListFailureAction(error: e.toString()));
  }
  if (action.callback != null) {
    action.callback();
  }
}
