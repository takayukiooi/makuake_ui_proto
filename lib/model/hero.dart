import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'project.dart';

part 'hero.g.dart';

@JsonSerializable()
class HeroItem extends Equatable {
  const HeroItem({
    required this.id,
    required this.bgUrl,
    required this.order,
    required this.project,
  });

  factory HeroItem.fromJson(Map<String, dynamic> json) => _$HeroItemFromJson(json);

  Map<String, dynamic> toJson() => _$HeroItemToJson(this);

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
