import 'package:redux/redux.dart';
import '../redux.dart';
import '../actions.dart';

class StartupAction extends Action {
  String value;
  StartupAction({ActionType type = ActionType.STARTUP, this.value})
      : super(type: type);

  @override
  String toString() {
    return 'type:${ActionType.TEST_STARTUP},value:$value';
  }
}

AppState startup(AppState state, StartupAction action) {
  state.startup = action.value;
  return state;
}

AppState updateStartUp(AppState state, StartupAction action) {
  state.startup = action.value;
  print('---action=$action');
  return state;
}

Map startUpReducer() {
  return {
    ActionType.STARTUP: startup,
    ActionType.TEST_STARTUP: updateStartUp,
  };
}

// saga 要先执行next();否则数据更新顺序会乱
startupSaga(Store<AppState> store, dynamic action, NextDispatcher next) {
  next(action);
}
