import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';

class DetailsRow extends StatelessWidget {
  final String? value;
  final String label;

  DetailsRow({
    required this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          label,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: AppColors.blueDark,
              ),
        ),
        Text(
          value != null ? value! : '',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}
