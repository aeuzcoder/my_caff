import 'package:dartz/dartz.dart';
import 'package:my_caff/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}
