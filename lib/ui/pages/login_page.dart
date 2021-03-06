import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makuake_ui_proto/const/makuake_url.dart';
import 'package:makuake_ui_proto/const/user_agent.dart';
import 'package:makuake_ui_proto/ui/state/app_state_controller.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _controller = Completer<WebViewController>();
  final cookieManager = WebviewCookieManager();

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: kMakuakeLoginUrl,
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: makuakeUserAgent,
        onWebViewCreated: (webViewController) {
          _controller.complete(webViewController);
        },
        navigationDelegate: (NavigationRequest request) async {
          if (await isLoginSucceed()) {
            ref.read(appStateController.notifier).loginSucceed();
            Navigator.of(context).maybePop();
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  Future<bool> isLoginSucceed() async {
    final cookies = await cookieManager.getCookies(kMakuakeWebUrl);
    for (var item in cookies) {
      print(item);
    }
    final isLoginCookie = cookies.lastWhere((element) => element.name == 'is_logined', orElse: () => Cookie('is_logined', 'false'));
    return isLoginCookie.value == 'true';
  }
}
