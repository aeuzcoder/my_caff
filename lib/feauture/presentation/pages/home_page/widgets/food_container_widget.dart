// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/core/utils/app_functions.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/food_widget_controller.dart';
import 'package:my_caff/feauture/presentation/widgets/image_container_widget.dart';

class FoodContainerWidget extends StatefulWidget {
  const FoodContainerWidget({super.key, required this.product});
  final ProductEntity product;

  @override
  State<FoodContainerWidget> createState() => _FoodContainerWidgetState();
}

class _FoodContainerWidgetState extends State<FoodContainerWidget> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodWidgetController>(builder: (controller) {
      int count = 0;
      if (controller.controllerH.order.containsKey(widget.product.id)) {
        count = controller.controllerH.order[widget.product.id]!;
      }

      isFavourite = controller.checkFavourite(widget.product.id);
      return GestureDetector(
        onTap: () {
          Get.toNamed('/food', arguments: widget.product);
        },
        child: Container(
          width: 180.w,
          height: 280.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //FAVOURITE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.saveOrDeleteFoods(
                              !isFavourite, widget.product);
                          isFavourite =
                              controller.checkFavourite(widget.product.id);
                        });
                      },
                      child: Center(
                        child: isFavourite
                            ? Icon(
                                size: 24.w,
                                Icons.favorite,
                                color: AppColors.red,
                                shadows: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.8),
                                    offset: Offset(0, 1.5),
                                    blurRadius: 4.r,
                                  ),
                                ],
                              )
                            : Icon(
                                size: 24.w,
                                Icons.favorite_border,
                                color: AppColors.red,
                                shadows: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.8),
                                    offset: Offset(0, 1.5),
                                    blurRadius: 4.r,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  )
                ],
              ),

              //IMAGE
              ImageContainerWidget(
                url: AppFunctions.imageUrl(
                  widget.product.image,
                ),
                w: 124.w,
                h: 124.h,
              ),
              SizedBox(
                height: 12.h,
              ),
              //NAME
              SizedBox(
                width: 192.w,
                child: Text(
                  widget.product.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1,
                    fontSize: 16.sp,
                    shadows: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.8),
                        offset: Offset(0, 1.5),
                        blurRadius: 4.r,
                      ),
                    ],
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '${AppFunctions.formattingPrice(widget.product.price)} so\'m',
                style: TextStyle(
                  shadows: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.8),
                      offset: Offset(0, 1.5),
                      blurRadius: 4.r,
                    ),
                  ],
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 12.h),

              //ROW ADD AND PRICE

              GestureDetector(
                onTap: () {
                  if (count == 0) {
                    setState(() {
                      count++;
                    });
                    controller.controllerH.addProduct(widget.product.id);
                  } else {}
                },
                child: Container(
                  height: 24.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.8),
                        offset: Offset(0, 2),
                        blurRadius: 4.r,
                      ),
                    ],
                    color: AppColors.widgetColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: count == 0
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        count != 0
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    count--;
                                    controller.controllerH
                                        .deleteProduct(widget.product.id);
                                  });
                                },
                                child: Container(
                                  width: 40.w,
                                  color: AppColors.widgetColor,
                                  child: Icon(
                                    size: 24.w,
                                    Icons.remove,
                                    color: AppColors.white,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        count != 0
                            ? Text(
                                count.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                    fontSize: 14.sp),
                              )
                            : SizedBox(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                            controller.controllerH
                                .addProduct(widget.product.id);
                          },
                          child: Container(
                            width: 40.w,
                            color: AppColors.widgetColor,
                            child: Icon(
                              size: 24.w,
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
