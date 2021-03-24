import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/res/app_images.dart';
import 'package:yuka/widgets/nutriscore_banner_widget.dart';

class ImageHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Image.asset(
            AppImages.pancakes,
            height: 290.0,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 250.0,
            left: 0.0,
            right: 0.0,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30.0,
                ),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
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
                    NutriscoreBannerWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
