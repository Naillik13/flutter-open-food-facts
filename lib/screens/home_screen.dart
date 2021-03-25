import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuka/app_icons.dart';
import 'package:yuka/blocs/product_history_bloc.dart';
import 'package:yuka/screens/empty_list_display.dart';
import 'package:yuka/screens/product_list_display.dart';
import 'package:yuka/states/result_product_list_state.dart';
import 'package:yuka/utils/navigation_util.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsHistoryBloc>(
      create: (_) => ProductsHistoryBloc(),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Mes scans'),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(AppIcons.barcode),
                    onPressed: () {
                      openProductDetailsScreen(context, '5000159484695');
                    },
                  ),
                )
              ],
            ),
            body: BlocBuilder<ProductsHistoryBloc, ProductsListState>(
              builder: (BuildContext context, ProductsListState state) {
                if (state.history.isEmpty) {
                  return EmptyListDisplay();
                } else {
                  return ProductListDisplay();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
