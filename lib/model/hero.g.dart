// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroItem _$HeroItemFromJson(Map<String, dynamic> json) => HeroItem(
      id: json['id'] as int,
      bgUrl: json['bg_url'] as String,
      order: json['order'] as int,
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HeroItemToJson(HeroItem instance) => <String, dynamic>{
      'id': instance.id,
      'bg_url': instance.bgUrl,
      'order': instance.order,
      'project': instance.project,
    };
