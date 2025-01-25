import 'package:get/get.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class FoodController extends BaseController {
  late ProductEntity product;
  late int counter;
  @override
  void onInit() {
    super.onInit();
    product = Get.arguments;
    counter = 0;
  }

  void increment() {
    counter++;
    update();
  }

  void decrement() {
    if (counter > 1) {
      counter--;
      update();
    }
  }
}
