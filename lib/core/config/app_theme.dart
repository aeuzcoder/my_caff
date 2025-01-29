import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_caff/core/utils/app_colors.dart';

const _sfpro = 'SF-Pro';

class AppTheme {
  static var appTheme = ThemeData(
      fontFamily: _sfpro,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bgColor,
      primaryColor: AppColors.black,
      colorScheme: const ColorScheme.dark(primary: AppColors.grey),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: _sfpro,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: AppColors.black,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(size: 20.r, color: Colors.white),
        actionsIconTheme: IconThemeData(size: 20.r),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(iconSize: 24.r),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
      ),
      iconTheme: IconThemeData(size: 24.r),
      primaryIconTheme: IconThemeData(size: 24.r),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.widgetColor,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.bgColor,
        unselectedItemColor: AppColors.n979C9E,
      ));
}
