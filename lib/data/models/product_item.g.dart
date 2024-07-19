part of 'product_model.dart';

class ProductItemAdapter extends TypeAdapter<ProductItem> {
  @override
  final int typeId = 0;

  @override
  ProductItem read(BinaryReader reader) {
    return ProductItem(
      id: reader.read() as int?,
      title: reader.read() as String?,
      description: reader.read() as String?,
      category: reader.read() as String?,
      price: reader.read() as double?,
      discountPercentage: reader.read() as double?,
      rating: reader.read() as double?,
      stock: reader.read() as int?,
      tags: (reader.read() as List?)?.cast<String>(),
      sku: reader.read() as String?,
      weight: reader.read() as int?,
      warrantyInformation: reader.read() as String?,
      shippingInformation: reader.read() as String?,
      availabilityStatus: reader.read() as String?,
      returnPolicy: reader.read() as String?,
      minimumOrderQuantity: reader.read() as int?,
      images: (reader.read() as List?)?.cast<String>(),
      thumbnail: reader.read() as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductItem obj) {
    writer
      ..write(obj.id)
      ..write(obj.title)
      ..write(obj.description)
      ..write(obj.category)
      ..write(obj.price)
      ..write(obj.discountPercentage)
      ..write(obj.rating)
      ..write(obj.stock)
      ..write(obj.tags)
      ..write(obj.sku)
      ..write(obj.weight)
      ..write(obj.warrantyInformation)
      ..write(obj.shippingInformation)
      ..write(obj.availabilityStatus)
      ..write(obj.returnPolicy)
      ..write(obj.minimumOrderQuantity)
      ..write(obj.images)
      ..write(obj.thumbnail);
  }
}
