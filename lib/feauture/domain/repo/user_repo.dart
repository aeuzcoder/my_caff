import 'package:dartz/dartz.dart';
import 'package:my_caff/feauture/domain/entites/sign_in_entity.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';

abstract class UserRepo {
  Future<Either<String, SignInEntity>> signIn(
      {required String username, required String password});
  Future<Either<String, String>> signUp({required UserEntity user});
}
