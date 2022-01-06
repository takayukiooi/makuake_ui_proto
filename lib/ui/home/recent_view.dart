import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:makuake_ui_proto/data/recent_projects.dart';
import 'package:makuake_ui_proto/model/project.dart';
import 'package:intl/intl.dart';
import 'package:makuake_ui_proto/model/project.dart';
import 'package:makuake_ui_proto/model/response/projects_response.dart';
import 'package:makuake_ui_proto/ui/components/project_card.dart';
import 'package:makuake_ui_proto/ui/pages/project_page.dart';

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
