import 'package:my_caff/core/errors/exception.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class HomeController extends BaseController {
  List<ProductEntity> products = [];
  @override
  void onInit() async {
    super.onInit();
    products = await getProducts(1);
  }

  Future<List<ProductEntity>> getProducts(int page) async {
    changeLoading(true);
    var productsJson = await userRepo.getProducts(page: page);
    if (productsJson.isRight()) {
      var result = productsJson.getOrElse(() => throw ServerException());
      changeLoading(false);
      return result;
    }
    return [];
  }
}
