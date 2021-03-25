import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/models/product.dart';
import 'package:yuka/utils/quality_score_util.dart';
import 'package:yuka/widgets/separator_widget.dart';

class ProductDetailsWidget extends StatelessWidget {
  final Product product;

  ProductDetailsWidget({required this.product});

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
            NutriscoreBanner(),
          ],
        ),
      ),
    );
  }
}

class NutriscoreBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray1,
      child: Column(
        children: <Widget>[
          IntrinsicHeight(
            child: Row(
              children: <Widget>[
                ProductNutriscore(nutriscore: 'C'),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SeparatorWidget(axis: Axis.vertical),
                ),
                ProductNovaScore(novaScore: 1),
              ],
            ),
          ),
          SeparatorWidget(axis: Axis.horizontal),
          ProductEcoScore(ecoScore: 'E'),
        ],
      ),
    );
  }
}

class ProductEcoScore extends StatelessWidget {
  final String ecoScore;

  const ProductEcoScore({required this.ecoScore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        bottom: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'EcoScore',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              getEcoScoreIcon(ecoScore),
              const SizedBox(width: 10.0),
              Text(
                getEcoScoreHeadline(ecoScore),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProductNovaScore extends StatelessWidget {
  final int novaScore;

  const ProductNovaScore({required this.novaScore});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Groupe NOVA',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10.0),
            Text(
              getNovaScoreHeadline(novaScore),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductNutriscore extends StatelessWidget {
  final String nutriscore;

  const ProductNutriscore({required this.nutriscore});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nutri-Score',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10.0),
            Image.asset(
              getNutriscoreImagePath(nutriscore),
              height: 65.0,
            )
          ],
        ),
      ),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final Product product;

  const ProductTitle({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.barcode,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: AppColors.blueDark,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Cassegrain',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.grey,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Petits pois et carottes à l\'étuvée avec garniture',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
