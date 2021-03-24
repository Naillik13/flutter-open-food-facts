import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/enum/product_details_current_tab.dart';
import 'package:yuka/res/app_images.dart';
import 'package:yuka/widgets/product_details_widget.dart';

import '../app_icons.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int barcode;

  ProductDetailsScreen({required this.barcode});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsCurrentTab currentTab = ProductDetailsCurrentTab.summary;

  void _changeTab(int tabIndex) {
    setState(() {
      currentTab = getProductDetailsCurrentTabFromValue(tabIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(AppIcons.share, color: AppColors.white),
            onPressed: () => {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_barcode),
            label: 'Fiche',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_fridge),
            label: 'Caractéristiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_nutrition),
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_array),
            label: 'Tableau',
          ),
        ],
        currentIndex: getProductDetailsCurrentTabValue(currentTab),
        onTap: _changeTab,
      ),
      body: getProductDetailsCurrentTabWidget(currentTab),
    );
  }
}

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
