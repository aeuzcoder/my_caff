import 'package:flutter/material.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/pages/login_page/login_page.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.widgetColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //LOGO
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/logo.png'),
                    ),

                    //HAMMAGA BURGER
                    const SizedBox(
                      height: 200,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: FittedBox(
                          child: Text(
                            'My Caff',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //IMAGE
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  height: size.height / 2,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            'assets/images/man.png',
                            width: size.width / 1.5,
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/images/women.png',
                            width: size.width / 1.5,
                          )),
                      //BUTTON
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 44),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: Container(
                              height: 64,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: AppColors.white,
                              ),
                              child: const Center(
                                child: Text(
                                  'Davom etish',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.widgetColor,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
