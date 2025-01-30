import 'dart:async';

import 'package:get/get.dart';
import 'package:my_caff/feauture/data/datasources/database/db_service.dart';
import 'package:my_caff/feauture/presentation/pages/main_page/main_page.dart';
import 'package:my_caff/feauture/presentation/pages/offline_page.dart';
import 'package:my_caff/feauture/presentation/pages/tutorial_page.dart';

import 'base_controller.dart';

class SplashController extends BaseController {
  initTimer() {
    Timer(const Duration(seconds: 0), () {
      _callNextPage();
    });
  }

  _callNextPage() async {
    if (await userRepo.internetInfo()) {
      Get.off(() => const OfflinePage());
    } else {
      if (DBService.to.getAccessToken().isNotEmpty) {
        Get.off(() => const MainPage());
      } else {
        Get.off(() => const TutorialPage());
      }
    }
  }
}
