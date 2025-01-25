import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/main_controller.dart';
import 'package:my_caff/feauture/presentation/pages/favourite_page/favourite_page.dart';
import 'package:my_caff/feauture/presentation/pages/history_page/history_page.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/home_page.dart';
import 'package:my_caff/feauture/presentation/pages/profile_page/profile_page.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_svg.dart';

class MainPage extends StatefulWidget {
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
            const HistoryPage(),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.bgColor,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex,
            onTap: controller.onChange,
            items: [
              _navItem(AppAssets.icons.home),
              _navItem(AppAssets.icons.heart),
              _navItem(AppAssets.icons.user),
              _navItem(AppAssets.icons.history),
            ],
          ),
        ),
      );
    });
  }

  _navItem(icon) {
    return BottomNavigationBarItem(
      icon: CustomSvg(
        iconSvg: icon,
        color: AppColors.grey,
      ),
      activeIcon: CustomSvg(
        iconSvg: icon,
        color: AppColors.red,
      ),
      label: '',
    );
  }
}
