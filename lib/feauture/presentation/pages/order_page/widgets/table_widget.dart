import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_caff/core/utils/app_colors.dart';
import 'package:my_caff/feauture/domain/entites/table_entity.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key, required this.table});
  final TableEntity table;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Container(width: ,)
          ],
        ),
      ),
    );
  }
}
