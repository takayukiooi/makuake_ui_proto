import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theme_tag.g.dart';

@JsonSerializable()
class TopThemeTag extends Equatable {
  const TopThemeTag({
    required this.topThemeTagId,
    required this.topThemeTagName,
    required this.secondThemes,
  });

  factory TopThemeTag.fromJson(Map<String, dynamic> json) => _$TopThemeTagFromJson(json);

  Map<String, dynamic> toJson() => _$TopThemeTagToJson(this);

  @JsonKey(name: 'top_theme_tag_id')
  final int topThemeTagId;

  @JsonKey(name: 'top_theme_tag_name')
  final String topThemeTagName;

  @JsonKey(name: 'second_themes')
  final List<SecondThemeTag> secondThemes;

  @override
  List<Object?> get props => [
        topThemeTagId,
        topThemeTagName,
        secondThemes,
      ];
}

@JsonSerializable()
class SecondThemeTag extends Equatable {
  const SecondThemeTag({
    required this.secondThemeTagId,
    required this.secondThemeTagName,
    required this.tags,
  });

  factory SecondThemeTag.fromJson(Map<String, dynamic> json) => _$SecondThemeTagFromJson(json);

  Map<String, dynamic> toJson() => _$SecondThemeTagToJson(this);

  @JsonKey(name: 'second_theme_tag_id')
  final int secondThemeTagId;

  @JsonKey(name: 'second_theme_tag_name')
  final String secondThemeTagName;

  @JsonKey(name: 'tags')
  final List<Tag> tags;

  @override
  List<Object?> get props => [
        secondThemeTagId,
        secondThemeTagName,
        tags,
      ];
}

@JsonSerializable()
class GenreTheme extends Equatable {
  const GenreTheme({
    required this.genreThemeId,
    required this.genreThemeName,
    required this.genreTags,
  });

  factory GenreTheme.fromJson(Map<String, dynamic> json) => _$GenreThemeFromJson(json);

  Map<String, dynamic> toJson() => _$GenreThemeToJson(this);

  @JsonKey(name: 'genre_theme_id')
  final int genreThemeId;

  @JsonKey(name: 'genre_theme_name')
  final String genreThemeName;

  @JsonKey(name: 'genre_tags')
  final List<Tag> genreTags;

  @override
  List<Object?> get props => [
        genreThemeId,
        genreThemeName,
        genreTags,
      ];
}

@JsonSerializable()
class Tag extends Equatable {
  const Tag({
    required this.tagId,
    required this.tagName,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @JsonKey(name: 'tag_id')
  final int tagId;

  @JsonKey(name: 'tag_name')
  final String tagName;

  @override
  List<Object?> get props => [
        tagId,
        tagName,
      ];
}
