import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/blocs/product_bloc.dart';
import 'package:yuka/enum/product_details_current_tab.dart';

import '../app_icons.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String barcode;

  ProductDetailsScreen({required this.barcode});

  @override
  _ProductDetailsScreenState createState() =>
      _ProductDetailsScreenState(barcode: barcode);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsCurrentTab currentTab = ProductDetailsCurrentTab.summary;

  final String barcode;

  _ProductDetailsScreenState({required this.barcode});

  void _changeTab(int tabIndex) {
    setState(() {
      currentTab = getProductDetailsCurrentTabFromValue(tabIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => ProductBloc(barcode),
      lazy: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: Icon(AppIcons.share, color: AppColors.white),
              onPressed: () => <void>{
                Share.share('https://fr.openfoodfacts.org/produit/$barcode')
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(AppIcons.tabBarcode),
              label: 'Fiche',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.tabFridge),
              label: 'Caractéristiques',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.tabNutrition),
              label: 'Nutrition',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.tabArray),
              label: 'Tableau',
            ),
          ],
          currentIndex: getProductDetailsCurrentTabValue(currentTab),
          onTap: _changeTab,
        ),
        body: getProductDetailsCurrentTabWidget(currentTab),
      ),
    );
  }
}
