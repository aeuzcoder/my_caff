import 'package:get/get.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/login_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/sign_in_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    // Controllers
    Get.lazyPut<BaseController>(() => BaseController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
  }
}
