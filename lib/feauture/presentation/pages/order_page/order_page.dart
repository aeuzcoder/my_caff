import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/core/utils/app_functions.dart';
import 'package:my_caff/feauture/presentation/controllers/order_controller.dart';
import 'package:my_caff/feauture/presentation/pages/order_page/widgets/table_widget.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_app_bar_widget.dart';
import 'package:my_caff/feauture/presentation/widgets/favourite_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      child: SafeArea(
        child: GetBuilder<OrderController>(
          builder: (controller) {
            return Scaffold(
              floatingActionButton: controller.isOrder
                  ? Padding(
                      padding: EdgeInsets.all(16.0.r),
                      child: GestureDetector(
                        onTap: () async {
                          if (controller.isDone) {
                            final String title = await controller.sendOrder();
                            Get.snackbar('Malumot', title);
                          } else {}
                        },
                        child: Container(
                          height: 64.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: controller.isDone
                                ? AppColors.widgetColor
                                : AppColors.grey,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Center(
                            child: controller.isLoading2
                                ? CircularProgressIndicator(
                                    color: AppColors.bgColor,
                                    strokeWidth: 2,
                                  )
                                : Text(
                                    'Buyurtma berish',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              appBar: CustomAppBarWidget(
                title: 'Buyurtma',
                leftIcon: AppAssets.icons.left,
                rightIcon: controller.isOrder
                    ? Icon(
                        Icons.delete_outline,
                        color: AppColors.widgetColor,
                        size: 30.w,
                      )
                    : null,
                leftSize: 32.w,
                rightSize: 0.w,
                rightFunction:
                    controller.isOrder ? () => controller.clearOrder() : () {},
                leftFunction: () => Get.back(),
              ),
              body: controller.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.isOrder
                      ? SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //BUILDER OF FOODS
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.controllerH.lengthFood(),
                                itemBuilder: (context, index) {
                                  final id = controller.keysOfFood[index];
                                  return FavouriteWidget(
                                    product: controller.productById(id)!,
                                    function: () {},
                                    price: controller.priceOfOrderById(id),
                                    rWidget: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Кнопка "-"
                                        GestureDetector(
                                          onTap: () {
                                            controller.decrement(id);
                                          },
                                          child: Container(
                                            width: 28.w,
                                            height: 28.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: AppColors.widgetColor,
                                                border: Border.symmetric(
                                                  vertical: BorderSide(
                                                      color: AppColors
                                                          .widgetColor),
                                                  horizontal: BorderSide(
                                                      color: AppColors
                                                          .widgetColor),
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
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
                                          width: 28.w,
                                          height: 28.h,
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
                                            controller.countById(id).toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.widgetColor),
                                          ),
                                        ),

                                        // Кнопка "+"
                                        GestureDetector(
                                          onTap: () {
                                            controller.increment(id);
                                          },
                                          child: Container(
                                            width: 28.w,
                                            height: 28.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: AppColors.widgetColor,
                                                border: Border.symmetric(
                                                  vertical: BorderSide(
                                                      color: AppColors
                                                          .widgetColor),
                                                  horizontal: BorderSide(
                                                      color: AppColors
                                                          .widgetColor),
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  bottomRight:
                                                      Radius.circular(8),
                                                )),
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.0.w, vertical: 12.h),
                                child: Text(
                                  'Jami: ${AppFunctions.formattingPrice(controller.controllerH.priceAllProducts())}',
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              //TEXT TABLES
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 24.0.w, bottom: 12.h),
                                child: Text(
                                  'Stollar',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              //BUILDER OF TABLES

                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.tables.length,
                                itemBuilder: (context, index) {
                                  final table = controller.tables[index];
                                  return TableWidget(table: table);
                                },
                              ),

                              SizedBox(
                                height: 200.h,
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
