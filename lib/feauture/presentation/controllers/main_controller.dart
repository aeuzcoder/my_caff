import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';

class MainController extends BaseController {
  final pageController = PageController();
  final controllerH = Get.find<HomeController>();
  int currentIndex = 0;

  void onChange(int index) {
    pageController.jumpToPage(index);
    currentIndex = index;
    controllerH.changeSearch(false);
    controllerH.unfocusSearch();
    update();
  }

  @override
  void onClose() {
    pageController.dispose(); // Удаляем контроллер при закрытии
    super.onClose();
  }
}
