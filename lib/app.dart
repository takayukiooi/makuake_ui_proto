import 'package:flutter/material.dart';
import 'package:makuake_ui_proto/ui/state/app_state.dart';
import 'package:provider/provider.dart';

import 'ui/tab_root.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState(isLogin: false)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TabRoot(),
      ),
    );
  }
}
