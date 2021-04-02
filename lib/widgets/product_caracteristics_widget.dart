import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/models/product.dart';
import 'package:yuka/widgets/components/details_row.dart';
import 'package:yuka/widgets/components/product_title.dart';
import 'package:yuka/widgets/components/subtitle.dart';
import 'package:yuka/widgets/separator_widget.dart';

class ProductCaracteristicsWidget extends StatelessWidget {
  final Product product;

  ProductCaracteristicsWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        color: AppColors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductTitle(product: product),
            Subtitle(title: 'Ingédients'),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: Column(
                children: <Widget>[
                  DetailsRow(label: 'Légumes', value: 'petis pois 41%'),
                  SeparatorWidget(axis: Axis.horizontal),
                  DetailsRow(label: 'Eau'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
