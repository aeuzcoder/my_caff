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
          width: 186,
          height: 280,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //FAVOURITE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Container(
                    width: 24,
                    height: 24,
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
                                size: 24,
                                Icons.favorite,
                                color: AppColors.red,
                                shadows: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.8),
                                    offset: Offset(0, 1.5),
                                    blurRadius: 4,
                                  ),
                                ],
                              )
                            : Icon(
                                size: 24,
                                Icons.favorite_border,
                                color: AppColors.red,
                                shadows: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.8),
                                    offset: Offset(0, 1.5),
                                    blurRadius: 4,
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
                w: 150,
                h: 150,
              ),
              SizedBox(
                height: 12,
              ),
              //NAME
              SizedBox(
                width: 200,
                child: Text(
                  widget.product.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    shadows: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.8),
                        offset: Offset(0, 1.5),
                        blurRadius: 4,
                      ),
                    ],
                    height: 1,
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
                      blurRadius: 4,
                    ),
                  ],
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),

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
                  height: 26.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.8),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                    color: AppColors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                child: Icon(
                                  size: 24,
                                  Icons.remove,
                                  color: AppColors.white,
                                ),
                              )
                            : SizedBox(),
                        count != 0
                            ? Text(
                                count.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                    fontSize: 16),
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
                          child: Icon(
                            size: 24,
                            Icons.add,
                            color: AppColors.white,
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
