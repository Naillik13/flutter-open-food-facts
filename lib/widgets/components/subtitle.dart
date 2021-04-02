import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';

class Subtitle extends StatelessWidget {
  final String title;

  const Subtitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        color: AppColors.gray1,
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: AppColors.blueDark, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
