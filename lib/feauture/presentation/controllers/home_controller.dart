import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_caff/core/errors/exception.dart';
import 'package:my_caff/feauture/domain/entites/category_entity.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class HomeController extends BaseController {
  List<ProductEntity> products = [];
  List<CategoryEntity> categories = [];
  List<ProductEntity> resultSearch = [];
  Map<int, List<ProductEntity>> categoryMap = {};
  Map<int, int> order = {};
  int changedFoodId = 0;
  int idCategory = 0;
  int indexCategory = 0;
  bool isSearched = false;
  final FocusNode searchFocus = FocusNode();

  @override
  void onClose() {
    super.onClose();
    searchFocus.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    changeLoading(true);
    products = await getProducts(1);

    categories = await getCategories(1);

    idCategory = categories.first.id;
    categoryMap = filterProductsByCategory();
    changeLoading(false);
  }

  int lengthOrder() {
    int length = 0;
    for (var values in order.values) {
      length = length + values;
    }
    return length;
  }

  int lengthFood() {
    int length = 0;
    // ignore: unused_local_variable
    for (var key in order.keys) {
      length = length + 1;
    }
    return length;
  }

  void unfocusSearch() {
    searchFocus.unfocus();
    log('unfocus');
    update();
  }

  void changeSearch(bool search) {
    isSearched = search;
    if (!search) {
      resultSearch.clear();
    }
    update();
  }

  void clearOrder() {
    order.clear();
    update();
  }

  void searchProducts(String query) {
    resultSearch.clear();
    resultSearch = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();
  }

  int priceAllProducts() {
    int summ = 0;
    for (var entry in order.entries) {
      for (var product in products) {
        if (product.id == entry.key) {
          summ = summ + product.price * entry.value;
        }
      }
    }
    return summ;
  }

  void decrement(int id) {
    if (order[id]! > 0) {
      order[id] = order[id]! - 1;

      update();
    }
  }

  void increment(int id) {
    order[id] = order[id]! + 1;
    update();
  }

  void addProduct(int id) {
    if (order.containsKey(id)) {
      order[id] = order[id]! + 1;
    } else {
      order[id] = 1;
    }
    update();
  }

  void deleteProduct(int id) {
    if (order.containsKey(id)) {
      if (order[id] == 0) {
        return;
      }
      order[id] = order[id]! - 1;
    }
    update();
  }

  void changedId(int id) {
    changedFoodId = id;
    update();
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
    var productsJson = await userRepo.getCategories(page: page);
    if (productsJson.isRight()) {
      var result = productsJson.getOrElse(() => throw ServerException());

      return result;
    }
    return [];
  }

  Future<List<ProductEntity>> getProducts(int page) async {
    var productsJson = await userRepo.getProducts(page: page);
    if (productsJson.isRight()) {
      var result = productsJson.getOrElse(() => throw ServerException());
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
