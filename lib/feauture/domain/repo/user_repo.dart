import 'package:dartz/dartz.dart';
import 'package:my_caff/feauture/domain/entites/category_entity.dart';
import 'package:my_caff/feauture/domain/entites/my_order_entity.dart';
import 'package:my_caff/feauture/domain/entites/order_entity.dart';
import 'package:my_caff/feauture/domain/entites/person_entity.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/domain/entites/sign_in_entity.dart';
import 'package:my_caff/feauture/domain/entites/table_entity.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';

abstract class UserRepo {
  //SIGN IN
  Future<Either<String, SignInEntity>> signIn(
      {required String username, required String password});

  //SIGN UP
  Future<Either<String, String>> signUp({required UserEntity user});

  //GET PRODUCTS
  Future<Either<String, List<ProductEntity>>> getProducts({required int page});

  //GET PRODUCTS
  Future<Either<String, List<CategoryEntity>>> getCategories(
      {required int page});

  //SET ORDER
  Future<Either<String, String>> setOrder({required OrderEntity order});

  //GET TABLES
  Future<Either<String, List<TableEntity>>> getTables();

  //GET USER INFO
  Future<Either<String, PersonEntity>> getUser();

  //SEND PHOTO
  Future<Either<String, String>> sendPhoto({required String path});

  //CHECK INTERNET
  Future<bool> internetInfo();

  //CHANGE PROFILE
  Future<Either<String, String>> changeProfile({required UserEntity user});

  //GET ORDERS
  Future<Either<String, List<MyOrderEntity>>> getOrders();
}
