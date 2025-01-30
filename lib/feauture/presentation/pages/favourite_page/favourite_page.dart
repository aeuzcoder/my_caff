import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/favourite_controller.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/widgets/food_container_widget.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_app_bar_widget.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(builder: (controller) {
      if (controller.isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return Container(
        color: AppColors.bgColor,
        child: SafeArea(
          child: Scaffold(
            appBar: CustomAppBarWidget(
              title: 'Favourite Foods',
              leftIcon: null,
              rightIcon: null,
              leftSize: 28,
              rightSize: 0,
            ),
            body: controller.products.isEmpty
                ? Center(
                    child: Text(
                      'Ovqat tanlanmangan',
                      style: TextStyle(
                          color: AppColors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                        child: GridView.builder(
                          controller: ScrollController(),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.products.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Количество столбцов
                            crossAxisSpacing:
                                10.w, // Пространство между столбцами
                            mainAxisSpacing: 12.h,
                            childAspectRatio: 180.w / 280.h,
                            // Пространство между строками
                          ),
                          itemBuilder: (context, index) {
                            if (controller.products.isEmpty) {
                              return SizedBox();
                            }
                            final product = controller.products[index];

                            return FoodContainerWidget(
                              product: product,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
