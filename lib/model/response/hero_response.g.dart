// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroResponse _$HeroResponseFromJson(Map<String, dynamic> json) => HeroResponse(
      heroes: (json['heroes'] as List<dynamic>)
          .map((e) => HeroItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HeroResponseToJson(HeroResponse instance) =>
    <String, dynamic>{
      'heroes': instance.heroes,
    };
