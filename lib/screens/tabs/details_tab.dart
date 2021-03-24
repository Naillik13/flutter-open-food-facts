import 'package:flutter/material.dart';
import 'package:yuka/res/app_images.dart';
import 'package:yuka/widgets/product_details_widget.dart';

class DetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.pancakes),
        Padding(
          padding: const EdgeInsets.only(top: 260.0),
          child: ProductDetailsWidget(),
        ),
      ],
    );
  }
}
