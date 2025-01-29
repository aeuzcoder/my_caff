// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/profile_controller.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_app_bar_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      if (controller.isLoading) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.widgetColor,
            ),
          ),
        );
      } else {
        return controller.userInfo == null
            ? SizedBox()
            : Container(
                color: AppColors.bgColor,
                child: SafeArea(
                  child: Scaffold(
                    appBar: CustomAppBarWidget(
                      leftIcon: null,
                      rightIcon: null,
                      leftSize: 28.w,
                      rightSize: 0,
                      title: 'My Profile',
                    ),
                    body: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //MALUMOTLAR
                            Text(
                              'Ma\'lumotlar',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 1),
                                    color: Colors.grey.withOpacity(0.2),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //image
                                    Container(
                                      width: 80.w,
                                      height: 80.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: AppColors.widgetColor),
                                      child: Center(
                                        child:
                                            controller.userInfo!.image == null
                                                ? Icon(
                                                    Icons.image,
                                                    color: AppColors.white,
                                                    size: 32.w,
                                                  )
                                                : SizedBox(),
                                      ),
                                    ),

                                    //column
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //ism
                                          Text(
                                            controller.userInfo!.name,
                                            style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            color:
                                                AppColors.grey.withOpacity(0.5),
                                            width: 164.w,
                                            height: 1,
                                          ),

                                          //address
                                          Text(
                                            controller.userInfo!.address,
                                            style: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                          Container(
                                            color:
                                                AppColors.grey.withOpacity(0.5),
                                            width: 164.w,
                                            height: 1,
                                          ),

                                          //email
                                          Text(
                                            controller.userInfo!.email,
                                            style: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 16.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              );
      }
    });
  }
}
