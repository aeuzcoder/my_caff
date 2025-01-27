import 'package:get/get.dart';
import 'package:my_caff/core/errors/exception.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/domain/entites/table_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';

class OrderController extends BaseController {
  List<int> keysOfFood = [];
  Map<int, int> order = {};
  List<TableEntity> tables = [];
  final controllerH = Get.find<HomeController>();

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

  Future<List<TableEntity>> getTable() async {
    var tablesJson = await userRepo.getTables();
    if (tablesJson.isRight()) {
      var result = tablesJson.getOrElse(() => throw ServerException());
      return result;
    }
    return [];
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
