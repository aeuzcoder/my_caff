import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:my_caff/core/config/app_theme.dart';
import 'package:my_caff/core/config/root_binding.dart';
import 'package:my_caff/core/services/root_service.dart';
import 'package:my_caff/feauture/presentation/pages/favourite_page/favourite_page.dart';
import 'package:my_caff/feauture/presentation/pages/history_page/history_page.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/home_page.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/login_page.dart';
import 'package:my_caff/feauture/presentation/pages/profile_page/profile_page.dart';
import 'package:my_caff/feauture/presentation/pages/splash_page.dart';
import 'package:my_caff/feauture/presentation/pages/tutorial_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RootService.init();
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
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 100),
          getPages: [
            GetPage(name: '/home', page: () => HomePage()),
            GetPage(name: '/history', page: () => HistoryPage()),
            GetPage(name: '/favourite', page: () => FavouritePage()),
            GetPage(name: '/tutorial', page: () => TutorialPage()),
            GetPage(name: '/login', page: () => LoginPage()),
            GetPage(name: '/splash', page: () => SplashPage()),
            GetPage(name: '/profile', page: () => ProfilePage()),
          ],
          initialRoute: '/splash',
        );
      },
    );
  }
}
