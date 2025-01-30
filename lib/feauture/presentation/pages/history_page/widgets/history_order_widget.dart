import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/core/utils/app_functions.dart';
import 'package:my_caff/feauture/domain/entites/my_order_entity.dart';

class HistoryOrderWidget extends StatelessWidget {
  const HistoryOrderWidget({super.key, required this.order});
  final MyOrderEntity? order;

  @override
  Widget build(BuildContext context) {
    if (order == null) {
      return SizedBox();
    } else {
      return Padding(
        padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 12.h),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),

              //TITLES
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: Text(
                      'Stol raqami',
                      style: TextStyle(fontSize: 12.sp, color: AppColors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Text(
                      'Sana va narxi',
                      style: TextStyle(fontSize: 12.sp, color: AppColors.black),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Text(
                      'Xolati',
                      style: TextStyle(fontSize: 12.sp, color: AppColors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),

              //MAIN ROW
              child: Row(
                children: [
                  //CONTAINER
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.widgetColor,
                          borderRadius: BorderRadius.circular(8)),
                      width: 40.w,
                      height: 40.h,
                      child: Center(
                        child: Text(
                          order!.tableNumber.toString(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24.w),

                  //COLUMN TEXTS
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //DATA
                      Text(
                        AppFunctions.formatDate(order!.orderTime),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //PRICE
                      Text(
                        '${AppFunctions.formattingPrice(order!.totalPrice)} so\'m',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  //CONTAINER RIGHT
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(8)),
                      width: 40.w,
                      height: 40.h,
                      child: Center(
                          child:
                              Icon(order!.status ? Icons.check : Icons.clear)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
