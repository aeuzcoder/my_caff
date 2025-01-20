import 'package:flutter/material.dart';
import 'package:my_caff/core/utils/app_assets.dart';
import 'package:my_caff/core/utils/app_colors.dart';

class AppBarContainer extends StatelessWidget implements PreferredSizeWidget {
  const AppBarContainer({
    super.key,
    required this.size,
    required this.index,
    required this.onSignUpPressed,
    required this.onSignInPressed,
  });

  final double size;
  final int index;
  final VoidCallback onSignUpPressed;
  final VoidCallback onSignInPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Image.asset(
              AppAssets.images.logo,
              width: 120,
              height: 120,
            ),
          ),
          Spacer(),
          Row(
            children: [
              _buildTabButton(
                label: 'Sign In',
                isSelected: index == 0,
                onPressed: onSignInPressed,
              ),
              _buildTabButton(
                label: 'Sign Up',
                isSelected: index == 1,
                onPressed: onSignUpPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Вспомогательный метод для создания кнопки вкладки
  Widget _buildTabButton({
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            color: AppColors.white,
          ),
          height: 40,
          child: Column(
            children: [
              Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.black,
                  ),
                ),
              ),
              Spacer(),
              isSelected
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Container(
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.widgetColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                  : SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
