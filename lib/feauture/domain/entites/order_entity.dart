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
}

class LocationEntity {
  final double latitude;
  final double longitude;

  LocationEntity({
    required this.latitude,
    required this.longitude,
  });
}
