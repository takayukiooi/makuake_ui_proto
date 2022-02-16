// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopThemeTag _$TopThemeTagFromJson(Map<String, dynamic> json) => TopThemeTag(
      topThemeTagId: json['top_theme_tag_id'] as int,
      topThemeTagName: json['top_theme_tag_name'] as String,
      secondThemes: (json['second_themes'] as List<dynamic>)
          .map((e) => SecondThemeTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopThemeTagToJson(TopThemeTag instance) =>
    <String, dynamic>{
      'top_theme_tag_id': instance.topThemeTagId,
      'top_theme_tag_name': instance.topThemeTagName,
      'second_themes': instance.secondThemes,
    };

SecondThemeTag _$SecondThemeTagFromJson(Map<String, dynamic> json) =>
    SecondThemeTag(
      secondThemeTagId: json['second_theme_tag_id'] as int,
      secondThemeTagName: json['second_theme_tag_name'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SecondThemeTagToJson(SecondThemeTag instance) =>
    <String, dynamic>{
      'second_theme_tag_id': instance.secondThemeTagId,
      'second_theme_tag_name': instance.secondThemeTagName,
      'tags': instance.tags,
    };

GenreTheme _$GenreThemeFromJson(Map<String, dynamic> json) => GenreTheme(
      genreThemeId: json['genre_theme_id'] as int,
      genreThemeName: json['genre_theme_name'] as String,
      genreTags: (json['genre_tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenreThemeToJson(GenreTheme instance) =>
    <String, dynamic>{
      'genre_theme_id': instance.genreThemeId,
      'genre_theme_name': instance.genreThemeName,
      'genre_tags': instance.genreTags,
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      tagId: json['tag_id'] as int,
      tagName: json['tag_name'] as String,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'tag_id': instance.tagId,
      'tag_name': instance.tagName,
    };
