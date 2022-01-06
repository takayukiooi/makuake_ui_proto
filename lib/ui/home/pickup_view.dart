import 'package:flutter/material.dart';
import 'package:makuake_ui_proto/data/pickup_response.dart';
import 'package:makuake_ui_proto/data/recent_projects.dart';
import 'package:makuake_ui_proto/model/response/projects_response.dart';
import 'package:makuake_ui_proto/ui/components/project_card.dart';

class PickupView extends StatelessWidget {
  const PickupView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hero = [];
    final pickup = ProjectsResponse.fromJson(kPickupResponse).projects;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Text(
              '今日始まったプロジェクト',
              style: Theme.of(context).textTheme.headline6,
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
