// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/core/utils/app_functions.dart';
import 'package:my_caff/feauture/presentation/controllers/food_controller.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_app_bar_widget.dart';
import 'package:my_caff/feauture/presentation/widgets/image_container_widget.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      child: SafeArea(
        child: GetBuilder<FoodController>(
          builder: (controller) {
            return Scaffold(
                appBar: CustomAppBarWidget(
                  leftIcon: AppAssets.icons.left,
                  leftSize: 28.w,
                  leftFunction: () {
                    controller.foodWidgetController.update();
                    Get.back();
                  },
                  rightIcon: Icon(
                    controller.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: AppColors.red,
                  ),
                  rightSize: 28.w,
                  rightFunction: () async {
                    controller.foodWidgetController.update();
                    controller.changeFavourite();
                    return await controller.foodWidgetController
                        .saveOrDeleteFoods(
                      controller.isFavourite,
                      controller.product,
                    );
                  },
                ),
                body: Center(
                  child: Column(
                    children: [
                      //IMAGE
                      ImageContainerWidget(
                        url: AppFunctions.imageUrl(controller.product.image),
                        w: 240.w,
                        h: 240.h,
                      ),
                      SizedBox(height: 18.h),
                      //NAME
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Container(
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 4.r,
                                  color: AppColors.grey.withOpacity(0.6))
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                controller.product.name,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    BoxShadow(
                                      color: AppColors.grey.withOpacity(0.6),
                                      offset: Offset(0, 2),
                                      blurRadius: 4.r,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 24.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //PRICE
                                    Text(
                                      '${AppFunctions.formattingPrice(controller.product.price)} so\'m',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: AppColors.widgetColor,
                                        fontWeight: FontWeight.w600,
                                        shadows: [
                                          BoxShadow(
                                            color:
                                                AppColors.grey.withOpacity(0.4),
                                            offset: Offset(0, 2),
                                            blurRadius: 4.r,
                                          )
                                        ],
                                      ),
                                    ),

                                    //KKAL
                                    Text(
                                      '${controller.product.kcal} Kkal',
                                      style: TextStyle(
                                        shadows: [
                                          BoxShadow(
                                            color:
                                                AppColors.grey.withOpacity(0.4),
                                            offset: Offset(0, 2),
                                            blurRadius: 4.r,
                                          )
                                        ],
                                        fontSize: 20.sp,
                                        color: AppColors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.widgetColor),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Кнопка "-"
                                    GestureDetector(
                                      onTap: controller.decrement,
                                      child: Container(
                                        width: 40.w,
                                        height: 40.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColors.widgetColor,
                                            border: Border.symmetric(
                                              vertical: BorderSide(
                                                  color: AppColors.widgetColor),
                                              horizontal: BorderSide(
                                                  color: AppColors.widgetColor),
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              topLeft: Radius.circular(8),
                                            )),
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white),
                                        ),
                                      ),
                                    ),

                                    // Текущее значение
                                    Container(
                                      width: 40.w,
                                      height: 40.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.symmetric(
                                          vertical: BorderSide(
                                              color: AppColors.widgetColor),
                                          horizontal: BorderSide(
                                              color: AppColors.widgetColor),
                                        ),
                                      ),
                                      child: Text(
                                        controller.counter.toString(),
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.widgetColor),
                                      ),
                                    ),

                                    // Кнопка "+"
                                    GestureDetector(
                                      onTap: controller.increment,
                                      child: Container(
                                        width: 40.w,
                                        height: 40.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColors.widgetColor,
                                            border: Border.symmetric(
                                              vertical: BorderSide(
                                                  color: AppColors.widgetColor),
                                              horizontal: BorderSide(
                                                  color: AppColors.widgetColor),
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                            )),
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      //COUNTER

                      //ADD TO CART
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
