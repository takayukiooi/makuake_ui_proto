import 'package:flutter/material.dart';
import 'package:infinite_scroll_tab_view/infinite_scroll_tab_view.dart';
import 'package:makuake_ui_proto/ui/home/pickup_view.dart';
import 'package:makuake_ui_proto/ui/home/recent_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> tabViews;

  @override
  void initState() {
    super.initState();
    tabViews = [
      RecentView(
        key: PageStorageKey('RecentView'),
      ),
      PickupView(),
      RankingView(),
      FeatureView(),
      RecommendView(),
      MyTagView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InfiniteScrollTabView(
          contentLength: HomePageTab.values.length,
          onTabTap: (index) {
            debugPrint('tapped $index');
          },
          tabBuilder: (index, isSelected) => Text(
            HomePageTab.values[index].displayText(),
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          separator: const BorderSide(color: Colors.transparent, width: 3.0),
          onPageChanged: (index) => debugPrint('page changed to $index.'),
          indicatorColor: Colors.black,
          pageBuilder: (context, index, _) {
            return tabViews[index];
          },
        ),
      ),
    );
  }
}

enum HomePageTab {
  recent,
  pickup,
  ranking,
  feature,
  recommend,
  myTag,
}

extension HomePageTabValue on HomePageTab {
  String displayText() {
    switch (this) {
      case HomePageTab.recent:
        return '新着';
      case HomePageTab.feature:
        return '特集';
      case HomePageTab.ranking:
        return 'ランキング';
      case HomePageTab.pickup:
        return '注目';
      case HomePageTab.recommend:
        return 'おすすめ';
      case HomePageTab.myTag:
        return 'MYタグ';
    }
  }
}

class FeatureView extends StatelessWidget {
  const FeatureView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RankingView extends StatelessWidget {
  const RankingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RecommendView extends StatelessWidget {
  const RecommendView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyTagView extends StatelessWidget {
  const MyTagView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
