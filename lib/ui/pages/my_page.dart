import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:makuake_ui_proto/const/makuake_url.dart';
import 'package:makuake_ui_proto/ui/pages/login_page.dart';
import 'package:makuake_ui_proto/ui/state/app_state.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLogin = context.select<AppState, bool>((state) => state.isLogin);
    return Center(
      child: isLogin
          ? const Text('login success')
          : ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Text('login'),
            ),
    );
  }
}
