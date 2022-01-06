import 'package:flutter/material.dart';

class SimpleTabNavigator extends StatelessWidget {
  const SimpleTabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.defaultPage,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget defaultPage;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (context) => defaultPage,
        );
      },
    );
  }
}
