import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'return_item.g.dart';

@JsonSerializable()
class ReturnItem extends Equatable {
  const ReturnItem({
    required this.id,
    required this.projectId,
    required this.title,
    required this.contents,
    required this.price,
    required this.priceNoTax,
    required this.limitAmount,
    required this.supportedAmount,
    required this.deliveryDate,
    required this.isRequireAddress,
    required this.isImage,
    required this.imageUrl,
    required this.hasQuestion,
  });

  factory ReturnItem.fromJson(Map<String, dynamic> json) => _$ReturnItemFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnItemToJson(this);

  final int id;

  @JsonKey(name: 'project_id')
  final int projectId;

  final String title;
  final String contents;
  final String price;

  @JsonKey(name: 'price_no_tax')
  final int priceNoTax;

  @JsonKey(name: 'limit_amount')
  final int limitAmount;

  @JsonKey(name: 'supported_amount')
  final int supportedAmount;

  @JsonKey(name: 'delivery_date')
  final DateTime deliveryDate;

  @JsonKey(name: 'is_require_address')
  final bool isRequireAddress;

  @JsonKey(name: 'is_image')
  final bool isImage;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'has_question')
  final bool hasQuestion;

  @override
  List<Object?> get props => [
        id,
        projectId,
        title,
        contents,
        price,
        priceNoTax,
        limitAmount,
        supportedAmount,
        deliveryDate,
        isRequireAddress,
        isImage,
        imageUrl,
        hasQuestion,
      ];
}
