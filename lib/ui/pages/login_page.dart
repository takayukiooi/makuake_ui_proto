import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:makuake_ui_proto/const/makuake_url.dart';
import 'package:makuake_ui_proto/ui/state/app_state.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final os = Platform.isIOS ? 'makuake-ios' : 'makuake-android';
    return Scaffold(
      body: WebView(
        initialUrl: kMakuakeLoginUrl,
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36 $os',
        onWebViewCreated: (webViewController) {
          _controller.complete(webViewController);
        },
        navigationDelegate: (NavigationRequest request) async {
          print('allowing navigation to $request');
          if (await isLoginSucceed()) {
            context.read<AppState>().loginSucceed();
            Navigator.pop(context);
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
