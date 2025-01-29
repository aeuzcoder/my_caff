import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_svg.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget(
      {super.key,
      required this.leftIcon,
      required this.rightIcon,
      required this.leftSize,
      required this.rightSize,
      this.leftFunction,
      this.rightFunction,
      this.title});
  final String? title;
  final String? leftIcon;
  final dynamic rightIcon;
  final double leftSize;
  final double rightSize;
  final VoidCallback? leftFunction;
  final VoidCallback? rightFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftIcon == null
                ? SizedBox()
                : GestureDetector(
                    onTap: leftFunction,
                    child: Container(
                      width: leftSize,
                      height: leftSize,
                      color: AppColors.bgColor,
                      child: CustomSvg(
                        iconSvg: leftIcon!,
                        size: leftSize,
                      ),
                    ),
                  ),
            title == null
                ? SizedBox()
                : Text(
                    title!,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            rightIcon == null
                ? SizedBox()
                : GestureDetector(
                    onTap: rightFunction,
                    child: rightIcon is String
                        ? CustomSvg(
                            iconSvg: rightIcon,
                            size: rightSize,
                          )
                        : (rightIcon as Widget),
                  )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
