import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_caff/feauture/data/datasources/database/db_service.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';

class FoodWidgetController extends BaseController {
  final controllerH = Get.find<HomeController>();

  bool checkFavourite(int id) {
    return DBService.to.hasDataOn(id);
  }

  Future<void> saveOrDeleteFoods(
      bool isFavourite, ProductEntity product) async {
    log(isFavourite.toString());
    if (isFavourite) {
      await DBService.to.setProduct(product.id, product);
    } else {
      await DBService.to.deleteProduct(product.id);
    }
  }
}
