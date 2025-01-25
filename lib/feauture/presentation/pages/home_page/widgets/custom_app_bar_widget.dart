import 'package:flutter/material.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/presentation/widgets/custom_svg.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSvg(
              iconSvg: AppAssets.icons.menu,
            ),
            CustomSvg(
              iconSvg: AppAssets.icons.shop,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
