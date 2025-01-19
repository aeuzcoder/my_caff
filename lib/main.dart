import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_caff/core/config/root_binding.dart';
import 'package:my_caff/core/services/root_service.dart';
import 'package:my_caff/feauture/presentation/pages/sign_in_page.dart';

void main() async {
  await RootService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: RootBinding(),
      home: SignInPage(),
      builder: (context, child) {
        return MediaQuery(
          // ignore: deprecated_member_use
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}
