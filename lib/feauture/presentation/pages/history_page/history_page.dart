import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/history_controller.dart';
import 'package:my_caff/feauture/presentation/pages/history_page/widgets/history_order_widget.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_app_bar_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      builder: (controller) {
        //SCAFFOLD
        return Container(
          color: AppColors.bgColor,
          child: SafeArea(
            child: Scaffold(
              appBar: CustomAppBarWidget(
                leftIcon: null,
                rightIcon: null,
                title: 'Buyurtmalar tarixi',
                leftSize: 0,
                rightSize: 0,
              ),

              //BODY
              body: controller.isLoading
                  //LOADING
                  ? Center(
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.widgetColor),
                    )
                  //LOADED
                  : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Column(children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.orders?.length,
                            itemBuilder: (context, index) {
                              final order = controller.orders?[index];
                              return HistoryOrderWidget(order: order);
                            },
                          ),
                        ]),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
