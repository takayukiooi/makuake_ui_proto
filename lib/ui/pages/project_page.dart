import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makuake_ui_proto/const/makuake_url.dart';
import 'package:makuake_ui_proto/const/user_agent.dart';
import 'package:makuake_ui_proto/ui/pages/login_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProjectPage extends ConsumerStatefulWidget {
  const ProjectPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  static Route<ProjectPage> route({
    required String url,
  }) {
    return MaterialPageRoute(builder: (context) => ProjectPage(url: url));
  }

  final String url;

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends ConsumerState<ProjectPage> {
  final _controller = Completer<WebViewController>();
  String get projectUrl => widget.url;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: projectUrl,
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
    );
  }
}
