import 'package:flutter/material.dart';
import 'package:makuake_ui_proto/ui/pages/discover_page.dart';
import 'package:makuake_ui_proto/ui/pages/favorite_page.dart';
import 'package:makuake_ui_proto/ui/pages/home_page.dart';
import 'package:makuake_ui_proto/ui/pages/my_page.dart';
import 'package:makuake_ui_proto/ui/pages/notification_page.dart';
import 'package:makuake_ui_proto/ui/simple_tab_navigator.dart';

class _TabModel {
  final GlobalKey key;
  final int index;
  final IconData icon;
  final String title;
  final Widget navigator;

  _TabModel(
    this.key,
    this.index,
    this.icon,
    this.title,
    this.navigator,
  );
}

class TabRoot extends StatefulWidget {
  const TabRoot({
    Key? key,
  }) : super(key: key);

  @override
  State<TabRoot> createState() => _TabRootState();
}

class _TabRootState extends State<TabRoot> {
  int _currentIndex = 0;
  List<_TabModel> _models = [];

  final _homeKey = GlobalKey<NavigatorState>();
  final _discoverKey = GlobalKey<NavigatorState>();
  final _favoriteKey = GlobalKey<NavigatorState>();
  final _notificationKey = GlobalKey<NavigatorState>();
  final _myPageKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _models = [
      _TabModel(
        _homeKey,
        0,
        Icons.home,
        'ホーム',
        SimpleTabNavigator(
          navigatorKey: _homeKey,
          defaultPage: const HomePage(),
        ),
      ),
      _TabModel(
        _discoverKey,
        1,
        Icons.search_outlined,
        'さがす',
        SimpleTabNavigator(
          navigatorKey: _discoverKey,
          defaultPage: const DiscoverPage(),
        ),
      ),
      _TabModel(
        _favoriteKey,
        2,
        Icons.favorite_border,
        '気になる',
        SimpleTabNavigator(
          navigatorKey: _favoriteKey,
          defaultPage: const FavoritePage(),
        ),
      ),
      _TabModel(
        _notificationKey,
        3,
        Icons.notifications_none_outlined,
        'お知らせ',
        SimpleTabNavigator(
          navigatorKey: _notificationKey,
          defaultPage: const NotificationPage(),
        ),
      ),
      _TabModel(
        _myPageKey,
        4,
        Icons.person_add_alt_outlined,
        'MYページ',
        SimpleTabNavigator(
          navigatorKey: _myPageKey,
          defaultPage: const MyPage(),
        ),
      ),
    ];
  }

  Future<bool> _onWillPop() async {
    final key = _models[_currentIndex].navigator.key as GlobalKey<NavigatorState>;
    final isFirstRouteInCurrentTab = await key.currentState?.maybePop() ?? false;
    if (isFirstRouteInCurrentTab) {
      if (_currentIndex != 0) {
        _currentIndex = 0;
        return false;
      }
    }

    return isFirstRouteInCurrentTab;
  }

  void _onPressNavigationButton(int index) {
    if (_currentIndex == index) {
      final key = _models[index].key as GlobalKey<NavigatorState>;
      key.currentState?.popUntil((route) => route.isFirst);
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: _models.map((model) {
            return Offstage(
              offstage: _currentIndex != model.index,
              child: model.navigator,
            );
          }).toList(),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: _models.map((model) {
                return Expanded(
                  child: _NavigationButton(
                    icon: model.icon,
                    title: model.title,
                    selected: _currentIndex == model.index,
                    onPressed: () => _onPressNavigationButton(model.index),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  const _NavigationButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: selected ? Colors.black : Colors.grey,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.button!.copyWith(
                  fontSize: 12.0,
                  color: selected ? Colors.black : Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
