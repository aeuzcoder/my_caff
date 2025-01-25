import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/widgets/custom_app_bar_widget.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/widgets/custom_search_widget.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/widgets/food_container_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          //APP BAR
          appBar: CustomAppBarWidget(),

          //BODY
          body: Column(
            children: [
              //MAZZALI
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
                child: Text(
                  'Mazzali Taomlar\nsiz uchun',
                  style: TextStyle(
                      height: 1.2,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),

              //SEARCH
              CustomSearchWidget(),
              //TAB BAR

              //FOOD LISTS
              FoodContainerWidget(),
            ],
          ),
        ),
      );
    });
  }
}
