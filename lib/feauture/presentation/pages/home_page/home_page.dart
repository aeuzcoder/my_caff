// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_app_bar_widget.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/widgets/custom_search_widget.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/widgets/food_container_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    super.dispose();

    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
        child: DefaultTabController(
          length: controller.categories.length,
          initialIndex: controller.indexCategory,
          child: Scaffold(
            //APP BAR
            appBar: CustomAppBarWidget(
              leftIcon: AppAssets.icons.menu,
              leftSize: 18,
              rightIcon: AppAssets.icons.shop,
              rightSize: 24,
            ),

            //BODY
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  //MAZZALI
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 20),
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
                  CustomSearchWidget(
                    focusNode: _focusNode,
                  ),
                  //TAB BAR
                  TabBar(
                    dividerColor: AppColors.bgColor,
                    labelColor: AppColors.widgetColor,
                    indicatorColor: AppColors.widgetColor,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(horizontal: 18),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    unselectedLabelColor: AppColors.grey,
                    labelStyle: TextStyle(fontSize: 16),
                    unselectedLabelStyle: TextStyle(fontSize: 16),
                    onTap: (value) {
                      controller
                          .changeCategory(controller.categories[value].id);
                      controller.changeIndex(value);
                    },
                    overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      (states) {
                        if (states.contains(WidgetState.pressed)) {
                          return AppColors.bgColor;
                        }
                        return null;
                      },
                    ),
                    tabs: controller.categories
                        .map((category) => Tab(
                              text: category.name,
                            ))
                        .toList(),
                  ),

                  //BUILDER
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      controller: ScrollController(),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.categoryMap[controller.idCategory]?.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Количество столбцов
                        crossAxisSpacing: 12, // Пространство между столбцами
                        mainAxisSpacing: 12,
                        childAspectRatio: 180 / 280,
                        // Пространство между строками
                      ),
                      itemBuilder: (context, index) {
                        final product = controller
                            .categoryMap[controller.idCategory]![index];
                        return FoodContainerWidget(
                          product: product,
                          isFavourite: false,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
