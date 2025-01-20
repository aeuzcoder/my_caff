import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/main_controller.dart';
import 'package:my_caff/feauture/presentation/pages/favourite_page/favourite_page.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/home_page.dart';
import 'package:my_caff/feauture/presentation/pages/profile_page/profile_page.dart';

class MainPage extends StatefulWidget {
  static const String id = "main_page";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            const HomePage(),
            const FavouritePage(),
            const ProfilePage(),
            // StatisticPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex,
          onTap: controller.onChange,
          items: [
            _navItem(AppAssets.icons.icNavHome),
            _navItem(AppAssets.icons.icFavFood),
            _navItem(AppAssets.icons.icNavPerson),
          ],
        ),
      );
    });
  }

  _navItem(icon) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(icon, color: AppColors.red),
    );
  }
}
