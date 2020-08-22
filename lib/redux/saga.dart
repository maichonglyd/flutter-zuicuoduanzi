import 'package:zuicuo/redux/reducer/allJokeList.dart';
import 'package:zuicuo/redux/reducer/gifJokeList.dart';
import 'package:zuicuo/redux/reducer/imageJokeList.dart';
import 'package:zuicuo/redux/reducer/textJokeList.dart';
import 'package:zuicuo/redux/reducer/videoJokeList.dart';

import 'reducer/startup.dart';

// 所有saga在此集合
dynamic sagas() {
  return [
    log,
    startupSaga,
    allJokeListSaga,
    imageJokeListSaga,
    videoJokeListSaga,
    gifJokeListSaga,
    textJokeListSaga
  ];
}

log(store, action, next) {
  print('                                     store -> action: ${action.type}');
  next(action);
}
