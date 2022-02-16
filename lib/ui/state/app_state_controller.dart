import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makuake_ui_proto/ui/state/app_state.dart';

final loginStateProvider = Provider((ref) => ref.watch(appStateController).login);

final appStateController = StateNotifierProvider<AppStateController, AppState>((ref) => AppStateController(ref.read));

class AppStateController extends StateNotifier<AppState> {
  AppStateController(this._read) : super(AppState());

  final Reader _read;

  void loginSucceed() {
    state = state.copyWith(login: true);
  }

  void logout() {
    state = state.copyWith(login: false);
  }
}
