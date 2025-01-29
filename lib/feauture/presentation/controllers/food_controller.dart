import 'package:get/get.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/food_widget_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';

class FoodController extends BaseController {
  late ProductEntity product;
  bool isFavourite = false;
  int counter = 0;
  final foodWidgetController = Get.find<FoodWidgetController>();
  final controllerH = Get.find<HomeController>();

  @override
  void onInit() async {
    super.onInit();
    product = Get.arguments;
    counter = controllerH.order[product.id]!;
    update();
  }

  void changeFavourite() {
    isFavourite = !isFavourite;
    update();
  }

  void increment() {
    counter++;
    controllerH.addProduct(product.id);
    update();
  }

  void decrement() {
    if (counter > 1) {
      counter--;
      controllerH.deleteProduct(product.id);

      update();
    }
  }
}
