import 'dart:developer';

import 'package:my_caff/feauture/data/datasources/database/db_service.dart';
import 'package:my_caff/feauture/data/repo/user_repo_impl.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class SignInController extends BaseController {
  final userRepo = UserRepoImpl();

  Future<bool> onLogin(
      {required String username, required String password}) async {
    changeLoading(true);
    final res = await userRepo.signIn(username: username, password: password);
    if (res.isRight()) {
      log("right");
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
}
