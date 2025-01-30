// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/controllers/home_controller.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_svg.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key, required this.focusNode});
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final controllerH = Get.find<HomeController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: TextFormField(
        onTapOutside: (tab) => FocusScope.of(context).unfocus(),
        onChanged: (value) {
          if (value.isNotEmpty) {
            controllerH.changeSearch(true);
            controllerH.searchProducts(value);
            log('Maxsulotlar: ${controllerH.resultSearch}');
          } else {
            controllerH.changeSearch(false);
          }
        },
        focusNode: focusNode,
        style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            decorationColor: AppColors.searchColor),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
              color: AppColors.black.withOpacity(0.5),
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
          contentPadding: EdgeInsets.symmetric(vertical: 18.h),
          filled: true,
          fillColor: AppColors.searchColor,
          prefixIconConstraints: BoxConstraints(
            minWidth: 68.w, // Минимальная ширина для отступа иконки
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 16.w), // Точный отступ слева
            child: CustomSvg(
              iconSvg: AppAssets.icons.search,
              size: 24.w,
              color: AppColors.black, // Оптимальный размер иконки
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide:
                const BorderSide(width: 1, color: AppColors.searchColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(width: 0.1, color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
