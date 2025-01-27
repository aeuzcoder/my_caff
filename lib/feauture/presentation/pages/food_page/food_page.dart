// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
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
                  leftSize: 28,
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
                  rightSize: 24,
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
                        w: 300,
                        h: 300,
                      ),
                      SizedBox(height: 18),
                      //NAME
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 4,
                                  color: AppColors.grey)
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                controller.product.name,
                                style: TextStyle(
                                  fontSize: 28,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    BoxShadow(
                                      color: AppColors.grey.withOpacity(0.8),
                                      offset: Offset(0, 2),
                                      blurRadius: 4,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //PRICE
                                    Text(
                                      '${AppFunctions.formattingPrice(controller.product.price)} so\'m',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: AppColors.widgetColor,
                                        fontWeight: FontWeight.w600,
                                        shadows: [
                                          BoxShadow(
                                            color:
                                                AppColors.grey.withOpacity(0.4),
                                            offset: Offset(0, 2),
                                            blurRadius: 4,
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
                                            blurRadius: 4,
                                          )
                                        ],
                                        fontSize: 24,
                                        color: AppColors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Кнопка "-"
                                          GestureDetector(
                                            onTap: controller.decrement,
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.symmetric(
                                                    vertical: BorderSide(
                                                        color: Colors.black),
                                                    horizontal: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8),
                                                    topLeft: Radius.circular(8),
                                                  )),
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.black),
                                              ),
                                            ),
                                          ),

                                          // Текущее значение
                                          Container(
                                            width: 40,
                                            height: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border.symmetric(
                                                vertical: BorderSide(
                                                    color: Colors.black),
                                                horizontal: BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            child: Text(
                                              controller.counter.toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.black),
                                            ),
                                          ),

                                          // Кнопка "+"
                                          GestureDetector(
                                            onTap: controller.increment,
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.symmetric(
                                                    vertical: BorderSide(
                                                        color: Colors.black),
                                                    horizontal: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8),
                                                  )),
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 220,
                                      height: 44,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.grey
                                                    .withOpacity(0.8),
                                                blurRadius: 3)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: AppColors.widgetColor),
                                      child: Center(
                                          child: Text(
                                        'Savatga qo`shish',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                    )
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
