import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/login_controller.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/app_bar_container.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/sign_in_widget.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/sign_up_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final nameCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final addressCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBarContainer(
            size: MediaQuery.of(context).size.height / 3,
            index: controller.indexItem,
            onSignUpPressed: () =>
                controller.changer(1), // вызов функции смены вкладки
            onSignInPressed: () =>
                controller.changer(0), // вызов функции смены вкладки
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              height: 64,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: AppColors.red,
              ),
              child: Center(
                child: Text(
                  controller.indexItem == 0 ? 'Sign In' : 'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      fontSize: 16),
                ),
              ),
            ),
          ),
          body: controller.indexItem == 0 ? SignInWidget() : SignUpWidget(),
        );
      },
    );
  }
}
