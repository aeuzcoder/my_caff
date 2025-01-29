import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/domain/entites/table_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/order_controller.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key, required this.table});
  final TableEntity table;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 12),
      child: GetBuilder<OrderController>(builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.selectTable(table.number);
          },
          child: Container(
            height: 52.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: controller.selectedTable != table.number
                  ? AppColors.white
                  : AppColors.gold04,
            ),
            child: Row(
              children: [
                //NUMBER
                Container(
                  width: 52.w,
                  decoration: BoxDecoration(
                    color: AppColors.widgetColor,
                    borderRadius: BorderRadius.circular(
                      16.r,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      table.number.toString(),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),

                //CAPACITY
                Text(
                  'Sig\'imi: ${table.capacity}',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),

                //TANLANDI
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    controller.selectedTable != table.number ? '' : 'TANLANDI',
                    style: TextStyle(
                      color: AppColors.widgetColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
