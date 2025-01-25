import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/profile_controller.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                await controller.exitProfile();
                Get.offAll(() => LoginPage());
              },
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.blue,
                ),
                child: Center(
                  child: Text(
                    'EXIT',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
