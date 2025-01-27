// Model
import 'package:my_caff/feauture/domain/entites/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.tableNumber,
    required super.items,
    required super.location,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      tableNumber: json['table_number'],
      items: (json['items'] as List<dynamic>)
          .map((item) => ItemModel.fromJson(item))
          .toList(),
      location: LocationModel.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'table_number': tableNumber,
      'items': items.map((item) => (item as ItemModel).toJson()).toList(),
      'location': (location as LocationModel).toJson(),
    };
  }
}

class ItemModel extends ItemEntity {
  ItemModel({
    required super.productId,
    required super.quantity,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      productId: json['product_id'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
    };
  }
}

class LocationModel extends LocationEntity {
  LocationModel({
    required super.latitude,
    required super.longitude,
  });
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
