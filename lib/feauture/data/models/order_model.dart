// Model
import 'package:my_caff/feauture/domain/entites/order_entity.dart';

Map<String, dynamic> createOrderFromEntity(OrderEntity data) {
  var model = OrderModel.convertToModel(data);
  return model.toJson();
}

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
          .map((item) => ItemEntity.fromJson(item))
          .toList(),
      location: LocationEntity.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'table_number': tableNumber,
      'items': items.map((item) => (item).toJson()).toList(),
      'location': (location).toJson(),
    };
  }

  static OrderModel convertToModel(OrderEntity entity) {
    return OrderModel(
        tableNumber: entity.tableNumber,
        items: entity.items,
        location: entity.location);
  }
}
