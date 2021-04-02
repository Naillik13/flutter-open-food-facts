import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/models/product.dart';

class ProductTitle extends StatelessWidget {
  final Product product;

  ProductTitle({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            getTextValue(product.name),
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: AppColors.blueDark,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            getTextValue(product.brands?[0]),
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}

String getTextValue(String? text) {
  return text ?? 'Aucune information';
}
