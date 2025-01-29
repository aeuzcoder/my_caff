import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
    required this.index,
    required this.function,
  });

  final int index;
  final Function(int) function;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Container(
        height: ScreenUtil().screenHeight / 3,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.bgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: ClipOval(
                child: Image.asset(
                  AppAssets.images.logo,
                  width: 120.w,
                  height: 120.h,
                ),
              ),
            ),
            Spacer(),
            TabBar(
              indicatorColor: AppColors.widgetColor,
              indicatorWeight: 4,
              padding: EdgeInsets.only(left: 4.w, right: 16.w),
              onTap: (value) => function(value),
              tabs: [
                Tab(
                  child: Text(
                    '      Kirish      ',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Ro\'yhatdan o\'tish',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
