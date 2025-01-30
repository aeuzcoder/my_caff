import 'package:my_caff/feauture/domain/entites/my_order_entity.dart';

class MyOrderModel extends MyOrderEntity {
  MyOrderModel({
    required super.orderId,
    required super.tableNumber,
    required super.totalPrice,
    required super.orderTime,
    required super.status,
    required super.items,
    required super.user,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) {
    return MyOrderModel(
      orderId: json['order_id'],
      tableNumber: json['table_number'],
      totalPrice: json['total_price'],
      orderTime: json['order_time'],
      status: json['status'],
      items: (json['items'] as List).map((e) => OrderItem.fromJson(e)).toList(),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'table_number': tableNumber,
      'total_price': totalPrice,
      'order_time': orderTime,
      'status': status,
      'items': items.map((e) => e.toJson()).toList(),
      'user': user.toJson(),
    };
  }
}
