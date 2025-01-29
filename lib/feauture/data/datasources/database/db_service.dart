import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_caff/feauture/data/models/product_model.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';

class DBService {
  final GetStorage _box = GetStorage();

  static DBService get to => Get.find<DBService>();

  static Future<void> init() async {
    await Get.putAsync<DBService>(() async {
      final storageService = DBService();
      await GetStorage.init();
      return storageService;
    }, permanent: true);
  }

  bool isLoggedIn() {
    String token = getAccessToken();
    return token.isNotEmpty;
  }

  Future<void> logOut() async {
    await _box.erase(); // Clear all data on database DB
    await Get.deleteAll();
  }

  /// Check Favoutire food
  bool hasDataOn(int id) {
    return _box.hasData('f_$id');
  }

  /// Set Favourite food
  Future<void> setProduct(int id, ProductEntity product) async {
    final productModel = ProductModel.fromEntity(product);

    await _box.write('f_$id', productModel.toJson());
  }

  /// Delete Favourite food
  Future<void> deleteProduct(int id) async {
    await _box.remove('f_$id');
  }

  /// Get Favourite food
  Future<bool> getProduct(int id) async {
    final data = await _box.read('f_$id');
    if (data != null) {
      return true;
    }
    return false;
  }

  /// Delete all Favourite foods
  Future<void> deleteAllProducts() async {
    for (var key in _box.getKeys()) {
      if (key is String && key.startsWith('f_')) {
        await _box.remove(key);
      }
    }
  }

  /// Get all Favourite foods
  Future<List<ProductModel>> getAllProducts() async {
    final List<ProductModel> products = [];

    for (var key in _box.getKeys()) {
      if (key is String && key.startsWith('f_')) {
        final data = await _box.read(key);
        if (data != null) {
          products.add(ProductModel.fromJson(data));
        }
      }
    }

    return products;
  }

  /// Access Token
  Future<void> setAccessToken(String? value) async {
    await _box.write(_StorageKeys.accessToken, value);
  }

  String getAccessToken() {
    return _box.read(_StorageKeys.accessToken) ?? "";
  }

  Future<void> delAccessToken() async {
    await _box.remove(_StorageKeys.accessToken);
  }

  /// Refresh Token
  Future<void> setRefreshToken(String? value) async {
    await _box.write(_StorageKeys.refreshToken, value);
  }

  String getRefreshToken() {
    return _box.read(_StorageKeys.refreshToken) ?? "";
  }

  Future<void> delRefreshToken() async {
    await _box.remove(_StorageKeys.refreshToken);
  }

  Future<void> setLanguage(String code) async {
    await _box.write(_StorageKeys.language, code);
  }

  /// User
  Future<void> setUser(String? value) async {
    await _box.write(_StorageKeys.user, value);
  }

  String getUser() {
    return _box.read(_StorageKeys.user) ?? "";
  }

  Future<void> delUser() async {
    await _box.remove(_StorageKeys.user);
  }

  /// Pin Code
  Future<void> setPinCode(String value) async {
    await _box.write(_StorageKeys.pinCode, value);
  }

  String getPinCode() {
    return _box.read(_StorageKeys.pinCode) ?? "";
  }

  /// Face/Touch ID
  Future<void> setBiometrics(bool value) async {
    await _box.write(_StorageKeys.biometrics, value);
  }

  bool getBiometrics() {
    return _box.read(_StorageKeys.biometrics) ?? false;
  }
}

class _StorageKeys {
  static const accessToken = 'access_token';
  static const refreshToken = 'refresh_token';

  static const language = 'language';
  static const user = 'user';
  static const pinCode = 'pin_code';
  static const biometrics = 'biometrics';
}
