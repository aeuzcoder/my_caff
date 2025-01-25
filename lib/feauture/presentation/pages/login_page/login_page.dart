import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/domain/entites/user_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/login_controller.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/app_bar_container.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/sign_in_widget.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/widgets/sign_up_widget.dart';
import 'package:my_caff/feauture/presentation/pages/main_page/main_page.dart';

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
  void dispose() {
    super.dispose();
    usernameCtr.dispose();
    nameCtr.dispose();
    emailCtr.dispose();
    addressCtr.dispose();
    passwordCtr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: [
              //APP BAR apCOINTAINER
              AppBarContainer(
                size: MediaQuery.of(context).size.height / 3,
                index: controller.indexItem,
                onSignUpPressed: () =>
                    controller.changerItem(1), // вызов функции смены вкладки
                onSignInPressed: () =>
                    controller.changerItem(0), // вызов функции смены вкладки
              ),

              //TEXT FIELDS
              controller.indexItem == 0
                  ? SignInWidget(
                      usernameCtr: usernameCtr,
                      passwordCtr: passwordCtr,
                    )
                  : SignUpWidget(
                      usernameCtr: usernameCtr,
                      nameCtr: nameCtr,
                      passwordCtr: passwordCtr,
                      emailCtr: emailCtr,
                      addressCtr: addressCtr,
                    ),

              //BUTTON
              SizedBox(
                height: 20,
              ),
              controller.errorOnPassword != null
                  ? Column(
                      children: [
                        Text(
                          controller.errorOnPassword!,
                          style: TextStyle(fontSize: 16, color: AppColors.red),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : SizedBox(
                      height: 20,
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: GestureDetector(
                  onTap: () async {
                    if (controller.indexItem == 0 && controller.isValide) {
                      var isAuth = await controller.onSignIn(
                        username: usernameCtr.text,
                        password: passwordCtr.text,
                      );
                      if (isAuth) {
                        Get.offAll(() => MainPage());
                      }
                    } else {}
                    if (controller.indexItem == 1 && controller.isValide) {
                      final UserEntity user = UserEntity(
                          name: nameCtr.text,
                          username: usernameCtr.text,
                          password: passwordCtr.text,
                          email: emailCtr.text,
                          address: addressCtr.text);
                      var isSignUp = await controller.onSignUp(user: user);
                      if (isSignUp) {
                        controller.changerItem(0);
                      }
                    } else {}
                  },
                  child: Container(
                    height: 64,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: AppColors.red,
                    ),
                    child: Center(
                      child: controller.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.bgColor,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              controller.indexItem == 0 ? 'Sign In' : 'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                  fontSize: 16),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
