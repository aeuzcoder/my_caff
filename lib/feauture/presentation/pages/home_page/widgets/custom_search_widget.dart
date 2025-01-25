// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_svg.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key, required this.focusNode});
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextField(
        focusNode: focusNode,
        style: TextStyle(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            decorationColor: AppColors.searchColor),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
              color: AppColors.black.withOpacity(0.5),
              fontSize: 18,
              fontWeight: FontWeight.w500),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          filled: true,
          fillColor: AppColors.searchColor,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 72, // Минимальная ширина для отступа иконки
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16), // Точный отступ слева
            child: CustomSvg(
              iconSvg: AppAssets.icons.search,
              size: 24,
              color: AppColors.black, // Оптимальный размер иконки
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(width: 1, color: AppColors.searchColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 0.1, color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
