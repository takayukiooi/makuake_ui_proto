import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makuake_ui_proto/const/makuake_url.dart';
import 'package:makuake_ui_proto/const/user_agent.dart';
import 'package:makuake_ui_proto/ui/pages/login_page.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
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
      body: WebView(
        initialUrl: kMakuakeFavoriteProjectUrl,
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: makuakeUserAgent,
        onWebViewCreated: (webViewController) {
          _controller.complete(webViewController);
        },
        navigationDelegate: (NavigationRequest request) async {
          if (request.url == kMakuakeLoginUrl) {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
                fullscreenDialog: true,
              ),
            );
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
