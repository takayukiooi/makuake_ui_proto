import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:makuake_ui_proto/model/project.dart';
import 'package:makuake_ui_proto/ui/pages/project_page.dart';

const kProjectCardImageTag = 'kProjectCardImageTag';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final thumbnailWidth = (size.width - 24.0) / 2;
    final thumbnailHeight = thumbnailWidth * (9 / 16);

    final formatter = NumberFormat('#,###');
    final collectedMoney = formatter.format(project.collectedMoney);

    return InkWell(
      onTap: () => Navigator.of(context).push(ProjectPage.route(id: project.id)),
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
              child: Hero(
                tag: '$kProjectCardImageTag${project.id}',
                child: Image.network(
                  project.thumbnailUrl,
                  width: thumbnailWidth,
                  height: thumbnailHeight,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  project.title,
                  maxLines: 3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.access_time),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(project.timeLeftText ?? ''),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      '$collectedMoney円',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomPaint(
                      painter: _CollectedPercent(project.percent ?? 0),
                    ),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  Text('${project.percent.toString()}%'),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _CollectedPercent extends CustomPainter {
  const _CollectedPercent(this.percent);

  final int percent;

  @override
  void paint(Canvas canvas, Size size) {
    final background = Paint()
      ..color = const Color(0xFFEAEBEE)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    final start = Offset(0.0, size.height / 2);
    final end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, background);

    final paint = Paint()
      ..color = const Color(0xFFA5F117)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final calc = min(percent / 100, 1.0);

    canvas.drawLine(start, Offset(size.width * calc, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
