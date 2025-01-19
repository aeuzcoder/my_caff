import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<String, Type>> call({required Params params});
}
