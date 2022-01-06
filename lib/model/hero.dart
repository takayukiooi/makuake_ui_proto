import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'project.dart';

part 'hero.g.dart';

@JsonSerializable()
class Hero extends Equatable {
  const Hero({
    required this.id,
    required this.bgUrl,
    required this.order,
    required this.project,
  });

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);

  Map<String, dynamic> toJson() => _$HeroToJson(this);

  final int id;

  @JsonKey(name: 'bg_url')
  final String bgUrl;

  final int order;

  final Project project;

  @override
  List<Object?> get props => [
        id,
        bgUrl,
        order,
        project,
      ];
}
