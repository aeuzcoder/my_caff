import 'package:my_caff/feauture/data/repo/user_repo_impl.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class LoginController extends BaseController {
  final userRepo = UserRepoImpl();

  Future<String> onLogin({required UserEntity user}) async {
    changeLoading(true);
    final res = await userRepo.signUp(user: user);
    if (res.isRight()) {
      var loginData = res.getOrElse(() => throw Exception("Unexpected error"));
      return loginData;
    }
    if (res.isLeft()) {
      var loginData = res.getOrElse(() => throw Exception("Unexpected error"));
      return loginData;
    }
    return ' ERROR ';
  }
}
