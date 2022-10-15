import 'package:flutter/foundation.dart';
import 'package:smart_shop/services/Sessions.dart';

class Data extends ChangeNotifier {
  List<Session> _session = [];

  void addSession(username, password, accessKey, refreshkey) {
    _session.add(Session(
        username: username,
        password: password,
        accessKey: accessKey,
        refreshkey: refreshkey));
    notifyListeners();
  }

  dynamic deleteSession(int index) {
    _session.removeAt(index);
    notifyListeners();
  }
}
