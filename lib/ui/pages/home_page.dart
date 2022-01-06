import 'package:flutter/material.dart';
import 'package:makuake_ui_proto/ui/home/pickup_view.dart';
import 'package:makuake_ui_proto/ui/home/recent_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: HomePageTab.values.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                pinned: true,
                title: TabBar(
                  isScrollable: true,
                  tabs: HomePageTab.values.map((item) => Tab(text: item.displayText())).toList(),
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              RecentView(
                key: PageStorageKey('RecentView'),
              ),
              PickupView(),
              RankingView(),
              FeatureView(),
              RecommendView(),
              MyTagView(),
            ],
          ),
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
