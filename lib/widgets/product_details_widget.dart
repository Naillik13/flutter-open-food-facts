import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/res/app_images.dart';
import 'package:yuka/widgets/separator_widget.dart';

import '../app_icons.dart';

class ProductDetailsWidget extends StatelessWidget {
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
          children: [
            ProductTitle(),
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
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nutri-Score',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 10.0),
                        Image.asset(
                          AppImages.nutriscoreA,
                          height: 65.0,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SeparatorWidget(axis: Axis.vertical),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Groupe NOVA',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Produits alimentaires et boissons ultra-transformés',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SeparatorWidget(axis: Axis.horizontal),
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EcoScore',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(
                      AppIcons.ecoscore_d,
                      color: AppColors.ecoScoreD,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'Impact environnemental élevé',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Petits pois et carottes',
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
