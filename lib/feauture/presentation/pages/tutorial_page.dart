import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.symmetric(
            vertical: 40.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //LOGO
                    Container(
                      padding: EdgeInsets.all(8.r),
                      width: 80.w,
                      height: 80.h,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    //HAMMAGA BURGER
                    SizedBox(
                      height: 144.h,
                      child: Padding(
                        padding: EdgeInsets.all(12.0.r),
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
                          padding: EdgeInsets.symmetric(horizontal: 44.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: Container(
                              height: 64.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28.r),
                                color: AppColors.white,
                              ),
                              child: Center(
                                child: Text(
                                  'Davom etish',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.widgetColor,
                                      fontSize: 18.sp),
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
