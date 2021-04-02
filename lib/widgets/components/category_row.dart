import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/app_icons.dart';

class CategoryRow extends StatelessWidget {
  final bool isInCategory;
  final String category;

  const CategoryRow({required this.isInCategory, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: AppColors.blueLight,
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      child: Row(
        children: <Widget>[
          Icon(
            isInCategory ? AppIcons.checkmark : AppIcons.close,
            color: AppColors.white,
          ),
          SizedBox(width: 10.0),
          Text(
            category,
            style: TextStyle(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
