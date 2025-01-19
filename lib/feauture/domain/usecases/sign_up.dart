import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_caff/core/errors/failure.dart';
import 'package:my_caff/core/usecases/usecase.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';
import 'package:my_caff/feauture/domain/repo/user_repo.dart';

class SignUp extends UseCase<String, SignUpParams> {
  final UserRepo userRepo;
  SignUp({required this.userRepo});
  @override
  Future<Either<Failure, String>> call({required SignUpParams params}) async {
    return await userRepo.signUp(user: params.user);
  }
}

class SignUpParams extends Equatable {
  final UserEntity user;

  const SignUpParams({required this.user});
  @override
  List<Object?> get props => [user];
}
