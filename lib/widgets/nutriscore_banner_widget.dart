import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/res/app_images.dart';
import 'package:yuka/widgets/separator_widget.dart';

import '../app_icons.dart';

class NutriscoreBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 30.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            color: AppColors.white,
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
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nutri-Score',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 10.0),
                      Image.asset(AppImages.nutriscoreA)
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
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Groupe NOVA',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                          'Produits alimentaires et boissons ultra-transformés')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SeparatorWidget(axis: Axis.horizontal),
        Padding(
          padding: const EdgeInsets.all(30.0),
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
              Row(
                children: [
                  Icon(AppIcons.ecoscore_d),
                  Text('Impact environnemental élevé')
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
