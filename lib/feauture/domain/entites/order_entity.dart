// Entity
class OrderEntity {
  final int tableNumber;
  final List<ItemEntity> items;
  final LocationEntity location;

  OrderEntity({
    required this.tableNumber,
    required this.items,
    required this.location,
  });
}

class ItemEntity {
  final int productId;
  final int quantity;

  ItemEntity({
    required this.productId,
    required this.quantity,
  });

  factory ItemEntity.fromJson(Map<String, dynamic> json) {
    return ItemEntity(
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

class LocationEntity {
  final double latitude;
  final double longitude;

  LocationEntity({
    required this.latitude,
    required this.longitude,
  });
  factory LocationEntity.fromJson(Map<String, dynamic> json) {
    return LocationEntity(
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
