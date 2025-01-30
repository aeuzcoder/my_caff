import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:my_caff/core/errors/exception.dart';
import 'package:my_caff/core/network/api_constants.dart';
import 'package:my_caff/core/services/network_info.dart';
import 'package:my_caff/feauture/data/datasources/network/network_service.dart';
import 'package:my_caff/feauture/data/models/category_model.dart';
import 'package:my_caff/feauture/data/models/order_model.dart';
import 'package:my_caff/feauture/data/models/person_model.dart';
import 'package:my_caff/feauture/data/models/product_model.dart';
import 'package:my_caff/feauture/data/models/sign_in_model.dart';
import 'package:my_caff/feauture/data/models/table_model.dart';
import 'package:my_caff/feauture/data/models/user_model.dart';
import 'package:my_caff/feauture/domain/entites/category_entity.dart';
import 'package:my_caff/feauture/domain/entites/order_entity.dart';
import 'package:my_caff/feauture/domain/entites/person_entity.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/domain/entites/sign_in_entity.dart';
import 'package:my_caff/feauture/domain/entites/table_entity.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';
import 'package:my_caff/feauture/domain/repo/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final NetworkInfo networkInfo;
  UserRepoImpl({required this.networkInfo});
  @override
  Future<Either<String, SignInEntity>> signIn(
      {required String username, required String password}) async {
    try {
      final response = await NetworkService.POST(
        ApiConstants.TOKEN,
        {
          'username': username,
          'password': password,
        },
        isAuth: true,
      );
      final resultJson = jsonDecode(response!);

      log(resultJson.toString());
      final result = SignInModel.fromJson(resultJson);

      return Right(result);
    } on InvalidInputException catch (_) {
      return Right(
        SignInEntity(
            accessToken: '',
            tokenType: '',
            role: '',
            details: 'Login yoki parolda xatolik'),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> signUp({required UserEntity user}) async {
    try {
      var response = await NetworkService.POST(
          ApiConstants.USERS_CREATE_USERS, createUserFromEntity(user));
      var result = jsonDecode(response ?? '');
      return Right(result['message']);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductEntity>>> getProducts(
      {required int page}) async {
    try {
      var response = await NetworkService.GET(ApiConstants.PRODUCT_GET,
          {'page': page.toString(), 'page_size': 10.toString()});
      var resultJson = jsonDecode(response!);
      List<ProductEntity> result = resultJson['products']
          .map<ProductModel>((product) => ProductModel.fromJson(product))
          .toList();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CategoryEntity>>> getCategories(
      {required int page}) async {
    try {
      var response = await NetworkService.GET(ApiConstants.CATEGORY_GET,
          {'page': page.toString(), 'page_size': 10.toString()});
      var resultJson = jsonDecode(response!);
      List<CategoryEntity> result = resultJson
          .map<CategoryEntity>((category) => CategoryModel.fromJson(category))
          .toList();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> setOrder({required OrderEntity order}) async {
    try {
      var response = await NetworkService.POST(
          ApiConstants.ORDER_CREATE, createOrderFromEntity(order));
      var result = jsonDecode(response ?? '');
      log("RESULT: $result");
      return Right(result['message']);
    } catch (e) {
      log('EROR: ${e.toString()}');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<TableEntity>>> getTables() async {
    try {
      var response = await NetworkService.GET(
          ApiConstants.TABLE_GET, NetworkService.paramsEmpty());
      var resultJson = jsonDecode(response!);
      List<TableEntity> result = resultJson
          .map<TableEntity>((table) => TableModel.fromJson(table))
          .toList();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PersonEntity>> getUser() async {
    try {
      var response = await NetworkService.GET(
          ApiConstants.USERS_GET_OWN, NetworkService.paramsEmpty());
      var resultJson = jsonDecode(response!);
      PersonEntity result = PersonModel.fromJson(resultJson);

      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> sendPhoto({required String path}) async {
    try {
      var response = await NetworkService.POST(
          ApiConstants.UPLOAD_IMAGE, NetworkService.paramsEmpty(),
          path: path);
      var result = jsonDecode(response ?? '');
      log('tipi: ${result.runtimeType}');
      log(result.toString());
      return Right(result['message']);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<bool> internetInfo() async {
    final bool result = await networkInfo.isConnected;
    log('INTERNET: $result');
    if (result) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either<String, String>> changeProfile(
      {required UserEntity user}) async {
    try {
      log(createUserFromEntity(user).toString());
      var response = await NetworkService.PUT(ApiConstants.USERS_UPDATE_PROFILE,
          body: createUserFromEntity(user));
      var result = jsonDecode(response ?? '');
      return Right(result['message']);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
