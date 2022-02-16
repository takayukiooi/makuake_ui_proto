import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:makuake_ui_proto/model/theme_tag.dart';

part 'layer_tag_response.g.dart';

@JsonSerializable()
class LayerTagResponse extends Equatable {
  const LayerTagResponse({
    required this.topThemes,
    required this.genreThemes,
  });

  factory LayerTagResponse.fromJson(Map<String, dynamic> json) => _$LayerTagResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LayerTagResponseToJson(this);

  @JsonKey(name: 'top_themes')
  final List<TopThemeTag> topThemes;

  @JsonKey(name: 'genre_themes')
  final List<GenreTheme> genreThemes;

  @override
  List<Object?> get props => [];
}
