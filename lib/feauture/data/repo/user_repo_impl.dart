import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:my_caff/core/network/api_constants.dart';
import 'package:my_caff/feauture/data/datasources/network/network_service.dart';
import 'package:my_caff/feauture/data/models/sign_in_model.dart';
import 'package:my_caff/feauture/data/models/user_model.dart';
import 'package:my_caff/feauture/domain/entites/sign_in_entity.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';
import 'package:my_caff/feauture/domain/repo/user_repo.dart';

class UserRepoImpl implements UserRepo {
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
      log("RIGHT RESULT");
      return Right(result);
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
      log('ERROR UP');
      return Left(e.toString());
    }
  }
}
