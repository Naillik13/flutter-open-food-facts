import 'package:flutter/material.dart';
import 'package:yuka/screens/tabs/caracteristics_tab.dart';
import 'package:yuka/screens/tabs/counter_tab.dart';
import 'package:yuka/screens/tabs/details_tab.dart';

enum ProductDetailsCurrentTab {
  summary,
  info,
  nutrition,
  nutritionValues,
}

ProductDetailsCurrentTab getProductDetailsCurrentTabFromValue(int tabIndex) {
  switch (tabIndex) {
    case 0:
      return ProductDetailsCurrentTab.summary;
    case 1:
      return ProductDetailsCurrentTab.info;
    case 2:
      return ProductDetailsCurrentTab.nutrition;
    case 3:
      return ProductDetailsCurrentTab.nutritionValues;
    default:
      return ProductDetailsCurrentTab.summary;
  }
}

int getProductDetailsCurrentTabValue(
  ProductDetailsCurrentTab productDetailsCurrentTab,
) {
  switch (productDetailsCurrentTab) {
    case ProductDetailsCurrentTab.summary:
      return 0;
    case ProductDetailsCurrentTab.info:
      return 1;
    case ProductDetailsCurrentTab.nutrition:
      return 2;
    case ProductDetailsCurrentTab.nutritionValues:
      return 3;
    default:
      return 0;
  }
}

Widget getProductDetailsCurrentTabWidget(ProductDetailsCurrentTab currentTab) {
  switch (currentTab) {
    case ProductDetailsCurrentTab.summary:
      return DetailsTab();
    case ProductDetailsCurrentTab.info:
      return CaracteristicsTab();
    case ProductDetailsCurrentTab.nutrition:
      return CounterTab();
    case ProductDetailsCurrentTab.nutritionValues:
      return DetailsTab();
  }
}
