import 'package:get/get.dart';
import 'package:my_caff/core/errors/exception.dart';
import 'package:my_caff/feauture/domain/entites/order_entity.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/domain/entites/table_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';

class OrderController extends BaseController {
  List<int> keysOfFood = [];
  Map<int, int> order = {};
  List<TableEntity> tables = [];
  final controllerH = Get.find<HomeController>();
  int selectedTable = 0;
  bool isLoading2 = false;

  bool isDone = false;
  @override
  void onInit() async {
    super.onInit();
    changeLoading(true);

    tables = await getTable();
    order = controllerH.order;
    for (var key in controllerH.order.keys) {
      keysOfFood.add(key);
    }
    changeLoading(false);
  }

  void change2(bool loading) {
    isLoading2 = loading;
    update();
  }

  void selectTable(int id) {
    selectedTable = id;
    isDone = true;

    update();
  }

  //RESPONSES
  Future<List<TableEntity>> getTable() async {
    var tablesJson = await userRepo.getTables();
    if (tablesJson.isRight()) {
      var result = tablesJson.getOrElse(() => throw ServerException());
      return result;
    }
    return [];
  }

  List<ItemEntity> getItems() {
    List<ItemEntity> items = [];
    for (var entry in order.entries) {
      items.add(ItemEntity(productId: entry.key, quantity: entry.value));
    }
    return items;
  }

  Future<String> sendOrder() async {
    change2(true);
    var productsJson = await userRepo.setOrder(
      order: OrderEntity(
        tableNumber: selectedTable,
        items: getItems(),
        location: LocationEntity(latitude: -90, longitude: -180),
      ),
    );
    if (productsJson.isRight()) {
      var result = productsJson.getOrElse(() => throw ServerException());
      change2(false);

      return result;
    }
    if (productsJson.isLeft()) {
      var result = productsJson.getOrElse(() => throw ServerException());
      change2(false);

      return result;
    }
    change2(false);

    return 'Operatsiya Amalga oshmadi';
  }

  double priceOfOrderById(int id) {
    double price = 0;
    for (var productF in controllerH.products) {
      if (productF.id == id) {
        price = productF.price * order[id]!.toDouble();
      }
    }
    return price;
  }

  void decrement(int id) {
    if (order[id]! > 0) {
      controllerH.decrement(id);
      update();
    }
  }

  void increment(int id) {
    controllerH.increment(id);

    update();
  }

  int countById(int id) {
    return order[id]!;
  }

  ProductEntity? productById(int id) {
    for (var product in controllerH.products) {
      if (id == product.id) {
        return product;
      } else {
        continue;
      }
    }
    return null;
  }
}
