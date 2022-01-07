import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:makuake_ui_proto/model/hero.dart';

part 'hero_response.g.dart';

@JsonSerializable()
class HeroResponse extends Equatable {
  const HeroResponse({
    required this.heroes,
  });

  final List<HeroItem> heroes;

  factory HeroResponse.fromJson(Map<String, dynamic> json) => _$HeroResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HeroResponseToJson(this);

  @override
  List<Object?> get props => [
        heroes,
      ];
}
