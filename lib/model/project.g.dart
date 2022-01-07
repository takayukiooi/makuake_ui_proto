// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as int,
      title: json['title'] as String,
      collectedMoney: json['collected_money'] as int,
      collectedSuppoter: json['collected_supporter'] as int?,
      thumbnailUrl: json['thumbnail_url'] as String,
      returns: (json['returns'] as List<dynamic>?)
              ?.map((e) => ReturnItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      percent: json['percent'] as int?,
      url: json['url'] as String?,
      timeLeftText: json['time_left_label'] as String?,
      isNew: json['is_new'] as bool?,
      isStoreOpening: json['is_store_opening'] as bool?,
      hasTargetMoney: json['has_target_money'] as bool?,
      hasExpiration: json['has_expiration'] as bool?,
      isAcceptingSupport: json['is_accepting_support'] as bool?,
      hideCollectedMoney: json['hide_collected_money'] as bool?,
      targetedAmount: json['targeted_amount'] as int?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'collected_money': instance.collectedMoney,
      'collected_supporter': instance.collectedSuppoter,
      'thumbnail_url': instance.thumbnailUrl,
      'percent': instance.percent,
      'url': instance.url,
      'time_left_label': instance.timeLeftText,
      'is_new': instance.isNew,
      'is_store_opening': instance.isStoreOpening,
      'has_target_money': instance.hasTargetMoney,
      'has_expiration': instance.hasExpiration,
      'is_accepting_support': instance.isAcceptingSupport,
      'hide_collected_money': instance.hideCollectedMoney,
      'targeted_amount': instance.targetedAmount,
      'start_date': instance.startDate?.toIso8601String(),
      'returns': instance.returns,
    };
