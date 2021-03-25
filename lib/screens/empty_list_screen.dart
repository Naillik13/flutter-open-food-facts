import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/app_icons.dart';
import 'package:yuka/blocs/product_history_bloc.dart';
import 'package:yuka/res/app_vectorial_images.dart';
import 'package:yuka/screens/product_details_screen.dart';
import 'package:yuka/states/result_product_list_state.dart';

class EmptyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

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
                      _openProductDetailsScreen(context, '5000159484695');
                    },
                  ),
                )
              ],
            ),
            body: BlocBuilder<ProductsHistoryBloc, ProductsListState>(
              builder: (BuildContext context, ProductsListState state) {
                if (state.history.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset(AppVectorialImages.illEmpty),
                        SizedBox(height: screenHeight * 0.1),
                        FractionallySizedBox(
                          widthFactor: 0.3,
                          child: Text(
                            'Vous  n\'avez pas encore scanné de produit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.blue,
                              height: 1.4,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.1),
                        TextButton(
                          onPressed: () {
                            _openProductDetailsScreen(context, '5000159484695');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Commencer'.toUpperCase()),
                              const SizedBox(width: 20.0),
                              Icon(Icons.arrow_right_alt)
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            primary: AppColors.blue,
                            padding: EdgeInsets.symmetric(
                                vertical: 18.0, horizontal: 22.0),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22.0))),
                            backgroundColor: AppColors.yellow,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return _ListProductsContent();
                }
              },
            ),
          );
        },
      ),
    );
  }

  void _openProductDetailsScreen(BuildContext context, String barcode) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            ProductDetailsScreen(barcode: barcode),
      ),
    );
  }
}

class _ListProductsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: BlocBuilder<ProductsHistoryBloc, ProductsListState>(
          builder: (BuildContext context, ProductsListState state) {
        return ListView.builder(
          itemCount: state.history.length,
          itemBuilder: (BuildContext context, int position) {
            dynamic item = state.history[position];

            // TODO Modifier la vue
            // https://devinci-online.brightspace.com/d2l/le/lessons/44502/topics/167610
            return Container(
              padding: const EdgeInsets.all(42.0),
              child: Text(
                '$position : ${item.barcode}',
              ),
            );
          },
        );
      }),
    );
  }
}
