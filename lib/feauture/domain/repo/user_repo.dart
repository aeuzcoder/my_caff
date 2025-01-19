import 'package:dartz/dartz.dart';
import 'package:my_caff/core/errors/failure.dart';
import 'package:my_caff/feauture/domain/entites/sign_in_entity.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, SignInEntity>> signIn();
  Future<Either<Failure, String>> signUp({UserEntity user});
}
