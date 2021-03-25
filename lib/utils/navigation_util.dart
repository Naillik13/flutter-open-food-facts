import 'package:flutter/material.dart';
import 'package:yuka/screens/product_details_screen.dart';

void openProductDetailsScreen(BuildContext context, String barcode) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => ProductDetailsScreen(barcode: barcode),
    ),
  );
}
