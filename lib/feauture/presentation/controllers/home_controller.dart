import 'package:my_caff/core/errors/exception.dart';
import 'package:my_caff/feauture/domain/entites/category_entity.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class HomeController extends BaseController {
  List<ProductEntity> products = [];
  List<CategoryEntity> categories = [];
  Map<int, List<ProductEntity>> categoryMap = {};
  int idCategory = 0;
  int indexCategory = 0;
  @override
  void onInit() async {
    super.onInit();
    products = await getProducts(1);
    categories = await getCategories(1);
    idCategory = categories.first.id;
    categoryMap = filterProductsByCategory();
  }

  void changeCategory(int id) {
    idCategory = id;
    update();
  }

  void changeIndex(int value) {
    indexCategory = value;
    update();
  }

  Future<List<CategoryEntity>> getCategories(int page) async {
    changeLoading(true);
    var productsJson = await userRepo.getCategories(page: page);
    if (productsJson.isRight()) {
      var result = productsJson.getOrElse(() => throw ServerException());
      changeLoading(false);
      return result;
    }
    return [];
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

  Map<int, List<ProductEntity>> filterProductsByCategory() {
    for (var product in products) {
      if (!categoryMap.containsKey(product.categoryId)) {
        categoryMap[product.categoryId] = [];
      }

      categoryMap[product.categoryId]!.add(product);
    }

    return categoryMap;
  }
}
