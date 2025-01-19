import 'package:dartz/dartz.dart';
import 'package:my_caff/core/errors/failure.dart';
import 'package:my_caff/core/usecases/usecase.dart';
import 'package:my_caff/feauture/domain/entites/sign_in_entity.dart';
import 'package:my_caff/feauture/domain/repo/user_repo.dart';

class SignIn extends UseCase<SignInEntity, SignInParams> {
  final UserRepo userRepo;
  SignIn({required this.userRepo});
  @override
  Future<Either<Failure, SignInEntity>> call(
      {required SignInParams params}) async {
    return await userRepo.signIn();
  }
}

class SignInParams {}
