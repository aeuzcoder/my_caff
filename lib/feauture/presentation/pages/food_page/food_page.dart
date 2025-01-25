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
        child: Scaffold(
          appBar: CustomAppBarWidget(
            leftIcon: AppAssets.icons.left,
            leftSize: 28,
            leftFunction: () => Get.back(),
            rightIcon: AppAssets.icons.heart2,
            rightSize: 24,
          ),
          body: GetBuilder<FoodController>(
            builder: (controller) {
              return Center(
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
                    Text(
                      controller.product.name,
                      style: TextStyle(
                        fontSize: 28,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    //PRICE
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppFunctions.formattingPrice(controller.product.price)} sum',
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColors.widgetColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${controller.product.kcal} Kkal',
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    //COUNTER
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
                                    vertical: BorderSide(color: Colors.black),
                                    horizontal: BorderSide(color: Colors.black),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
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
                                vertical: BorderSide(color: Colors.black),
                                horizontal: BorderSide(color: Colors.black),
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
                                    vertical: BorderSide(color: Colors.black),
                                    horizontal: BorderSide(color: Colors.black),
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
                                    color: AppColors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    //ADD TO CART
                    Container(
                      width: 220,
                      height: 54,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.widgetColor),
                      child: Center(
                          child: Text(
                        'Savatga qo`shish',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
