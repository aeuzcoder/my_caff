import 'package:get/get.dart';
import 'package:my_caff/feauture/domain/repo/user_repo.dart';
import 'package:my_caff/service_locator.dart';

class BaseController extends GetxController {
  bool isLoading = false;
  bool isError = false;
  String errorText = '';
  final userRepo = sl<UserRepo>();

  void changeLoading(bool loading) {
    isLoading = loading;
    update();
  }

  void changeError(bool value, {String text = ''}) {
    isError = value;
    errorText = text;
    update();
  }
}
