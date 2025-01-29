// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';
import 'package:my_caff/feauture/presentation/pages/home_page/widgets/order_buttom_widget.dart';
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
    log('init');
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
            //FLOATING BUTTON
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: controller.priceAllProducts() != 0
                ? OrderButtomWidget()
                : SizedBox(),
            //APP BAR
            appBar: CustomAppBarWidget(
              leftIcon: AppAssets.icons.menu,
              leftSize: 20.w,
              rightIcon: AppAssets.icons.shop,
              rightSize: 20.w,
              rightFunction: () => Get.toNamed('/order'),
            ),

            //BODY
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  //MAZZALI
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 32.0.w, vertical: 20.h),
                    child: Text(
                      'Mazzali Taomlar\nsiz uchun',
                      style: TextStyle(
                        height: 1,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),

                  //SEARCH
                  CustomSearchWidget(
                    focusNode: _focusNode,
                  ),

                  //TAB BAR
                  controller.isLoading
                      ? SizedBox()
                      : Column(
                          children: [
                            TabBar(
                              dividerColor: AppColors.bgColor,
                              labelColor: AppColors.widgetColor,
                              indicatorColor: AppColors.widgetColor,
                              isScrollable: true,
                              labelPadding:
                                  EdgeInsets.symmetric(horizontal: 18.w),
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              unselectedLabelColor: AppColors.grey,
                              labelStyle: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                              unselectedLabelStyle: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                              onTap: (value) {
                                controller.changeCategory(
                                    controller.categories[value].id);
                                controller.changeIndex(value);
                              },
                              overlayColor:
                                  WidgetStateProperty.resolveWith<Color?>(
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
                              padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                              child: GridView.builder(
                                controller: ScrollController(),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .categoryMap[controller.idCategory]?.length,
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
                                  final product = controller
                                          .categoryMap[controller.idCategory]
                                      ?[index];

                                  return FoodContainerWidget(
                                    product: product!,
                                  );
                                },
                              ),
                            ),

                            SizedBox(height: 100.h),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
