// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/core/utils/app_functions.dart';
import 'package:my_caff/feauture/domain/entites/product_entity.dart';
import 'package:my_caff/feauture/presentation/widgets/image_container_widget.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget(
      {super.key,
      required this.product,
      required this.function,
      this.rWidget,
      this.price});
  final ProductEntity product;
  final VoidCallback? function;
  final Widget? rWidget;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.w, right: 16.h, left: 16.h),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(blurRadius: 4.r, color: AppColors.grey.withOpacity(0.8))
          ],
          borderRadius: BorderRadius.circular(
            16.r,
          ),
        ),

        //ROW
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 12.w),

            //IMAGE
            Center(
              child: ImageContainerWidget(
                  url: AppFunctions.imageUrl(product.image), w: 80.w, h: 80.h),
            ),

            //TEXT
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //NAME
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 20),
                  child: SizedBox(
                    width: 164.w,
                    child: Text(
                      product.name,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1,
                          color: AppColors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            BoxShadow(
                              offset: Offset(0, 1.5),
                              color: AppColors.grey.withOpacity(0.6),
                              blurRadius: 4,
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                //PRICE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    price == null
                        ? '${AppFunctions.formattingPrice(product.price)} so\'m'
                        : '${AppFunctions.formattingPrice(price!.toInt())} so\'m',
                    style: TextStyle(
                        height: 1,
                        color: AppColors.widgetColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          BoxShadow(
                            offset: Offset(0, 1.5),
                            color: AppColors.grey.withOpacity(0.6),
                            blurRadius: 4.r,
                          )
                        ]),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            rWidget == null
                ? GestureDetector(
                    onTap: function,
                    child: Icon(
                      Icons.delete,
                      color: AppColors.widgetColor,
                      size: 40.h,
                    ),
                  )
                : rWidget!,
          ],
        ),
      ),
    );
  }
}
