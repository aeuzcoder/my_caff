import 'package:get/get.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/login_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/main_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/profile_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/splash_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    // Controllers
    Get.lazyPut<BaseController>(() => BaseController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
  }
}
