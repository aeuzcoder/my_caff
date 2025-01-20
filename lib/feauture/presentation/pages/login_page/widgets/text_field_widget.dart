import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_caff/core/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.blvk03,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blvk01))),
          style: const TextStyle(
            decorationColor: AppColors.bgColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
