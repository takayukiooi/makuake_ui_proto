import 'package:flutter/widgets.dart';

class AppState extends ChangeNotifier {
  late bool isLogin;

  AppState({
    this.isLogin = false,
  });

  void loginSucceed() {
    isLogin = true;
    notifyListeners();
  }
}
