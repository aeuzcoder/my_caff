import 'package:get/get.dart';

class BaseController extends GetxController {
  bool isLoading = false;
  bool isError = false;
  String errorText = '';

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
