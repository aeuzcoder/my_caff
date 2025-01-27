// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/core/utils/app_functions.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';

class OrderButtomWidget extends StatelessWidget {
  const OrderButtomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GestureDetector(
          onTap: () => Get.toNamed('order'),
          child: Container(
            height: 44.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: AppColors.grey.withOpacity(0.8),
                    blurRadius: 4,
                    offset: Offset(0, 2))
              ],
              borderRadius: BorderRadius.circular(20),
              color: AppColors.widgetColor,
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                SizedBox(
                  width: 12.w,
                ),

                //COUNT
                Container(
                  width: 24.r,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.bgColor),
                  child: Center(
                    child: Text(
                      controller.lengthOrder().toString(),
                      style: TextStyle(
                          color: AppColors.widgetColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                //SAVATGA
                SizedBox(width: 16.w),
                Text(
                  'Savatga',
                  style: TextStyle(
                    color: AppColors.bgColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),

                //ALL PRICE
                Text(
                  '${AppFunctions.formattingPrice(controller.priceAllProducts())} so\'m',
                  style: TextStyle(
                    color: AppColors.bgColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
