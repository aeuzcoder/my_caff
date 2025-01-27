import 'package:get/get.dart';
import 'package:my_caff/feauture/data/datasources/database/db_service.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/food_widget_controller.dart';

class FoodController extends BaseController {
  late ProductEntity product;
  bool isFavourite = false;
  int counter = 0;
  final foodWidgetController = Get.find<FoodWidgetController>();
  @override
  void onInit() async {
    super.onInit();
    product = Get.arguments;

    isFavourite = await DBService.to.getProduct(product.id);
    update();
  }

  void changeFavourite() {
    isFavourite = !isFavourite;
    update();
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
