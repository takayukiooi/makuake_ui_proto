// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layer_tag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayerTagResponse _$LayerTagResponseFromJson(Map<String, dynamic> json) =>
    LayerTagResponse(
      topThemes: (json['top_themes'] as List<dynamic>)
          .map((e) => TopThemeTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      genreThemes: (json['genre_themes'] as List<dynamic>)
          .map((e) => GenreTheme.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LayerTagResponseToJson(LayerTagResponse instance) =>
    <String, dynamic>{
      'top_themes': instance.topThemes,
      'genre_themes': instance.genreThemes,
    };
