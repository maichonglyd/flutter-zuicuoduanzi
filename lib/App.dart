import 'package:zuicuo/redux/actions.dart';
import 'package:zuicuo/redux/reducer/startup.dart';
import 'package:zuicuo/redux/redux.dart';
import 'package:zuicuo/redux/saga.dart';
import 'package:dio/dio.dart';
import 'package:redux/redux.dart';

import 'utils/events.dart';

class App {
  final MyEvents events = MyEvents.getInstanse();
  final Dio api = Dio(BaseOptions(baseUrl: 'https://api.apiopen.top'));
  Store<AppState> store;

  init() {
    this.store = new Store<AppState>(
      mainReducer,
      initialState: initialState(),
      middleware: sagas(),
    );

    store.dispatch(StartupAction(type: ActionType.STARTUP, value: 'start'));
  }
}

final App app = new App();
