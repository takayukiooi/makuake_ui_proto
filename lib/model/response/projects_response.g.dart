// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsResponse _$ProjectsResponseFromJson(Map<String, dynamic> json) =>
    ProjectsResponse(
      projects: (json['projects'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectsResponseToJson(ProjectsResponse instance) =>
    <String, dynamic>{
      'projects': instance.projects,
    };
