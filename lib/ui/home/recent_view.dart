import 'package:flutter/material.dart';
import 'package:makuake_ui_proto/data/recent_projects.dart';
import 'package:makuake_ui_proto/model/response/projects_response.dart';
import 'package:makuake_ui_proto/ui/components/project_card.dart';

class RecentView extends StatelessWidget {
  const RecentView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentProject = ProjectsResponse.fromJson(kRecentApiResponse).projects.getRange(0, 10).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _TodayRecommend(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 16.0),
              child: Text(
                '今日始まったプロジェクト',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProjectCard(project: recentProject[index]);
              },
              childCount: recentProject.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              childAspectRatio: 0.8,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 16.0),
              child: Text(
                '昨日',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProjectCard(project: recentProject[index]);
              },
              childCount: recentProject.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              childAspectRatio: 0.8,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              child: Text(
                '一週間以上前',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProjectCard(project: recentProject[index]);
              },
              childCount: recentProject.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              childAspectRatio: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

class _TodayRecommend extends StatefulWidget {
  const _TodayRecommend({
    Key? key,
  }) : super(key: key);

  @override
  __TodayRecommendState createState() => __TodayRecommendState();
}

class __TodayRecommendState extends State<_TodayRecommend> {
  final pageController = PageController(viewportFraction: 0.8);
  final List<int> projects = List.generate(5, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
          child: Text(
            "本日のあなたへのおすすめ",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 320,
          child: PageView(
            controller: pageController,
            // physics: CustomScrollPhysics(itemDimension: 3000),
            children: projects
                .map(
                  (project) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _TodayRecommendCard(),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _TodayRecommendCard extends StatelessWidget {
  const _TodayRecommendCard({
    Key? key,
    this.imageUrl = "https://hayabusa.io/makuake/upload/project/21703/main_21703.png?format=png\u0026ttl=31536000\u0026version=1640855728\u0026force",
    this.projectUrl = "https://www.makuake.com/project/moft_mat/",
    this.title = "デスクワークに最高の快適さを目指して。「MOFT Smart Desk Mat」",
    this.userImageUrl =
        "https://hayabusa.io/makuake/upload/user/regist2019/03/07/548979/main_548979.fit-scale.png?width=200&height=200&quality=95&version=1583132941&pq=false&format=png&ttl=31536000&force",
    this.userName = "MOFT（モフト）",
    this.timeLeftText = "30日",
    this.collectedSuppoter = 2510,
    this.favoriteCount = 1024,
    this.commentCount = 2048,
  }) : super(key: key);

  final String imageUrl;
  final String projectUrl;
  final String title;
  final String userImageUrl;
  final String userName;
  final String timeLeftText;
  final int collectedSuppoter;
  final int favoriteCount;
  final int commentCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          children: [
            Image.network(
              imageUrl,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE7E7E7)),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        userImageUrl,
                        width: 32.0,
                        height: 32.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    userName,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF0F2),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14.0,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          '$timeLeftText',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            height: 12,
                            child: VerticalDivider(
                              width: 2.0,
                              color: Color(0xFFADAEAF),
                            ),
                          ),
                        ),
                        Icon(Icons.person_outline_rounded, size: 14.0),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          '$collectedSuppoter人',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Icon(Icons.favorite),
                      Text(
                        '$favoriteCount',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  Column(
                    children: [
                      Icon(Icons.comment),
                      Text(
                        '$commentCount',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
