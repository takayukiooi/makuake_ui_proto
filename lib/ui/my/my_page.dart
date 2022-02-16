import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makuake_ui_proto/const/makuake_url.dart';
import 'package:makuake_ui_proto/const/user_agent.dart';
import 'package:makuake_ui_proto/ui/pages/login_page.dart';
import 'package:makuake_ui_proto/ui/state/app_state_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyPage extends ConsumerStatefulWidget {
  const MyPage({
    Key? key,
  }) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage> {
  final _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final isLogin = ref.watch(loginStateProvider);
    return Center(
      child: isLogin
          ? WebView(
              initialUrl: kMakuakeMyPageUrl,
              javascriptMode: JavascriptMode.unrestricted,
              userAgent: makuakeUserAgent,
              onWebViewCreated: (webViewController) {
                _controller.complete(webViewController);
              },
              navigationDelegate: (NavigationRequest request) async {
                if (request.url == kMakuakeLoginUrl) {
                  ref.read(appStateController.notifier).logout();
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            )
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
