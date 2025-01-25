// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/core/utils/app_functions.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/widgets/image_container_widget.dart';

class FoodContainerWidget extends StatelessWidget {
  const FoodContainerWidget({
    super.key,
    required this.product,
    required this.isFavourite,
  });
  final bool isFavourite;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/food', arguments: product);
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
                )
              ],
            ),

            //IMAGE
            ImageContainerWidget(
              url: AppFunctions.imageUrl(
                product.image,
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
                product.name,
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
            Spacer(),

            //ROW ADD AND PRICE
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //PRICE
                Text(
                  '${AppFunctions.formattingPrice(product.price)} sum',
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

                //ICON
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.8),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: AppColors.red,
                  ),
                  child: Center(
                    child: Icon(
                      size: 24,
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
