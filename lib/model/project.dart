import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:makuake_ui_proto/model/datetime_converter.dart';

import 'return_item.dart';

part 'project.g.dart';

@JsonSerializable()
class Project extends Equatable {
  const Project({
    required this.id,
    required this.title,
    required this.collectedMoney,
    this.collectedSuppoter,
    required this.thumbnailUrl,
    this.returns = const [],
    this.percent,
    this.url,
    this.timeLeftText,
    this.isNew,
    this.isStoreOpening,
    this.hasTargetMoney,
    this.hasExpiration,
    this.isAcceptingSupport,
    this.hideCollectedMoney,
    this.targetedAmount,
    this.startDate,
  });

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  final int id;
  final String title;

  @JsonKey(name: 'collected_money')
  final int collectedMoney;
  @JsonKey(name: 'collected_supporter')
  final int? collectedSuppoter;

  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;

  final int? percent;

  final String? url;

  @JsonKey(name: 'time_left_label')
  final String? timeLeftText;

  @JsonKey(name: 'is_new')
  final bool? isNew;

  @JsonKey(name: 'is_store_opening')
  final bool? isStoreOpening;

  @JsonKey(name: 'has_target_money')
  final bool? hasTargetMoney;

  @JsonKey(name: 'has_expiration')
  final bool? hasExpiration;

  @JsonKey(name: 'is_accepting_support')
  final bool? isAcceptingSupport;

  @JsonKey(name: 'hide_collected_money')
  final bool? hideCollectedMoney;

  @JsonKey(name: 'targeted_amount')
  final int? targetedAmount;

  @JsonKey(name: 'start_date')
  @DateTimeConverter()
  final DateTime? startDate;

  final List<ReturnItem>? returns;

  @override
  List<Object?> get props => [
        id,
        title,
        url,
        collectedMoney,
        percent,
        thumbnailUrl,
        timeLeftText,
        isNew,
        isStoreOpening,
        collectedSuppoter,
        hasTargetMoney,
        hasExpiration,
        isAcceptingSupport,
        hideCollectedMoney,
        targetedAmount,
        startDate,
        returns,
      ];
}
