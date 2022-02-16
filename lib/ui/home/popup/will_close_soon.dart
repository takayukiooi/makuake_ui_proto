import 'package:flutter/material.dart';

class WillCloseSoon extends StatefulWidget {
  const WillCloseSoon({
    Key? key,
  }) : super(key: key);

  @override
  State<WillCloseSoon> createState() => _WillCloseSoonState();
}

class _WillCloseSoonState extends State<WillCloseSoon> with SingleTickerProviderStateMixin {
  List<Color> colorList = [
    Color(0xFFFB2A79),
    Color(0xFFFFE600),
    Color(0xFFBBF117),
    Color(0xFF1AD4FF),
  ];
  int index = 0;
  Color bottomColor = Color(0xFFFB2A79);
  Color topColor = Color(0xFF1AD4FF);
  Alignment begin = Alignment.bottomRight;
  Alignment end = Alignment.topLeft;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        bottomColor = Color(0xFFFFE600);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      onEnd: () {
        setState(() {
          index = index + 1;
          // animate the color
          bottomColor = colorList[index % colorList.length];
          topColor = colorList[(index + 1) % colorList.length];
        });
      },
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [
            bottomColor,
            topColor,
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 32.0,
          ),
          Icon(
            Icons.access_time,
            color: Colors.white,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "応援購入は本日まで！",
            style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 32.0,
          ),
          Text(
            "あなたが\"気になる\"したプロジェクトが\n24時間以内に終了します",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 32.0,
          ),
          _WillCloseSoonList(),
          SizedBox(
            height: 32.0,
          ),
        ],
      ),
    );
  }
}

class _WillCloseSoonList extends StatefulWidget {
  const _WillCloseSoonList({
    Key? key,
  }) : super(key: key);

  @override
  _WillCloseSoonListState createState() => _WillCloseSoonListState();
}

class _WillCloseSoonListState extends State<_WillCloseSoonList> {
  final pageController = PageController(viewportFraction: 0.8);
  final List<int> projects = List.generate(5, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView(
            controller: pageController,
            // physics: CustomScrollPhysics(itemDimension: 3000),
            children: projects
                .map(
                  (project) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _WillCloseSoonListItem(),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _WillCloseSoonListItem extends StatelessWidget {
  const _WillCloseSoonListItem({
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
