// Action的类型，需要新类型时在此处添加
enum ActionType {
  STARTUP,
  TEST_STARTUP,

  ALL_JOKE_LIST_REQUEST,
  ALL_JOKE_LIST_SUCCESS,
  ALL_JOKE_LIST_FAILURE,

  IMAGE_JOKE_LIST_REQUEST,
  IMAGE_JOKE_LIST_SUCCESS,
  IMAGE_JOKE_LIST_FAILURE,

  VIDEO_JOKE_LIST_REQUEST,
  VIDEO_JOKE_LIST_SUCCESS,
  VIDEO_JOKE_LIST_FAILURE,

  GIF_JOKE_LIST_REQUEST,
  GIF_JOKE_LIST_SUCCESS,
  GIF_JOKE_LIST_FAILURE,

  TEXT_JOKE_LIST_REQUEST,
  TEXT_JOKE_LIST_SUCCESS,
  TEXT_JOKE_LIST_FAILURE,
}

// 所有Action的基类
class Action {
  ActionType type;
  Action({this.type});
}

// 所有不分页列表数据的基础类型，
class RecordList<T> {
  bool fetching;
  bool loaded;
  String error;
  List<T> results;
  RecordList({this.fetching, this.loaded, this.results, this.error});
}

// 详情基础数据类型
class Record<T> {
  bool fetching;
  bool loaded;
  String error;
  String request;
  T info;
  Record({this.fetching, this.loaded, this.info, this.error});
}

// 所有分页列表数据的基础类型
class RecordPaginate<T> {
  bool fetching;
  bool loaded;
  String error;
  int limit;
  String request;
  List<T> results;
  RecordPaginate({
    this.limit,
    this.fetching,
    this.loaded,
    this.error,
    this.request,
    this.results,
  });
}

class JokeType {
  static const String all = 'all';
  static const String video = 'video';
  static const String image = 'image';
  static const String gif = 'gif';
  static const String text = 'text';
}
