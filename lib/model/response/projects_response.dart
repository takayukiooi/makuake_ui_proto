import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:makuake_ui_proto/model/project.dart';

part 'projects_response.g.dart';

@JsonSerializable()
class ProjectsResponse extends Equatable {
  const ProjectsResponse({
    required this.projects,
  });

  final List<Project> projects;

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) => _$ProjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsResponseToJson(this);

  @override
  List<Object?> get props => [
        projects,
      ];
}
