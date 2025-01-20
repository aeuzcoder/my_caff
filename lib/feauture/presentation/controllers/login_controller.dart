import 'package:my_caff/feauture/data/datasources/database/db_service.dart';
import 'package:my_caff/feauture/data/repo/user_repo_impl.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class LoginController extends BaseController {
  final userRepo = UserRepoImpl();

  int indexItem = 0;

  void changer(int index) {
    indexItem = index;
    update();
  }

  Future<bool> onSignIn(
      {required String username, required String password}) async {
    changeLoading(true);
    final res = await userRepo.signIn(username: username, password: password);
    if (res.isRight()) {
      var loginData = res.getOrElse(() => throw Exception("Unexpected error"));
      if ((loginData.accessToken).isNotEmpty) {
        await DBService.to.setAccessToken(loginData.accessToken);
      }
      return true;
    }
    if (res.isLeft()) {
      return false;
    }
    return false;
  }

  Future<String> onSignUp({required UserEntity user}) async {
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
