import 'package:flutter/material.dart';
import 'package:makuake_ui_proto/data/hero_projects.dart';
import 'package:makuake_ui_proto/data/pickup_response.dart';
import 'package:makuake_ui_proto/model/hero.dart';
import 'package:makuake_ui_proto/model/response/hero_response.dart';
import 'package:makuake_ui_proto/model/response/projects_response.dart';
import 'package:makuake_ui_proto/ui/components/project_card.dart';

class PickupView extends StatefulWidget {
  const PickupView({
    Key? key,
  }) : super(key: key);

  @override
  State<PickupView> createState() => _PickupViewState();
}

class _PickupViewState extends State<PickupView> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final hero = HeroResponse.fromJson(kHeroResponse).heroes;
    final pickup = ProjectsResponse.fromJson(kPickupResponse).projects;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 320,
            child: PageView(
              controller: pageController,
              children: hero
                  .map((hero) => HeroWidget(
                        hero: hero,
                      ))
                  .toList(),
            ),
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ProjectCard(project: pickup[index]);
            },
            childCount: pickup.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: 0.8,
          ),
        ),
      ],
    );
  }
}

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    Key? key,
    required this.hero,
  }) : super(key: key);

  final HeroItem hero;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(hero.bgUrl),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset.zero, // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Column(
                children: [
                  Image.network(hero.project.thumbnailUrl),
                  Text(hero.project.title),
                  Row(
                    children: [
                      Text('${hero.project.collectedMoney}円'),
                      Text('${hero.project.percent}%'),
                      Text('${hero.project.timeLeftText}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
