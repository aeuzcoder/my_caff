import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/favourite_controller.dart';
import 'package:my_caff/feauture/presentation/widgets/favourite_widget.dart';
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
      if (controller.products.isEmpty) {
        return Center(
          child: Text(
            'Ovqat tanlanmangan',
            style: TextStyle(
                color: AppColors.red,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        );
      } else {
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
              body: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return FavouriteWidget(
                        product: product,
                        function: () => controller.deleteFavouirite(product),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
