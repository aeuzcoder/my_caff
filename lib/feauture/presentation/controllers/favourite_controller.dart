import 'package:get/get.dart';

import 'package:my_caff/feauture/data/datasources/database/db_service.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';

class FavouriteController extends BaseController {
  List<ProductEntity> products = [];
  final controllerH = Get.find<HomeController>();

  @override
  void onInit() async {
    super.onInit();
    changeLoading(true);

    products = await DBService.to.getAllProducts();
    changeLoading(false);
  }

  Future<void> deleteFavouirite(ProductEntity product) async {
    await DBService.to.deleteProduct(product.id);
    products.remove(product);

    update();
  }
}
