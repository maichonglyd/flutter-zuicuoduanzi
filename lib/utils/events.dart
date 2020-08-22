class MyEvents {
  MyEvents._();
  static MyEvents _app;
  static MyEvents getInstanse() {
    if (_app == null) {
      _app = MyEvents._();
    }
    return _app;
  }

  Map<String, List<Function>> _event = {};

  addListener(String eventName, Function func) {
    if (_event[eventName] == null) {
      _event[eventName] = [];
    }
    List<Function> list = _event[eventName];
    bool has = false;
    list.forEach((Function item) {
      if (item == func) {
        has = true;
      }
    });
    if (!has) {
      _event[eventName].add(func);
    }
  }

  removeListener(String eventName, Function func) {
    if (_event.containsKey(eventName)) {
      List<Function> list = _event[eventName] ?? [];
      if (list.contains(func)) {
        list.remove(func);
      }
    }
  }

  send<T>(String eventName, T data) {
    List<Function> list = _event[eventName] ?? [];
    print('$eventName,${list.length}');
    list.forEach((func) {
      if (func != null) {
        try {
          func(data);
        } catch (e) {}
      }
    });
  }
}
