// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnItem _$ReturnItemFromJson(Map<String, dynamic> json) => ReturnItem(
      id: json['id'] as int,
      projectId: json['project_id'] as int,
      title: json['title'] as String,
      contents: json['contents'] as String,
      price: json['price'] as String,
      priceNoTax: json['price_no_tax'] as int,
      limitAmount: json['limit_amount'] as int,
      supportedAmount: json['supported_amount'] as int,
      deliveryDate: DateTime.parse(json['delivery_date'] as String),
      isRequireAddress: json['is_require_address'] as bool,
      isImage: json['is_image'] as bool,
      imageUrl: json['image_url'] as String,
      hasQuestion: json['has_question'] as bool,
    );

Map<String, dynamic> _$ReturnItemToJson(ReturnItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'title': instance.title,
      'contents': instance.contents,
      'price': instance.price,
      'price_no_tax': instance.priceNoTax,
      'limit_amount': instance.limitAmount,
      'supported_amount': instance.supportedAmount,
      'delivery_date': instance.deliveryDate.toIso8601String(),
      'is_require_address': instance.isRequireAddress,
      'is_image': instance.isImage,
      'image_url': instance.imageUrl,
      'has_question': instance.hasQuestion,
    };
