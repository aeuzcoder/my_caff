import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:my_caff/core/config/app_theme.dart';
import 'package:my_caff/core/config/root_binding.dart';
import 'package:my_caff/core/services/root_service.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/pages/favourite_page/favourite_page.dart';
import 'package:my_caff/feauture/presentation/pages/food_page/food_page.dart';
import 'package:my_caff/feauture/presentation/pages/history_page/history_page.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/home_page.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/login_page.dart';
import 'package:my_caff/feauture/presentation/pages/main_page/main_page.dart';
import 'package:my_caff/feauture/presentation/pages/order_page/order_page.dart';
import 'package:my_caff/feauture/presentation/pages/profile_page/profile_page.dart';
import 'package:my_caff/feauture/presentation/pages/splash_page.dart';
import 'package:my_caff/feauture/presentation/pages/tutorial_page.dart';
import 'package:my_caff/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //DI
  di.init();

  //DB
  await RootService.init();

  //For system colors
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Прозрачный цвет
      statusBarIconBrightness:
          Brightness.dark, // Темные иконки (для светлого фона)
      systemNavigationBarColor:
          AppColors.bgColor, // Прозрачный цвет для нижней панели
      systemNavigationBarIconBrightness: Brightness.dark, // Темные иконки
    ),
  );

  //APP
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      builder: (context, _) {
        return GetMaterialApp(
          title: 'My Caff',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          scrollBehavior: const ScrollBehavior().copyWith(
              overscroll: false, physics: const ClampingScrollPhysics()),
          initialBinding: RootBinding(),
          defaultTransition: Transition.circularReveal,
          transitionDuration: const Duration(milliseconds: 120),
          getPages: [
            GetPage(name: '/home', page: () => HomePage()),
            GetPage(
                name: '/main',
                page: () => MainPage(),
                transition: Transition.circularReveal),
            GetPage(name: '/history', page: () => HistoryPage()),
            GetPage(name: '/favourite', page: () => FavouritePage()),
            GetPage(name: '/tutorial', page: () => TutorialPage()),
            GetPage(name: '/login', page: () => LoginPage()),
            GetPage(name: '/splash', page: () => SplashPage()),
            GetPage(name: '/profile', page: () => ProfilePage()),
            GetPage(name: '/order', page: () => OrderPage()),
            GetPage(
                name: '/food',
                page: () => FoodPage(),
                transition: Transition.circularReveal),
          ],
          initialRoute: '/splash',
        );
      },
    );
  }
}
