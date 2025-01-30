class MyOrderEntity {
  final int orderId;
  final int tableNumber;
  final int totalPrice;
  final String orderTime;
  final bool status;
  final List<OrderItem> items;
  final User user;

  MyOrderEntity({
    required this.orderId,
    required this.tableNumber,
    required this.totalPrice,
    required this.orderTime,
    required this.status,
    required this.items,
    required this.user,
  });
}

class OrderItem {
  final int productId;
  final String name;
  final int quantity;
  final double productPrice;
  final int totalPrice;

  OrderItem({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.productPrice,
    required this.totalPrice,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['product_id'],
      name: json['name'],
      quantity: json['quantity'],
      productPrice: json['product_price'].toDouble(),
      totalPrice: json['total_price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'name': name,
      'quantity': quantity,
      'product_price': productPrice,
      'total_price': totalPrice,
    };
  }
}

class User {
  final String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
