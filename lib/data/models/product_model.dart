import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'product_model.g.dart';
part 'product_item.g.dart';

@JsonSerializable()
class ProductModel {
  final List<ProductItem>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@HiveType(typeId: 0)
@JsonSerializable()
class ProductItem {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final String? category;

  @HiveField(4)
  final double? price;

  @HiveField(5)
  final double? discountPercentage;

  @HiveField(6)
  final double? rating;

  @HiveField(7)
  final int? stock;

  @HiveField(8)
  final List<String>? tags;

  @HiveField(9)
  final String? sku;

  @HiveField(10)
  final int? weight;

  @HiveField(11)
  final String? warrantyInformation;

  @HiveField(12)
  final String? shippingInformation;

  @HiveField(13)
  final String? availabilityStatus;

  @HiveField(14)
  final String? returnPolicy;

  @HiveField(15)
  final int? minimumOrderQuantity;

  @HiveField(16)
  final List<String>? images;

  @HiveField(17)
  final String? thumbnail;

  ProductItem({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.sku,
    this.weight,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.images,
    this.thumbnail,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}
