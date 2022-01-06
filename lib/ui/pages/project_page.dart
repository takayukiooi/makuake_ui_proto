import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  static Route<ProjectPage> route({
    required int id,
  }) {
    return MaterialPageRoute(builder: (context) => ProjectPage(id: id));
  }

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
